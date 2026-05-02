package korex.mail;

import com.sun.mail.util.LineInputStream;
import com.sun.mail.util.MailLogger;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.lang.reflect.Constructor;
import java.net.InetAddress;
import java.net.URL;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import korex.mail.Provider;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/Session.class */
public final class Session {
    private final Properties props;
    private final Authenticator authenticator;
    private boolean debug;
    private PrintStream out;
    private MailLogger logger;
    private final EventQueue q;
    private static Session defaultSession = null;
    private final Hashtable authTable = new Hashtable();
    private final Vector providers = new Vector();
    private final Hashtable providersByProtocol = new Hashtable();
    private final Hashtable providersByClassName = new Hashtable();
    private final Properties addressMap = new Properties();

    private Session(Properties props, Authenticator authenticator) {
        Class cl;
        this.debug = false;
        this.props = props;
        this.authenticator = authenticator;
        if (Boolean.valueOf(props.getProperty("mail.debug")).booleanValue()) {
            this.debug = true;
        }
        initLogger();
        this.logger.log(Level.CONFIG, "JavaMail version {0}", Version.version);
        if (authenticator != null) {
            cl = authenticator.getClass();
        } else {
            cl = getClass();
        }
        loadProviders(cl);
        loadAddressMap(cl);
        this.q = new EventQueue((Executor) props.get("mail.event.executor"));
    }

    private final synchronized void initLogger() {
        this.logger = new MailLogger(getClass(), "DEBUG", this.debug, getDebugOut());
    }

    public static Session getInstance(Properties props, Authenticator authenticator) {
        return new Session(props, authenticator);
    }

    public static Session getInstance(Properties props) {
        return new Session(props, null);
    }

    public static synchronized Session getDefaultInstance(Properties props, Authenticator authenticator) {
        if (defaultSession == null) {
            SecurityManager security = System.getSecurityManager();
            if (security != null) {
                security.checkSetFactory();
            }
            defaultSession = new Session(props, authenticator);
        } else if (defaultSession.authenticator != authenticator && (defaultSession.authenticator == null || authenticator == null || defaultSession.authenticator.getClass().getClassLoader() != authenticator.getClass().getClassLoader())) {
            throw new SecurityException("Access to default session denied");
        }
        return defaultSession;
    }

    public static Session getDefaultInstance(Properties props) {
        return getDefaultInstance(props, null);
    }

    public synchronized void setDebug(boolean debug) {
        this.debug = debug;
        initLogger();
        this.logger.log(Level.CONFIG, "setDebug: JavaMail version {0}", Version.version);
    }

    public synchronized boolean getDebug() {
        return this.debug;
    }

    public synchronized void setDebugOut(PrintStream out) {
        this.out = out;
        initLogger();
    }

    public synchronized PrintStream getDebugOut() {
        if (this.out == null) {
            return System.out;
        }
        return this.out;
    }

    public synchronized Provider[] getProviders() {
        Provider[] _providers = new Provider[this.providers.size()];
        this.providers.copyInto(_providers);
        return _providers;
    }

