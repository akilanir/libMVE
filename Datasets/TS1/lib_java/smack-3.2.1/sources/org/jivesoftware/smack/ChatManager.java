package org.jivesoftware.smack;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromContainsFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.ThreadFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.collections.ReferenceMap;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/ChatManager.class */
public class ChatManager {
    private static String prefix = StringUtils.randomString(5);
    private static long id = 0;
    private Map<String, Chat> threadChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Map<String, Chat> jidChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Map<String, Chat> baseJidChats = Collections.synchronizedMap(new ReferenceMap(0, 2));
    private Set<ChatManagerListener> chatManagerListeners = new CopyOnWriteArraySet();
    private Map<PacketInterceptor, PacketFilter> interceptors = new WeakHashMap();
    private Connection connection;

    private static synchronized String nextID() {
        StringBuilder append = new StringBuilder().append(prefix);
        long j = id;
        id = j + 1;
        return append.append(Long.toString(j)).toString();
    }

    ChatManager(Connection connection) {
        this.connection = connection;
        PacketFilter filter = new PacketFilter() { // from class: org.jivesoftware.smack.ChatManager.1
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                Message.Type messageType;
                return (!(packet instanceof Message) || (messageType = ((Message) packet).getType()) == Message.Type.groupchat || messageType == Message.Type.headline) ? false : true;
            }
        };
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smack.ChatManager.2
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Chat chat;
                Message message = (Message) packet;
                if (message.getThread() == null) {
                    chat = ChatManager.this.getUserChat(message.getFrom());
                } else {
                    chat = ChatManager.this.getThreadChat(message.getThread());
                    if (chat == null) {
                        chat = ChatManager.this.getUserChat(message.getFrom());
                    }
                }
                if (chat == null) {
                    chat = ChatManager.this.createChat(message);
                }
                ChatManager.this.deliverMessage(chat, message);
            }
        }, filter);
    }

    public Chat createChat(String userJID, MessageListener listener) {
        String threadID;
        do {
            threadID = nextID();
        } while (this.threadChats.get(threadID) != null);
        return createChat(userJID, threadID, listener);
    }

    public Chat createChat(String userJID, String thread, MessageListener listener) {
        if (thread == null) {
            thread = nextID();
        }
        if (this.threadChats.get(thread) != null) {
            throw new IllegalArgumentException("ThreadID is already used");
        }
        Chat chat = createChat(userJID, thread, true);
        chat.addMessageListener(listener);
        return chat;
    }

    private Chat createChat(String userJID, String threadID, boolean createdLocally) {
        Chat chat = new Chat(this, userJID, threadID);
        this.threadChats.put(threadID, chat);
        this.jidChats.put(userJID, chat);
        this.baseJidChats.put(StringUtils.parseBareAddress(userJID), chat);
        for (ChatManagerListener listener : this.chatManagerListeners) {
            listener.chatCreated(chat, createdLocally);
        }
        return chat;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Chat createChat(Message message) {
        String threadID = message.getThread();
        if (threadID == null) {
            threadID = nextID();
        }
        String userJID = message.getFrom();
        return createChat(userJID, threadID, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Chat getUserChat(String userJID) {
        Chat match = this.jidChats.get(userJID);
        if (match == null) {
            match = this.baseJidChats.get(StringUtils.parseBareAddress(userJID));
        }
        return match;
    }

    public Chat getThreadChat(String thread) {
        return this.threadChats.get(thread);
    }

    public void addChatListener(ChatManagerListener listener) {
        this.chatManagerListeners.add(listener);
    }

    public void removeChatListener(ChatManagerListener listener) {
        this.chatManagerListeners.remove(listener);
    }

    public Collection<ChatManagerListener> getChatListeners() {
        return Collections.unmodifiableCollection(this.chatManagerListeners);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deliverMessage(Chat chat, Message message) {
        chat.deliver(message);
    }

    void sendMessage(Chat chat, Message message) {
        for (Map.Entry<PacketInterceptor, PacketFilter> interceptor : this.interceptors.entrySet()) {
            PacketFilter filter = interceptor.getValue();
            if (filter != null && filter.accept(message)) {
                interceptor.getKey().interceptPacket(message);
            }
        }
        if (message.getFrom() == null) {
            message.setFrom(this.connection.getUser());
        }
        this.connection.sendPacket(message);
    }

    PacketCollector createPacketCollector(Chat chat) {
        return this.connection.createPacketCollector(new AndFilter(new ThreadFilter(chat.getThreadID()), new FromContainsFilter(chat.getParticipant())));
    }

    public void addOutgoingMessageInterceptor(PacketInterceptor packetInterceptor) {
        addOutgoingMessageInterceptor(packetInterceptor, null);
    }

    public void addOutgoingMessageInterceptor(PacketInterceptor packetInterceptor, PacketFilter filter) {
        if (packetInterceptor != null) {
            this.interceptors.put(packetInterceptor, filter);
        }
    }
}
