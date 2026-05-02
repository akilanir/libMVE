package com.sun.mail.pop3;

import com.sun.mail.util.MailLogger;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.util.Vector;
import java.util.logging.Level;
import korex.mail.FetchProfile;
import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.FolderClosedException;
import korex.mail.FolderNotFoundException;
import korex.mail.Message;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.MethodNotSupportedException;
import korex.mail.UIDFolder;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/POP3Folder.class */
public class POP3Folder extends Folder {
    private String name;
    private POP3Store store;
    private volatile Protocol port;
    private int total;
    private int size;
    private boolean exists;
    private volatile boolean opened;
    private Vector message_cache;
    private boolean doneUidl;
    private volatile TempFile fileCache;
    MailLogger logger;

    POP3Folder(POP3Store store, String name) {
        super(store);
        this.exists = false;
        this.opened = false;
        this.doneUidl = false;
        this.fileCache = null;
        this.name = name;
        this.store = store;
        if (name.equalsIgnoreCase("INBOX")) {
            this.exists = true;
        }
        this.logger = new MailLogger(getClass(), "DEBUG POP3", store.getSession());
    }

    @Override // korex.mail.Folder
    public String getName() {
        return this.name;
    }

    @Override // korex.mail.Folder
    public String getFullName() {
        return this.name;
    }

    @Override // korex.mail.Folder
    public Folder getParent() {
        return new DefaultFolder(this.store);
    }

    @Override // korex.mail.Folder
    public boolean exists() {
        return this.exists;
    }

    @Override // korex.mail.Folder
    public Folder[] list(String pattern) throws MessagingException {
        throw new MessagingException("not a directory");
    }

    @Override // korex.mail.Folder
    public char getSeparator() {
        return (char) 0;
    }

    @Override // korex.mail.Folder
    public int getType() {
        return 1;
    }

    @Override // korex.mail.Folder
    public boolean create(int type) throws MessagingException {
        return false;
    }

    @Override // korex.mail.Folder
    public boolean hasNewMessages() throws MessagingException {
        return false;
    }

    @Override // korex.mail.Folder
    public Folder getFolder(String name) throws MessagingException {
        throw new MessagingException("not a directory");
    }

    @Override // korex.mail.Folder
    public boolean delete(boolean recurse) throws MessagingException {
        throw new MethodNotSupportedException("delete");
    }

    @Override // korex.mail.Folder
    public boolean renameTo(Folder f) throws MessagingException {
        throw new MethodNotSupportedException("renameTo");
    }

    @Override // korex.mail.Folder
    public synchronized void open(int mode) throws MessagingException {
        checkClosed();
        if (!this.exists) {
            throw new FolderNotFoundException(this, "folder is not INBOX");
        }
        try {
            this.port = this.store.getPort(this);
            Status s = this.port.stat();
            this.total = s.total;
            this.size = s.size;
            this.mode = mode;
            if (this.store.useFileCache) {
                try {
                    this.fileCache = new TempFile(this.store.fileCacheDir);
                } catch (IOException ex) {
                    this.logger.log(Level.FINE, "failed to create file cache", (Throwable) ex);
                    throw ex;
                }
            }
            this.opened = true;
            this.message_cache = new Vector(this.total);
            this.message_cache.setSize(this.total);
            this.doneUidl = false;
            notifyConnectionListeners(1);
        } catch (IOException ioex) {
            try {
                if (this.port != null) {
                    this.port.quit();
                }
                this.port = null;
                this.store.closePort(this);
            } catch (IOException e) {
                this.port = null;
                this.store.closePort(this);
            } catch (Throwable th) {
                this.port = null;
                this.store.closePort(this);
                throw th;
            }
            throw new MessagingException("Open failed", ioex);
        }
    }

    @Override // korex.mail.Folder
    public synchronized void close(boolean expunge) throws MessagingException {
        checkOpen();
        try {
            if (this.store.rsetBeforeQuit) {
                this.port.rset();
            }
            if (expunge && this.mode == 2) {
                for (int i = 0; i < this.message_cache.size(); i++) {
                    POP3Message m = (POP3Message) this.message_cache.elementAt(i);
                    if (m != null && m.isSet(Flags.Flag.DELETED)) {
                        try {
                            this.port.dele(i + 1);
                        } catch (IOException ioex) {
                            throw new MessagingException("Exception deleting messages during close", ioex);
                        }
                    }
                }
            }
            for (int i2 = 0; i2 < this.message_cache.size(); i2++) {
                POP3Message m2 = (POP3Message) this.message_cache.elementAt(i2);
                if (m2 != null) {
                    m2.invalidate(true);
                }
            }
            this.port.quit();
            this.port = null;
            this.store.closePort(this);
            this.message_cache = null;
            this.opened = false;
            notifyConnectionListeners(3);
            if (this.fileCache != null) {
                this.fileCache.close();
                this.fileCache = null;
            }
        } catch (IOException e) {
            this.port = null;
            this.store.closePort(this);
            this.message_cache = null;
            this.opened = false;
            notifyConnectionListeners(3);
            if (this.fileCache != null) {
                this.fileCache.close();
                this.fileCache = null;
            }
        } catch (Throwable th) {
            this.port = null;
            this.store.closePort(this);
            this.message_cache = null;
            this.opened = false;
            notifyConnectionListeners(3);
            if (this.fileCache != null) {
                this.fileCache.close();
                this.fileCache = null;
            }
            throw th;
        }
    }

