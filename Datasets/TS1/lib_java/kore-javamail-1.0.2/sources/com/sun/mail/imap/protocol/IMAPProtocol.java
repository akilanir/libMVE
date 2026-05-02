package com.sun.mail.imap.protocol;

import com.sun.mail.auth.Ntlm;
import com.sun.mail.iap.Argument;
import com.sun.mail.iap.BadCommandException;
import com.sun.mail.iap.ByteArray;
import com.sun.mail.iap.CommandFailedException;
import com.sun.mail.iap.ConnectionException;
import com.sun.mail.iap.Literal;
import com.sun.mail.iap.LiteralException;
import com.sun.mail.iap.ParsingException;
import com.sun.mail.iap.Protocol;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.ACL;
import com.sun.mail.imap.AppendUID;
import com.sun.mail.imap.CopyUID;
import com.sun.mail.imap.ResyncData;
import com.sun.mail.imap.Rights;
import com.sun.mail.imap.SortTerm;
import com.sun.mail.imap.Utility;
import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.MailLogger;
import com.sun.mail.util.PropUtil;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import korex.mail.Flags;
import korex.mail.Quota;
import korex.mail.internet.MimeUtility;
import korex.mail.search.SearchException;
import korex.mail.search.SearchTerm;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/IMAPProtocol.class */
public class IMAPProtocol extends Protocol {
    private boolean connected;
    private boolean rev1;
    private boolean noauthdebug;
    private boolean authenticated;
    private Map capabilities;
    private List authmechs;
    protected SearchSequence searchSequence;
    protected String[] searchCharsets;
    protected Set<String> enabled;
    private String name;
    private SaslAuthenticator saslAuthenticator;
    private String proxyAuthUser;
    private ByteArray ba;
    private static final byte[] CRLF;
    private static final FetchItem[] fetchItems;
    private volatile String idleTag;
    private static final byte[] DONE;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !IMAPProtocol.class.desiredAssertionStatus();
        CRLF = new byte[]{13, 10};
        fetchItems = new FetchItem[0];
        DONE = new byte[]{68, 79, 78, 69, 13, 10};
    }

    public IMAPProtocol(String name, String host, int port, Properties props, boolean isSSL, MailLogger logger) throws IOException, ProtocolException {
        super(host, port, props, "mail." + name, isSSL, logger);
        this.connected = false;
        this.rev1 = false;
        this.noauthdebug = true;
        try {
            this.name = name;
            this.noauthdebug = !PropUtil.getBooleanProperty(props, "mail.debug.auth", false);
            if (this.capabilities == null) {
                capability();
            }
            if (hasCapability("IMAP4rev1")) {
                this.rev1 = true;
            }
            this.searchCharsets = new String[2];
            this.searchCharsets[0] = "UTF-8";
            this.searchCharsets[1] = MimeUtility.mimeCharset(MimeUtility.getDefaultJavaCharset());
            this.connected = true;
            if (!this.connected) {
                disconnect();
            }
        } catch (Throwable th) {
            if (!this.connected) {
                disconnect();
            }
            throw th;
        }
    }

    public IMAPProtocol(InputStream in, PrintStream out, Properties props, boolean debug) throws IOException {
        super(in, out, props, debug);
        this.connected = false;
        this.rev1 = false;
        this.noauthdebug = true;
        this.name = "imap";
        this.noauthdebug = !PropUtil.getBooleanProperty(props, "mail.debug.auth", false);
        if (this.capabilities == null) {
            this.capabilities = new HashMap();
        }
        this.searchCharsets = new String[2];
        this.searchCharsets[0] = "UTF-8";
        this.searchCharsets[1] = MimeUtility.mimeCharset(MimeUtility.getDefaultJavaCharset());
        this.connected = true;
    }

    public FetchItem[] getFetchItems() {
        return fetchItems;
    }

    public void capability() throws ProtocolException {
        Response[] r = command("CAPABILITY", null);
        if (!r[r.length - 1].isOK()) {
            throw new ProtocolException(r[r.length - 1].toString());
        }
        this.capabilities = new HashMap(10);
        this.authmechs = new ArrayList(5);
        int len = r.length;
        for (int i = 0; i < len; i++) {
            if (r[i] instanceof IMAPResponse) {
                IMAPResponse ir = (IMAPResponse) r[i];
                if (ir.keyEquals("CAPABILITY")) {
                    parseCapabilities(ir);
                }
            }
        }
    }

    protected void setCapabilities(Response r) {
        byte b;
        do {
            b = r.readByte();
            if (b <= 0) {
                break;
            }
        } while (b != 91);
        if (b == 0) {
            return;
        }
        String s = r.readAtom();
        if (!s.equalsIgnoreCase("CAPABILITY")) {
            return;
        }
        this.capabilities = new HashMap(10);
        this.authmechs = new ArrayList(5);
        parseCapabilities(r);
    }

    protected void parseCapabilities(Response r) {
        while (true) {
            String s = r.readAtom();
            if (s != null) {
                if (s.length() == 0) {
                    if (r.peekByte() != 93) {
                        r.skipToken();
                    } else {
                        return;
                    }
                } else {
                    this.capabilities.put(s.toUpperCase(Locale.ENGLISH), s);
                    if (s.regionMatches(true, 0, "AUTH=", 0, 5)) {
                        this.authmechs.add(s.substring(5));
                        if (this.logger.isLoggable(Level.FINE)) {
                            this.logger.fine("AUTH: " + s.substring(5));
                        }
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override // com.sun.mail.iap.Protocol
    protected void processGreeting(Response r) throws ProtocolException {
        super.processGreeting(r);
        if (r.isOK()) {
            setCapabilities(r);
            return;
        }
        if (!$assertionsDisabled && !(r instanceof IMAPResponse)) {
            throw new AssertionError();
        }
        IMAPResponse ir = (IMAPResponse) r;
        if (ir.keyEquals("PREAUTH")) {
            this.authenticated = true;
            setCapabilities(r);
            return;
        }
        throw new ConnectionException(this, r);
    }

    public boolean isAuthenticated() {
        return this.authenticated;
    }

    public boolean isREV1() {
        return this.rev1;
    }

    @Override // com.sun.mail.iap.Protocol
    protected boolean supportsNonSyncLiterals() {
        return hasCapability("LITERAL+");
    }

    @Override // com.sun.mail.iap.Protocol
    public Response readResponse() throws IOException, ProtocolException {
        IMAPResponse r = new IMAPResponse(this);
        if (r.keyEquals("FETCH")) {
            r = new FetchResponse(r, getFetchItems());
        }
        return r;
    }

    public boolean hasCapability(String c) {
        if (c.endsWith("*")) {
            String c2 = c.substring(0, c.length() - 1).toUpperCase(Locale.ENGLISH);
            Iterator it = this.capabilities.keySet().iterator();
            while (it.hasNext()) {
                if (((String) it.next()).startsWith(c2)) {
                    return true;
                }
            }
            return false;
        }
        return this.capabilities.containsKey(c.toUpperCase(Locale.ENGLISH));
    }

    public Map getCapabilities() {
        return this.capabilities;
    }

    @Override // com.sun.mail.iap.Protocol
    public void disconnect() {
        super.disconnect();
        this.authenticated = false;
    }

    public void noop() throws ProtocolException {
        this.logger.fine("IMAPProtocol noop");
        simpleCommand("NOOP", null);
    }

    public void logout() throws ProtocolException {
        try {
            Response[] r = command("LOGOUT", null);
            this.authenticated = false;
            notifyResponseHandlers(r);
        } finally {
            disconnect();
        }
    }

    public void login(String u, String p) throws ProtocolException {
        Argument args = new Argument();
        args.writeString(u);
        args.writeString(p);
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("LOGIN command trace suppressed");
                suspendTracing();
            }
            Response[] r = command("LOGIN", args);
            resumeTracing();
            notifyResponseHandlers(r);
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("LOGIN command result: " + r[r.length - 1]);
            }
            handleResult(r[r.length - 1]);
            setCapabilities(r[r.length - 1]);
            this.authenticated = true;
        } catch (Throwable th) {
            resumeTracing();
            throw th;
        }
    }

    public synchronized void authlogin(String u, String p) throws ProtocolException {
        String s;
        List<Response> v = new ArrayList<>();
        String tag = null;
        Response r = null;
        boolean done = false;
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE LOGIN command trace suppressed");
                suspendTracing();
            }
            try {
                tag = writeCommand("AUTHENTICATE LOGIN", null);
            } catch (Exception ex) {
                r = Response.byeResponse(ex);
                done = true;
            }
            OutputStream os = getOutputStream();
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            OutputStream b64os = new BASE64EncoderStream(bos, Integer.MAX_VALUE);
            boolean first = true;
            while (!done) {
                try {
                    r = readResponse();
                    if (r.isContinuation()) {
                        if (first) {
                            s = u;
                            first = false;
                        } else {
                            s = p;
                        }
                        b64os.write(ASCIIUtility.getBytes(s));
                        b64os.flush();
                        bos.write(CRLF);
                        os.write(bos.toByteArray());
                        os.flush();
                        bos.reset();
                    } else if ((r.isTagged() && r.getTag().equals(tag)) || r.isBYE()) {
                        done = true;
                    } else {
                        v.add(r);
                    }
                } catch (Exception ioex) {
                    r = Response.byeResponse(ioex);
                    done = true;
                }
            }
            Response[] responses = (Response[]) v.toArray(new Response[v.size()]);
            notifyResponseHandlers(responses);
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE LOGIN command result: " + r);
            }
            handleResult(r);
            setCapabilities(r);
            this.authenticated = true;
        } finally {
            resumeTracing();
        }
    }

    public synchronized void authplain(String authzid, String u, String p) throws ProtocolException {
        List<Response> v = new ArrayList<>();
        String tag = null;
        Response r = null;
        boolean done = false;
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE PLAIN command trace suppressed");
                suspendTracing();
            }
            try {
                tag = writeCommand("AUTHENTICATE PLAIN", null);
            } catch (Exception ex) {
                r = Response.byeResponse(ex);
                done = true;
            }
            OutputStream os = getOutputStream();
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            OutputStream b64os = new BASE64EncoderStream(bos, Integer.MAX_VALUE);
            while (!done) {
                try {
                    r = readResponse();
                    if (r.isContinuation()) {
                        String s = (authzid == null ? "" : authzid) + "��" + u + "��" + p;
                        b64os.write(ASCIIUtility.getBytes(s));
                        b64os.flush();
                        bos.write(CRLF);
                        os.write(bos.toByteArray());
                        os.flush();
                        bos.reset();
                    } else if ((r.isTagged() && r.getTag().equals(tag)) || r.isBYE()) {
                        done = true;
                    } else {
                        v.add(r);
                    }
                } catch (Exception ioex) {
                    r = Response.byeResponse(ioex);
                    done = true;
                }
            }
            Response[] responses = (Response[]) v.toArray(new Response[v.size()]);
            notifyResponseHandlers(responses);
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE PLAIN command result: " + r);
            }
            handleResult(r);
            setCapabilities(r);
            this.authenticated = true;
        } finally {
            resumeTracing();
        }
    }

    public synchronized void authntlm(String authzid, String u, String p) throws ProtocolException {
        String s;
        List<Response> v = new ArrayList<>();
        String tag = null;
        Response r = null;
        boolean done = false;
        int flags = PropUtil.getIntProperty(this.props, "mail." + this.name + ".auth.ntlm.flags", 0);
        String domain = this.props.getProperty("mail." + this.name + ".auth.ntlm.domain", "");
        Ntlm ntlm = new Ntlm(domain, getLocalHost(), u, p, this.logger);
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE NTLM command trace suppressed");
                suspendTracing();
            }
            try {
                tag = writeCommand("AUTHENTICATE NTLM", null);
            } catch (Exception ex) {
                r = Response.byeResponse(ex);
                done = true;
            }
            OutputStream os = getOutputStream();
            boolean first = true;
            while (!done) {
                try {
                    r = readResponse();
                    if (r.isContinuation()) {
                        if (first) {
                            s = ntlm.generateType1Msg(flags);
                            first = false;
                        } else {
                            s = ntlm.generateType3Msg(r.getRest());
                        }
                        os.write(ASCIIUtility.getBytes(s));
                        os.write(CRLF);
                        os.flush();
                    } else if ((r.isTagged() && r.getTag().equals(tag)) || r.isBYE()) {
                        done = true;
                    } else {
                        v.add(r);
                    }
                } catch (Exception ioex) {
                    r = Response.byeResponse(ioex);
                    done = true;
                }
            }
            Response[] responses = (Response[]) v.toArray(new Response[v.size()]);
            notifyResponseHandlers(responses);
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("AUTHENTICATE NTLM command result: " + r);
            }
            handleResult(r);
            setCapabilities(r);
            this.authenticated = true;
        } finally {
            resumeTracing();
        }
    }

    public void sasllogin(String[] allowed, String realm, String authzid, String u, String p) throws ProtocolException {
        String serviceHost;
        List v;
        boolean useCanonicalHostName = PropUtil.getBooleanProperty(this.props, "mail." + this.name + ".sasl.usecanonicalhostname", false);
        if (useCanonicalHostName) {
            serviceHost = getInetAddress().getCanonicalHostName();
        } else {
            serviceHost = this.host;
        }
        if (this.saslAuthenticator == null) {
            try {
                Class sac = Class.forName("com.sun.mail.imap.protocol.IMAPSaslAuthenticator");
                Constructor c = sac.getConstructor(IMAPProtocol.class, String.class, Properties.class, MailLogger.class, String.class);
                this.saslAuthenticator = (SaslAuthenticator) c.newInstance(this, this.name, this.props, this.logger, serviceHost);
            } catch (Exception ex) {
                this.logger.log(Level.FINE, "Can't load SASL authenticator", (Throwable) ex);
                return;
            }
        }
        if (allowed != null && allowed.length > 0) {
            v = new ArrayList(allowed.length);
            for (int i = 0; i < allowed.length; i++) {
                if (this.authmechs.contains(allowed[i])) {
                    v.add(allowed[i]);
                }
            }
        } else {
            v = this.authmechs;
        }
        String[] mechs = (String[]) v.toArray(new String[v.size()]);
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("SASL authentication command trace suppressed");
                suspendTracing();
            }
            if (this.saslAuthenticator.authenticate(mechs, realm, authzid, u, p)) {
                if (this.noauthdebug && isTracing()) {
                    this.logger.fine("SASL authentication succeeded");
                }
                this.authenticated = true;
            } else if (this.noauthdebug && isTracing()) {
                this.logger.fine("SASL authentication failed");
            }
        } finally {
            resumeTracing();
        }
    }

    OutputStream getIMAPOutputStream() {
        return getOutputStream();
    }

    public void proxyauth(String u) throws ProtocolException {
        Argument args = new Argument();
        args.writeString(u);
        simpleCommand("PROXYAUTH", args);
        this.proxyAuthUser = u;
    }

    public String getProxyAuthUser() {
        return this.proxyAuthUser;
    }

    public void unauthenticate() throws ProtocolException {
        if (!hasCapability("X-UNAUTHENTICATE")) {
            throw new BadCommandException("UNAUTHENTICATE not supported");
        }
        simpleCommand("UNAUTHENTICATE", null);
        this.authenticated = false;
    }

    public void id(String guid) throws ProtocolException {
        Map<String, String> gmap = new HashMap<>();
        gmap.put("GUID", guid);
        id(gmap);
    }

    public void startTLS() throws ProtocolException {
        try {
            super.startTLS("STARTTLS");
        } catch (ProtocolException pex) {
            this.logger.log(Level.FINE, "STARTTLS ProtocolException", (Throwable) pex);
            throw pex;
        } catch (Exception ex) {
            this.logger.log(Level.FINE, "STARTTLS Exception", (Throwable) ex);
            Response[] r = {Response.byeResponse(ex)};
            notifyResponseHandlers(r);
            disconnect();
            throw new ProtocolException("STARTTLS failure", ex);
        }
    }

    public MailboxInfo select(String mbox) throws ProtocolException {
        return select(mbox, null);
    }

    public MailboxInfo select(String mbox, ResyncData rd) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        if (rd != null) {
            if (rd == ResyncData.CONDSTORE) {
                if (!hasCapability("CONDSTORE")) {
                    throw new BadCommandException("CONDSTORE not supported");
                }
                args.writeArgument(new Argument().writeAtom("CONDSTORE"));
            } else {
                if (!hasCapability("QRESYNC")) {
                    throw new BadCommandException("QRESYNC not supported");
                }
                args.writeArgument(resyncArgs(rd));
            }
        }
        Response[] r = command("SELECT", args);
        MailboxInfo minfo = new MailboxInfo(r);
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            if (response.toString().indexOf("READ-ONLY") != -1) {
                minfo.mode = 1;
            } else {
                minfo.mode = 2;
            }
        }
        handleResult(response);
        return minfo;
    }

    public MailboxInfo examine(String mbox) throws ProtocolException {
        return examine(mbox, null);
    }

    public MailboxInfo examine(String mbox, ResyncData rd) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        if (rd != null) {
            if (rd == ResyncData.CONDSTORE) {
                if (!hasCapability("CONDSTORE")) {
                    throw new BadCommandException("CONDSTORE not supported");
                }
                args.writeArgument(new Argument().writeAtom("CONDSTORE"));
            } else {
                if (!hasCapability("QRESYNC")) {
                    throw new BadCommandException("QRESYNC not supported");
                }
                args.writeArgument(resyncArgs(rd));
            }
        }
        Response[] r = command("EXAMINE", args);
        MailboxInfo minfo = new MailboxInfo(r);
        minfo.mode = 1;
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        return minfo;
    }

    private static Argument resyncArgs(ResyncData rd) {
        Argument cmd = new Argument();
        cmd.writeAtom("QRESYNC");
        Argument args = new Argument();
        args.writeNumber(rd.getUIDValidity());
        args.writeNumber(rd.getModSeq());
        UIDSet[] uids = Utility.getResyncUIDSet(rd);
        if (uids != null) {
            args.writeString(UIDSet.toString(uids));
        }
        cmd.writeArgument(args);
        return cmd;
    }

    public void enable(String cap) throws ProtocolException {
        if (!hasCapability("ENABLE")) {
            throw new BadCommandException("ENABLE not supported");
        }
        Argument args = new Argument();
        args.writeAtom(cap);
        simpleCommand("ENABLE", args);
        if (this.enabled == null) {
            this.enabled = new HashSet();
        }
        this.enabled.add(cap.toUpperCase(Locale.ENGLISH));
    }

    public boolean isEnabled(String cap) {
        if (this.enabled == null) {
            return false;
        }
        return this.enabled.contains(cap.toUpperCase(Locale.ENGLISH));
    }

    public void unselect() throws ProtocolException {
        if (!hasCapability("UNSELECT")) {
            throw new BadCommandException("UNSELECT not supported");
        }
        simpleCommand("UNSELECT", null);
    }

    public Status status(String mbox, String[] items) throws ProtocolException {
        if (!isREV1() && !hasCapability("IMAP4SUNVERSION")) {
            throw new BadCommandException("STATUS not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        Argument itemArgs = new Argument();
        if (items == null) {
            items = Status.standardItems;
        }
        for (String str : items) {
            itemArgs.writeAtom(str);
        }
        args.writeArgument(itemArgs);
        Response[] r = command("STATUS", args);
        Status status = null;
        Response response = r[r.length - 1];
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("STATUS")) {
                        if (status == null) {
                            status = new Status(ir);
                        } else {
                            Status.add(status, new Status(ir));
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return status;
    }

    public void create(String mbox) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        simpleCommand("CREATE", args);
    }

    public void delete(String mbox) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        simpleCommand("DELETE", args);
    }

    public void rename(String o, String n) throws ProtocolException {
        String o2 = BASE64MailboxEncoder.encode(o);
        String n2 = BASE64MailboxEncoder.encode(n);
        Argument args = new Argument();
        args.writeString(o2);
        args.writeString(n2);
        simpleCommand("RENAME", args);
    }

    public void subscribe(String mbox) throws ProtocolException {
        Argument args = new Argument();
        args.writeString(BASE64MailboxEncoder.encode(mbox));
        simpleCommand("SUBSCRIBE", args);
    }

    public void unsubscribe(String mbox) throws ProtocolException {
        Argument args = new Argument();
        args.writeString(BASE64MailboxEncoder.encode(mbox));
        simpleCommand("UNSUBSCRIBE", args);
    }

    public ListInfo[] list(String ref, String pattern) throws ProtocolException {
        return doList("LIST", ref, pattern);
    }

    public ListInfo[] lsub(String ref, String pattern) throws ProtocolException {
        return doList("LSUB", ref, pattern);
    }

    protected ListInfo[] doList(String cmd, String ref, String pat) throws ProtocolException {
        String ref2 = BASE64MailboxEncoder.encode(ref);
        String pat2 = BASE64MailboxEncoder.encode(pat);
        Argument args = new Argument();
        args.writeString(ref2);
        args.writeString(pat2);
        Response[] r = command(cmd, args);
        ListInfo[] linfo = null;
        Response response = r[r.length - 1];
        if (response.isOK()) {
            List<ListInfo> v = new ArrayList<>(1);
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals(cmd)) {
                        v.add(new ListInfo(ir));
                        r[i] = null;
                    }
                }
            }
            if (v.size() > 0) {
                linfo = (ListInfo[]) v.toArray(new ListInfo[v.size()]);
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return linfo;
    }

    public void append(String mbox, Flags f, Date d, Literal data) throws ProtocolException {
        appenduid(mbox, f, d, data, false);
    }

    public AppendUID appenduid(String mbox, Flags f, Date d, Literal data) throws ProtocolException {
        return appenduid(mbox, f, d, data, true);
    }

    public AppendUID appenduid(String mbox, Flags f, Date d, Literal data, boolean uid) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        if (f != null) {
            if (f.contains(Flags.Flag.RECENT)) {
                f = new Flags(f);
                f.remove(Flags.Flag.RECENT);
            }
            args.writeAtom(createFlagList(f));
        }
        if (d != null) {
            args.writeString(INTERNALDATE.format(d));
        }
        args.writeBytes(data);
        Response[] r = command("APPEND", args);
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        if (uid) {
            return getAppendUID(r[r.length - 1]);
        }
        return null;
    }

    private AppendUID getAppendUID(Response r) {
        byte b;
        if (!r.isOK()) {
            return null;
        }
        do {
            b = r.readByte();
            if (b <= 0) {
                break;
            }
        } while (b != 91);
        if (b == 0) {
            return null;
        }
        String s = r.readAtom();
        if (!s.equalsIgnoreCase("APPENDUID")) {
            return null;
        }
        long uidvalidity = r.readLong();
        long uid = r.readLong();
        return new AppendUID(uidvalidity, uid);
    }

    public void check() throws ProtocolException {
        simpleCommand("CHECK", null);
    }

    public void close() throws ProtocolException {
        simpleCommand("CLOSE", null);
    }

    public void expunge() throws ProtocolException {
        simpleCommand("EXPUNGE", null);
    }

    public void uidexpunge(UIDSet[] set) throws ProtocolException {
        if (!hasCapability("UIDPLUS")) {
            throw new BadCommandException("UID EXPUNGE not supported");
        }
        simpleCommand("UID EXPUNGE " + UIDSet.toString(set), null);
    }

    public BODYSTRUCTURE fetchBodyStructure(int msgno) throws ProtocolException {
        Response[] r = fetch(msgno, "BODYSTRUCTURE");
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            return (BODYSTRUCTURE) FetchResponse.getItem(r, msgno, BODYSTRUCTURE.class);
        }
        if (response.isNO()) {
            return null;
        }
        handleResult(response);
        return null;
    }

    public BODY peekBody(int msgno, String section) throws ProtocolException {
        return fetchBody(msgno, section, true);
    }

    public BODY fetchBody(int msgno, String section) throws ProtocolException {
        return fetchBody(msgno, section, false);
    }

    protected BODY fetchBody(int msgno, String section, boolean peek) throws ProtocolException {
        if (section == null) {
            section = "";
        }
        String body = (peek ? "BODY.PEEK[" : "BODY[") + section + "]";
        return fetchSectionBody(msgno, section, body);
    }

    public BODY peekBody(int msgno, String section, int start, int size) throws ProtocolException {
        return fetchBody(msgno, section, start, size, true, null);
    }

    public BODY fetchBody(int msgno, String section, int start, int size) throws ProtocolException {
        return fetchBody(msgno, section, start, size, false, null);
    }

    public BODY peekBody(int msgno, String section, int start, int size, ByteArray ba) throws ProtocolException {
        return fetchBody(msgno, section, start, size, true, ba);
    }

    public BODY fetchBody(int msgno, String section, int start, int size, ByteArray ba) throws ProtocolException {
        return fetchBody(msgno, section, start, size, false, ba);
    }

    protected BODY fetchBody(int msgno, String section, int start, int size, boolean peek, ByteArray ba) throws ProtocolException {
        this.ba = ba;
        if (section == null) {
            section = "";
        }
        String body = (peek ? "BODY.PEEK[" : "BODY[") + section + "]<" + String.valueOf(start) + "." + String.valueOf(size) + ">";
        return fetchSectionBody(msgno, section, body);
    }

    protected BODY fetchSectionBody(int msgno, String section, String body) throws ProtocolException {
        Response[] r = fetch(msgno, body);
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            List<BODY> bl = FetchResponse.getItems(r, msgno, BODY.class);
            if (bl.size() == 1) {
                return bl.get(0);
            }
            if (this.logger.isLoggable(Level.FINEST)) {
                this.logger.finest("got " + bl.size() + " BODY responses for section " + section);
            }
            for (BODY br : bl) {
                if (this.logger.isLoggable(Level.FINEST)) {
                    this.logger.finest("got BODY section " + br.getSection());
                }
                if (br.getSection().equalsIgnoreCase(section)) {
                    return br;
                }
            }
            return null;
        }
        if (response.isNO()) {
            return null;
        }
        handleResult(response);
        return null;
    }

    @Override // com.sun.mail.iap.Protocol
    protected ByteArray getResponseBuffer() {
        ByteArray ret = this.ba;
        this.ba = null;
        return ret;
    }

    public RFC822DATA fetchRFC822(int msgno, String what) throws ProtocolException {
        Response[] r = fetch(msgno, what == null ? "RFC822" : "RFC822." + what);
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            return (RFC822DATA) FetchResponse.getItem(r, msgno, RFC822DATA.class);
        }
        if (response.isNO()) {
            return null;
        }
        handleResult(response);
        return null;
    }

    public Flags fetchFlags(int msgno) throws ProtocolException {
        Flags flags = null;
        Response[] r = fetch(msgno, "FLAGS");
        int i = 0;
        int len = r.length;
        while (true) {
            if (i >= len) {
                break;
            }
            if (r[i] != null && (r[i] instanceof FetchResponse) && ((FetchResponse) r[i]).getNumber() == msgno) {
                FetchResponse fr = (FetchResponse) r[i];
                Flags flags2 = (Flags) fr.getItem(FLAGS.class);
                flags = flags2;
                if (flags2 != null) {
                    r[i] = null;
                    break;
                }
            }
            i++;
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        return flags;
    }

    public UID fetchUID(int msgno) throws ProtocolException {
        Response[] r = fetch(msgno, "UID");
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            return (UID) FetchResponse.getItem(r, msgno, UID.class);
        }
        if (response.isNO()) {
            return null;
        }
        handleResult(response);
        return null;
    }

    public MODSEQ fetchMODSEQ(int msgno) throws ProtocolException {
        Response[] r = fetch(msgno, "MODSEQ");
        notifyResponseHandlers(r);
        Response response = r[r.length - 1];
        if (response.isOK()) {
            return (MODSEQ) FetchResponse.getItem(r, msgno, MODSEQ.class);
        }
        if (response.isNO()) {
            return null;
        }
        handleResult(response);
        return null;
    }

    public UID fetchSequenceNumber(long uid) throws ProtocolException {
        UID u = null;
        Response[] r = fetch(String.valueOf(uid), "UID", true);
        int len = r.length;
        for (int i = 0; i < len; i++) {
            if (r[i] != null && (r[i] instanceof FetchResponse)) {
                FetchResponse fr = (FetchResponse) r[i];
                UID uid2 = (UID) fr.getItem(UID.class);
                u = uid2;
                if (uid2 == null) {
                    continue;
                } else {
                    if (u.uid == uid) {
                        break;
                    }
                    u = null;
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        return u;
    }

    public UID[] fetchSequenceNumbers(long start, long end) throws ProtocolException {
        Response[] r = fetch(String.valueOf(start) + ":" + (end == -1 ? "*" : String.valueOf(end)), "UID", true);
        List<UID> v = new ArrayList<>();
        int len = r.length;
        for (int i = 0; i < len; i++) {
            if (r[i] != null && (r[i] instanceof FetchResponse)) {
                FetchResponse fr = (FetchResponse) r[i];
                UID u = (UID) fr.getItem(UID.class);
                if (u != null) {
                    v.add(u);
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        return (UID[]) v.toArray(new UID[v.size()]);
    }

    public UID[] fetchSequenceNumbers(long[] uids) throws ProtocolException {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < uids.length; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(String.valueOf(uids[i]));
        }
        Response[] r = fetch(sb.toString(), "UID", true);
        List<UID> v = new ArrayList<>();
        int len = r.length;
        for (int i2 = 0; i2 < len; i2++) {
            if (r[i2] != null && (r[i2] instanceof FetchResponse)) {
                FetchResponse fr = (FetchResponse) r[i2];
                UID u = (UID) fr.getItem(UID.class);
                if (u != null) {
                    v.add(u);
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        return (UID[]) v.toArray(new UID[v.size()]);
    }

    public int[] uidfetchChangedSince(long start, long end, long modseq) throws ProtocolException {
        String msgSequence = String.valueOf(start) + ":" + (end == -1 ? "*" : String.valueOf(end));
        Response[] r = command("UID FETCH " + msgSequence + " (FLAGS) (CHANGEDSINCE " + String.valueOf(modseq) + ")", null);
        List v = new ArrayList();
        int len = r.length;
        for (int i = 0; i < len; i++) {
            if (r[i] != null && (r[i] instanceof FetchResponse)) {
                FetchResponse fr = (FetchResponse) r[i];
                v.add(Integer.valueOf(fr.getNumber()));
            }
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        int vsize = v.size();
        int[] matches = new int[vsize];
        for (int i2 = 0; i2 < vsize; i2++) {
            matches[i2] = ((Integer) v.get(i2)).intValue();
        }
        return matches;
    }

    public Response[] fetch(MessageSet[] msgsets, String what) throws ProtocolException {
        return fetch(MessageSet.toString(msgsets), what, false);
    }

    public Response[] fetch(int start, int end, String what) throws ProtocolException {
        return fetch(String.valueOf(start) + ":" + String.valueOf(end), what, false);
    }

    public Response[] fetch(int msg, String what) throws ProtocolException {
        return fetch(String.valueOf(msg), what, false);
    }

    private Response[] fetch(String msgSequence, String what, boolean uid) throws ProtocolException {
        if (uid) {
            return command("UID FETCH " + msgSequence + " (" + what + ")", null);
        }
        return command("FETCH " + msgSequence + " (" + what + ")", null);
    }

    public void copy(MessageSet[] msgsets, String mbox) throws ProtocolException {
        copyuid(MessageSet.toString(msgsets), mbox, false);
    }

    public void copy(int start, int end, String mbox) throws ProtocolException {
        copyuid(String.valueOf(start) + ":" + String.valueOf(end), mbox, false);
    }

    public CopyUID copyuid(MessageSet[] msgsets, String mbox) throws ProtocolException {
        return copyuid(MessageSet.toString(msgsets), mbox, true);
    }

    public CopyUID copyuid(int start, int end, String mbox) throws ProtocolException {
        return copyuid(String.valueOf(start) + ":" + String.valueOf(end), mbox, true);
    }

    public CopyUID copyuid(String msgSequence, String mbox, boolean uid) throws ProtocolException {
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeAtom(msgSequence);
        args.writeString(mbox2);
        Response[] r = command("COPY", args);
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
        if (uid) {
            return getCopyUID(r[r.length - 1]);
        }
        return null;
    }

    private CopyUID getCopyUID(Response r) {
        byte b;
        if (!r.isOK()) {
            return null;
        }
        do {
            b = r.readByte();
            if (b <= 0) {
                break;
            }
        } while (b != 91);
        if (b == 0) {
            return null;
        }
        String s = r.readAtom();
        if (!s.equalsIgnoreCase("COPYUID")) {
            return null;
        }
        long uidvalidity = r.readLong();
        String src = r.readAtom();
        String dst = r.readAtom();
        return new CopyUID(uidvalidity, UIDSet.parseUIDSets(src), UIDSet.parseUIDSets(dst));
    }

    public void storeFlags(MessageSet[] msgsets, Flags flags, boolean set) throws ProtocolException {
        storeFlags(MessageSet.toString(msgsets), flags, set);
    }

    public void storeFlags(int start, int end, Flags flags, boolean set) throws ProtocolException {
        storeFlags(String.valueOf(start) + ":" + String.valueOf(end), flags, set);
    }

    public void storeFlags(int msg, Flags flags, boolean set) throws ProtocolException {
        storeFlags(String.valueOf(msg), flags, set);
    }

    private void storeFlags(String msgset, Flags flags, boolean set) throws ProtocolException {
        Response[] r;
        if (set) {
            r = command("STORE " + msgset + " +FLAGS " + createFlagList(flags), null);
        } else {
            r = command("STORE " + msgset + " -FLAGS " + createFlagList(flags), null);
        }
        notifyResponseHandlers(r);
        handleResult(r[r.length - 1]);
    }

    private String createFlagList(Flags flags) {
        String s;
        StringBuffer sb = new StringBuffer();
        sb.append("(");
        Flags.Flag[] sf = flags.getSystemFlags();
        boolean first = true;
        for (Flags.Flag f : sf) {
            if (f == Flags.Flag.ANSWERED) {
                s = "\\Answered";
            } else if (f == Flags.Flag.DELETED) {
                s = "\\Deleted";
            } else if (f == Flags.Flag.DRAFT) {
                s = "\\Draft";
            } else if (f == Flags.Flag.FLAGGED) {
                s = "\\Flagged";
            } else if (f == Flags.Flag.RECENT) {
                s = "\\Recent";
            } else if (f == Flags.Flag.SEEN) {
                s = "\\Seen";
            }
            if (first) {
                first = false;
            } else {
                sb.append(' ');
            }
            sb.append(s);
        }
        String[] uf = flags.getUserFlags();
        for (String str : uf) {
            if (first) {
                first = false;
            } else {
                sb.append(' ');
            }
            sb.append(str);
        }
        sb.append(")");
        return sb.toString();
    }

    public int[] search(MessageSet[] msgsets, SearchTerm term) throws ProtocolException, SearchException {
        return search(MessageSet.toString(msgsets), term);
    }

    public int[] search(SearchTerm term) throws ProtocolException, SearchException {
        return search("ALL", term);
    }

    private int[] search(String msgSequence, SearchTerm term) throws ProtocolException, SearchException {
        getSearchSequence();
        if (SearchSequence.isAscii(term)) {
            try {
                return issueSearch(msgSequence, term, null);
            } catch (IOException e) {
            }
        }
        for (int i = 0; i < this.searchCharsets.length; i++) {
            if (this.searchCharsets[i] != null) {
                try {
                    return issueSearch(msgSequence, term, this.searchCharsets[i]);
                } catch (CommandFailedException e2) {
                    this.searchCharsets[i] = null;
                } catch (ProtocolException pex) {
                    throw pex;
                } catch (IOException e3) {
                } catch (SearchException sex) {
                    throw sex;
                }
            }
        }
        throw new SearchException("Search failed");
    }

    private int[] issueSearch(String msgSequence, SearchTerm term, String charset) throws ProtocolException, SearchException, IOException {
        Response[] r;
        Argument args = getSearchSequence().generateSequence(term, charset == null ? null : MimeUtility.javaCharset(charset));
        args.writeAtom(msgSequence);
        if (charset == null) {
            r = command("SEARCH", args);
        } else {
            r = command("SEARCH CHARSET " + charset, args);
        }
        Response response = r[r.length - 1];
        int[] matches = null;
        if (response.isOK()) {
            List<Integer> v = new ArrayList<>();
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("SEARCH")) {
                        while (true) {
                            int num = ir.readNumber();
                            if (num == -1) {
                                break;
                            }
                            v.add(Integer.valueOf(num));
                        }
                        r[i] = null;
                    }
                }
            }
            int vsize = v.size();
            matches = new int[vsize];
            for (int i2 = 0; i2 < vsize; i2++) {
                matches[i2] = v.get(i2).intValue();
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return matches;
    }

    protected SearchSequence getSearchSequence() {
        if (this.searchSequence == null) {
            this.searchSequence = new SearchSequence();
        }
        return this.searchSequence;
    }

    public int[] sort(SortTerm[] term, SearchTerm sterm) throws ProtocolException, SearchException {
        if (!hasCapability("SORT*")) {
            throw new BadCommandException("SORT not supported");
        }
        if (term == null || term.length == 0) {
            throw new BadCommandException("Must have at least one sort term");
        }
        Argument args = new Argument();
        Argument sargs = new Argument();
        for (SortTerm sortTerm : term) {
            sargs.writeAtom(sortTerm.toString());
        }
        args.writeArgument(sargs);
        args.writeAtom("UTF-8");
        if (sterm != null) {
            try {
                args.append(getSearchSequence().generateSequence(sterm, "UTF-8"));
            } catch (IOException ioex) {
                throw new SearchException(ioex.toString());
            }
        } else {
            args.writeAtom("ALL");
        }
        Response[] r = command("SORT", args);
        Response response = r[r.length - 1];
        int[] matches = null;
        if (response.isOK()) {
            List<Integer> v = new ArrayList<>();
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("SORT")) {
                        while (true) {
                            int num = ir.readNumber();
                            if (num == -1) {
                                break;
                            }
                            v.add(Integer.valueOf(num));
                        }
                        r[i] = null;
                    }
                }
            }
            int vsize = v.size();
            matches = new int[vsize];
            for (int i2 = 0; i2 < vsize; i2++) {
                matches[i2] = v.get(i2).intValue();
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return matches;
    }

    public Namespaces namespace() throws ProtocolException {
        if (!hasCapability("NAMESPACE")) {
            throw new BadCommandException("NAMESPACE not supported");
        }
        Response[] r = command("NAMESPACE", null);
        Namespaces namespace = null;
        Response response = r[r.length - 1];
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("NAMESPACE")) {
                        if (namespace == null) {
                            namespace = new Namespaces(ir);
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return namespace;
    }

    public Quota[] getQuotaRoot(String mbox) throws ProtocolException {
        if (!hasCapability("QUOTA")) {
            throw new BadCommandException("GETQUOTAROOT not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        Response[] r = command("GETQUOTAROOT", args);
        Response response = r[r.length - 1];
        Hashtable tab = new Hashtable();
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("QUOTAROOT")) {
                        ir.readAtomString();
                        while (true) {
                            String root = ir.readAtomString();
                            if (root == null || root.length() <= 0) {
                                break;
                            }
                            tab.put(root, new Quota(root));
                        }
                        r[i] = null;
                    } else if (ir.keyEquals("QUOTA")) {
                        Quota quota = parseQuota(ir);
                        Quota q = (Quota) tab.get(quota.quotaRoot);
                        if (q != null && q.resources != null) {
                            int newl = q.resources.length + quota.resources.length;
                            Quota.Resource[] newr = new Quota.Resource[newl];
                            System.arraycopy(q.resources, 0, newr, 0, q.resources.length);
                            System.arraycopy(quota.resources, 0, newr, q.resources.length, quota.resources.length);
                            quota.resources = newr;
                        }
                        tab.put(quota.quotaRoot, quota);
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        Quota[] qa = new Quota[tab.size()];
        Enumeration e = tab.elements();
        int i2 = 0;
        while (e.hasMoreElements()) {
            qa[i2] = (Quota) e.nextElement();
            i2++;
        }
        return qa;
    }

    public Quota[] getQuota(String root) throws ProtocolException {
        if (!hasCapability("QUOTA")) {
            throw new BadCommandException("QUOTA not supported");
        }
        Argument args = new Argument();
        args.writeString(root);
        Response[] r = command("GETQUOTA", args);
        List<Quota> v = new ArrayList<>();
        Response response = r[r.length - 1];
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("QUOTA")) {
                        Quota quota = parseQuota(ir);
                        v.add(quota);
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return (Quota[]) v.toArray(new Quota[v.size()]);
    }

    public void setQuota(Quota quota) throws ProtocolException {
        if (!hasCapability("QUOTA")) {
            throw new BadCommandException("QUOTA not supported");
        }
        Argument args = new Argument();
        args.writeString(quota.quotaRoot);
        Argument qargs = new Argument();
        if (quota.resources != null) {
            for (int i = 0; i < quota.resources.length; i++) {
                qargs.writeAtom(quota.resources[i].name);
                qargs.writeNumber(quota.resources[i].limit);
            }
        }
        args.writeArgument(qargs);
        Response[] r = command("SETQUOTA", args);
        Response response = r[r.length - 1];
        notifyResponseHandlers(r);
        handleResult(response);
    }

    private Quota parseQuota(Response r) throws ParsingException {
        String quotaRoot = r.readAtomString();
        Quota q = new Quota(quotaRoot);
        r.skipSpaces();
        if (r.readByte() != 40) {
            throw new ParsingException("parse error in QUOTA");
        }
        List<Quota.Resource> v = new ArrayList<>();
        while (r.peekByte() != 41) {
            String name = r.readAtom();
            if (name != null) {
                long usage = r.readLong();
                long limit = r.readLong();
                Quota.Resource res = new Quota.Resource(name, usage, limit);
                v.add(res);
            }
        }
        r.readByte();
        q.resources = (Quota.Resource[]) v.toArray(new Quota.Resource[v.size()]);
        return q;
    }

    public void setACL(String mbox, char modifier, ACL acl) throws ProtocolException {
        if (!hasCapability("ACL")) {
            throw new BadCommandException("ACL not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        args.writeString(acl.getName());
        String rights = acl.getRights().toString();
        if (modifier == '+' || modifier == '-') {
            rights = modifier + rights;
        }
        args.writeString(rights);
        Response[] r = command("SETACL", args);
        Response response = r[r.length - 1];
        notifyResponseHandlers(r);
        handleResult(response);
    }

    public void deleteACL(String mbox, String user) throws ProtocolException {
        if (!hasCapability("ACL")) {
            throw new BadCommandException("ACL not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        args.writeString(user);
        Response[] r = command("DELETEACL", args);
        Response response = r[r.length - 1];
        notifyResponseHandlers(r);
        handleResult(response);
    }

    public ACL[] getACL(String mbox) throws ProtocolException {
        String rights;
        if (!hasCapability("ACL")) {
            throw new BadCommandException("ACL not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        Response[] r = command("GETACL", args);
        Response response = r[r.length - 1];
        List<ACL> v = new ArrayList<>();
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("ACL")) {
                        ir.readAtomString();
                        while (true) {
                            String name = ir.readAtomString();
                            if (name == null || (rights = ir.readAtomString()) == null) {
                                break;
                            }
                            ACL acl = new ACL(name, new Rights(rights));
                            v.add(acl);
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return (ACL[]) v.toArray(new ACL[v.size()]);
    }

    public Rights[] listRights(String mbox, String user) throws ProtocolException {
        if (!hasCapability("ACL")) {
            throw new BadCommandException("ACL not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        args.writeString(user);
        Response[] r = command("LISTRIGHTS", args);
        Response response = r[r.length - 1];
        List<Rights> v = new ArrayList<>();
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("LISTRIGHTS")) {
                        ir.readAtomString();
                        ir.readAtomString();
                        while (true) {
                            String rights = ir.readAtomString();
                            if (rights == null) {
                                break;
                            }
                            v.add(new Rights(rights));
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return (Rights[]) v.toArray(new Rights[v.size()]);
    }

    public Rights myRights(String mbox) throws ProtocolException {
        if (!hasCapability("ACL")) {
            throw new BadCommandException("ACL not supported");
        }
        String mbox2 = BASE64MailboxEncoder.encode(mbox);
        Argument args = new Argument();
        args.writeString(mbox2);
        Response[] r = command("MYRIGHTS", args);
        Response response = r[r.length - 1];
        Rights rights = null;
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("MYRIGHTS")) {
                        ir.readAtomString();
                        String rs = ir.readAtomString();
                        if (rights == null) {
                            rights = new Rights(rs);
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        return rights;
    }

    public synchronized void idleStart() throws ProtocolException {
        Response r;
        if (!hasCapability("IDLE")) {
            throw new BadCommandException("IDLE not supported");
        }
        List<Response> v = new ArrayList<>();
        boolean done = false;
        try {
            this.idleTag = writeCommand("IDLE", null);
        } catch (LiteralException lex) {
            v.add(lex.getResponse());
            done = true;
        } catch (Exception ex) {
            v.add(Response.byeResponse(ex));
            done = true;
        }
        while (!done) {
            try {
                r = readResponse();
            } catch (ProtocolException e) {
            } catch (IOException ioex) {
                r = Response.byeResponse(ioex);
            }
            v.add(r);
            if (r.isContinuation() || r.isBYE()) {
                done = true;
            }
        }
        Response[] responses = (Response[]) v.toArray(new Response[v.size()]);
        Response r2 = responses[responses.length - 1];
        notifyResponseHandlers(responses);
        if (!r2.isContinuation()) {
            handleResult(r2);
        }
    }

    public synchronized Response readIdleResponse() {
        if (this.idleTag == null) {
            return null;
        }
        Response r = null;
        while (r == null) {
            try {
                r = readResponse();
            } catch (ProtocolException pex) {
                r = Response.byeResponse(pex);
            } catch (InterruptedIOException iioex) {
                r = iioex.bytesTransferred == 0 ? null : Response.byeResponse(iioex);
            } catch (IOException ioex) {
                r = Response.byeResponse(ioex);
            }
        }
        return r;
    }

    public boolean processIdleResponse(Response r) throws ProtocolException {
        Response[] responses = {r};
        boolean done = false;
        notifyResponseHandlers(responses);
        if (r.isBYE()) {
            done = true;
        }
        if (r.isTagged() && r.getTag().equals(this.idleTag)) {
            done = true;
        }
        if (done) {
            this.idleTag = null;
        }
        handleResult(r);
        return !done;
    }

    public void idleAbort() {
        OutputStream os = getOutputStream();
        try {
            os.write(DONE);
            os.flush();
        } catch (Exception ex) {
            this.logger.log(Level.FINEST, "Exception aborting IDLE", (Throwable) ex);
        }
    }

    public Map<String, String> id(Map<String, String> clientParams) throws ProtocolException {
        if (!hasCapability("ID")) {
            throw new BadCommandException("ID not supported");
        }
        Response[] r = command("ID", ID.getArgumentList(clientParams));
        ID id = null;
        Response response = r[r.length - 1];
        if (response.isOK()) {
            int len = r.length;
            for (int i = 0; i < len; i++) {
                if (r[i] instanceof IMAPResponse) {
                    IMAPResponse ir = (IMAPResponse) r[i];
                    if (ir.keyEquals("ID")) {
                        if (id == null) {
                            id = new ID(ir);
                        }
                        r[i] = null;
                    }
                }
            }
        }
        notifyResponseHandlers(r);
        handleResult(response);
        if (id == null) {
            return null;
        }
        return id.getServerParams();
    }
}
