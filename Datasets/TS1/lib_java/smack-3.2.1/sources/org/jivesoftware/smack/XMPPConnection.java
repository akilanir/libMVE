package org.jivesoftware.smack;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyStore;
import java.security.Provider;
import java.security.SecureRandom;
import java.security.Security;
import java.util.Collection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.PasswordCallback;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/XMPPConnection.class */
public class XMPPConnection extends Connection {
    Socket socket;
    String connectionID;
    private String user;
    private boolean connected;
    private boolean authenticated;
    private boolean wasAuthenticated;
    private boolean anonymous;
    private boolean usingTLS;
    PacketWriter packetWriter;
    PacketReader packetReader;
    Roster roster;
    private Collection<String> compressionMethods;
    private boolean usingCompression;

    public XMPPConnection(String serviceName, CallbackHandler callbackHandler) {
        super(new ConnectionConfiguration(serviceName));
        this.connectionID = null;
        this.user = null;
        this.connected = false;
        this.authenticated = false;
        this.wasAuthenticated = false;
        this.anonymous = false;
        this.usingTLS = false;
        this.roster = null;
        this.config.setCompressionEnabled(false);
        this.config.setSASLAuthenticationEnabled(true);
        this.config.setDebuggerEnabled(DEBUG_ENABLED);
        this.config.setCallbackHandler(callbackHandler);
    }

    public XMPPConnection(String serviceName) {
        super(new ConnectionConfiguration(serviceName));
        this.connectionID = null;
        this.user = null;
        this.connected = false;
        this.authenticated = false;
        this.wasAuthenticated = false;
        this.anonymous = false;
        this.usingTLS = false;
        this.roster = null;
        this.config.setCompressionEnabled(false);
        this.config.setSASLAuthenticationEnabled(true);
        this.config.setDebuggerEnabled(DEBUG_ENABLED);
    }

    public XMPPConnection(ConnectionConfiguration config) {
        super(config);
        this.connectionID = null;
        this.user = null;
        this.connected = false;
        this.authenticated = false;
        this.wasAuthenticated = false;
        this.anonymous = false;
        this.usingTLS = false;
        this.roster = null;
    }

    public XMPPConnection(ConnectionConfiguration config, CallbackHandler callbackHandler) {
        super(config);
        this.connectionID = null;
        this.user = null;
        this.connected = false;
        this.authenticated = false;
        this.wasAuthenticated = false;
        this.anonymous = false;
        this.usingTLS = false;
        this.roster = null;
        config.setCallbackHandler(callbackHandler);
    }

    @Override // org.jivesoftware.smack.Connection
    public String getConnectionID() {
        if (!isConnected()) {
            return null;
        }
        return this.connectionID;
    }

    @Override // org.jivesoftware.smack.Connection
    public String getUser() {
        if (!isAuthenticated()) {
            return null;
        }
        return this.user;
    }

