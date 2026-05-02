package com.sun.mail.pop3;

import com.sun.mail.util.LineInputStream;
import com.sun.mail.util.MailLogger;
import com.sun.mail.util.PropUtil;
import com.sun.mail.util.SocketFetcher;
import com.sun.mail.util.TraceInputStream;
import com.sun.mail.util.TraceOutputStream;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.InterruptedIOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.SocketException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.logging.Level;
import javax.net.ssl.SSLSocket;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/Protocol.class */
class Protocol {
    private Socket socket;
    private String host;
    private Properties props;
    private String prefix;
    private DataInputStream input;
    private PrintWriter output;
    private TraceInputStream traceInput;
    private TraceOutputStream traceOutput;
    private MailLogger logger;
    private MailLogger traceLogger;
    private String apopChallenge;
    private Map capabilities = null;
    private boolean pipelining;
    private boolean noauthdebug;
    private boolean traceSuspended;
    private static final int POP3_PORT = 110;
    private static final String CRLF = "\r\n";
    private static final int SLOP = 128;
    private static char[] digits;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Protocol.class.desiredAssertionStatus();
        digits = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    }

    Protocol(String host, int port, MailLogger logger, Properties props, String prefix, boolean isSSL) throws IOException {
        this.apopChallenge = null;
        this.noauthdebug = true;
        this.host = host;
        this.props = props;
        this.prefix = prefix;
        this.logger = logger;
        this.traceLogger = logger.getSubLogger("protocol", null);
        this.noauthdebug = !PropUtil.getBooleanProperty(props, "mail.debug.auth", false);
        boolean enableAPOP = getBoolProp(props, prefix + ".apop.enable");
        boolean disableCapa = getBoolProp(props, prefix + ".disablecapa");
        port = port == -1 ? POP3_PORT : port;
        try {
            if (logger.isLoggable(Level.FINE)) {
                logger.fine("connecting to host \"" + host + "\", port " + port + ", isSSL " + isSSL);
            }
            this.socket = SocketFetcher.getSocket(host, port, props, prefix, isSSL);
            initStreams();
            Response r = simpleCommand(null);
            if (!r.ok) {
                try {
                    this.socket.close();
                    throw new IOException("Connect failed");
                } catch (Throwable th) {
                    throw new IOException("Connect failed");
                }
            }
            if (enableAPOP) {
                int challStart = r.data.indexOf(60);
                int challEnd = r.data.indexOf(62, challStart);
                if (challStart != -1 && challEnd != -1) {
                    this.apopChallenge = r.data.substring(challStart, challEnd + 1);
                }
                logger.log(Level.FINE, "APOP challenge: {0}", this.apopChallenge);
            }
            if (!disableCapa) {
                setCapabilities(capa());
            }
            this.pipelining = hasCapability("PIPELINING") || PropUtil.getBooleanProperty(props, new StringBuilder().append(prefix).append(".pipelining").toString(), false);
            if (this.pipelining) {
                logger.config("PIPELINING enabled");
            }
        } catch (IOException ioe) {
            this.socket.close();
            throw ioe;
        }
    }

    private final synchronized boolean getBoolProp(Properties props, String prop) {
        boolean val = PropUtil.getBooleanProperty(props, prop, false);
        if (this.logger.isLoggable(Level.CONFIG)) {
            this.logger.config(prop + ": " + val);
        }
        return val;
    }

    private void initStreams() throws IOException {
        boolean quote = PropUtil.getBooleanProperty(this.props, "mail.debug.quote", false);
        this.traceInput = new TraceInputStream(this.socket.getInputStream(), this.traceLogger);
        this.traceInput.setQuote(quote);
        this.traceOutput = new TraceOutputStream(this.socket.getOutputStream(), this.traceLogger);
        this.traceOutput.setQuote(quote);
        this.input = new DataInputStream(new BufferedInputStream(this.traceInput));
        this.output = new PrintWriter(new BufferedWriter(new OutputStreamWriter(this.traceOutput, "iso-8859-1")));
    }

    protected void finalize() throws Throwable {
        super.finalize();
        if (this.socket != null) {
            quit();
        }
    }

    synchronized void setCapabilities(InputStream in) {
        if (in == null) {
            this.capabilities = null;
            return;
        }
        this.capabilities = new HashMap(10);
        BufferedReader r = null;
        try {
            r = new BufferedReader(new InputStreamReader(in, "us-ascii"));
        } catch (UnsupportedEncodingException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        while (true) {
            try {
                String s = r.readLine();
                if (s != null) {
                    String cap = s;
                    int i = cap.indexOf(32);
                    if (i > 0) {
                        cap = cap.substring(0, i);
                    }
                    this.capabilities.put(cap.toUpperCase(Locale.ENGLISH), s);
                } else {
                    try {
                        in.close();
                        return;
                    } catch (IOException e2) {
                        return;
                    }
                }
            } catch (IOException e3) {
                try {
                    in.close();
                    return;
                } catch (IOException e4) {
                    return;
                }
            } catch (Throwable th) {
                try {
                    in.close();
                } catch (IOException e5) {
                }
                throw th;
            }
        }
    }

    synchronized boolean hasCapability(String c) {
        return this.capabilities != null && this.capabilities.containsKey(c.toUpperCase(Locale.ENGLISH));
    }

    synchronized Map getCapabilities() {
        return this.capabilities;
    }

    synchronized String login(String user, String password) throws IOException {
        Response r;
        boolean batch = this.pipelining && (this.socket instanceof SSLSocket);
        try {
            if (this.noauthdebug && isTracing()) {
                this.logger.fine("authentication command trace suppressed");
                suspendTracing();
            }
            String dpw = null;
            if (this.apopChallenge != null) {
                dpw = getDigest(password);
            }
            if (this.apopChallenge != null && dpw != null) {
                r = simpleCommand("APOP " + user + " " + dpw);
            } else if (batch) {
                String cmd = "USER " + user;
                batchCommandStart(cmd);
                issueCommand(cmd);
                String cmd2 = "PASS " + password;
                batchCommandContinue(cmd2);
                issueCommand(cmd2);
                Response r2 = readResponse();
                if (!r2.ok) {
                    String err = r2.data != null ? r2.data : "USER command failed";
                    readResponse();
                    batchCommandEnd();
                    resumeTracing();
                    return err;
                }
                r = readResponse();
                batchCommandEnd();
            } else {
                Response r3 = simpleCommand("USER " + user);
                if (!r3.ok) {
                    return r3.data != null ? r3.data : "USER command failed";
                }
                r = simpleCommand("PASS " + password);
            }
            if (this.noauthdebug && isTracing()) {
                this.logger.log(Level.FINE, "authentication command {0}", r.ok ? "succeeded" : "failed");
            }
            if (r.ok) {
                resumeTracing();
                return null;
            }
            String str = r.data != null ? r.data : "login failed";
            resumeTracing();
            return str;
        } finally {
            resumeTracing();
        }
    }

    private String getDigest(String password) {
        String key = this.apopChallenge + password;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digest = md.digest(key.getBytes("iso-8859-1"));
            return toHex(digest);
        } catch (UnsupportedEncodingException e) {
            return null;
        } catch (NoSuchAlgorithmException e2) {
            return null;
        }
    }

    private static String toHex(byte[] bytes) {
        char[] result = new char[bytes.length * 2];
        int i = 0;
        for (byte b : bytes) {
            int temp = b & 255;
            int i2 = i;
            int i3 = i + 1;
            result[i2] = digits[temp >> 4];
            i = i3 + 1;
            result[i3] = digits[temp & 15];
        }
        return new String(result);
    }

    synchronized boolean quit() throws IOException {
        try {
            Response r = simpleCommand("QUIT");
            boolean ok = r.ok;
            try {
                this.socket.close();
                return ok;
            } finally {
            }
        } catch (Throwable th) {
            try {
                this.socket.close();
                throw th;
            } finally {
            }
        }
    }

    synchronized Status stat() throws IOException {
        Response r = simpleCommand("STAT");
        Status s = new Status();
        if (!r.ok) {
            throw new IOException("STAT command failed: " + r.data);
        }
        if (r.data != null) {
            try {
                StringTokenizer st = new StringTokenizer(r.data);
                s.total = Integer.parseInt(st.nextToken());
                s.size = Integer.parseInt(st.nextToken());
            } catch (RuntimeException e) {
            }
        }
        return s;
    }

    synchronized int list(int msg) throws IOException {
        Response r = simpleCommand("LIST " + msg);
        int size = -1;
        if (r.ok && r.data != null) {
            try {
                StringTokenizer st = new StringTokenizer(r.data);
                st.nextToken();
                size = Integer.parseInt(st.nextToken());
            } catch (RuntimeException e) {
            }
        }
        return size;
    }

    synchronized InputStream list() throws IOException {
        Response r = multilineCommand("LIST", SLOP);
        return r.bytes;
    }

    synchronized InputStream retr(int msg, int size) throws IOException {
        Response r;
        boolean batch = size == 0 && this.pipelining;
        if (batch) {
            String cmd = "LIST " + msg;
            batchCommandStart(cmd);
            issueCommand(cmd);
            String cmd2 = "RETR " + msg;
            batchCommandContinue(cmd2);
            issueCommand(cmd2);
            Response r2 = readResponse();
            if (r2.ok && r2.data != null) {
                try {
                    StringTokenizer st = new StringTokenizer(r2.data);
                    st.nextToken();
                    int size2 = Integer.parseInt(st.nextToken());
                    if (size2 > 1073741824 || size2 < 0) {
                        size = 0;
                    } else {
                        if (this.logger.isLoggable(Level.FINE)) {
                            this.logger.fine("pipeline message size " + size2);
                        }
                        size = size2 + SLOP;
                    }
                } catch (RuntimeException e) {
                }
            }
            r = readResponse();
            if (r.ok) {
                r.bytes = readMultilineResponse(size + SLOP);
            }
            batchCommandEnd();
        } else {
            String cmd3 = "RETR " + msg;
            multilineCommandStart(cmd3);
            issueCommand(cmd3);
            r = readResponse();
            if (!r.ok) {
                multilineCommandEnd();
                return null;
            }
            if (size <= 0 && r.data != null) {
                try {
                    StringTokenizer st2 = new StringTokenizer(r.data);
                    String s = st2.nextToken();
                    String octets = st2.nextToken();
                    if (octets.equals("octets")) {
                        int size3 = Integer.parseInt(s);
                        if (size3 > 1073741824 || size3 < 0) {
                            size = 0;
                        } else {
                            if (this.logger.isLoggable(Level.FINE)) {
                                this.logger.fine("guessing message size: " + size3);
                            }
                            size = size3 + SLOP;
                        }
                    }
                } catch (RuntimeException e2) {
                }
            }
            r.bytes = readMultilineResponse(size);
            multilineCommandEnd();
        }
        if (r.ok && size > 0 && this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("got message size " + r.bytes.available());
        }
        return r.bytes;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0064, code lost:
    
        r11 = r5.input.read();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    synchronized boolean retr(int r6, java.io.OutputStream r7) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 264
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.pop3.Protocol.retr(int, java.io.OutputStream):boolean");
    }

    synchronized InputStream top(int msg, int n) throws IOException {
        Response r = multilineCommand("TOP " + msg + " " + n, 0);
        return r.bytes;
    }

    synchronized boolean dele(int msg) throws IOException {
        Response r = simpleCommand("DELE " + msg);
        return r.ok;
    }

    synchronized String uidl(int msg) throws IOException {
        int i;
        Response r = simpleCommand("UIDL " + msg);
        if (r.ok && (i = r.data.indexOf(32)) > 0) {
            return r.data.substring(i + 1);
        }
        return null;
    }

    synchronized boolean uidl(String[] uids) throws IOException {
        int n;
        Response r = multilineCommand("UIDL", 15 * uids.length);
        if (!r.ok) {
            return false;
        }
        LineInputStream lis = new LineInputStream(r.bytes);
        while (true) {
            String line = lis.readLine();
            if (line != null) {
                int i = line.indexOf(32);
                if (i >= 1 && i < line.length() && (n = Integer.parseInt(line.substring(0, i))) > 0 && n <= uids.length) {
                    uids[n - 1] = line.substring(i + 1);
                }
            } else {
                try {
                    r.bytes.close();
                    return true;
                } catch (IOException e) {
                    return true;
                }
            }
        }
    }

    synchronized boolean noop() throws IOException {
        Response r = simpleCommand("NOOP");
        return r.ok;
    }

    synchronized boolean rset() throws IOException {
        Response r = simpleCommand("RSET");
        return r.ok;
    }

    synchronized boolean stls() throws IOException {
        if (this.socket instanceof SSLSocket) {
            return true;
        }
        Response r = simpleCommand("STLS");
        if (r.ok) {
            try {
                this.socket = SocketFetcher.startTLS(this.socket, this.host, this.props, this.prefix);
                initStreams();
            } catch (IOException ioex) {
                try {
                    this.socket.close();
                    IOException sioex = new IOException("Could not convert socket to TLS");
                    sioex.initCause(ioex);
                    throw sioex;
                } finally {
                    this.socket = null;
                    this.input = null;
                    this.output = null;
                }
            }
        }
        return r.ok;
    }

    synchronized boolean isSSL() {
        return this.socket instanceof SSLSocket;
    }

    synchronized InputStream capa() throws IOException {
        Response r = multilineCommand("CAPA", SLOP);
        if (!r.ok) {
            return null;
        }
        return r.bytes;
    }

    private Response simpleCommand(String cmd) throws IOException {
        simpleCommandStart(cmd);
        issueCommand(cmd);
        Response r = readResponse();
        simpleCommandEnd();
        return r;
    }

    private void issueCommand(String cmd) throws IOException {
        if (this.socket == null) {
            throw new IOException("Folder is closed");
        }
        if (cmd != null) {
            this.output.print(cmd + CRLF);
            this.output.flush();
        }
    }

    private Response readResponse() throws IOException {
        try {
            String line = this.input.readLine();
            if (line == null) {
                this.traceLogger.finest("<EOF>");
                throw new EOFException("EOF on socket");
            }
            Response r = new Response();
            if (line.startsWith("+OK")) {
                r.ok = true;
            } else if (line.startsWith("-ERR")) {
                r.ok = false;
            } else {
                throw new IOException("Unexpected response: " + line);
            }
            int i = line.indexOf(32);
            if (i >= 0) {
                r.data = line.substring(i + 1);
            }
            return r;
        } catch (InterruptedIOException iioex) {
            try {
                this.socket.close();
            } catch (IOException e) {
            }
            throw new EOFException(iioex.getMessage());
        } catch (SocketException ex) {
            try {
                this.socket.close();
            } catch (IOException e2) {
            }
            throw new EOFException(ex.getMessage());
        }
    }

    private Response multilineCommand(String cmd, int size) throws IOException {
        multilineCommandStart(cmd);
        issueCommand(cmd);
        Response r = readResponse();
        if (!r.ok) {
            multilineCommandEnd();
            return r;
        }
        r.bytes = readMultilineResponse(size);
        multilineCommandEnd();
        return r;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0034, code lost:
    
        r7 = r4.input.read();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.io.InputStream readMultilineResponse(int r5) throws java.io.IOException {
        /*
            r4 = this;
            com.sun.mail.util.SharedByteArrayOutputStream r0 = new com.sun.mail.util.SharedByteArrayOutputStream
            r1 = r0
            r2 = r5
            r1.<init>(r2)
            r6 = r0
            r0 = 10
            r8 = r0
        Ld:
            r0 = r4
            java.io.DataInputStream r0 = r0.input     // Catch: java.io.InterruptedIOException -> L4d
            int r0 = r0.read()     // Catch: java.io.InterruptedIOException -> L4d
            r1 = r0
            r7 = r1
            if (r0 < 0) goto L4a
            r0 = r8
            r1 = 10
            if (r0 != r1) goto L3f
            r0 = r7
            r1 = 46
            if (r0 != r1) goto L3f
            r0 = r4
            java.io.DataInputStream r0 = r0.input     // Catch: java.io.InterruptedIOException -> L4d
            int r0 = r0.read()     // Catch: java.io.InterruptedIOException -> L4d
            r7 = r0
            r0 = r7
            r1 = 13
            if (r0 != r1) goto L3f
            r0 = r4
            java.io.DataInputStream r0 = r0.input     // Catch: java.io.InterruptedIOException -> L4d
            int r0 = r0.read()     // Catch: java.io.InterruptedIOException -> L4d
            r7 = r0
            goto L4a
        L3f:
            r0 = r6
            r1 = r7
            r0.write(r1)     // Catch: java.io.InterruptedIOException -> L4d
            r0 = r7
            r8 = r0
            goto Ld
        L4a:
            goto L5e
        L4d:
            r9 = move-exception
            r0 = r4
            java.net.Socket r0 = r0.socket     // Catch: java.io.IOException -> L59
            r0.close()     // Catch: java.io.IOException -> L59
            goto L5b
        L59:
            r10 = move-exception
        L5b:
            r0 = r9
            throw r0
        L5e:
            r0 = r7
            if (r0 >= 0) goto L6c
            java.io.EOFException r0 = new java.io.EOFException
            r1 = r0
            java.lang.String r2 = "EOF on socket"
            r1.<init>(r2)
            throw r0
        L6c:
            r0 = r6
            java.io.InputStream r0 = r0.toStream()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.pop3.Protocol.readMultilineResponse(int):java.io.InputStream");
    }

    protected boolean isTracing() {
        return this.traceLogger.isLoggable(Level.FINEST);
    }

    private void suspendTracing() {
        if (this.traceLogger.isLoggable(Level.FINEST)) {
            this.traceInput.setTrace(false);
            this.traceOutput.setTrace(false);
        }
    }

    private void resumeTracing() {
        if (this.traceLogger.isLoggable(Level.FINEST)) {
            this.traceInput.setTrace(true);
            this.traceOutput.setTrace(true);
        }
    }

    private void simpleCommandStart(String command) {
    }

    private void simpleCommandEnd() {
    }

    private void multilineCommandStart(String command) {
    }

    private void multilineCommandEnd() {
    }

    private void batchCommandStart(String command) {
    }

    private void batchCommandContinue(String command) {
    }

    private void batchCommandEnd() {
    }
}
