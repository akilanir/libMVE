package org.jivesoftware.smack;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import org.jivesoftware.smack.packet.Message;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Chat.class */
public class Chat {
    private ChatManager chatManager;
    private String threadID;
    private String participant;
    private final Set<MessageListener> listeners = new CopyOnWriteArraySet();

    Chat(ChatManager chatManager, String participant, String threadID) {
        this.chatManager = chatManager;
        this.participant = participant;
        this.threadID = threadID;
    }

    public String getThreadID() {
        return this.threadID;
    }

    public String getParticipant() {
        return this.participant;
    }

    public void sendMessage(String text) throws XMPPException {
        Message message = new Message(this.participant, Message.Type.chat);
        message.setThread(this.threadID);
        message.setBody(text);
        this.chatManager.sendMessage(this, message);
    }

    public void sendMessage(Message message) throws XMPPException {
        message.setTo(this.participant);
        message.setType(Message.Type.chat);
        message.setThread(this.threadID);
        this.chatManager.sendMessage(this, message);
    }

    public void addMessageListener(MessageListener listener) {
        if (listener == null) {
            return;
        }
        this.listeners.add(listener);
    }

    public void removeMessageListener(MessageListener listener) {
        this.listeners.remove(listener);
    }

    public Collection<MessageListener> getListeners() {
        return Collections.unmodifiableCollection(this.listeners);
    }

    public PacketCollector createCollector() {
        return this.chatManager.createPacketCollector(this);
    }

    void deliver(Message message) {
        message.setThread(this.threadID);
        for (MessageListener listener : this.listeners) {
            listener.processMessage(this, message);
        }
    }

    public boolean equals(Object obj) {
        return (obj instanceof Chat) && this.threadID.equals(((Chat) obj).getThreadID()) && this.participant.equals(((Chat) obj).getParticipant());
    }
}
