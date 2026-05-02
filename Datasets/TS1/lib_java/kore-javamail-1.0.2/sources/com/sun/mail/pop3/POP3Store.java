package com.sun.mail.pop3;

import com.sun.mail.util.MailConnectException;
import com.sun.mail.util.MailLogger;
import com.sun.mail.util.PropUtil;
import com.sun.mail.util.SocketConnectException;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Collections;
import java.util.Map;
import java.util.logging.Level;
import korex.mail.AuthenticationFailedException;
import korex.mail.Folder;
import korex.mail.MessagingException;
import korex.mail.Session;
import korex.mail.Store;
import korex.mail.URLName;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/POP3Store.class */
public class POP3Store extends Store {
    private String name;
    private int defaultPort;
    private boolean isSSL;
    private Protocol port;
    private POP3Folder portOwner;
    private String host;
    private int portNum;
    private String user;
    private String passwd;
    private boolean useStartTLS;
    private boolean requireStartTLS;
    private boolean usingSSL;
    private Map capabilities;
    private MailLogger logger;
    volatile Constructor messageConstructor;
    volatile boolean rsetBeforeQuit;
    volatile boolean disableTop;
    volatile boolean forgetTopHeaders;
    volatile boolean supportsUidl;
    volatile boolean cacheWriteTo;
    volatile boolean useFileCache;
    volatile File fileCacheDir;
    volatile boolean keepMessageContent;

    public POP3Store(Session session, URLName url) {
        this(session, url, "pop3", false);
    }

    public POP3Store(Session session, URLName url, String name, boolean isSSL) {
        Class messageClass;
        super(session, url);
        this.name = "pop3";
        this.defaultPort = 110;
        this.isSSL = false;
        this.port = null;
        this.portOwner = null;
        this.host = null;
        this.portNum = -1;
        this.user = null;
        this.passwd = null;
        this.useStartTLS = false;
        this.requireStartTLS = false;
        this.usingSSL = false;
        this.messageConstructor = null;
        this.rsetBeforeQuit = false;
        this.disableTop = false;
        this.forgetTopHeaders = false;
        this.supportsUidl = true;
        this.cacheWriteTo = false;
        this.useFileCache = false;
        this.fileCacheDir = null;
        this.keepMessageContent = false;
        name = url != null ? url.getProtocol() : name;
        this.name = name;
        this.logger = new MailLogger(getClass(), "DEBUG POP3", session);
        isSSL = isSSL ? isSSL : PropUtil.getBooleanSessionProperty(session, "mail." + name + ".ssl.enable", false);
        if (isSSL) {
            this.defaultPort = 995;
        } else {
            this.defaultPort = 110;
        }
        this.isSSL = isSSL;
        this.rsetBeforeQuit = getBoolProp("rsetbeforequit");
        this.disableTop = getBoolProp("disabletop");
        this.forgetTopHeaders = getBoolProp("forgettopheaders");
        this.cacheWriteTo = getBoolProp("cachewriteto");
        this.useFileCache = getBoolProp("filecache.enable");
        String dir = session.getProperty("mail." + name + ".filecache.dir");
        if (dir != null && this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("mail." + name + ".filecache.dir: " + dir);
        }
        if (dir != null) {
            this.fileCacheDir = new File(dir);
        }
        this.keepMessageContent = getBoolProp("keepmessagecontent");
        this.useStartTLS = getBoolProp("starttls.enable");
        this.requireStartTLS = getBoolProp("starttls.required");
        String s = session.getProperty("mail." + name + ".message.class");
        if (s != null) {
            this.logger.log(Level.CONFIG, "message class: {0}", s);
            try {
                ClassLoader cl = getClass().getClassLoader();
                try {
                    messageClass = Class.forName(s, false, cl);
                } catch (ClassNotFoundException e) {
                    messageClass = Class.forName(s);
                }
                Class[] c = {Folder.class, Integer.TYPE};
                this.messageConstructor = messageClass.getConstructor(c);
            } catch (Exception ex) {
                this.logger.log(Level.CONFIG, "failed to load message class", (Throwable) ex);
            }
        }
    }