    @Override // org.jivesoftware.smack.Connection
    public synchronized void login(String username, String password, String resource) throws XMPPException {
        String response;
        if (!isConnected()) {
            throw new IllegalStateException("Not connected to server.");
        }
        if (this.authenticated) {
            throw new IllegalStateException("Already logged in to server.");
        }
        String username2 = username.toLowerCase().trim();
        if (this.config.isSASLAuthenticationEnabled() && this.saslAuthentication.hasNonAnonymousAuthentication()) {
            if (password != null) {
                response = this.saslAuthentication.authenticate(username2, password, resource);
            } else {
                response = this.saslAuthentication.authenticate(username2, resource, this.config.getCallbackHandler());
            }
        } else {
            response = new NonSASLAuthentication(this).authenticate(username2, password, resource);
        }
        if (response != null) {
            this.user = response;
            this.config.setServiceName(StringUtils.parseServer(response));
        } else {
            this.user = username2 + "@" + getServiceName();
            if (resource != null) {
                this.user += "/" + resource;
            }
        }
        if (this.config.isCompressionEnabled()) {
            useCompression();
        }
        this.authenticated = true;
        this.anonymous = false;
        if (this.roster == null) {
            this.roster = new Roster(this);
        }
        if (this.config.isRosterLoadedAtLogin()) {
            this.roster.reload();
        }
        if (this.config.isSendPresence()) {
            this.packetWriter.sendPacket(new Presence(Presence.Type.available));
        }
        this.config.setLoginInfo(username2, password, resource);
        if (this.config.isDebuggerEnabled() && this.debugger != null) {
            this.debugger.userHasLogged(this.user);
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public synchronized void loginAnonymously() throws XMPPException {
        String response;
        if (!isConnected()) {
            throw new IllegalStateException("Not connected to server.");
        }
        if (this.authenticated) {
            throw new IllegalStateException("Already logged in to server.");
        }
        if (this.config.isSASLAuthenticationEnabled() && this.saslAuthentication.hasAnonymousAuthentication()) {
            response = this.saslAuthentication.authenticateAnonymously();
        } else {
            response = new NonSASLAuthentication(this).authenticateAnonymously();
        }
        this.user = response;
        this.config.setServiceName(StringUtils.parseServer(response));
        if (this.config.isCompressionEnabled()) {
            useCompression();
        }
        this.packetWriter.sendPacket(new Presence(Presence.Type.available));
        this.authenticated = true;
        this.anonymous = true;
        if (this.config.isDebuggerEnabled() && this.debugger != null) {
            this.debugger.userHasLogged(this.user);
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public Roster getRoster() {
        synchronized (this) {
            if (!isAuthenticated() || isAnonymous()) {
                if (this.roster == null) {
                    this.roster = new Roster(this);
                }
                return this.roster;
            }
            if (!this.config.isRosterLoadedAtLogin()) {
                this.roster.reload();
            }
            if (!this.roster.rosterInitialized) {
                try {
                    synchronized (this.roster) {
                        long waitTime = SmackConfiguration.getPacketReplyTimeout();
                        long start = System.currentTimeMillis();
                        while (!this.roster.rosterInitialized && waitTime > 0) {
                            this.roster.wait(waitTime);
                            long now = System.currentTimeMillis();
                            waitTime -= now - start;
                            start = now;
                        }
                    }
                } catch (InterruptedException e) {
                }
            }
            return this.roster;
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isConnected() {
        return this.connected;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isSecureConnection() {
        return isUsingTLS();
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isAuthenticated() {
        return this.authenticated;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isAnonymous() {
        return this.anonymous;
    }

    protected void shutdown(Presence unavailablePresence) {
        this.packetWriter.sendPacket(unavailablePresence);
        setWasAuthenticated(this.authenticated);
        this.authenticated = false;
        this.connected = false;
        this.packetReader.shutdown();
        this.packetWriter.shutdown();
        try {
            Thread.sleep(150L);
        } catch (Exception e) {
        }
        if (this.reader != null) {
            try {
                this.reader.close();
            } catch (Throwable th) {
            }
            this.reader = null;
        }
        if (this.writer != null) {
            try {
                this.writer.close();
            } catch (Throwable th2) {
            }
            this.writer = null;
        }
        try {
            this.socket.close();
        } catch (Exception e2) {
        }
        this.saslAuthentication.init();
    }

    @Override // org.jivesoftware.smack.Connection
    public synchronized void disconnect(Presence unavailablePresence) {
        if (this.packetReader == null || this.packetWriter == null) {
            return;
        }
        shutdown(unavailablePresence);
        if (this.roster != null) {
            this.roster.cleanup();
            this.roster = null;
        }
        this.wasAuthenticated = false;
        this.packetWriter.cleanup();
        this.packetWriter = null;
        this.packetReader.cleanup();
        this.packetReader = null;
    }

    @Override // org.jivesoftware.smack.Connection
    public void sendPacket(Packet packet) {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected to server.");
        }
        if (packet == null) {
            throw new NullPointerException("Packet is null.");
        }
        this.packetWriter.sendPacket(packet);
    }

    public void addPacketWriterInterceptor(PacketInterceptor packetInterceptor, PacketFilter packetFilter) {
        addPacketInterceptor(packetInterceptor, packetFilter);
    }

    public void removePacketWriterInterceptor(PacketInterceptor packetInterceptor) {
        removePacketInterceptor(packetInterceptor);
    }

    public void addPacketWriterListener(PacketListener packetListener, PacketFilter packetFilter) {
        addPacketSendingListener(packetListener, packetFilter);
    }

    public void removePacketWriterListener(PacketListener packetListener) {
        removePacketSendingListener(packetListener);
    }

    private void connectUsingConfiguration(ConnectionConfiguration config) throws XMPPException {
        String host = config.getHost();
        int port = config.getPort();
        try {
            if (config.getSocketFactory() == null) {
                this.socket = new Socket(host, port);
            } else {
                this.socket = config.getSocketFactory().createSocket(host, port);
            }
            initConnection();
        } catch (UnknownHostException uhe) {
            String errorMessage = "Could not connect to " + host + ":" + port + ".";
            throw new XMPPException(errorMessage, new XMPPError(XMPPError.Condition.remote_server_timeout, errorMessage), uhe);
        } catch (IOException ioe) {
            String errorMessage2 = "XMPPError connecting to " + host + ":" + port + ".";
            throw new XMPPException(errorMessage2, new XMPPError(XMPPError.Condition.remote_server_error, errorMessage2), ioe);
        }
    }

    private void initConnection() throws XMPPException {
        boolean isFirstInitialization = this.packetReader == null || this.packetWriter == null;
        if (!isFirstInitialization) {
            this.usingCompression = false;
        }
        initReaderAndWriter();
        try {
            if (isFirstInitialization) {
                this.packetWriter = new PacketWriter(this);
                this.packetReader = new PacketReader(this);
                if (this.config.isDebuggerEnabled()) {
                    addPacketListener(this.debugger.getReaderListener(), null);
                    if (this.debugger.getWriterListener() != null) {
                        addPacketSendingListener(this.debugger.getWriterListener(), null);
                    }
                }
            } else {
                this.packetWriter.init();
                this.packetReader.init();
            }
            this.packetWriter.startup();
            this.packetReader.startup();
            this.connected = true;
            this.packetWriter.startKeepAliveProcess();
            if (isFirstInitialization) {
                for (ConnectionCreationListener listener : getConnectionCreationListeners()) {
                    listener.connectionCreated(this);
                }
            } else if (!this.wasAuthenticated) {
                this.packetReader.notifyReconnection();
            }
        } catch (XMPPException ex) {
            if (this.packetWriter != null) {
                try {
                    this.packetWriter.shutdown();
                } catch (Throwable th) {
                }
                this.packetWriter = null;
            }
            if (this.packetReader != null) {
                try {
                    this.packetReader.shutdown();
                } catch (Throwable th2) {
                }
                this.packetReader = null;
            }
            if (this.reader != null) {
                try {
                    this.reader.close();
                } catch (Throwable th3) {
                }
                this.reader = null;
            }
            if (this.writer != null) {
                try {
                    this.writer.close();
                } catch (Throwable th4) {
                }
                this.writer = null;
            }
            if (this.socket != null) {
                try {
                    this.socket.close();
                } catch (Exception e) {
                }
                this.socket = null;
            }
            setWasAuthenticated(this.authenticated);
            this.authenticated = false;
            this.connected = false;
            throw ex;
        }
    }

    private void initReaderAndWriter() throws XMPPException {
        try {
            if (!this.usingCompression) {
                this.reader = new BufferedReader(new InputStreamReader(this.socket.getInputStream(), "UTF-8"));
                this.writer = new BufferedWriter(new OutputStreamWriter(this.socket.getOutputStream(), "UTF-8"));
            } else {
                try {
                    Class<?> zoClass = Class.forName("com.jcraft.jzlib.ZOutputStream");
                    Constructor<?> constructor = zoClass.getConstructor(OutputStream.class, Integer.TYPE);
                    Object out = constructor.newInstance(this.socket.getOutputStream(), 9);
                    Method method = zoClass.getMethod("setFlushMode", Integer.TYPE);
                    method.invoke(out, 2);
                    this.writer = new BufferedWriter(new OutputStreamWriter((OutputStream) out, "UTF-8"));
                    Class<?> ziClass = Class.forName("com.jcraft.jzlib.ZInputStream");
                    Constructor<?> constructor2 = ziClass.getConstructor(InputStream.class);
                    Object in = constructor2.newInstance(this.socket.getInputStream());
                    Method method2 = ziClass.getMethod("setFlushMode", Integer.TYPE);
                    method2.invoke(in, 2);
                    this.reader = new BufferedReader(new InputStreamReader((InputStream) in, "UTF-8"));
                } catch (Exception e) {
                    e.printStackTrace();
                    this.reader = new BufferedReader(new InputStreamReader(this.socket.getInputStream(), "UTF-8"));
                    this.writer = new BufferedWriter(new OutputStreamWriter(this.socket.getOutputStream(), "UTF-8"));
                }
            }
            initDebugger();
        } catch (IOException ioe) {
            throw new XMPPException("XMPPError establishing connection with server.", new XMPPError(XMPPError.Condition.remote_server_error, "XMPPError establishing connection with server."), ioe);
        }
    }

    public boolean isUsingTLS() {
        return this.usingTLS;
    }

    void startTLSReceived(boolean required) {
        if (required && this.config.getSecurityMode() == ConnectionConfiguration.SecurityMode.disabled) {
            this.packetReader.notifyConnectionError(new IllegalStateException("TLS required by server but not allowed by connection configuration"));
            return;
        }
        if (this.config.getSecurityMode() == ConnectionConfiguration.SecurityMode.disabled) {
            return;
        }
        try {
            this.writer.write("<starttls xmlns=\"urn:ietf:params:xml:ns:xmpp-tls\"/>");
            this.writer.flush();
        } catch (IOException e) {
            this.packetReader.notifyConnectionError(e);
        }
    }

    void proceedTLSReceived() throws Exception {
        KeyStore ks;
        SSLContext context = SSLContext.getInstance("TLS");
        KeyManager[] kms = null;
        PasswordCallback pcb = null;
        if (this.config.getCallbackHandler() != null) {
            if (this.config.getKeystoreType().equals("NONE")) {
                ks = null;
                pcb = null;
            } else if (this.config.getKeystoreType().equals("PKCS11")) {
                try {
                    Constructor c = Class.forName("sun.security.pkcs11.SunPKCS11").getConstructor(InputStream.class);
                    String pkcs11Config = "name = SmartCard\nlibrary = " + this.config.getPKCS11Library();
                    ByteArrayInputStream config = new ByteArrayInputStream(pkcs11Config.getBytes());
                    Provider p = (Provider) c.newInstance(config);
                    Security.addProvider(p);
                    ks = KeyStore.getInstance("PKCS11", p);
                    pcb = new PasswordCallback("PKCS11 Password: ", false);
                    this.config.getCallbackHandler().handle(new Callback[]{pcb});
                    ks.load(null, pcb.getPassword());
                } catch (Exception e) {
                    ks = null;
                    pcb = null;
                }
            } else if (this.config.getKeystoreType().equals("Apple")) {
                ks = KeyStore.getInstance("KeychainStore", "Apple");
                ks.load(null, null);
            } else {
                ks = KeyStore.getInstance(this.config.getKeystoreType());
                try {
                    pcb = new PasswordCallback("Keystore Password: ", false);
                    this.config.getCallbackHandler().handle(new Callback[]{pcb});
                    ks.load(new FileInputStream(this.config.getKeystorePath()), pcb.getPassword());
                } catch (Exception e2) {
                    ks = null;
                    pcb = null;
                }
            }
            KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
            try {
                if (pcb == null) {
                    kmf.init(ks, null);
                } else {
                    kmf.init(ks, pcb.getPassword());
                    pcb.clearPassword();
                }
                kms = kmf.getKeyManagers();
            } catch (NullPointerException e3) {
                kms = null;
            }
        }
        context.init(kms, new TrustManager[]{new ServerTrustManager(getServiceName(), this.config)}, new SecureRandom());
        Socket plain = this.socket;
        this.socket = context.getSocketFactory().createSocket(plain, plain.getInetAddress().getHostName(), plain.getPort(), true);
        this.socket.setSoTimeout(0);
        this.socket.setKeepAlive(true);
        initReaderAndWriter();
        ((SSLSocket) this.socket).startHandshake();
        this.usingTLS = true;
        this.packetWriter.setWriter(this.writer);
        this.packetWriter.openStream();
    }

    void setAvailableCompressionMethods(Collection<String> methods) {
        this.compressionMethods = methods;
    }

    private boolean hasAvailableCompressionMethod(String method) {
        return this.compressionMethods != null && this.compressionMethods.contains(method);
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isUsingCompression() {
        return this.usingCompression;
    }

    private boolean useCompression() {
        if (this.authenticated) {
            throw new IllegalStateException("Compression should be negotiated before authentication.");
        }
        try {
            Class.forName("com.jcraft.jzlib.ZOutputStream");
            if (hasAvailableCompressionMethod("zlib")) {
                requestStreamCompression();
                synchronized (this) {
                    try {
                        wait(SmackConfiguration.getPacketReplyTimeout() * 5);
                    } catch (InterruptedException e) {
                    }
                }
                return this.usingCompression;
            }
            return false;
        } catch (ClassNotFoundException e2) {
            throw new IllegalStateException("Cannot use compression. Add smackx.jar to the classpath");
        }
    }

    private void requestStreamCompression() {
        try {
            this.writer.write("<compress xmlns='http://jabber.org/protocol/compress'>");
            this.writer.write("<method>zlib</method></compress>");
            this.writer.flush();
        } catch (IOException e) {
            this.packetReader.notifyConnectionError(e);
        }
    }

    void startStreamCompression() throws Exception {
        this.usingCompression = true;
        initReaderAndWriter();
        this.packetWriter.setWriter(this.writer);
        this.packetWriter.openStream();
        synchronized (this) {
            notify();
        }
    }

    void streamCompressionDenied() {
        synchronized (this) {
            notify();
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public void connect() throws XMPPException {
        connectUsingConfiguration(this.config);
        if (this.connected && this.wasAuthenticated) {
            try {
                if (isAnonymous()) {
                    loginAnonymously();
                } else {
                    login(this.config.getUsername(), this.config.getPassword(), this.config.getResource());
                }
                this.packetReader.notifyReconnection();
            } catch (XMPPException e) {
                e.printStackTrace();
            }
        }
    }

    private void setWasAuthenticated(boolean wasAuthenticated) {
        if (!this.wasAuthenticated) {
            this.wasAuthenticated = wasAuthenticated;
        }
    }
}
