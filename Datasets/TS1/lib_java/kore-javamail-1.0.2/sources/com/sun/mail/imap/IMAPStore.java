package com.sun.mail.imap;

import com.sun.mail.iap.BadCommandException;
import com.sun.mail.iap.CommandFailedException;
import com.sun.mail.iap.ConnectionException;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.iap.ResponseHandler;
import com.sun.mail.imap.protocol.IMAPProtocol;
import com.sun.mail.imap.protocol.ListInfo;
import com.sun.mail.imap.protocol.Namespaces;
import com.sun.mail.util.MailConnectException;
import com.sun.mail.util.MailLogger;
import com.sun.mail.util.PropUtil;
import com.sun.mail.util.SocketConnectException;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;
import java.util.logging.Level;
import korex.mail.AuthenticationFailedException;
import korex.mail.Folder;
import korex.mail.MessagingException;
import korex.mail.PasswordAuthentication;
import korex.mail.Quota;
import korex.mail.QuotaAwareStore;
import korex.mail.Session;
import korex.mail.Store;
import korex.mail.StoreClosedException;
import korex.mail.URLName;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:58)
    */
/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPStore.class */
public class IMAPStore extends Store implements QuotaAwareStore, ResponseHandler {
    public static final int RESPONSE = 1000;
    public static final String ID_NAME = "name";
    public static final String ID_VERSION = "version";
    public static final String ID_OS = "os";
    public static final String ID_OS_VERSION = "os-version";
    public static final String ID_VENDOR = "vendor";
    public static final String ID_SUPPORT_URL = "support-url";
    public static final String ID_ADDRESS = "address";
    public static final String ID_DATE = "date";
    public static final String ID_COMMAND = "command";
    public static final String ID_ARGUMENTS = "arguments";
    public static final String ID_ENVIRONMENT = "environment";
    protected final String name;
    protected final int defaultPort;
    protected final boolean isSSL;
    private final int blksize;
    private boolean ignoreSize;
    private final int statusCacheTimeout;
    private final int appendBufferSize;
    private final int minIdleTime;
    private volatile int port;
    protected String host;
    protected String user;
    protected String password;
    protected String proxyAuthUser;
    protected String authorizationID;
    protected String saslRealm;
    private Namespaces namespaces;
    private boolean disableAuthLogin;
    private boolean disableAuthPlain;
    private boolean disableAuthNtlm;
    private boolean enableStartTLS;
    private boolean requireStartTLS;
    private boolean usingSSL;
    private boolean enableSASL;
    private String[] saslMechanisms;
    private boolean forcePasswordRefresh;
    private boolean enableResponseEvents;
    private boolean enableImapEvents;
    private String guid;
    private boolean throwSearchException;
    private boolean peek;
    private volatile boolean connectionFailed;
    private volatile boolean forceClose;
    private final Object connectionFailedLock;
    private boolean debugusername;
    private boolean debugpassword;
    protected MailLogger logger;
    private boolean messageCacheDebug;
    private volatile Constructor folderConstructor;
    private volatile Constructor folderConstructorLI;
    private final ConnectionPool pool;
    private ResponseHandler nonStoreResponseHandler;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IMAPStore.class.desiredAssertionStatus();
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPStore$ConnectionPool.class */
    static class ConnectionPool {
        private Vector folders;
        private final boolean separateStoreConnection;
        private final long clientTimeoutInterval;
        private final long serverTimeoutInterval;
        private final int poolSize;
        private final long pruningInterval;
        private final MailLogger logger;
        private static final int RUNNING = 0;
        private static final int IDLE = 1;
        private static final int ABORTING = 2;
        private IMAPProtocol idleProtocol;
        private Vector authenticatedConnections = new Vector();
        private boolean storeConnectionInUse = false;
        private int idleState = 0;
        private long lastTimePruned = System.currentTimeMillis();