    public synchronized Provider getProvider(String protocol) throws NoSuchProviderException {
        if (protocol == null || protocol.length() <= 0) {
            throw new NoSuchProviderException("Invalid protocol: null");
        }
        Provider _provider = null;
        String _className = this.props.getProperty("mail." + protocol + ".class");
        if (_className != null) {
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("mail." + protocol + ".class property exists and points to " + _className);
            }
            _provider = (Provider) this.providersByClassName.get(_className);
        }
        if (_provider != null) {
            return _provider;
        }
        Provider _provider2 = (Provider) this.providersByProtocol.get(protocol);
        if (_provider2 == null) {
            throw new NoSuchProviderException("No provider for " + protocol);
        }
        if (this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("getProvider() returning " + _provider2.toString());
        }
        return _provider2;
    }

    public synchronized void setProvider(Provider provider) throws NoSuchProviderException {
        if (provider == null) {
            throw new NoSuchProviderException("Can't set null provider");
        }
        this.providersByProtocol.put(provider.getProtocol(), provider);
        this.props.put("mail." + provider.getProtocol() + ".class", provider.getClassName());
    }

    public Store getStore() throws NoSuchProviderException {
        return getStore(getProperty("mail.store.protocol"));
    }

    public Store getStore(String protocol) throws NoSuchProviderException {
        return getStore(new URLName(protocol, null, -1, null, null, null));
    }

    public Store getStore(URLName url) throws NoSuchProviderException {
        String protocol = url.getProtocol();
        Provider p = getProvider(protocol);
        return getStore(p, url);
    }

    public Store getStore(Provider provider) throws NoSuchProviderException {
        return getStore(provider, null);
    }

    private Store getStore(Provider provider, URLName url) throws NoSuchProviderException {
        if (provider == null || provider.getType() != Provider.Type.STORE) {
            throw new NoSuchProviderException("invalid provider");
        }
        try {
            return (Store) getService(provider, url);
        } catch (ClassCastException e) {
            throw new NoSuchProviderException("incorrect class");
        }
    }

    public Folder getFolder(URLName url) throws MessagingException {
        Store store = getStore(url);
        store.connect();
        return store.getFolder(url);
    }

    public Transport getTransport() throws NoSuchProviderException {
        String prot = getProperty("mail.transport.protocol");
        if (prot != null) {
            return getTransport(prot);
        }
        String prot2 = (String) this.addressMap.get("rfc822");
        if (prot2 != null) {
            return getTransport(prot2);
        }
        return getTransport("smtp");
    }

    public Transport getTransport(String protocol) throws NoSuchProviderException {
        return getTransport(new URLName(protocol, null, -1, null, null, null));
    }

    public Transport getTransport(URLName url) throws NoSuchProviderException {
        String protocol = url.getProtocol();
        Provider p = getProvider(protocol);
        return getTransport(p, url);
    }

    public Transport getTransport(Provider provider) throws NoSuchProviderException {
        return getTransport(provider, null);
    }

    public Transport getTransport(Address address) throws NoSuchProviderException {
        String transportProtocol = getProperty("mail.transport.protocol." + address.getType());
        if (transportProtocol != null) {
            return getTransport(transportProtocol);
        }
        String transportProtocol2 = (String) this.addressMap.get(address.getType());
        if (transportProtocol2 != null) {
            return getTransport(transportProtocol2);
        }
        throw new NoSuchProviderException("No provider for Address type: " + address.getType());
    }

    private Transport getTransport(Provider provider, URLName url) throws NoSuchProviderException {
        if (provider == null || provider.getType() != Provider.Type.TRANSPORT) {
            throw new NoSuchProviderException("invalid provider");
        }
        try {
            return (Transport) getService(provider, url);
        } catch (ClassCastException e) {
            throw new NoSuchProviderException("incorrect class");
        }
    }

    private Object getService(Provider provider, URLName url) throws NoSuchProviderException {
        ClassLoader cl;
        if (provider == null) {
            throw new NoSuchProviderException("null");
        }
        if (url == null) {
            url = new URLName(provider.getProtocol(), null, -1, null, null, null);
        }
        if (this.authenticator != null) {
            cl = this.authenticator.getClass().getClassLoader();
        } else {
            cl = getClass().getClassLoader();
        }
        Class serviceClass = null;
        try {
            ClassLoader ccl = getContextClassLoader();
            if (ccl != null) {
                try {
                    serviceClass = Class.forName(provider.getClassName(), false, ccl);
                } catch (ClassNotFoundException e) {
                }
            }
            if (serviceClass == null) {
                serviceClass = Class.forName(provider.getClassName(), false, cl);
            }
        } catch (Exception e2) {
            try {
                serviceClass = Class.forName(provider.getClassName());
            } catch (Exception ex) {
                this.logger.log(Level.FINE, "Exception loading provider", (Throwable) ex);
                throw new NoSuchProviderException(provider.getProtocol());
            }
        }
        try {
            Class[] c = {Session.class, URLName.class};
            Constructor cons = serviceClass.getConstructor(c);
            Object[] o = {this, url};
            Object service = cons.newInstance(o);
            return service;
        } catch (Exception ex2) {
            this.logger.log(Level.FINE, "Exception loading provider", (Throwable) ex2);
            throw new NoSuchProviderException(provider.getProtocol());
        }
    }

    public void setPasswordAuthentication(URLName url, PasswordAuthentication pw) {
        if (pw == null) {
            this.authTable.remove(url);
        } else {
            this.authTable.put(url, pw);
        }
    }

    public PasswordAuthentication getPasswordAuthentication(URLName url) {
        return (PasswordAuthentication) this.authTable.get(url);
    }

    public PasswordAuthentication requestPasswordAuthentication(InetAddress addr, int port, String protocol, String prompt, String defaultUserName) {
        if (this.authenticator != null) {
            return this.authenticator.requestPasswordAuthentication(addr, port, protocol, prompt, defaultUserName);
        }
        return null;
    }

    public Properties getProperties() {
        return this.props;
    }

    public String getProperty(String name) {
        return this.props.getProperty(name);
    }

    private void loadProviders(Class cl) {
        StreamLoader loader = new StreamLoader() { // from class: korex.mail.Session.1
            @Override // korex.mail.StreamLoader
            public void load(InputStream is) throws IOException {
                Session.this.loadProvidersFromStream(is);
            }
        };
        try {
            String res = System.getProperty("java.home") + File.separator + "lib" + File.separator + "javamail.providers";
            loadFile(res, loader);
        } catch (SecurityException sex) {
            this.logger.log(Level.CONFIG, "can't get java.home", (Throwable) sex);
        }
        loadAllResources("META-INF/javamail.providers", cl, loader);
        loadResource("/META-INF/javamail.default.providers", cl, loader);
        if (this.providers.size() == 0) {
            this.logger.config("failed to load any providers, using defaults");
            addProvider(new Provider(Provider.Type.STORE, "imap", "com.sun.mail.imap.IMAPStore", "Oracle", Version.version));
            addProvider(new Provider(Provider.Type.STORE, "imaps", "com.sun.mail.imap.IMAPSSLStore", "Oracle", Version.version));
            addProvider(new Provider(Provider.Type.STORE, "pop3", "com.sun.mail.pop3.POP3Store", "Oracle", Version.version));
            addProvider(new Provider(Provider.Type.STORE, "pop3s", "com.sun.mail.pop3.POP3SSLStore", "Oracle", Version.version));
            addProvider(new Provider(Provider.Type.TRANSPORT, "smtp", "com.sun.mail.smtp.SMTPTransport", "Oracle", Version.version));
            addProvider(new Provider(Provider.Type.TRANSPORT, "smtps", "com.sun.mail.smtp.SMTPSSLTransport", "Oracle", Version.version));
        }
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config("Tables of loaded providers");
            this.logger.config("Providers Listed By Class Name: " + this.providersByClassName.toString());
            this.logger.config("Providers Listed By Protocol: " + this.providersByProtocol.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadProvidersFromStream(InputStream is) throws IOException {
        if (is != null) {
            LineInputStream lis = new LineInputStream(is);
            while (true) {
                String currLine = lis.readLine();
                if (currLine != null) {
                    if (!currLine.startsWith("#")) {
                        Provider.Type type = null;
                        String protocol = null;
                        String className = null;
                        String vendor = null;
                        String version = null;
                        StringTokenizer tuples = new StringTokenizer(currLine, ";");
                        while (tuples.hasMoreTokens()) {
                            String currTuple = tuples.nextToken().trim();
                            int sep = currTuple.indexOf("=");
                            if (currTuple.startsWith("protocol=")) {
                                protocol = currTuple.substring(sep + 1);
                            } else if (currTuple.startsWith("type=")) {
                                String strType = currTuple.substring(sep + 1);
                                if (strType.equalsIgnoreCase("store")) {
                                    type = Provider.Type.STORE;
                                } else if (strType.equalsIgnoreCase("transport")) {
                                    type = Provider.Type.TRANSPORT;
                                }
                            } else if (currTuple.startsWith("class=")) {
                                className = currTuple.substring(sep + 1);
                            } else if (currTuple.startsWith("vendor=")) {
                                vendor = currTuple.substring(sep + 1);
                            } else if (currTuple.startsWith("version=")) {
                                version = currTuple.substring(sep + 1);
                            }
                        }
                        if (type == null || protocol == null || className == null || protocol.length() <= 0 || className.length() <= 0) {
                            this.logger.log(Level.CONFIG, "Bad provider entry: {0}", currLine);
                        } else {
                            Provider provider = new Provider(type, protocol, className, vendor, version);
                            addProvider(provider);
                        }
                    }
                } else {
                    return;
                }
            }
        }
    }

    public synchronized void addProvider(Provider provider) {
        this.providers.addElement(provider);
        this.providersByClassName.put(provider.getClassName(), provider);
        if (!this.providersByProtocol.containsKey(provider.getProtocol())) {
            this.providersByProtocol.put(provider.getProtocol(), provider);
        }
    }

    private void loadAddressMap(Class cl) {
        StreamLoader loader = new StreamLoader() { // from class: korex.mail.Session.2
            @Override // korex.mail.StreamLoader
            public void load(InputStream is) throws IOException {
                Session.this.addressMap.load(is);
            }
        };
        loadResource("/META-INF/javamail.default.address.map", cl, loader);
        loadAllResources("META-INF/javamail.address.map", cl, loader);
        try {
            String res = System.getProperty("java.home") + File.separator + "lib" + File.separator + "javamail.address.map";
            loadFile(res, loader);
        } catch (SecurityException sex) {
            this.logger.log(Level.CONFIG, "can't get java.home", (Throwable) sex);
        }
        if (this.addressMap.isEmpty()) {
            this.logger.config("failed to load address map, using defaults");
            this.addressMap.put("rfc822", "smtp");
        }
    }

    public synchronized void setProtocolForAddress(String addresstype, String protocol) {
        if (protocol == null) {
            this.addressMap.remove(addresstype);
        } else {
            this.addressMap.put(addresstype, protocol);
        }
    }

    private void loadFile(String name, StreamLoader loader) {
        InputStream clis = null;
        try {
            try {
                clis = new BufferedInputStream(new FileInputStream(name));
                loader.load(clis);
                this.logger.log(Level.CONFIG, "successfully loaded file: {0}", name);
                if (clis != null) {
                    try {
                        clis.close();
                    } catch (IOException e) {
                    }
                }
            } catch (Throwable th) {
                if (clis != null) {
                    try {
                        clis.close();
                    } catch (IOException e2) {
                        throw th;
                    }
                }
                throw th;
            }
        } catch (FileNotFoundException e3) {
            if (clis != null) {
                try {
                    clis.close();
                } catch (IOException e4) {
                }
            }
        } catch (IOException e5) {
            if (this.logger.isLoggable(Level.CONFIG)) {
                this.logger.log(Level.CONFIG, "not loading file: " + name, (Throwable) e5);
            }
            if (clis != null) {
                try {
                    clis.close();
                } catch (IOException e6) {
                }
            }
        } catch (SecurityException sex) {
            if (this.logger.isLoggable(Level.CONFIG)) {
                this.logger.log(Level.CONFIG, "not loading file: " + name, (Throwable) sex);
            }
            if (clis != null) {
                try {
                    clis.close();
                } catch (IOException e7) {
                }
            }
        }
    }

    private void loadResource(String name, Class cl, StreamLoader loader) {
        InputStream clis = null;
        try {
            try {
                clis = getResourceAsStream(cl, name);
                if (clis != null) {
                    loader.load(clis);
                    this.logger.log(Level.CONFIG, "successfully loaded resource: {0}", name);
                }
                if (clis != null) {
                    try {
                        clis.close();
                    } catch (IOException e) {
                    }
                }
            } catch (IOException e2) {
                this.logger.log(Level.CONFIG, "Exception loading resource", (Throwable) e2);
                if (clis != null) {
                    try {
                        clis.close();
                    } catch (IOException e3) {
                    }
                }
            } catch (SecurityException sex) {
                this.logger.log(Level.CONFIG, "Exception loading resource", (Throwable) sex);
                if (clis != null) {
                    try {
                        clis.close();
                    } catch (IOException e4) {
                    }
                }
            }
        } catch (Throwable th) {
            if (clis != null) {
                try {
                    clis.close();
                } catch (IOException e5) {
                    throw th;
                }
            }
            throw th;
        }
    }

    private void loadAllResources(String name, Class cl, StreamLoader loader) {
        boolean anyLoaded = false;
        try {
            ClassLoader cld = getContextClassLoader();
            if (cld == null) {
                cld = cl.getClassLoader();
            }
            URL[] urls = cld != null ? getResources(cld, name) : getSystemResources(name);
            if (urls != null) {
                for (URL url : urls) {
                    InputStream clis = null;
                    this.logger.log(Level.CONFIG, "URL {0}", url);
                    try {
                        try {
                            clis = openStream(url);
                            if (clis != null) {
                                loader.load(clis);
                                anyLoaded = true;
                                this.logger.log(Level.CONFIG, "successfully loaded resource: {0}", url);
                            } else {
                                this.logger.log(Level.CONFIG, "not loading resource: {0}", url);
                            }
                            if (clis != null) {
                                try {
                                    clis.close();
                                } catch (IOException e) {
                                }
                            }
                        } catch (Throwable th) {
                            if (clis != null) {
                                try {
                                    clis.close();
                                } catch (IOException e2) {
                                    throw th;
                                }
                            }
                            throw th;
                        }
                    } catch (FileNotFoundException e3) {
                        if (clis != null) {
                            try {
                                clis.close();
                            } catch (IOException e4) {
                            }
                        }
                    } catch (IOException ioex) {
                        this.logger.log(Level.CONFIG, "Exception loading resource", (Throwable) ioex);
                        if (clis != null) {
                            try {
                                clis.close();
                            } catch (IOException e5) {
                            }
                        }
                    } catch (SecurityException sex) {
                        this.logger.log(Level.CONFIG, "Exception loading resource", (Throwable) sex);
                        if (clis != null) {
                            try {
                                clis.close();
                            } catch (IOException e6) {
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            this.logger.log(Level.CONFIG, "Exception loading resource", (Throwable) ex);
        }
        if (anyLoaded) {
            return;
        }
        loadResource("/" + name, cl, loader);
    }

    static ClassLoader getContextClassLoader() {
        return (ClassLoader) AccessController.doPrivileged(new PrivilegedAction() { // from class: korex.mail.Session.3
            @Override // java.security.PrivilegedAction
            public Object run() {
                ClassLoader cl = null;
                try {
                    cl = Thread.currentThread().getContextClassLoader();
                } catch (SecurityException e) {
                }
                return cl;
            }
        });
    }

    private static InputStream getResourceAsStream(final Class c, final String name) throws IOException {
        try {
            return (InputStream) AccessController.doPrivileged(new PrivilegedExceptionAction() { // from class: korex.mail.Session.4
                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws IOException {
                    return c.getResourceAsStream(name);
                }
            });
        } catch (PrivilegedActionException e) {
            throw ((IOException) e.getException());
        }
    }

    private static URL[] getResources(final ClassLoader cl, final String name) {
        return (URL[]) AccessController.doPrivileged(new PrivilegedAction() { // from class: korex.mail.Session.5
            @Override // java.security.PrivilegedAction
            public Object run() {
                URL[] ret = null;
                try {
                    Vector v = new Vector();
                    Enumeration e = cl.getResources(name);
                    while (e != null && e.hasMoreElements()) {
                        URL url = e.nextElement();
                        if (url != null) {
                            v.addElement(url);
                        }
                    }
                    if (v.size() > 0) {
                        ret = new URL[v.size()];
                        v.copyInto(ret);
                    }
                } catch (IOException e2) {
                } catch (SecurityException e3) {
                }
                return ret;
            }
        });
    }

    private static URL[] getSystemResources(final String name) {
        return (URL[]) AccessController.doPrivileged(new PrivilegedAction() { // from class: korex.mail.Session.6
            @Override // java.security.PrivilegedAction
            public Object run() {
                URL[] ret = null;
                try {
                    Vector v = new Vector();
                    Enumeration e = ClassLoader.getSystemResources(name);
                    while (e != null && e.hasMoreElements()) {
                        URL url = e.nextElement();
                        if (url != null) {
                            v.addElement(url);
                        }
                    }
                    if (v.size() > 0) {
                        ret = new URL[v.size()];
                        v.copyInto(ret);
                    }
                } catch (IOException e2) {
                } catch (SecurityException e3) {
                }
                return ret;
            }
        });
    }

    private static InputStream openStream(final URL url) throws IOException {
        try {
            return (InputStream) AccessController.doPrivileged(new PrivilegedExceptionAction() { // from class: korex.mail.Session.7
                @Override // java.security.PrivilegedExceptionAction
                public Object run() throws IOException {
                    return url.openStream();
                }
            });
        } catch (PrivilegedActionException e) {
            throw ((IOException) e.getException());
        }
    }

    EventQueue getEventQueue() {
        return this.q;
    }
}
