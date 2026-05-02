package org.jivesoftware.smack;

import java.io.Reader;
import java.io.Writer;
import java.lang.reflect.Constructor;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;
import org.jivesoftware.smack.debugger.SmackDebugger;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Connection.class */
public abstract class Connection {
    private static final AtomicInteger connectionCounter = new AtomicInteger(0);
    private static final Set<ConnectionCreationListener> connectionEstablishedListeners = new CopyOnWriteArraySet();
    public static boolean DEBUG_ENABLED;
    protected Reader reader;
    protected Writer writer;
    protected final ConnectionConfiguration config;
    protected final Collection<ConnectionListener> connectionListeners = new CopyOnWriteArrayList();
    protected final Collection<PacketCollector> collectors = new ConcurrentLinkedQueue();
    protected final Map<PacketListener, ListenerWrapper> recvListeners = new ConcurrentHashMap();
    protected final Map<PacketListener, ListenerWrapper> sendListeners = new ConcurrentHashMap();
    protected final Map<PacketInterceptor, InterceptorWrapper> interceptors = new ConcurrentHashMap();
    private AccountManager accountManager = null;
    private ChatManager chatManager = null;
    protected SmackDebugger debugger = null;
    protected SASLAuthentication saslAuthentication = new SASLAuthentication(this);
    protected final int connectionCounterValue = connectionCounter.getAndIncrement();

    public abstract String getUser();

    public abstract String getConnectionID();

    public abstract boolean isConnected();

    public abstract boolean isAuthenticated();

    public abstract boolean isAnonymous();

    public abstract boolean isSecureConnection();

    public abstract boolean isUsingCompression();

    public abstract void connect() throws XMPPException;

    public abstract void login(String str, String str2, String str3) throws XMPPException;

    public abstract void loginAnonymously() throws XMPPException;

    public abstract void sendPacket(Packet packet);

    public abstract Roster getRoster();

    public abstract void disconnect(Presence presence);

    static {
        DEBUG_ENABLED = false;
        try {
            DEBUG_ENABLED = Boolean.getBoolean("smack.debugEnabled");
        } catch (Exception e) {
        }
        SmackConfiguration.getVersion();
    }

    protected Connection(ConnectionConfiguration configuration) {
        this.config = configuration;
    }

    protected ConnectionConfiguration getConfiguration() {
        return this.config;
    }

    public String getServiceName() {
        return this.config.getServiceName();
    }

    public String getHost() {
        return this.config.getHost();
    }

    public int getPort() {
        return this.config.getPort();
    }

    protected boolean isReconnectionAllowed() {
        return this.config.isReconnectionAllowed();
    }

    public void login(String username, String password) throws XMPPException {
        login(username, password, "Smack");
    }

    public AccountManager getAccountManager() {
        if (this.accountManager == null) {
            this.accountManager = new AccountManager(this);
        }
        return this.accountManager;
    }

    public synchronized ChatManager getChatManager() {
        if (this.chatManager == null) {
            this.chatManager = new ChatManager(this);
        }
        return this.chatManager;
    }

    public SASLAuthentication getSASLAuthentication() {
        return this.saslAuthentication;
    }

    public void disconnect() {
        disconnect(new Presence(Presence.Type.unavailable));
    }

    public static void addConnectionCreationListener(ConnectionCreationListener connectionCreationListener) {
        connectionEstablishedListeners.add(connectionCreationListener);
    }

    public static void removeConnectionCreationListener(ConnectionCreationListener connectionCreationListener) {
        connectionEstablishedListeners.remove(connectionCreationListener);
    }

    protected static Collection<ConnectionCreationListener> getConnectionCreationListeners() {
        return Collections.unmodifiableCollection(connectionEstablishedListeners);
    }