    private final synchronized boolean getBoolProp(String prop) {
        String prop2 = "mail." + this.name + "." + prop;
        boolean val = PropUtil.getBooleanSessionProperty(this.session, prop2, false);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config(prop2 + ": " + val);
        }
        return val;
    }

    synchronized Session getSession() {
        return this.session;
    }

    @Override // korex.mail.Service
    protected synchronized boolean protocolConnect(String host, int portNum, String user, String passwd) throws MessagingException {
        if (host == null || passwd == null || user == null) {
            return false;
        }
        if (portNum == -1) {
            portNum = PropUtil.getIntSessionProperty(this.session, "mail." + this.name + ".port", -1);
        }
        if (portNum == -1) {
            portNum = this.defaultPort;
        }
        this.host = host;
        this.portNum = portNum;
        this.user = user;
        this.passwd = passwd;
        try {
            this.port = getPort(null);
            return true;
        } catch (SocketConnectException scex) {
            throw new MailConnectException(scex);
        } catch (EOFException eex) {
            throw new AuthenticationFailedException(eex.getMessage());
        } catch (IOException ioex) {
            throw new MessagingException("Connect failed", ioex);
        }
    }

    @Override // korex.mail.Service
    public synchronized boolean isConnected() {
        if (!super.isConnected()) {
            return false;
        }
        try {
            if (this.port == null) {
                this.port = getPort(null);
                return true;
            }
            if (!this.port.noop()) {
                throw new IOException("NOOP failed");
            }
            return true;
        } catch (IOException e) {
            try {
                super.close();
                return false;
            } catch (MessagingException e2) {
                return false;
            } catch (Throwable th) {
                return false;
            }
        }
    }

    synchronized Protocol getPort(POP3Folder owner) throws IOException {
        if (this.port != null && this.portOwner == null) {
            this.portOwner = owner;
            return this.port;
        }
        Protocol p = new Protocol(this.host, this.portNum, this.logger, this.session.getProperties(), "mail." + this.name, this.isSSL);
        if (this.useStartTLS || this.requireStartTLS) {
            if (p.hasCapability("STLS")) {
                if (p.stls()) {
                    p.setCapabilities(p.capa());
                } else if (this.requireStartTLS) {
                    this.logger.fine("STLS required but failed");
                    try {
                        p.quit();
                        throw new EOFException("STLS required but failed");
                    } catch (IOException e) {
                        throw new EOFException("STLS required but failed");
                    } catch (Throwable th) {
                        throw new EOFException("STLS required but failed");
                    }
                }
            } else if (this.requireStartTLS) {
                this.logger.fine("STLS required but not supported");
                try {
                    p.quit();
                    throw new EOFException("STLS required but not supported");
                } catch (IOException e2) {
                    throw new EOFException("STLS required but not supported");
                } catch (Throwable th2) {
                    throw new EOFException("STLS required but not supported");
                }
            }
        }
        this.capabilities = p.getCapabilities();
        this.usingSSL = p.isSSL();
        if (!this.disableTop && this.capabilities != null && !this.capabilities.containsKey("TOP")) {
            this.disableTop = true;
            this.logger.fine("server doesn't support TOP, disabling it");
        }
        this.supportsUidl = this.capabilities == null || this.capabilities.containsKey("UIDL");
        String msg = p.login(this.user, this.passwd);
        try {
            if (msg != null) {
                try {
                    p.quit();
                    throw new EOFException(msg);
                } catch (IOException e3) {
                    throw new EOFException(msg);
                }
            }
            if (this.port == null && owner != null) {
                this.port = p;
                this.portOwner = owner;
            }
            if (this.portOwner == null) {
                this.portOwner = owner;
            }
            return p;
        } catch (Throwable th3) {
            throw new EOFException(msg);
        }
    }

    synchronized void closePort(POP3Folder owner) {
        if (this.portOwner == owner) {
            this.port = null;
            this.portOwner = null;
        }
    }

    @Override // korex.mail.Service
    public synchronized void close() throws MessagingException {
        try {
            if (this.port != null) {
                this.port.quit();
            }
        } catch (IOException e) {
        } finally {
            this.port = null;
            super.close();
        }
    }

    @Override // korex.mail.Store
    public Folder getDefaultFolder() throws MessagingException {
        checkConnected();
        return new DefaultFolder(this);
    }

    @Override // korex.mail.Store
    public Folder getFolder(String name) throws MessagingException {
        checkConnected();
        return new POP3Folder(this, name);
    }

    @Override // korex.mail.Store
    public Folder getFolder(URLName url) throws MessagingException {
        checkConnected();
        return new POP3Folder(this, url.getFile());
    }

    public Map capabilities() throws MessagingException {
        Map c;
        synchronized (this) {
            c = this.capabilities;
        }
        if (c != null) {
            return Collections.unmodifiableMap(c);
        }
        return Collections.EMPTY_MAP;
    }

    public synchronized boolean isSSL() {
        return this.usingSSL;
    }

    @Override // korex.mail.Service
    protected void finalize() throws Throwable {
        super.finalize();
        if (this.port != null) {
            close();
        }
    }

    private void checkConnected() throws MessagingException {
        if (!super.isConnected()) {
            throw new MessagingException("Not connected");
        }
    }
}