    @Override // korex.mail.Folder
    public synchronized boolean isOpen() {
        if (!this.opened) {
            return false;
        }
        try {
            if (!this.port.noop()) {
                throw new IOException("NOOP failed");
            }
            return true;
        } catch (IOException e) {
            try {
                close(false);
                return false;
            } catch (MessagingException e2) {
                return false;
            } catch (Throwable th) {
                return false;
            }
        }
    }

    @Override // korex.mail.Folder
    public Flags getPermanentFlags() {
        return new Flags();
    }

    @Override // korex.mail.Folder
    public synchronized int getMessageCount() throws MessagingException {
        if (!this.opened) {
            return -1;
        }
        checkReadable();
        return this.total;
    }

    @Override // korex.mail.Folder
    public synchronized Message getMessage(int msgno) throws MessagingException {
        checkOpen();
        POP3Message pOP3Message = (POP3Message) this.message_cache.elementAt(msgno - 1);
        POP3Message m = pOP3Message;
        if (pOP3Message == null) {
            m = createMessage(this, msgno);
            this.message_cache.setElementAt(m, msgno - 1);
        }
        return m;
    }

    protected POP3Message createMessage(Folder f, int msgno) throws MessagingException {
        POP3Message m = null;
        Constructor cons = this.store.messageConstructor;
        if (cons != null) {
            try {
                Object[] o = {this, Integer.valueOf(msgno)};
                m = (POP3Message) cons.newInstance(o);
            } catch (Exception e) {
            }
        }
        if (m == null) {
            m = new POP3Message(this, msgno);
        }
        return m;
    }

    @Override // korex.mail.Folder
    public void appendMessages(Message[] msgs) throws MessagingException {
        throw new MethodNotSupportedException("Append not supported");
    }

    @Override // korex.mail.Folder
    public Message[] expunge() throws MessagingException {
        throw new MethodNotSupportedException("Expunge not supported");
    }

    @Override // korex.mail.Folder
    public synchronized void fetch(Message[] msgs, FetchProfile fp) throws MessagingException {
        checkReadable();
        if (!this.doneUidl && this.store.supportsUidl && fp.contains(UIDFolder.FetchProfileItem.UID)) {
            String[] uids = new String[this.message_cache.size()];
            try {
                if (!this.port.uidl(uids)) {
                    return;
                }
                for (int i = 0; i < uids.length; i++) {
                    if (uids[i] != null) {
                        POP3Message m = (POP3Message) getMessage(i + 1);
                        m.uid = uids[i];
                    }
                }
                this.doneUidl = true;
            } catch (EOFException eex) {
                close(false);
                throw new FolderClosedException(this, eex.toString());
            } catch (IOException ex) {
                throw new MessagingException("error getting UIDL", ex);
            }
        }
        if (fp.contains(FetchProfile.Item.ENVELOPE)) {
            for (Message message : msgs) {
                try {
                    POP3Message msg = (POP3Message) message;
                    msg.getHeader("");
                    msg.getSize();
                } catch (MessageRemovedException e) {
                }
            }
        }
    }

    public synchronized String getUID(Message msg) throws MessagingException {
        checkOpen();
        if (!(msg instanceof POP3Message)) {
            throw new MessagingException("message is not a POP3Message");
        }
        POP3Message m = (POP3Message) msg;
        try {
            if (!this.store.supportsUidl) {
                return null;
            }
            if (m.uid == "UNKNOWN") {
                m.uid = this.port.uidl(m.getMessageNumber());
            }
            return m.uid;
        } catch (EOFException eex) {
            close(false);
            throw new FolderClosedException(this, eex.toString());
        } catch (IOException ex) {
            throw new MessagingException("error getting UIDL", ex);
        }
    }