    public void addConnectionListener(ConnectionListener connectionListener) {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected to server.");
        }
        if (connectionListener != null && !this.connectionListeners.contains(connectionListener)) {
            this.connectionListeners.add(connectionListener);
        }
    }

    public void removeConnectionListener(ConnectionListener connectionListener) {
        this.connectionListeners.remove(connectionListener);
    }

    protected Collection<ConnectionListener> getConnectionListeners() {
        return this.connectionListeners;
    }

    public PacketCollector createPacketCollector(PacketFilter packetFilter) {
        PacketCollector collector = new PacketCollector(this, packetFilter);
        this.collectors.add(collector);
        return collector;
    }

    protected void removePacketCollector(PacketCollector collector) {
        this.collectors.remove(collector);
    }

    protected Collection<PacketCollector> getPacketCollectors() {
        return this.collectors;
    }

    public void addPacketListener(PacketListener packetListener, PacketFilter packetFilter) {
        if (packetListener == null) {
            throw new NullPointerException("Packet listener is null.");
        }
        ListenerWrapper wrapper = new ListenerWrapper(packetListener, packetFilter);
        this.recvListeners.put(packetListener, wrapper);
    }

    public void removePacketListener(PacketListener packetListener) {
        this.recvListeners.remove(packetListener);
    }

    protected Map<PacketListener, ListenerWrapper> getPacketListeners() {
        return this.recvListeners;
    }

    public void addPacketSendingListener(PacketListener packetListener, PacketFilter packetFilter) {
        if (packetListener == null) {
            throw new NullPointerException("Packet listener is null.");
        }
        ListenerWrapper wrapper = new ListenerWrapper(packetListener, packetFilter);
        this.sendListeners.put(packetListener, wrapper);
    }

    public void removePacketSendingListener(PacketListener packetListener) {
        this.sendListeners.remove(packetListener);
    }

    protected Map<PacketListener, ListenerWrapper> getPacketSendingListeners() {
        return this.sendListeners;
    }

    protected void firePacketSendingListeners(Packet packet) {
        for (ListenerWrapper listenerWrapper : this.sendListeners.values()) {
            listenerWrapper.notifyListener(packet);
        }
    }

    public void addPacketInterceptor(PacketInterceptor packetInterceptor, PacketFilter packetFilter) {
        if (packetInterceptor == null) {
            throw new NullPointerException("Packet interceptor is null.");
        }
        this.interceptors.put(packetInterceptor, new InterceptorWrapper(packetInterceptor, packetFilter));
    }

    public void removePacketInterceptor(PacketInterceptor packetInterceptor) {
        this.interceptors.remove(packetInterceptor);
    }

    protected Map<PacketInterceptor, InterceptorWrapper> getPacketInterceptors() {
        return this.interceptors;
    }

    protected void firePacketInterceptors(Packet packet) {
        if (packet != null) {
            for (InterceptorWrapper interceptorWrapper : this.interceptors.values()) {
                interceptorWrapper.notifyListener(packet);
            }
        }
    }

    protected void initDebugger() {
        if (this.reader == null || this.writer == null) {
            throw new NullPointerException("Reader or writer isn't initialized.");
        }
        if (this.config.isDebuggerEnabled()) {
            if (this.debugger == null) {
                String className = null;
                try {
                    className = System.getProperty("smack.debuggerClass");
                } catch (Throwable th) {
                }
                Class<?> debuggerClass = null;
                if (className != null) {
                    try {
                        debuggerClass = Class.forName(className);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (debuggerClass == null) {
                    try {
                        debuggerClass = Class.forName("org.jivesoftware.smackx.debugger.EnhancedDebugger");
                    } catch (Exception e2) {
                        try {
                            debuggerClass = Class.forName("org.jivesoftware.smack.debugger.LiteDebugger");
                        } catch (Exception ex2) {
                            ex2.printStackTrace();
                        }
                    }
                }
                try {
                    Constructor<?> constructor = debuggerClass.getConstructor(Connection.class, Writer.class, Reader.class);
                    this.debugger = (SmackDebugger) constructor.newInstance(this, this.writer, this.reader);
                    this.reader = this.debugger.getReader();
                    this.writer = this.debugger.getWriter();
                    return;
                } catch (Exception e3) {
                    throw new IllegalArgumentException("Can't initialize the configured debugger!", e3);
                }
            }
            this.reader = this.debugger.newConnectionReader(this.reader);
            this.writer = this.debugger.newConnectionWriter(this.writer);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Connection$ListenerWrapper.class */
    protected static class ListenerWrapper {
        private PacketListener packetListener;
        private PacketFilter packetFilter;

        public ListenerWrapper(PacketListener packetListener, PacketFilter packetFilter) {
            this.packetListener = packetListener;
            this.packetFilter = packetFilter;
        }

        public void notifyListener(Packet packet) {
            if (this.packetFilter == null || this.packetFilter.accept(packet)) {
                this.packetListener.processPacket(packet);
            }
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Connection$InterceptorWrapper.class */
    protected static class InterceptorWrapper {
        private PacketInterceptor packetInterceptor;
        private PacketFilter packetFilter;

        public InterceptorWrapper(PacketInterceptor packetInterceptor, PacketFilter packetFilter) {
            this.packetInterceptor = packetInterceptor;
            this.packetFilter = packetFilter;
        }

        public boolean equals(Object object) {
            if (object == null) {
                return false;
            }
            if (object instanceof InterceptorWrapper) {
                return ((InterceptorWrapper) object).packetInterceptor.equals(this.packetInterceptor);
            }
            if (object instanceof PacketInterceptor) {
                return object.equals(this.packetInterceptor);
            }
            return false;
        }

        public void notifyListener(Packet packet) {
            if (this.packetFilter == null || this.packetFilter.accept(packet)) {
                this.packetInterceptor.interceptPacket(packet);
            }
        }
    }
}