        /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
            java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
            	at java.base/java.lang.System.arraycopy(Native Method)
            	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
            	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
            	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
            	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
            	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
            	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
            	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
            	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
            	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:464)
            	at jadx.core.ProcessClass.process(ProcessClass.java:69)
            	at jadx.core.ProcessClass.generateCode(ProcessClass.java:109)
            	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
            	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
            	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
            */
        static /* synthetic */ long access$702(com.sun.mail.imap.IMAPStore.ConnectionPool r6, long r7) {
            /*
                r0 = r6
                r1 = r7
                // decode failed: arraycopy: source index -1 out of bounds for object array[6]
                r0.lastTimePruned = r1
                return r-1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.imap.IMAPStore.ConnectionPool.access$702(com.sun.mail.imap.IMAPStore$ConnectionPool, long):long");
        }

        ConnectionPool(String name, MailLogger plogger, Session session) {
            boolean debug = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".connectionpool.debug", false);
            this.logger = plogger.getSubLogger("connectionpool", "DEBUG IMAP CP", debug);
            int size = PropUtil.getIntSessionProperty(session, "mail." + name + ".connectionpoolsize", -1);
            if (size > 0) {
                this.poolSize = size;
                if (this.logger.isLoggable(Level.CONFIG)) {
                    this.logger.config("mail.imap.connectionpoolsize: " + this.poolSize);
                }
            } else {
                this.poolSize = 1;
            }
            int connectionPoolTimeout = PropUtil.getIntSessionProperty(session, "mail." + name + ".connectionpooltimeout", -1);
            if (connectionPoolTimeout > 0) {
                this.clientTimeoutInterval = connectionPoolTimeout;
                if (this.logger.isLoggable(Level.CONFIG)) {
                    this.logger.config("mail.imap.connectionpooltimeout: " + this.clientTimeoutInterval);
                }
            } else {
                this.clientTimeoutInterval = 45000L;
            }
            int serverTimeout = PropUtil.getIntSessionProperty(session, "mail." + name + ".servertimeout", -1);
            if (serverTimeout > 0) {
                this.serverTimeoutInterval = serverTimeout;
                if (this.logger.isLoggable(Level.CONFIG)) {
                    this.logger.config("mail.imap.servertimeout: " + this.serverTimeoutInterval);
                }
            } else {
                this.serverTimeoutInterval = 1800000L;
            }
            int pruning = PropUtil.getIntSessionProperty(session, "mail." + name + ".pruninginterval", -1);
            if (pruning > 0) {
                this.pruningInterval = pruning;
                if (this.logger.isLoggable(Level.CONFIG)) {
                    this.logger.config("mail.imap.pruninginterval: " + this.pruningInterval);
                }
            } else {
                this.pruningInterval = 60000L;
            }
            this.separateStoreConnection = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".separatestoreconnection", false);
            if (this.separateStoreConnection) {
                this.logger.config("dedicate a store connection");
            }
        }
    }

    public IMAPStore(Session session, URLName url) {
        this(session, url, "imap", false);
    }

    protected IMAPStore(Session session, URLName url, String name, boolean isSSL) {
        Class folderClass;
        String s;
        super(session, url);
        this.port = -1;
        this.disableAuthLogin = false;
        this.disableAuthPlain = false;
        this.disableAuthNtlm = false;
        this.enableStartTLS = false;
        this.requireStartTLS = false;
        this.usingSSL = false;
        this.enableSASL = false;
        this.forcePasswordRefresh = false;
        this.enableResponseEvents = false;
        this.enableImapEvents = false;
        this.throwSearchException = false;
        this.peek = false;
        this.connectionFailed = false;
        this.forceClose = false;
        this.connectionFailedLock = new Object();
        this.folderConstructor = null;
        this.folderConstructorLI = null;
        this.nonStoreResponseHandler = new ResponseHandler() { // from class: com.sun.mail.imap.IMAPStore.1
            @Override // com.sun.mail.iap.ResponseHandler
            public void handleResponse(Response r) {
                if (r.isOK() || r.isNO() || r.isBAD() || r.isBYE()) {
                    IMAPStore.this.handleResponseCode(r);
                }
                if (r.isBYE()) {
                    IMAPStore.this.logger.fine("IMAPStore non-store connection dead");
                }
            }
        };
        name = url != null ? url.getProtocol() : name;
        this.name = name;
        isSSL = isSSL ? isSSL : PropUtil.getBooleanSessionProperty(session, "mail." + name + ".ssl.enable", false);
        if (isSSL) {
            this.defaultPort = 993;
        } else {
            this.defaultPort = 143;
        }
        this.isSSL = isSSL;
        this.debug = session.getDebug();
        this.debugusername = PropUtil.getBooleanSessionProperty(session, "mail.debug.auth.username", true);
        this.debugpassword = PropUtil.getBooleanSessionProperty(session, "mail.debug.auth.password", false);
        this.logger = new MailLogger(getClass(), "DEBUG " + name.toUpperCase(Locale.ENGLISH), session);
        boolean partialFetch = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".partialfetch", true);
        if (!partialFetch) {
            this.blksize = -1;
            this.logger.config("mail.imap.partialfetch: false");
        } else {
            this.blksize = PropUtil.getIntSessionProperty(session, "mail." + name + ".fetchsize", 16384);
            if (this.logger.isLoggable(Level.CONFIG)) {
                this.logger.config("mail.imap.fetchsize: " + this.blksize);
            }
        }
        this.ignoreSize = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".ignorebodystructuresize", false);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("mail.imap.ignorebodystructuresize: " + this.ignoreSize);
        }
        this.statusCacheTimeout = PropUtil.getIntSessionProperty(session, "mail." + name + ".statuscachetimeout", RESPONSE);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("mail.imap.statuscachetimeout: " + this.statusCacheTimeout);
        }
        this.appendBufferSize = PropUtil.getIntSessionProperty(session, "mail." + name + ".appendbuffersize", -1);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("mail.imap.appendbuffersize: " + this.appendBufferSize);
        }
        this.minIdleTime = PropUtil.getIntSessionProperty(session, "mail." + name + ".minidletime", 10);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("mail.imap.minidletime: " + this.minIdleTime);
        }
        String s2 = session.getProperty("mail." + name + ".proxyauth.user");
        if (s2 != null) {
            this.proxyAuthUser = s2;
            if (this.logger.isLoggable(Level.CONFIG)) {
                this.logger.config("mail.imap.proxyauth.user: " + this.proxyAuthUser);
            }
        }
        this.disableAuthLogin = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".auth.login.disable", false);
        if (this.disableAuthLogin) {
            this.logger.config("disable AUTH=LOGIN");
        }
        this.disableAuthPlain = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".auth.plain.disable", false);
        if (this.disableAuthPlain) {
            this.logger.config("disable AUTH=PLAIN");
        }
        this.disableAuthNtlm = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".auth.ntlm.disable", false);
        if (this.disableAuthNtlm) {
            this.logger.config("disable AUTH=NTLM");
        }
        this.enableStartTLS = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".starttls.enable", false);
        if (this.enableStartTLS) {
            this.logger.config("enable STARTTLS");
        }
        this.requireStartTLS = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".starttls.required", false);
        if (this.requireStartTLS) {
            this.logger.config("require STARTTLS");
        }
        this.enableSASL = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".sasl.enable", false);
        if (this.enableSASL) {
            this.logger.config("enable SASL");
        }
        if (this.enableSASL && (s = session.getProperty("mail." + name + ".sasl.mechanisms")) != null && s.length() > 0) {
            if (this.logger.isLoggable(Level.CONFIG)) {
                this.logger.config("SASL mechanisms allowed: " + s);
            }
            Vector v = new Vector(5);
            StringTokenizer st = new StringTokenizer(s, " ,");
            while (st.hasMoreTokens()) {
                String m = st.nextToken();
                if (m.length() > 0) {
                    v.addElement(m);
                }
            }
            this.saslMechanisms = new String[v.size()];
            v.copyInto(this.saslMechanisms);
        }
        String s3 = session.getProperty("mail." + name + ".sasl.authorizationid");
        if (s3 != null) {
            this.authorizationID = s3;
            this.logger.log(Level.CONFIG, "mail.imap.sasl.authorizationid: {0}", this.authorizationID);
        }
        String s4 = session.getProperty("mail." + name + ".sasl.realm");
        if (s4 != null) {
            this.saslRealm = s4;
            this.logger.log(Level.CONFIG, "mail.imap.sasl.realm: {0}", this.saslRealm);
        }
        this.forcePasswordRefresh = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".forcepasswordrefresh", false);
        if (this.forcePasswordRefresh) {
            this.logger.config("enable forcePasswordRefresh");
        }
        this.enableResponseEvents = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".enableresponseevents", false);
        if (this.enableResponseEvents) {
            this.logger.config("enable IMAP response events");
        }
        this.enableImapEvents = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".enableimapevents", false);
        if (this.enableImapEvents) {
            this.logger.config("enable IMAP IDLE events");
        }
        this.messageCacheDebug = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".messagecache.debug", false);
        this.guid = session.getProperty("mail." + name + ".yahoo.guid");
        if (this.guid != null) {
            this.logger.log(Level.CONFIG, "mail.imap.yahoo.guid: {0}", this.guid);
        }
        this.throwSearchException = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".throwsearchexception", false);
        if (this.throwSearchException) {
            this.logger.config("throw SearchException");
        }
        this.peek = PropUtil.getBooleanSessionProperty(session, "mail." + name + ".peek", false);
        if (this.peek) {
            this.logger.config("peek");
        }
        String s5 = session.getProperty("mail." + name + ".folder.class");
        if (s5 != null) {
            this.logger.log(Level.CONFIG, "IMAP: folder class: {0}", s5);
            try {
                ClassLoader cl = getClass().getClassLoader();
                try {
                    folderClass = Class.forName(s5, false, cl);
                } catch (ClassNotFoundException e) {
                    folderClass = Class.forName(s5);
                }
                Class[] c = {String.class, Character.TYPE, IMAPStore.class, Boolean.class};
                this.folderConstructor = folderClass.getConstructor(c);
                Class[] c2 = {ListInfo.class, IMAPStore.class};
                this.folderConstructorLI = folderClass.getConstructor(c2);
            } catch (Exception ex) {
                this.logger.log(Level.CONFIG, "IMAP: failed to load folder class", (Throwable) ex);
            }
        }
        this.pool = new ConnectionPool(name, this.logger, session);
    }

    @Override // korex.mail.Service
    protected synchronized boolean protocolConnect(String host, int pport, String user, String password) throws MessagingException {
        boolean poolEmpty;
        IMAPProtocol protocol = null;
        if (host == null || password == null || user == null) {
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("protocolConnect returning false, host=" + host + ", user=" + traceUser(user) + ", password=" + tracePassword(password));
                return false;
            }
            return false;
        }
        if (pport != -1) {
            this.port = pport;
        } else {
            this.port = PropUtil.getIntSessionProperty(this.session, "mail." + this.name + ".port", this.port);
        }
        if (this.port == -1) {
            this.port = this.defaultPort;
        }
        try {
            synchronized (this.pool) {
                poolEmpty = this.pool.authenticatedConnections.isEmpty();
            }
            if (poolEmpty) {
                if (this.logger.isLoggable(Level.FINE)) {
                    this.logger.fine("trying to connect to host \"" + host + "\", port " + this.port + ", isSSL " + this.isSSL);
                }
                IMAPProtocol protocol2 = newIMAPProtocol(host, this.port);
                if (this.logger.isLoggable(Level.FINE)) {
                    this.logger.fine("protocolConnect login, host=" + host + ", user=" + traceUser(user) + ", password=" + tracePassword(password));
                }
                protocol2.addResponseHandler(this.nonStoreResponseHandler);
                login(protocol2, user, password);
                protocol2.removeResponseHandler(this.nonStoreResponseHandler);
                protocol2.addResponseHandler(this);
                this.usingSSL = protocol2.isSSL();
                this.host = host;
                this.user = user;
                this.password = password;
                synchronized (this.pool) {
                    this.pool.authenticatedConnections.addElement(protocol2);
                }
            }
            return true;
        } catch (CommandFailedException cex) {
            if (0 != 0) {
                protocol.disconnect();
            }
            throw new AuthenticationFailedException(cex.getResponse().getRest());
        } catch (ProtocolException pex) {
            if (0 != 0) {
                protocol.disconnect();
            }
            throw new MessagingException(pex.getMessage(), pex);
        } catch (SocketConnectException scex) {
            throw new MailConnectException(scex);
        } catch (IOException ioex) {
            throw new MessagingException(ioex.getMessage(), ioex);
        }
    }

    protected IMAPProtocol newIMAPProtocol(String host, int port) throws IOException, ProtocolException {
        return new IMAPProtocol(this.name, host, port, this.session.getProperties(), this.isSSL, this.logger);
    }

    private void login(IMAPProtocol p, String u, String pw) throws ProtocolException {
        String authzid;
        if ((this.enableStartTLS || this.requireStartTLS) && !p.isSSL()) {
            if (p.hasCapability("STARTTLS")) {
                p.startTLS();
                p.capability();
            } else if (this.requireStartTLS) {
                this.logger.fine("STARTTLS required but not supported by server");
                throw new ProtocolException("STARTTLS required but not supported by server");
            }
        }
        if (p.isAuthenticated()) {
            return;
        }
        preLogin(p);
        if (this.guid != null) {
            Map<String, String> gmap = new HashMap<>();
            gmap.put("GUID", this.guid);
            p.id(gmap);
        }
        p.getCapabilities().put("__PRELOGIN__", "");
        if (this.authorizationID != null) {
            authzid = this.authorizationID;
        } else if (this.proxyAuthUser != null) {
            authzid = this.proxyAuthUser;
        } else {
            authzid = null;
        }
        if (this.enableSASL) {
            try {
                p.sasllogin(this.saslMechanisms, this.saslRealm, authzid, u, pw);
                if (!p.isAuthenticated()) {
                    throw new CommandFailedException("SASL authentication failed");
                }
            } catch (UnsupportedOperationException e) {
            }
        }
        if (!p.isAuthenticated()) {
            if (p.hasCapability("AUTH=PLAIN") && !this.disableAuthPlain) {
                p.authplain(authzid, u, pw);
            } else if ((p.hasCapability("AUTH-LOGIN") || p.hasCapability("AUTH=LOGIN")) && !this.disableAuthLogin) {
                p.authlogin(u, pw);
            } else if (p.hasCapability("AUTH=NTLM") && !this.disableAuthNtlm) {
                p.authntlm(authzid, u, pw);
            } else if (!p.hasCapability("LOGINDISABLED")) {
                p.login(u, pw);
            } else {
                throw new ProtocolException("No login methods supported!");
            }
        }
        if (this.proxyAuthUser != null) {
            p.proxyauth(this.proxyAuthUser);
        }
        if (p.hasCapability("__PRELOGIN__")) {
            try {
                p.capability();
            } catch (ConnectionException cex) {
                throw cex;
            } catch (ProtocolException e2) {
            }
        }
    }

    protected void preLogin(IMAPProtocol p) throws ProtocolException {
    }

    public synchronized boolean isSSL() {
        return this.usingSSL;
    }

    public synchronized void setUsername(String user) {
        this.user = user;
    }

    public synchronized void setPassword(String password) {
        this.password = password;
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x01b3 A[Catch: all -> 0x01dc, TryCatch #5 {, blocks: (B:7:0x000d, B:9:0x001a, B:11:0x0028, B:13:0x0032, B:30:0x009c, B:32:0x00a9, B:33:0x00cc, B:35:0x00fd, B:46:0x013c, B:48:0x0143, B:50:0x0151, B:52:0x015a, B:54:0x018a, B:56:0x0199, B:61:0x01a2, B:63:0x01a6, B:64:0x01ab, B:66:0x01b3, B:68:0x01bd, B:69:0x01cc, B:71:0x01d8, B:37:0x0120, B:39:0x012f, B:44:0x0138, B:15:0x003c, B:16:0x0045, B:18:0x004c, B:19:0x0050, B:28:0x0092, B:29:0x009b, B:23:0x0083), top: B:91:0x000d, inners: #0, #2, #4, #6 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    com.sun.mail.imap.protocol.IMAPProtocol getProtocol(com.sun.mail.imap.IMAPFolder r6) throws korex.mail.MessagingException {
        /*
            Method dump skipped, instructions count: 488
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.imap.IMAPStore.getProtocol(com.sun.mail.imap.IMAPFolder):com.sun.mail.imap.protocol.IMAPProtocol");
    }

    private IMAPProtocol getStoreProtocol() throws ProtocolException {
        IMAPProtocol p = null;
        while (p == null) {
            synchronized (this.pool) {
                waitIfIdle();
                if (this.pool.authenticatedConnections.isEmpty()) {
                    this.pool.logger.fine("getStoreProtocol() - no connections in the pool, creating a new one");
                    try {
                        if (this.forcePasswordRefresh) {
                            refreshPassword();
                        }
                        p = newIMAPProtocol(this.host, this.port);
                        login(p, this.user, this.password);
                    } catch (Exception e) {
                        if (p != null) {
                            try {
                                p.logout();
                            } catch (Exception e2) {
                            }
                        }
                        p = null;
                    }
                    if (p == null) {
                        throw new ConnectionException("failed to create new store connection");
                    }
                    p.addResponseHandler(this);
                    this.pool.authenticatedConnections.addElement(p);
                } else {
                    if (this.pool.logger.isLoggable(Level.FINE)) {
                        this.pool.logger.fine("getStoreProtocol() - connection available -- size: " + this.pool.authenticatedConnections.size());
                    }
                    p = (IMAPProtocol) this.pool.authenticatedConnections.firstElement();
                    if (this.proxyAuthUser != null && !this.proxyAuthUser.equals(p.getProxyAuthUser()) && p.hasCapability("X-UNAUTHENTICATE")) {
                        p.unauthenticate();
                        login(p, this.user, this.password);
                    }
                }
                if (!this.pool.storeConnectionInUse) {
                    this.pool.storeConnectionInUse = true;
                    this.pool.logger.fine("getStoreProtocol() -- storeConnectionInUse");
                } else {
                    try {
                        p = null;
                        this.pool.wait();
                    } catch (InterruptedException e3) {
                    }
                }
                timeoutConnections();
            }
        }
        return p;
    }

    IMAPProtocol getFolderStoreProtocol() throws ProtocolException {
        IMAPProtocol p = getStoreProtocol();
        p.removeResponseHandler(this);
        p.addResponseHandler(this.nonStoreResponseHandler);
        return p;
    }

    private void refreshPassword() {
        InetAddress addr;
        if (this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("refresh password, user: " + traceUser(this.user));
        }
        try {
            addr = InetAddress.getByName(this.host);
        } catch (UnknownHostException e) {
            addr = null;
        }
        PasswordAuthentication pa = this.session.requestPasswordAuthentication(addr, this.port, this.name, null, this.user);
        if (pa != null) {
            this.user = pa.getUserName();
            this.password = pa.getPassword();
        }
    }

    boolean allowReadOnlySelect() {
        return PropUtil.getBooleanSessionProperty(this.session, "mail." + this.name + ".allowreadonlyselect", false);
    }

    boolean hasSeparateStoreConnection() {
        return this.pool.separateStoreConnection;
    }

    MailLogger getConnectionPoolLogger() {
        return this.pool.logger;
    }

    boolean getMessageCacheDebug() {
        return this.messageCacheDebug;
    }

    boolean isConnectionPoolFull() {
        boolean z;
        synchronized (this.pool) {
            if (this.pool.logger.isLoggable(Level.FINE)) {
                this.pool.logger.fine("connection pool current size: " + this.pool.authenticatedConnections.size() + "   pool size: " + this.pool.poolSize);
            }
            z = this.pool.authenticatedConnections.size() >= this.pool.poolSize;
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0073 A[Catch: all -> 0x0088, TryCatch #1 {, blocks: (B:6:0x000b, B:8:0x0012, B:10:0x002f, B:11:0x0056, B:12:0x0060, B:14:0x0069, B:16:0x0073, B:17:0x007f, B:18:0x0084), top: B:28:0x000b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void releaseProtocol(com.sun.mail.imap.IMAPFolder r5, com.sun.mail.imap.protocol.IMAPProtocol r6) {
        /*
            r4 = this;
            r0 = r4
            com.sun.mail.imap.IMAPStore$ConnectionPool r0 = r0.pool
            r1 = r0
            r7 = r1
            monitor-enter(r0)
            r0 = r6
            if (r0 == 0) goto L69
            r0 = r4
            boolean r0 = r0.isConnectionPoolFull()     // Catch: java.lang.Throwable -> L88
            if (r0 != 0) goto L56
            r0 = r6
            r1 = r4
            r0.addResponseHandler(r1)     // Catch: java.lang.Throwable -> L88
            r0 = r4
            com.sun.mail.imap.IMAPStore$ConnectionPool r0 = r0.pool     // Catch: java.lang.Throwable -> L88
            java.util.Vector r0 = com.sun.mail.imap.IMAPStore.ConnectionPool.access$000(r0)     // Catch: java.lang.Throwable -> L88
            r1 = r6
            r0.addElement(r1)     // Catch: java.lang.Throwable -> L88
            r0 = r4
            com.sun.mail.util.MailLogger r0 = r0.logger     // Catch: java.lang.Throwable -> L88
            java.util.logging.Level r1 = java.util.logging.Level.FINE     // Catch: java.lang.Throwable -> L88
            boolean r0 = r0.isLoggable(r1)     // Catch: java.lang.Throwable -> L88
            if (r0 == 0) goto L69
            r0 = r4
            com.sun.mail.util.MailLogger r0 = r0.logger     // Catch: java.lang.Throwable -> L88
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L88
            r2 = r1
            r2.<init>()     // Catch: java.lang.Throwable -> L88
            java.lang.String r2 = "added an Authenticated connection -- size: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L88
            r2 = r4
            com.sun.mail.imap.IMAPStore$ConnectionPool r2 = r2.pool     // Catch: java.lang.Throwable -> L88
            java.util.Vector r2 = com.sun.mail.imap.IMAPStore.ConnectionPool.access$000(r2)     // Catch: java.lang.Throwable -> L88
            int r2 = r2.size()     // Catch: java.lang.Throwable -> L88
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L88
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L88
            r0.fine(r1)     // Catch: java.lang.Throwable -> L88
            goto L69
        L56:
            r0 = r4
            com.sun.mail.util.MailLogger r0 = r0.logger     // Catch: java.lang.Throwable -> L88
            java.lang.String r1 = "pool is full, not adding an Authenticated connection"
            r0.fine(r1)     // Catch: java.lang.Throwable -> L88
            r0 = r6
            r0.logout()     // Catch: com.sun.mail.iap.ProtocolException -> L67 java.lang.Throwable -> L88
            goto L69
        L67:
            r8 = move-exception
        L69:
            r0 = r4
            com.sun.mail.imap.IMAPStore$ConnectionPool r0 = r0.pool     // Catch: java.lang.Throwable -> L88
            java.util.Vector r0 = com.sun.mail.imap.IMAPStore.ConnectionPool.access$400(r0)     // Catch: java.lang.Throwable -> L88
            if (r0 == 0) goto L7f
            r0 = r4
            com.sun.mail.imap.IMAPStore$ConnectionPool r0 = r0.pool     // Catch: java.lang.Throwable -> L88
            java.util.Vector r0 = com.sun.mail.imap.IMAPStore.ConnectionPool.access$400(r0)     // Catch: java.lang.Throwable -> L88
            r1 = r5
            boolean r0 = r0.removeElement(r1)     // Catch: java.lang.Throwable -> L88
        L7f:
            r0 = r4
            r0.timeoutConnections()     // Catch: java.lang.Throwable -> L88
            r0 = r7
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L88
            goto L8f
        L88:
            r9 = move-exception
            r0 = r7
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L88
            r0 = r9
            throw r0
        L8f:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.imap.IMAPStore.releaseProtocol(com.sun.mail.imap.IMAPFolder, com.sun.mail.imap.protocol.IMAPProtocol):void");
    }

    private void releaseStoreProtocol(IMAPProtocol protocol) {
        boolean failed;
        if (protocol == null) {
            cleanup();
            return;
        }
        synchronized (this.connectionFailedLock) {
            failed = this.connectionFailed;
            this.connectionFailed = false;
        }
        synchronized (this.pool) {
            this.pool.storeConnectionInUse = false;
            this.pool.notifyAll();
            this.pool.logger.fine("releaseStoreProtocol()");
            timeoutConnections();
        }
        if (!$assertionsDisabled && Thread.holdsLock(this.pool)) {
            throw new AssertionError();
        }
        if (failed) {
            cleanup();
        }
    }

    void releaseFolderStoreProtocol(IMAPProtocol protocol) {
        if (protocol == null) {
            return;
        }
        protocol.removeResponseHandler(this.nonStoreResponseHandler);
        protocol.addResponseHandler(this);
        synchronized (this.pool) {
            this.pool.storeConnectionInUse = false;
            this.pool.notifyAll();
            this.pool.logger.fine("releaseFolderStoreProtocol()");
            timeoutConnections();
        }
    }

    private void emptyConnectionPool(boolean force) {
        synchronized (this.pool) {
            for (int index = this.pool.authenticatedConnections.size() - 1; index >= 0; index--) {
                try {
                    IMAPProtocol p = (IMAPProtocol) this.pool.authenticatedConnections.elementAt(index);
                    p.removeResponseHandler(this);
                    if (force) {
                        p.disconnect();
                    } else {
                        p.logout();
                    }
                } catch (ProtocolException e) {
                }
            }
            this.pool.authenticatedConnections.removeAllElements();
        }
        this.pool.logger.fine("removed all authenticated connections from pool");
    }

    /* JADX WARN: Failed to check method for inline after forced processcom.sun.mail.imap.IMAPStore.ConnectionPool.access$702(com.sun.mail.imap.IMAPStore$ConnectionPool, long):long */
    private void timeoutConnections() {
        synchronized (this.pool) {
            if (System.currentTimeMillis() - this.pool.lastTimePruned > this.pool.pruningInterval && this.pool.authenticatedConnections.size() > 1) {
                if (this.pool.logger.isLoggable(Level.FINE)) {
                    this.pool.logger.fine("checking for connections to prune: " + (System.currentTimeMillis() - this.pool.lastTimePruned));
                    this.pool.logger.fine("clientTimeoutInterval: " + this.pool.clientTimeoutInterval);
                }
                for (int index = this.pool.authenticatedConnections.size() - 1; index > 0; index--) {
                    IMAPProtocol p = (IMAPProtocol) this.pool.authenticatedConnections.elementAt(index);
                    if (this.pool.logger.isLoggable(Level.FINE)) {
                        this.pool.logger.fine("protocol last used: " + (System.currentTimeMillis() - p.getTimestamp()));
                    }
                    if (System.currentTimeMillis() - p.getTimestamp() > this.pool.clientTimeoutInterval) {
                        this.pool.logger.fine("authenticated connection timed out, logging out the connection");
                        p.removeResponseHandler(this);
                        this.pool.authenticatedConnections.removeElementAt(index);
                        try {
                            p.logout();
                        } catch (ProtocolException e) {
                        }
                    }
                }
                ConnectionPool.access$702(this.pool, System.currentTimeMillis());
            }
        }
    }

    int getFetchBlockSize() {
        return this.blksize;
    }

    boolean ignoreBodyStructureSize() {
        return this.ignoreSize;
    }

    Session getSession() {
        return this.session;
    }

    int getStatusCacheTimeout() {
        return this.statusCacheTimeout;
    }

    int getAppendBufferSize() {
        return this.appendBufferSize;
    }

    int getMinIdleTime() {
        return this.minIdleTime;
    }

    boolean throwSearchException() {
        return this.throwSearchException;
    }

    boolean getPeek() {
        return this.peek;
    }

    public synchronized boolean hasCapability(String capability) throws MessagingException {
        IMAPProtocol p = null;
        try {
            try {
                p = getStoreProtocol();
                boolean hasCapability = p.hasCapability(capability);
                releaseStoreProtocol(p);
                return hasCapability;
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    public void setProxyAuthUser(String user) {
        this.proxyAuthUser = user;
    }

    public String getProxyAuthUser() {
        return this.proxyAuthUser;
    }

    @Override // korex.mail.Service
    public synchronized boolean isConnected() {
        if (!super.isConnected()) {
            return false;
        }
        IMAPProtocol p = null;
        try {
            p = getStoreProtocol();
            p.noop();
            releaseStoreProtocol(p);
        } catch (ProtocolException e) {
            releaseStoreProtocol(p);
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
        return super.isConnected();
    }

    @Override // korex.mail.Service
    public synchronized void close() throws MessagingException {
        boolean isEmpty;
        if (!super.isConnected()) {
            return;
        }
        try {
            try {
                synchronized (this.pool) {
                    isEmpty = this.pool.authenticatedConnections.isEmpty();
                }
                if (isEmpty) {
                    this.pool.logger.fine("close() - no connections ");
                    cleanup();
                    releaseStoreProtocol(null);
                } else {
                    IMAPProtocol protocol = getStoreProtocol();
                    synchronized (this.pool) {
                        this.pool.authenticatedConnections.removeElement(protocol);
                    }
                    protocol.logout();
                    releaseStoreProtocol(protocol);
                }
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        } catch (Throwable th) {
            releaseStoreProtocol(null);
            throw th;
        }
    }

    @Override // korex.mail.Service
    protected void finalize() throws Throwable {
        super.finalize();
        close();
    }

    private synchronized void cleanup() {
        boolean force;
        boolean done;
        if (!super.isConnected()) {
            this.logger.fine("IMAPStore cleanup, not connected");
            return;
        }
        synchronized (this.connectionFailedLock) {
            force = this.forceClose;
            this.forceClose = false;
            this.connectionFailed = false;
        }
        if (this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("IMAPStore cleanup, force " + force);
        }
        Vector foldersCopy = null;
        while (true) {
            synchronized (this.pool) {
                if (this.pool.folders != null) {
                    done = false;
                    foldersCopy = this.pool.folders;
                    this.pool.folders = null;
                } else {
                    done = true;
                }
            }
            if (done) {
                break;
            }
            int fsize = foldersCopy.size();
            for (int i = 0; i < fsize; i++) {
                IMAPFolder f = (IMAPFolder) foldersCopy.elementAt(i);
                if (force) {
                    try {
                        this.logger.fine("force folder to close");
                        f.forceClose();
                    } catch (IllegalStateException e) {
                    } catch (MessagingException e2) {
                    }
                } else {
                    this.logger.fine("close folder");
                    f.close(false);
                }
            }
        }
        synchronized (this.pool) {
            emptyConnectionPool(force);
        }
        try {
            super.close();
        } catch (MessagingException e3) {
        }
        this.logger.fine("IMAPStore cleanup done");
    }

    @Override // korex.mail.Store
    public synchronized Folder getDefaultFolder() throws MessagingException {
        checkConnected();
        return new DefaultFolder(this);
    }

    @Override // korex.mail.Store
    public synchronized Folder getFolder(String name) throws MessagingException {
        checkConnected();
        return newIMAPFolder(name, (char) 65535);
    }

    @Override // korex.mail.Store
    public synchronized Folder getFolder(URLName url) throws MessagingException {
        checkConnected();
        return newIMAPFolder(url.getFile(), (char) 65535);
    }

    protected IMAPFolder newIMAPFolder(String fullName, char separator, Boolean isNamespace) {
        IMAPFolder f = null;
        if (this.folderConstructor != null) {
            try {
                Object[] o = {fullName, Character.valueOf(separator), this, isNamespace};
                f = (IMAPFolder) this.folderConstructor.newInstance(o);
            } catch (Exception ex) {
                this.logger.log(Level.FINE, "exception creating IMAPFolder class", (Throwable) ex);
            }
        }
        if (f == null) {
            f = new IMAPFolder(fullName, separator, this, isNamespace);
        }
        return f;
    }

    protected IMAPFolder newIMAPFolder(String fullName, char separator) {
        return newIMAPFolder(fullName, separator, null);
    }

    protected IMAPFolder newIMAPFolder(ListInfo li) {
        IMAPFolder f = null;
        if (this.folderConstructorLI != null) {
            try {
                Object[] o = {li, this};
                f = (IMAPFolder) this.folderConstructorLI.newInstance(o);
            } catch (Exception ex) {
                this.logger.log(Level.FINE, "exception creating IMAPFolder class LI", (Throwable) ex);
            }
        }
        if (f == null) {
            f = new IMAPFolder(li, this);
        }
        return f;
    }

    @Override // korex.mail.Store
    public Folder[] getPersonalNamespaces() throws MessagingException {
        Namespaces ns = getNamespaces();
        if (ns == null || ns.personal == null) {
            return super.getPersonalNamespaces();
        }
        return namespaceToFolders(ns.personal, null);
    }

    @Override // korex.mail.Store
    public Folder[] getUserNamespaces(String user) throws MessagingException {
        Namespaces ns = getNamespaces();
        if (ns == null || ns.otherUsers == null) {
            return super.getUserNamespaces(user);
        }
        return namespaceToFolders(ns.otherUsers, user);
    }

    @Override // korex.mail.Store
    public Folder[] getSharedNamespaces() throws MessagingException {
        Namespaces ns = getNamespaces();
        if (ns == null || ns.shared == null) {
            return super.getSharedNamespaces();
        }
        return namespaceToFolders(ns.shared, null);
    }

    private synchronized Namespaces getNamespaces() throws MessagingException {
        checkConnected();
        IMAPProtocol p = null;
        try {
            if (this.namespaces == null) {
                try {
                    p = getStoreProtocol();
                    this.namespaces = p.namespace();
                    releaseStoreProtocol(p);
                } catch (BadCommandException e) {
                    releaseStoreProtocol(p);
                } catch (ConnectionException cex) {
                    throw new StoreClosedException(this, cex.getMessage());
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            }
            return this.namespaces;
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    private Folder[] namespaceToFolders(Namespaces.Namespace[] ns, String user) {
        Folder[] fa = new Folder[ns.length];
        for (int i = 0; i < fa.length; i++) {
            String name = ns[i].prefix;
            if (user == null) {
                int len = name.length();
                if (len > 0 && name.charAt(len - 1) == ns[i].delimiter) {
                    name = name.substring(0, len - 1);
                }
            } else {
                name = name + user;
            }
            fa[i] = newIMAPFolder(name, ns[i].delimiter, Boolean.valueOf(user == null));
        }
        return fa;
    }

    @Override // korex.mail.QuotaAwareStore
    public synchronized Quota[] getQuota(String root) throws MessagingException {
        checkConnected();
        IMAPProtocol p = null;
        try {
            try {
                try {
                    p = getStoreProtocol();
                    Quota[] qa = p.getQuotaRoot(root);
                    releaseStoreProtocol(p);
                    return qa;
                } catch (ConnectionException cex) {
                    throw new StoreClosedException(this, cex.getMessage());
                }
            } catch (BadCommandException bex) {
                throw new MessagingException("QUOTA not supported", bex);
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    @Override // korex.mail.QuotaAwareStore
    public synchronized void setQuota(Quota quota) throws MessagingException {
        checkConnected();
        IMAPProtocol p = null;
        try {
            try {
                try {
                    try {
                        p = getStoreProtocol();
                        p.setQuota(quota);
                        releaseStoreProtocol(p);
                    } catch (ConnectionException cex) {
                        throw new StoreClosedException(this, cex.getMessage());
                    }
                } catch (BadCommandException bex) {
                    throw new MessagingException("QUOTA not supported", bex);
                }
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    private void checkConnected() {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (!super.isConnected()) {
            throw new IllegalStateException("Not connected");
        }
    }

    @Override // com.sun.mail.iap.ResponseHandler
    public void handleResponse(Response r) {
        if (r.isOK() || r.isNO() || r.isBAD() || r.isBYE()) {
            handleResponseCode(r);
        }
        if (r.isBYE()) {
            this.logger.fine("IMAPStore connection dead");
            synchronized (this.connectionFailedLock) {
                this.connectionFailed = true;
                if (r.isSynthetic()) {
                    this.forceClose = true;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x00fb, code lost:
    
        if (r5.enableImapEvents == false) goto L133;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0102, code lost:
    
        if (r0.isUnTagged() == false) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0105, code lost:
    
        notifyStoreListeners(com.sun.mail.imap.IMAPStore.RESPONSE, r0.toString());
     */
    /* JADX WARN: Removed duplicated region for block: B:114:0x011c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x012a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void idle() throws korex.mail.MessagingException {
        /*
            Method dump skipped, instructions count: 453
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.imap.IMAPStore.idle():void");
    }

    private void waitIfIdle() throws ProtocolException {
        if (!$assertionsDisabled && !Thread.holdsLock(this.pool)) {
            throw new AssertionError();
        }
        while (this.pool.idleState != 0) {
            if (this.pool.idleState == 1) {
                this.pool.idleProtocol.idleAbort();
                this.pool.idleState = 2;
            }
            try {
                this.pool.wait();
            } catch (InterruptedException e) {
            }
        }
    }

    public synchronized Map<String, String> id(Map<String, String> clientParams) throws MessagingException {
        checkConnected();
        IMAPProtocol p = null;
        try {
            try {
                try {
                    p = getStoreProtocol();
                    Map<String, String> serverParams = p.id(clientParams);
                    releaseStoreProtocol(p);
                    return serverParams;
                } catch (ConnectionException cex) {
                    throw new StoreClosedException(this, cex.getMessage());
                }
            } catch (BadCommandException bex) {
                throw new MessagingException("ID not supported", bex);
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    void handleResponseCode(Response r) {
        if (this.enableResponseEvents) {
            notifyStoreListeners(RESPONSE, r.toString());
        }
        String s = r.getRest();
        boolean isAlert = false;
        if (s.startsWith("[")) {
            int i = s.indexOf(93);
            if (i > 0 && s.substring(0, i + 1).equalsIgnoreCase("[ALERT]")) {
                isAlert = true;
            }
            s = s.substring(i + 1).trim();
        }
        if (isAlert) {
            notifyStoreListeners(1, s);
        } else if (r.isUnTagged() && s.length() > 0) {
            notifyStoreListeners(2, s);
        }
    }

    private String traceUser(String user) {
        return this.debugusername ? user : "<user name suppressed>";
    }

    private String tracePassword(String password) {
        return this.debugpassword ? password : password == null ? "<null>" : "<non-null>";
    }
}