    public synchronized int getSize() throws MessagingException {
        checkOpen();
        return this.size;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0078 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0097 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized int[] getSizes() throws korex.mail.MessagingException {
        /*
            r4 = this;
            r0 = r4
            r0.checkOpen()
            r0 = r4
            int r0 = r0.total
            int[] r0 = new int[r0]
            r5 = r0
            r0 = 0
            r6 = r0
            r0 = 0
            r7 = r0
            r0 = r4
            com.sun.mail.pop3.Protocol r0 = r0.port     // Catch: java.io.IOException -> L84 java.lang.Throwable -> La3
            java.io.InputStream r0 = r0.list()     // Catch: java.io.IOException -> L84 java.lang.Throwable -> La3
            r6 = r0
            com.sun.mail.util.LineInputStream r0 = new com.sun.mail.util.LineInputStream     // Catch: java.io.IOException -> L84 java.lang.Throwable -> La3
            r1 = r0
            r2 = r6
            r1.<init>(r2)     // Catch: java.io.IOException -> L84 java.lang.Throwable -> La3
            r7 = r0
        L20:
            r0 = r7
            java.lang.String r0 = r0.readLine()     // Catch: java.io.IOException -> L84 java.lang.Throwable -> La3
            r1 = r0
            r8 = r1
            if (r0 == 0) goto L67
            java.util.StringTokenizer r0 = new java.util.StringTokenizer     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            r1 = r0
            r2 = r8
            r1.<init>(r2)     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            r9 = r0
            r0 = r9
            java.lang.String r0 = r0.nextToken()     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            int r0 = java.lang.Integer.parseInt(r0)     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            r10 = r0
            r0 = r9
            java.lang.String r0 = r0.nextToken()     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            int r0 = java.lang.Integer.parseInt(r0)     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            r11 = r0
            r0 = r10
            if (r0 <= 0) goto L5f
            r0 = r10
            r1 = r4
            int r1 = r1.total     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
            if (r0 > r1) goto L5f
            r0 = r5
            r1 = r10
            r2 = 1
            int r1 = r1 - r2
            r2 = r11
            r0[r1] = r2     // Catch: java.lang.RuntimeException -> L62 java.io.IOException -> L84 java.lang.Throwable -> La3
        L5f:
            goto L20
        L62:
            r9 = move-exception
            goto L20
        L67:
            r0 = r7
            if (r0 == 0) goto L6f
            r0 = r7
            r0.close()     // Catch: java.io.IOException -> L72
        L6f:
            goto L74
        L72:
            r8 = move-exception
        L74:
            r0 = r6
            if (r0 == 0) goto L7c
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> L7f
        L7c:
            goto Lc2
        L7f:
            r8 = move-exception
            goto Lc2
        L84:
            r8 = move-exception
            r0 = r7
            if (r0 == 0) goto L8e
            r0 = r7
            r0.close()     // Catch: java.io.IOException -> L91
        L8e:
            goto L93
        L91:
            r8 = move-exception
        L93:
            r0 = r6
            if (r0 == 0) goto L9b
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> L9e
        L9b:
            goto Lc2
        L9e:
            r8 = move-exception
            goto Lc2
        La3:
            r12 = move-exception
            r0 = r7
            if (r0 == 0) goto Lad
            r0 = r7
            r0.close()     // Catch: java.io.IOException -> Lb0
        Lad:
            goto Lb2
        Lb0:
            r13 = move-exception
        Lb2:
            r0 = r6
            if (r0 == 0) goto Lba
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> Lbd
        Lba:
            goto Lbf
        Lbd:
            r13 = move-exception
        Lbf:
            r0 = r12
            throw r0
        Lc2:
            r0 = r5
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.pop3.POP3Folder.getSizes():int[]");
    }

    public synchronized InputStream listCommand() throws MessagingException, IOException {
        checkOpen();
        return this.port.list();
    }

    @Override // korex.mail.Folder
    protected void finalize() throws Throwable {
        super.finalize();
        close(false);
    }

    private void checkOpen() throws IllegalStateException {
        if (!this.opened) {
            throw new IllegalStateException("Folder is not Open");
        }
    }

    private void checkClosed() throws IllegalStateException {
        if (this.opened) {
            throw new IllegalStateException("Folder is Open");
        }
    }

    private void checkReadable() throws IllegalStateException {
        if (!this.opened || (this.mode != 1 && this.mode != 2)) {
            throw new IllegalStateException("Folder is not Readable");
        }
    }

    Protocol getProtocol() throws MessagingException {
        Protocol p = this.port;
        checkOpen();
        return p;
    }

    @Override // korex.mail.Folder
    protected void notifyMessageChangedListeners(int type, Message m) {
        super.notifyMessageChangedListeners(type, m);
    }

    TempFile getFileCache() {
        return this.fileCache;
    }
}
