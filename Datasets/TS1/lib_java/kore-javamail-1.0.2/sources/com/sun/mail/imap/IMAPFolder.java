package com.sun.mail.imap;

import com.sun.mail.iap.BadCommandException;
import com.sun.mail.iap.CommandFailedException;
import com.sun.mail.iap.ConnectionException;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.iap.ResponseHandler;
import com.sun.mail.imap.IMAPMessage;
import com.sun.mail.imap.Utility;
import com.sun.mail.imap.protocol.FLAGS;
import com.sun.mail.imap.protocol.FetchItem;
import com.sun.mail.imap.protocol.FetchResponse;
import com.sun.mail.imap.protocol.IMAPProtocol;
import com.sun.mail.imap.protocol.IMAPResponse;
import com.sun.mail.imap.protocol.Item;
import com.sun.mail.imap.protocol.ListInfo;
import com.sun.mail.imap.protocol.MODSEQ;
import com.sun.mail.imap.protocol.MailboxInfo;
import com.sun.mail.imap.protocol.MessageSet;
import com.sun.mail.imap.protocol.Status;
import com.sun.mail.imap.protocol.UID;
import com.sun.mail.imap.protocol.UIDSet;
import com.sun.mail.util.MailLogger;
import java.io.IOException;
import java.nio.channels.SocketChannel;
import java.util.Date;
import java.util.Hashtable;
import java.util.Map;
import java.util.NoSuchElementException;
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
import korex.mail.Quota;
import korex.mail.StoreClosedException;
import korex.mail.UIDFolder;
import korex.mail.event.MessageCountListener;
import korex.mail.internet.MimeMessage;
import korex.mail.search.FlagTerm;
import korex.mail.search.SearchException;
import korex.mail.search.SearchTerm;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPFolder.class */
public class IMAPFolder extends Folder implements UIDFolder, ResponseHandler {
    protected String fullName;
    protected String name;
    protected int type;
    protected char separator;
    protected Flags availableFlags;
    protected Flags permanentFlags;
    protected volatile boolean exists;
    protected boolean isNamespace;
    protected volatile String[] attributes;
    protected volatile IMAPProtocol protocol;
    protected MessageCache messageCache;
    protected final Object messageCacheLock;
    protected Hashtable uidTable;
    protected static final char UNKNOWN_SEPARATOR = 65535;
    private volatile boolean opened;
    private boolean reallyClosed;
    private static final int RUNNING = 0;
    private static final int IDLE = 1;
    private static final int ABORTING = 2;
    private int idleState;
    private volatile IdleManager idleManager;
    private volatile int total;
    private volatile int recent;
    private int realTotal;
    private long uidvalidity;
    private long uidnext;
    private volatile long highestmodseq;
    private boolean doExpungeNotification;
    private Status cachedStatus;
    private long cachedStatusTime;
    private boolean hasMessageCountListener;
    protected MailLogger logger;
    private MailLogger connectionPoolLogger;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPFolder$ProtocolCommand.class */
    public interface ProtocolCommand {
        Object doCommand(IMAPProtocol iMAPProtocol) throws ProtocolException;
    }

    static {
        $assertionsDisabled = !IMAPFolder.class.desiredAssertionStatus();
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPFolder$FetchProfileItem.class */
    public static class FetchProfileItem extends FetchProfile.Item {
        public static final FetchProfileItem HEADERS = new FetchProfileItem("HEADERS");
        public static final FetchProfileItem SIZE = new FetchProfileItem("SIZE");
        public static final FetchProfileItem MESSAGE = new FetchProfileItem("MESSAGE");

        protected FetchProfileItem(String name) {
            super(name);
        }
    }

    protected IMAPFolder(String fullName, char separator, IMAPStore store, Boolean isNamespace) {
        int i;
        super(store);
        this.isNamespace = false;
        this.messageCacheLock = new Object();
        this.opened = false;
        this.reallyClosed = true;
        this.idleState = 0;
        this.total = -1;
        this.recent = -1;
        this.realTotal = -1;
        this.uidvalidity = -1L;
        this.uidnext = -1L;
        this.highestmodseq = -1L;
        this.doExpungeNotification = true;
        this.cachedStatus = null;
        this.cachedStatusTime = 0L;
        this.hasMessageCountListener = false;
        if (fullName == null) {
            throw new NullPointerException("Folder name is null");
        }
        this.fullName = fullName;
        this.separator = separator;
        this.logger = new MailLogger(getClass(), "DEBUG IMAP", store.getSession());
        this.connectionPoolLogger = store.getConnectionPoolLogger();
        this.isNamespace = false;
        if (separator != UNKNOWN_SEPARATOR && separator != 0 && (i = this.fullName.indexOf(separator)) > 0 && i == this.fullName.length() - 1) {
            this.fullName = this.fullName.substring(0, i);
            this.isNamespace = true;
        }
        if (isNamespace != null) {
            this.isNamespace = isNamespace.booleanValue();
        }
    }

    protected IMAPFolder(ListInfo li, IMAPStore store) {
        this(li.name, li.separator, store, null);
        if (li.hasInferiors) {
            this.type |= 2;
        }
        if (li.canOpen) {
            this.type |= 1;
        }
        this.exists = true;
        this.attributes = li.attrs;
    }

    protected void checkExists() throws MessagingException {
        if (!this.exists && !exists()) {
            throw new FolderNotFoundException(this, this.fullName + " not found");
        }
    }

    protected void checkClosed() {
        if (this.opened) {
            throw new IllegalStateException("This operation is not allowed on an open folder");
        }
    }

    protected void checkOpened() throws FolderClosedException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (!this.opened) {
            if (this.reallyClosed) {
                throw new IllegalStateException("This operation is not allowed on a closed folder");
            }
            throw new FolderClosedException(this, "Lost folder connection to server");
        }
    }

    protected void checkRange(int msgno) throws MessagingException {
        if (msgno < 1) {
            throw new IndexOutOfBoundsException("message number < 1");
        }
        if (msgno <= this.total) {
            return;
        }
        synchronized (this.messageCacheLock) {
            try {
                keepConnectionAlive(false);
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this, cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        if (msgno > this.total) {
            throw new IndexOutOfBoundsException(msgno + " > " + this.total);
        }
    }

    private void checkFlags(Flags flags) throws MessagingException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        if (this.mode != 2) {
            throw new IllegalStateException("Cannot change flags on READ_ONLY folder: " + this.fullName);
        }
    }

    @Override // korex.mail.Folder
    public synchronized String getName() {
        if (this.name == null) {
            try {
                this.name = this.fullName.substring(this.fullName.lastIndexOf(getSeparator()) + 1);
            } catch (MessagingException e) {
            }
        }
        return this.name;
    }

    @Override // korex.mail.Folder
    public synchronized String getFullName() {
        return this.fullName;
    }

    @Override // korex.mail.Folder
    public synchronized Folder getParent() throws MessagingException {
        char c = getSeparator();
        int index = this.fullName.lastIndexOf(c);
        if (index != -1) {
            return ((IMAPStore) this.store).newIMAPFolder(this.fullName.substring(0, index), c);
        }
        return new DefaultFolder((IMAPStore) this.store);
    }

    @Override // korex.mail.Folder
    public synchronized boolean exists() throws MessagingException {
        String lname;
        if (this.isNamespace && this.separator != 0) {
            lname = this.fullName + this.separator;
        } else {
            lname = this.fullName;
        }
        final String str = lname;
        ListInfo[] li = (ListInfo[]) doCommand(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.1
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.list("", str);
            }
        });
        if (li != null) {
            int i = findName(li, lname);
            this.fullName = li[i].name;
            this.separator = li[i].separator;
            int len = this.fullName.length();
            if (this.separator != 0 && len > 0 && this.fullName.charAt(len - 1) == this.separator) {
                this.fullName = this.fullName.substring(0, len - 1);
            }
            this.type = 0;
            if (li[i].hasInferiors) {
                this.type |= 2;
            }
            if (li[i].canOpen) {
                this.type |= 1;
            }
            this.exists = true;
            this.attributes = li[i].attrs;
        } else {
            this.exists = this.opened;
            this.attributes = null;
        }
        return this.exists;
    }

    private int findName(ListInfo[] li, String lname) {
        int i = 0;
        while (i < li.length && !li[i].name.equals(lname)) {
            i++;
        }
        if (i >= li.length) {
            i = 0;
        }
        return i;
    }

    @Override // korex.mail.Folder
    public Folder[] list(String pattern) throws MessagingException {
        return doList(pattern, false);
    }

    @Override // korex.mail.Folder
    public Folder[] listSubscribed(String pattern) throws MessagingException {
        return doList(pattern, true);
    }

    private synchronized Folder[] doList(final String pattern, final boolean subscribed) throws MessagingException {
        checkExists();
        if (this.attributes != null && !isDirectory()) {
            return new Folder[0];
        }
        final char c = getSeparator();
        ListInfo[] li = (ListInfo[]) doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.2
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                if (subscribed) {
                    return p.lsub("", IMAPFolder.this.fullName + c + pattern);
                }
                return p.list("", IMAPFolder.this.fullName + c + pattern);
            }
        });
        if (li == null) {
            return new Folder[0];
        }
        int start = 0;
        if (li.length > 0 && li[0].name.equals(this.fullName + c)) {
            start = 1;
        }
        IMAPFolder[] folders = new IMAPFolder[li.length - start];
        IMAPStore st = (IMAPStore) this.store;
        for (int i = start; i < li.length; i++) {
            folders[i - start] = st.newIMAPFolder(li[i]);
        }
        return folders;
    }

    @Override // korex.mail.Folder
    public synchronized char getSeparator() throws MessagingException {
        if (this.separator == UNKNOWN_SEPARATOR) {
            ListInfo[] li = (ListInfo[]) doCommand(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.3
                @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
                public Object doCommand(IMAPProtocol p) throws ProtocolException {
                    if (p.isREV1()) {
                        return p.list(IMAPFolder.this.fullName, "");
                    }
                    return p.list("", IMAPFolder.this.fullName);
                }
            });
            if (li != null) {
                this.separator = li[0].separator;
            } else {
                this.separator = '/';
            }
        }
        return this.separator;
    }

    @Override // korex.mail.Folder
    public synchronized int getType() throws MessagingException {
        if (this.opened) {
            if (this.attributes == null) {
                exists();
            }
        } else {
            checkExists();
        }
        return this.type;
    }

    @Override // korex.mail.Folder
    public synchronized boolean isSubscribed() {
        String lname;
        ListInfo[] li = null;
        if (this.isNamespace && this.separator != 0) {
            lname = this.fullName + this.separator;
        } else {
            lname = this.fullName;
        }
        try {
            final String str = lname;
            li = (ListInfo[]) doProtocolCommand(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.4
                @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
                public Object doCommand(IMAPProtocol p) throws ProtocolException {
                    return p.lsub("", str);
                }
            });
        } catch (ProtocolException e) {
        }
        if (li != null) {
            int i = findName(li, lname);
            return li[i].canOpen;
        }
        return false;
    }

    @Override // korex.mail.Folder
    public synchronized void setSubscribed(final boolean subscribe) throws MessagingException {
        doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.5
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                if (subscribe) {
                    p.subscribe(IMAPFolder.this.fullName);
                    return null;
                }
                p.unsubscribe(IMAPFolder.this.fullName);
                return null;
            }
        });
    }

    @Override // korex.mail.Folder
    public synchronized boolean create(final int type) throws MessagingException {
        char c = 0;
        if ((type & 1) == 0) {
            c = getSeparator();
        }
        final char sep = c;
        Object ret = doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.6
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                ListInfo[] li;
                if ((type & 1) == 0) {
                    p.create(IMAPFolder.this.fullName + sep);
                } else {
                    p.create(IMAPFolder.this.fullName);
                    if ((type & 2) != 0 && (li = p.list("", IMAPFolder.this.fullName)) != null && !li[0].hasInferiors) {
                        p.delete(IMAPFolder.this.fullName);
                        throw new ProtocolException("Unsupported type");
                    }
                }
                return Boolean.TRUE;
            }
        });
        if (ret == null) {
            return false;
        }
        boolean retb = exists();
        if (retb) {
            notifyFolderListeners(1);
        }
        return retb;
    }

    @Override // korex.mail.Folder
    public synchronized boolean hasNewMessages() throws MessagingException {
        String lname;
        boolean z;
        if (this.opened) {
            synchronized (this.messageCacheLock) {
                try {
                    try {
                        keepConnectionAlive(true);
                        z = this.recent > 0;
                    } catch (ConnectionException cex) {
                        throw new FolderClosedException(this, cex.getMessage());
                    }
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            }
            return z;
        }
        if (this.isNamespace && this.separator != 0) {
            lname = this.fullName + this.separator;
        } else {
            lname = this.fullName;
        }
        final String str = lname;
        ListInfo[] li = (ListInfo[]) doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.7
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.list("", str);
            }
        });
        if (li == null) {
            throw new FolderNotFoundException(this, this.fullName + " not found");
        }
        int i = findName(li, lname);
        if (li[i].changeState == 1) {
            return true;
        }
        if (li[i].changeState == 2) {
            return false;
        }
        try {
            Status status = getStatus();
            if (status.recent > 0) {
                return true;
            }
            return false;
        } catch (BadCommandException e) {
            return false;
        } catch (ConnectionException cex2) {
            throw new StoreClosedException(this.store, cex2.getMessage());
        } catch (ProtocolException pex2) {
            throw new MessagingException(pex2.getMessage(), pex2);
        }
    }

    @Override // korex.mail.Folder
    public synchronized Folder getFolder(String name) throws MessagingException {
        if (this.attributes != null && !isDirectory()) {
            throw new MessagingException("Cannot contain subfolders");
        }
        char c = getSeparator();
        return ((IMAPStore) this.store).newIMAPFolder(this.fullName + c + name, c);
    }

    @Override // korex.mail.Folder
    public synchronized boolean delete(boolean recurse) throws MessagingException {
        checkClosed();
        if (recurse) {
            Folder[] f = list();
            for (Folder folder : f) {
                folder.delete(recurse);
            }
        }
        Object ret = doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.8
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                p.delete(IMAPFolder.this.fullName);
                return Boolean.TRUE;
            }
        });
        if (ret == null) {
            return false;
        }
        this.exists = false;
        this.attributes = null;
        notifyFolderListeners(2);
        return true;
    }

    @Override // korex.mail.Folder
    public synchronized boolean renameTo(final Folder f) throws MessagingException {
        checkClosed();
        checkExists();
        if (f.getStore() != this.store) {
            throw new MessagingException("Can't rename across Stores");
        }
        Object ret = doCommandIgnoreFailure(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.9
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                p.rename(IMAPFolder.this.fullName, f.getFullName());
                return Boolean.TRUE;
            }
        });
        if (ret == null) {
            return false;
        }
        this.exists = false;
        this.attributes = null;
        notifyFolderRenamedListeners(f);
        return true;
    }

    @Override // korex.mail.Folder
    public synchronized void open(int mode) throws MessagingException {
        open(mode, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0089 A[Catch: CommandFailedException -> 0x00a9, ProtocolException -> 0x00ea, all -> 0x02f6, TryCatch #9 {CommandFailedException -> 0x00a9, ProtocolException -> 0x00ea, blocks: (B:7:0x002c, B:9:0x0033, B:11:0x003f, B:13:0x004b, B:15:0x0057, B:16:0x0063, B:17:0x006f, B:19:0x007b, B:22:0x0089, B:23:0x0099), top: B:125:0x002c, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0099 A[Catch: CommandFailedException -> 0x00a9, ProtocolException -> 0x00ea, all -> 0x02f6, TryCatch #9 {CommandFailedException -> 0x00a9, ProtocolException -> 0x00ea, blocks: (B:7:0x002c, B:9:0x0033, B:11:0x003f, B:13:0x004b, B:15:0x0057, B:16:0x0063, B:17:0x006f, B:19:0x007b, B:22:0x0089, B:23:0x0099), top: B:125:0x002c, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0219 A[Catch: all -> 0x02f6, TryCatch #4 {, blocks: (B:4:0x0020, B:7:0x002c, B:9:0x0033, B:11:0x003f, B:13:0x004b, B:15:0x0057, B:16:0x0063, B:17:0x006f, B:19:0x007b, B:22:0x0089, B:48:0x0133, B:52:0x0140, B:54:0x0148, B:57:0x0158, B:58:0x0167, B:59:0x016e, B:61:0x0171, B:62:0x0179, B:70:0x0194, B:71:0x0197, B:72:0x019e, B:65:0x0183, B:68:0x018d, B:69:0x0193, B:74:0x01a1, B:75:0x01a4, B:76:0x01ab, B:77:0x01ac, B:79:0x0219, B:80:0x022d, B:82:0x0237, B:84:0x024d, B:86:0x0259, B:88:0x0260, B:91:0x026f, B:93:0x028d, B:95:0x0293, B:97:0x02a8, B:99:0x02b2, B:101:0x02b8, B:103:0x02c0, B:104:0x02c9, B:105:0x02ca, B:107:0x02da, B:110:0x02f2, B:23:0x0099, B:26:0x00ab, B:28:0x00b8, B:29:0x00c1, B:30:0x00c2, B:31:0x00d0, B:34:0x00d4, B:35:0x00e9, B:37:0x00ec, B:38:0x00f4, B:39:0x0106, B:42:0x010a, B:43:0x011c, B:46:0x0120, B:47:0x0132), top: B:120:0x0020, inners: #1, #6, #9, #10, #9 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized java.util.List<korex.mail.event.MailEvent> open(int r8, com.sun.mail.imap.ResyncData r9) throws korex.mail.MessagingException {
        /*
            Method dump skipped, instructions count: 789
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.imap.IMAPFolder.open(int, com.sun.mail.imap.ResyncData):java.util.List");
    }

    @Override // korex.mail.Folder
    public synchronized void fetch(Message[] msgs, FetchProfile fp) throws MessagingException {
        checkOpened();
        StringBuffer command = new StringBuffer();
        boolean first = true;
        boolean allHeaders = false;
        if (fp.contains(FetchProfile.Item.ENVELOPE)) {
            command.append(getEnvelopeCommand());
            first = false;
        }
        if (fp.contains(FetchProfile.Item.FLAGS)) {
            command.append(first ? "FLAGS" : " FLAGS");
            first = false;
        }
        if (fp.contains(FetchProfile.Item.CONTENT_INFO)) {
            command.append(first ? "BODYSTRUCTURE" : " BODYSTRUCTURE");
            first = false;
        }
        if (fp.contains(UIDFolder.FetchProfileItem.UID)) {
            command.append(first ? "UID" : " UID");
            first = false;
        }
        if (fp.contains(FetchProfileItem.HEADERS)) {
            allHeaders = true;
            if (this.protocol.isREV1()) {
                command.append(first ? "BODY.PEEK[HEADER]" : " BODY.PEEK[HEADER]");
            } else {
                command.append(first ? "RFC822.HEADER" : " RFC822.HEADER");
            }
            first = false;
        }
        if (fp.contains(FetchProfileItem.MESSAGE)) {
            allHeaders = true;
            if (this.protocol.isREV1()) {
                command.append(first ? "BODY.PEEK[]" : " BODY.PEEK[]");
            } else {
                command.append(first ? "RFC822" : " RFC822");
            }
            first = false;
        }
        if (fp.contains(FetchProfile.Item.SIZE) || fp.contains(FetchProfileItem.SIZE)) {
            command.append(first ? "RFC822.SIZE" : " RFC822.SIZE");
            first = false;
        }
        String[] hdrs = null;
        if (!allHeaders) {
            hdrs = fp.getHeaderNames();
            if (hdrs.length > 0) {
                if (!first) {
                    command.append(" ");
                }
                command.append(createHeaderCommand(hdrs));
            }
        }
        FetchItem[] fitems = this.protocol.getFetchItems();
        for (int i = 0; i < fitems.length; i++) {
            if (fp.contains(fitems[i].getFetchProfileItem())) {
                if (command.length() != 0) {
                    command.append(" ");
                }
                command.append(fitems[i].getName());
            }
        }
        Utility.Condition condition = new IMAPMessage.FetchProfileCondition(fp, fitems);
        synchronized (this.messageCacheLock) {
            MessageSet[] msgsets = Utility.toMessageSet(msgs, condition);
            if (msgsets == null) {
                return;
            }
            Response[] r = null;
            Vector v = new Vector();
            try {
                try {
                    r = getProtocol().fetch(msgsets, command.toString());
                } catch (ConnectionException cex) {
                    throw new FolderClosedException(this, cex.getMessage());
                }
            } catch (CommandFailedException e) {
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
            if (r == null) {
                return;
            }
            for (int i2 = 0; i2 < r.length; i2++) {
                if (r[i2] != null) {
                    if (!(r[i2] instanceof FetchResponse)) {
                        v.addElement(r[i2]);
                    } else {
                        FetchResponse f = (FetchResponse) r[i2];
                        IMAPMessage msg = getMessageBySeqNumber(f.getNumber());
                        int count = f.getItemCount();
                        boolean unsolicitedFlags = false;
                        for (int j = 0; j < count; j++) {
                            Item item = f.getItem(j);
                            if ((item instanceof Flags) && (!fp.contains(FetchProfile.Item.FLAGS) || msg == null)) {
                                unsolicitedFlags = true;
                            } else if (msg != null) {
                                msg.handleFetchItem(item, hdrs, allHeaders);
                            }
                        }
                        if (msg != null) {
                            msg.handleExtensionFetchItems(f.getExtensionItems());
                        }
                        if (unsolicitedFlags) {
                            v.addElement(f);
                        }
                    }
                }
            }
            int size = v.size();
            if (size != 0) {
                Response[] responses = new Response[size];
                v.copyInto(responses);
                handleResponses(responses);
            }
        }
    }

    protected String getEnvelopeCommand() {
        return "ENVELOPE INTERNALDATE RFC822.SIZE";
    }

    protected IMAPMessage newIMAPMessage(int msgnum) {
        return new IMAPMessage(this, msgnum);
    }

    private String createHeaderCommand(String[] hdrs) {
        StringBuffer sb;
        if (this.protocol.isREV1()) {
            sb = new StringBuffer("BODY.PEEK[HEADER.FIELDS (");
        } else {
            sb = new StringBuffer("RFC822.HEADER.LINES (");
        }
        for (int i = 0; i < hdrs.length; i++) {
            if (i > 0) {
                sb.append(" ");
            }
            sb.append(hdrs[i]);
        }
        if (this.protocol.isREV1()) {
            sb.append(")]");
        } else {
            sb.append(")");
        }
        return sb.toString();
    }

    @Override // korex.mail.Folder
    public synchronized void setFlags(Message[] msgs, Flags flag, boolean value) throws MessagingException {
        checkOpened();
        checkFlags(flag);
        if (msgs.length == 0) {
            return;
        }
        synchronized (this.messageCacheLock) {
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    MessageSet[] ms = Utility.toMessageSet(msgs, null);
                    if (ms == null) {
                        throw new MessageRemovedException("Messages have been removed");
                    }
                    p.storeFlags(ms, flag, value);
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this, cex.getMessage());
            }
        }
    }

    @Override // korex.mail.Folder
    public synchronized void setFlags(int start, int end, Flags flag, boolean value) throws MessagingException {
        checkOpened();
        Message[] msgs = new Message[(end - start) + 1];
        int i = 0;
        for (int n = start; n <= end; n++) {
            int i2 = i;
            i++;
            msgs[i2] = getMessage(n);
        }
        setFlags(msgs, flag, value);
    }

    @Override // korex.mail.Folder
    public synchronized void setFlags(int[] msgnums, Flags flag, boolean value) throws MessagingException {
        checkOpened();
        Message[] msgs = new Message[msgnums.length];
        for (int i = 0; i < msgnums.length; i++) {
            msgs[i] = getMessage(msgnums[i]);
        }
        setFlags(msgs, flag, value);
    }

    @Override // korex.mail.Folder
    public synchronized void close(boolean expunge) throws MessagingException {
        close(expunge, false);
    }

    public synchronized void forceClose() throws MessagingException {
        close(false, true);
    }

    private void close(boolean expunge, boolean force) throws MessagingException {
        if (!$assertionsDisabled && !Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this.messageCacheLock) {
            if (!this.opened && this.reallyClosed) {
                throw new IllegalStateException("This operation is not allowed on a closed folder");
            }
            this.reallyClosed = true;
            if (this.opened) {
                boolean reuseProtocol = true;
                try {
                    try {
                        waitIfIdle();
                        if (force) {
                            this.logger.log(Level.FINE, "forcing folder {0} to close", this.fullName);
                            if (this.protocol != null) {
                                this.protocol.disconnect();
                            }
                        } else if (((IMAPStore) this.store).isConnectionPoolFull()) {
                            this.logger.fine("pool is full, not adding an Authenticated connection");
                            if (expunge && this.protocol != null) {
                                this.protocol.close();
                            }
                            if (this.protocol != null) {
                                this.protocol.logout();
                            }
                        } else if (!expunge && this.mode == 2) {
                            try {
                                if (this.protocol != null && this.protocol.hasCapability("UNSELECT")) {
                                    this.protocol.unselect();
                                } else if (this.protocol != null) {
                                    boolean selected = true;
                                    try {
                                        this.protocol.examine(this.fullName);
                                    } catch (CommandFailedException e) {
                                        selected = false;
                                    }
                                    if (selected && this.protocol != null) {
                                        this.protocol.close();
                                    }
                                }
                            } catch (ProtocolException e2) {
                                reuseProtocol = false;
                            }
                        } else if (this.protocol != null) {
                            this.protocol.close();
                        }
                        if (this.opened) {
                            cleanup(reuseProtocol);
                        }
                    } catch (ProtocolException pex) {
                        throw new MessagingException(pex.getMessage(), pex);
                    }
                } catch (Throwable th) {
                    if (this.opened) {
                        cleanup(true);
                    }
                    throw th;
                }
            }
        }
    }

    private void cleanup(boolean returnToPool) {
        if (!$assertionsDisabled && !Thread.holdsLock(this.messageCacheLock)) {
            throw new AssertionError();
        }
        releaseProtocol(returnToPool);
        this.messageCache = null;
        this.uidTable = null;
        this.exists = false;
        this.attributes = null;
        this.opened = false;
        this.idleState = 0;
        notifyConnectionListeners(3);
    }

    @Override // korex.mail.Folder
    public synchronized boolean isOpen() {
        synchronized (this.messageCacheLock) {
            if (this.opened) {
                try {
                    keepConnectionAlive(false);
                } catch (ProtocolException e) {
                }
            }
        }
        return this.opened;
    }

    @Override // korex.mail.Folder
    public synchronized Flags getPermanentFlags() {
        if (this.permanentFlags == null) {
            return null;
        }
        return (Flags) this.permanentFlags.clone();
    }

    @Override // korex.mail.Folder
    public synchronized int getMessageCount() throws MessagingException {
        int i;
        if (!this.opened) {
            checkExists();
            try {
                Status status = getStatus();
                return status.total;
            } catch (BadCommandException e) {
                IMAPProtocol p = null;
                try {
                    try {
                        p = getStoreProtocol();
                        MailboxInfo minfo = p.examine(this.fullName);
                        p.close();
                        int i2 = minfo.total;
                        releaseStoreProtocol(p);
                        return i2;
                    } catch (ProtocolException pex) {
                        throw new MessagingException(pex.getMessage(), pex);
                    }
                } catch (Throwable th) {
                    releaseStoreProtocol(p);
                    throw th;
                }
            } catch (ConnectionException cex) {
                throw new StoreClosedException(this.store, cex.getMessage());
            } catch (ProtocolException pex2) {
                throw new MessagingException(pex2.getMessage(), pex2);
            }
        }
        synchronized (this.messageCacheLock) {
            try {
                keepConnectionAlive(true);
                i = this.total;
            } catch (ConnectionException cex2) {
                throw new FolderClosedException(this, cex2.getMessage());
            } catch (ProtocolException pex3) {
                throw new MessagingException(pex3.getMessage(), pex3);
            }
        }
        return i;
    }

    @Override // korex.mail.Folder
    public synchronized int getNewMessageCount() throws MessagingException {
        int i;
        if (!this.opened) {
            checkExists();
            try {
                Status status = getStatus();
                return status.recent;
            } catch (BadCommandException e) {
                IMAPProtocol p = null;
                try {
                    try {
                        p = getStoreProtocol();
                        MailboxInfo minfo = p.examine(this.fullName);
                        p.close();
                        int i2 = minfo.recent;
                        releaseStoreProtocol(p);
                        return i2;
                    } catch (ProtocolException pex) {
                        throw new MessagingException(pex.getMessage(), pex);
                    }
                } catch (Throwable th) {
                    releaseStoreProtocol(p);
                    throw th;
                }
            } catch (ConnectionException cex) {
                throw new StoreClosedException(this.store, cex.getMessage());
            } catch (ProtocolException pex2) {
                throw new MessagingException(pex2.getMessage(), pex2);
            }
        }
        synchronized (this.messageCacheLock) {
            try {
                keepConnectionAlive(true);
                i = this.recent;
            } catch (ConnectionException cex2) {
                throw new FolderClosedException(this, cex2.getMessage());
            } catch (ProtocolException pex3) {
                throw new MessagingException(pex3.getMessage(), pex3);
            }
        }
        return i;
    }

    @Override // korex.mail.Folder
    public synchronized int getUnreadMessageCount() throws MessagingException {
        int length;
        if (!this.opened) {
            checkExists();
            try {
                Status status = getStatus();
                return status.unseen;
            } catch (BadCommandException e) {
                return -1;
            } catch (ConnectionException cex) {
                throw new StoreClosedException(this.store, cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        Flags f = new Flags();
        f.add(Flags.Flag.SEEN);
        try {
            synchronized (this.messageCacheLock) {
                int[] matches = getProtocol().search(new FlagTerm(f, false));
                length = matches.length;
            }
            return length;
        } catch (ConnectionException cex2) {
            throw new FolderClosedException(this, cex2.getMessage());
        } catch (ProtocolException pex2) {
            throw new MessagingException(pex2.getMessage(), pex2);
        }
    }

    @Override // korex.mail.Folder
    public synchronized int getDeletedMessageCount() throws MessagingException {
        int length;
        if (!this.opened) {
            checkExists();
            return -1;
        }
        Flags f = new Flags();
        f.add(Flags.Flag.DELETED);
        try {
            synchronized (this.messageCacheLock) {
                int[] matches = getProtocol().search(new FlagTerm(f, true));
                length = matches.length;
            }
            return length;
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    private Status getStatus() throws ProtocolException {
        int statusCacheTimeout = ((IMAPStore) this.store).getStatusCacheTimeout();
        if (statusCacheTimeout > 0 && this.cachedStatus != null && System.currentTimeMillis() - this.cachedStatusTime < statusCacheTimeout) {
            return this.cachedStatus;
        }
        IMAPProtocol p = null;
        try {
            p = getStoreProtocol();
            Status s = p.status(this.fullName, null);
            if (statusCacheTimeout > 0) {
                this.cachedStatus = s;
                this.cachedStatusTime = System.currentTimeMillis();
            }
            releaseStoreProtocol(p);
            return s;
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    @Override // korex.mail.Folder
    public synchronized Message getMessage(int msgnum) throws MessagingException {
        checkOpened();
        checkRange(msgnum);
        return this.messageCache.getMessage(msgnum);
    }

    @Override // korex.mail.Folder
    public synchronized void appendMessages(Message[] msgs) throws MessagingException {
        checkExists();
        int maxsize = ((IMAPStore) this.store).getAppendBufferSize();
        for (Message m : msgs) {
            Date d = m.getReceivedDate();
            if (d == null) {
                d = m.getSentDate();
            }
            final Date dd = d;
            final Flags f = m.getFlags();
            try {
                final MessageLiteral mos = new MessageLiteral(m, m.getSize() > maxsize ? 0 : maxsize);
                doCommand(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.10
                    @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
                    public Object doCommand(IMAPProtocol p) throws ProtocolException {
                        p.append(IMAPFolder.this.fullName, f, dd, mos);
                        return null;
                    }
                });
            } catch (IOException ex) {
                throw new MessagingException("IOException while appending messages", ex);
            } catch (MessageRemovedException e) {
            }
        }
    }

    public synchronized AppendUID[] appendUIDMessages(Message[] msgs) throws MessagingException {
        checkExists();
        int maxsize = ((IMAPStore) this.store).getAppendBufferSize();
        AppendUID[] uids = new AppendUID[msgs.length];
        for (int i = 0; i < msgs.length; i++) {
            Message m = msgs[i];
            try {
                final MessageLiteral mos = new MessageLiteral(m, m.getSize() > maxsize ? 0 : maxsize);
                Date d = m.getReceivedDate();
                if (d == null) {
                    d = m.getSentDate();
                }
                final Date dd = d;
                final Flags f = m.getFlags();
                AppendUID auid = (AppendUID) doCommand(new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.11
                    @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
                    public Object doCommand(IMAPProtocol p) throws ProtocolException {
                        return p.appenduid(IMAPFolder.this.fullName, f, dd, mos);
                    }
                });
                uids[i] = auid;
            } catch (IOException ex) {
                throw new MessagingException("IOException while appending messages", ex);
            } catch (MessageRemovedException e) {
            }
        }
        return uids;
    }

    public synchronized Message[] addMessages(Message[] msgs) throws MessagingException {
        checkOpened();
        Message[] rmsgs = new MimeMessage[msgs.length];
        AppendUID[] uids = appendUIDMessages(msgs);
        for (int i = 0; i < uids.length; i++) {
            AppendUID auid = uids[i];
            if (auid != null && auid.uidvalidity == this.uidvalidity) {
                try {
                    rmsgs[i] = getMessageByUID(auid.uid);
                } catch (MessagingException e) {
                }
            }
        }
        return rmsgs;
    }

    @Override // korex.mail.Folder
    public synchronized void copyMessages(Message[] msgs, Folder folder) throws MessagingException {
        checkOpened();
        if (msgs.length == 0) {
            return;
        }
        if (folder.getStore() == this.store) {
            synchronized (this.messageCacheLock) {
                try {
                    IMAPProtocol p = getProtocol();
                    MessageSet[] ms = Utility.toMessageSet(msgs, null);
                    if (ms == null) {
                        throw new MessageRemovedException("Messages have been removed");
                    }
                    p.copy(ms, folder.getFullName());
                } catch (CommandFailedException cfx) {
                    if (cfx.getMessage().indexOf("TRYCREATE") != -1) {
                        throw new FolderNotFoundException(folder, folder.getFullName() + " does not exist");
                    }
                    throw new MessagingException(cfx.getMessage(), cfx);
                } catch (ConnectionException cex) {
                    throw new FolderClosedException(this, cex.getMessage());
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            }
            return;
        }
        super.copyMessages(msgs, folder);
    }

    public synchronized AppendUID[] copyUIDMessages(Message[] msgs, Folder folder) throws MessagingException {
        AppendUID[] result;
        checkOpened();
        if (msgs.length == 0) {
            return null;
        }
        if (folder.getStore() == this.store) {
            synchronized (this.messageCacheLock) {
                try {
                    try {
                        IMAPProtocol p = getProtocol();
                        MessageSet[] ms = Utility.toMessageSet(msgs, null);
                        if (ms == null) {
                            throw new MessageRemovedException("Messages have been removed");
                        }
                        CopyUID cuid = p.copyuid(ms, folder.getFullName());
                        long[] srcuids = UIDSet.toArray(cuid.src);
                        long[] dstuids = UIDSet.toArray(cuid.dst);
                        Message[] srcmsgs = getMessagesByUID(srcuids);
                        result = new AppendUID[msgs.length];
                        for (int i = 0; i < srcmsgs.length; i++) {
                            int j = i;
                            while (true) {
                                if (msgs[j] == srcmsgs[i]) {
                                    result[j] = new AppendUID(cuid.uidvalidity, dstuids[i]);
                                    break;
                                }
                                j++;
                                if (j >= msgs.length) {
                                    j = 0;
                                }
                                if (j == i) {
                                    break;
                                }
                            }
                        }
                        for (int i2 = 0; i2 < msgs.length; i2++) {
                            int j2 = i2;
                            while (true) {
                                if (msgs[i2] == srcmsgs[j2]) {
                                    result[i2] = new AppendUID(cuid.uidvalidity, dstuids[j2]);
                                    break;
                                }
                                j2++;
                                if (j2 >= msgs.length) {
                                    j2 = 0;
                                }
                                if (j2 == i2) {
                                    break;
                                }
                            }
                        }
                    } catch (ConnectionException cex) {
                        throw new FolderClosedException(this, cex.getMessage());
                    }
                } catch (CommandFailedException cfx) {
                    if (cfx.getMessage().indexOf("TRYCREATE") != -1) {
                        throw new FolderNotFoundException(folder, folder.getFullName() + " does not exist");
                    }
                    throw new MessagingException(cfx.getMessage(), cfx);
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            }
            return result;
        }
        throw new MessagingException("can't copyUIDMessages to a different store");
    }

    @Override // korex.mail.Folder
    public synchronized Message[] expunge() throws MessagingException {
        return expunge(null);
    }

    /* JADX WARN: Finally extract failed */
    public synchronized Message[] expunge(Message[] msgs) throws MessagingException {
        IMAPMessage[] rmsgs;
        checkOpened();
        if (msgs != null) {
            FetchProfile fp = new FetchProfile();
            fp.add(UIDFolder.FetchProfileItem.UID);
            fetch(msgs, fp);
        }
        synchronized (this.messageCacheLock) {
            this.doExpungeNotification = false;
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    if (msgs != null) {
                        p.uidexpunge(Utility.toUIDSet(msgs));
                    } else {
                        p.expunge();
                    }
                    this.doExpungeNotification = true;
                    if (msgs != null) {
                        rmsgs = this.messageCache.removeExpungedMessages(msgs);
                    } else {
                        rmsgs = this.messageCache.removeExpungedMessages();
                    }
                    if (this.uidTable != null) {
                        for (IMAPMessage m : rmsgs) {
                            long uid = m.getUID();
                            if (uid != -1) {
                                this.uidTable.remove(Long.valueOf(uid));
                            }
                        }
                    }
                    this.total = this.messageCache.size();
                } catch (Throwable th) {
                    this.doExpungeNotification = true;
                    throw th;
                }
            } catch (CommandFailedException cfx) {
                if (this.mode != 2) {
                    throw new IllegalStateException("Cannot expunge READ_ONLY folder: " + this.fullName);
                }
                throw new MessagingException(cfx.getMessage(), cfx);
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this, cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        if (rmsgs.length > 0) {
            notifyMessageRemovedListeners(true, rmsgs);
        }
        return rmsgs;
    }

    @Override // korex.mail.Folder
    public synchronized Message[] search(SearchTerm term) throws MessagingException {
        checkOpened();
        try {
            Message[] matchMsgs = null;
            synchronized (this.messageCacheLock) {
                int[] matches = getProtocol().search(term);
                if (matches != null) {
                    matchMsgs = new IMAPMessage[matches.length];
                    int size = this.messageCache.size();
                    for (int i = 0; i < matches.length; i++) {
                        if (matches[i] > size) {
                            if (this.logger.isLoggable(Level.FINE)) {
                                this.logger.fine("ignoring message number " + matches[i] + " in search results, outside range " + size);
                            }
                        } else {
                            matchMsgs[i] = getMessageBySeqNumber(matches[i]);
                        }
                    }
                }
            }
            return matchMsgs;
        } catch (CommandFailedException e) {
            return super.search(term);
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        } catch (SearchException sex) {
            if (((IMAPStore) this.store).throwSearchException()) {
                throw sex;
            }
            return super.search(term);
        }
    }

    @Override // korex.mail.Folder
    public synchronized Message[] search(SearchTerm term, Message[] msgs) throws MessagingException {
        checkOpened();
        if (msgs.length == 0) {
            return msgs;
        }
        try {
            Message[] matchMsgs = null;
            synchronized (this.messageCacheLock) {
                IMAPProtocol p = getProtocol();
                MessageSet[] ms = Utility.toMessageSet(msgs, null);
                if (ms == null) {
                    throw new MessageRemovedException("Messages have been removed");
                }
                int[] matches = p.search(ms, term);
                if (matches != null) {
                    matchMsgs = new IMAPMessage[matches.length];
                    for (int i = 0; i < matches.length; i++) {
                        matchMsgs[i] = getMessageBySeqNumber(matches[i]);
                    }
                }
            }
            return matchMsgs;
        } catch (CommandFailedException e) {
            return super.search(term, msgs);
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        } catch (SearchException e2) {
            return super.search(term, msgs);
        }
    }

    public synchronized Message[] getSortedMessages(SortTerm[] term) throws MessagingException {
        return getSortedMessages(term, null);
    }

    public synchronized Message[] getSortedMessages(SortTerm[] term, SearchTerm sterm) throws MessagingException {
        checkOpened();
        try {
            Message[] matchMsgs = null;
            synchronized (this.messageCacheLock) {
                int[] matches = getProtocol().sort(term, sterm);
                if (matches != null) {
                    matchMsgs = new IMAPMessage[matches.length];
                    for (int i = 0; i < matches.length; i++) {
                        matchMsgs[i] = getMessageBySeqNumber(matches[i]);
                    }
                }
            }
            return matchMsgs;
        } catch (CommandFailedException cfx) {
            throw new MessagingException(cfx.getMessage(), cfx);
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        } catch (SearchException sex) {
            throw new MessagingException(sex.getMessage(), sex);
        }
    }

    @Override // korex.mail.Folder
    public synchronized void addMessageCountListener(MessageCountListener l) {
        super.addMessageCountListener(l);
        this.hasMessageCountListener = true;
    }

    @Override // korex.mail.UIDFolder
    public synchronized long getUIDValidity() throws MessagingException {
        if (this.opened) {
            return this.uidvalidity;
        }
        IMAPProtocol p = null;
        Status status = null;
        try {
            try {
                try {
                    p = getStoreProtocol();
                    String[] item = {"UIDVALIDITY"};
                    status = p.status(this.fullName, item);
                    releaseStoreProtocol(p);
                } catch (BadCommandException bex) {
                    throw new MessagingException("Cannot obtain UIDValidity", bex);
                }
            } catch (ConnectionException cex) {
                throwClosedException(cex);
                releaseStoreProtocol(p);
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
            return status.uidvalidity;
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    public synchronized long getUIDNext() throws MessagingException {
        if (this.opened) {
            return this.uidnext;
        }
        IMAPProtocol p = null;
        Status status = null;
        try {
            try {
                try {
                    p = getStoreProtocol();
                    String[] item = {"UIDNEXT"};
                    status = p.status(this.fullName, item);
                    releaseStoreProtocol(p);
                } catch (BadCommandException bex) {
                    throw new MessagingException("Cannot obtain UIDNext", bex);
                }
            } catch (ConnectionException cex) {
                throwClosedException(cex);
                releaseStoreProtocol(p);
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
            return status.uidnext;
        } catch (Throwable th) {
            releaseStoreProtocol(p);
            throw th;
        }
    }

    @Override // korex.mail.UIDFolder
    public synchronized Message getMessageByUID(long uid) throws MessagingException {
        checkOpened();
        IMAPMessage m = null;
        try {
            synchronized (this.messageCacheLock) {
                Long l = Long.valueOf(uid);
                if (this.uidTable != null) {
                    m = (IMAPMessage) this.uidTable.get(l);
                    if (m != null) {
                        return m;
                    }
                } else {
                    this.uidTable = new Hashtable();
                }
                UID u = getProtocol().fetchSequenceNumber(uid);
                if (u != null && u.seqnum <= this.total) {
                    m = getMessageBySeqNumber(u.seqnum);
                    if (m != null) {
                        m.setUID(u.uid);
                        this.uidTable.put(l, m);
                    }
                }
                return m;
            }
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    @Override // korex.mail.UIDFolder
    public synchronized Message[] getMessagesByUID(long start, long end) throws MessagingException {
        Message[] msgs;
        checkOpened();
        try {
            synchronized (this.messageCacheLock) {
                if (this.uidTable == null) {
                    this.uidTable = new Hashtable();
                }
                UID[] ua = getProtocol().fetchSequenceNumbers(start, end);
                msgs = new Message[ua.length];
                for (int i = 0; i < ua.length; i++) {
                    IMAPMessage m = getMessageBySeqNumber(ua[i].seqnum);
                    if (m != null) {
                        m.setUID(ua[i].uid);
                        msgs[i] = m;
                        this.uidTable.put(Long.valueOf(ua[i].uid), m);
                    }
                }
            }
            return msgs;
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    @Override // korex.mail.UIDFolder
    public synchronized Message[] getMessagesByUID(long[] uids) throws MessagingException {
        Message[] msgs;
        checkOpened();
        try {
            synchronized (this.messageCacheLock) {
                long[] unavailUids = uids;
                if (this.uidTable != null) {
                    Vector v = new Vector();
                    for (long j : uids) {
                        Hashtable hashtable = this.uidTable;
                        Long l = Long.valueOf(j);
                        if (!hashtable.containsKey(l)) {
                            v.addElement(l);
                        }
                    }
                    int vsize = v.size();
                    unavailUids = new long[vsize];
                    for (int i = 0; i < vsize; i++) {
                        unavailUids[i] = ((Long) v.elementAt(i)).longValue();
                    }
                } else {
                    this.uidTable = new Hashtable();
                }
                if (unavailUids.length > 0) {
                    UID[] ua = getProtocol().fetchSequenceNumbers(unavailUids);
                    for (int i2 = 0; i2 < ua.length; i2++) {
                        IMAPMessage m = getMessageBySeqNumber(ua[i2].seqnum);
                        if (m != null) {
                            m.setUID(ua[i2].uid);
                            this.uidTable.put(Long.valueOf(ua[i2].uid), m);
                        }
                    }
                }
                msgs = new Message[uids.length];
                for (int i3 = 0; i3 < uids.length; i3++) {
                    msgs[i3] = (Message) this.uidTable.get(Long.valueOf(uids[i3]));
                }
            }
            return msgs;
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    @Override // korex.mail.UIDFolder
    public synchronized long getUID(Message message) throws MessagingException {
        if (message.getFolder() != this) {
            throw new NoSuchElementException("Message does not belong to this folder");
        }
        checkOpened();
        if (!(message instanceof IMAPMessage)) {
            throw new MessagingException("message is not an IMAPMessage");
        }
        IMAPMessage m = (IMAPMessage) message;
        long uid = m.getUID();
        long uid2 = uid;
        if (uid != -1) {
            return uid2;
        }
        synchronized (this.messageCacheLock) {
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    m.checkExpunged();
                    UID u = p.fetchUID(m.getSequenceNumber());
                    if (u != null) {
                        uid2 = u.uid;
                        m.setUID(uid2);
                        if (this.uidTable == null) {
                            this.uidTable = new Hashtable();
                        }
                        this.uidTable.put(Long.valueOf(uid2), m);
                    }
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this, cex.getMessage());
            }
        }
        return uid2;
    }

    private Message[] createMessagesForUIDs(long[] uids) {
        IMAPMessage[] msgs = new IMAPMessage[uids.length];
        for (int i = 0; i < uids.length; i = i + 1 + 1) {
            IMAPMessage m = null;
            if (this.uidTable != null) {
                m = (IMAPMessage) this.uidTable.get(Long.valueOf(uids[i]));
            }
            if (m == null) {
                m = newIMAPMessage(-1);
                m.setUID(uids[i]);
                m.setExpunged(true);
            }
            msgs[i] = m;
        }
        return msgs;
    }

    public synchronized long getHighestModSeq() throws MessagingException {
        IMAPProtocol p;
        if (this.opened) {
            return this.highestmodseq;
        }
        Status status = null;
        try {
            try {
                p = getStoreProtocol();
            } catch (BadCommandException bex) {
                throw new MessagingException("Cannot obtain HIGHESTMODSEQ", bex);
            } catch (ConnectionException cex) {
                throwClosedException(cex);
                releaseStoreProtocol(null);
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
            if (!p.hasCapability("CONDSTORE")) {
                throw new BadCommandException("CONDSTORE not supported");
            }
            String[] item = {"HIGHESTMODSEQ"};
            status = p.status(this.fullName, item);
            releaseStoreProtocol(p);
            return status.highestmodseq;
        } catch (Throwable th) {
            releaseStoreProtocol(null);
            throw th;
        }
    }

    public synchronized Message[] getMessagesByUIDChangedSince(long start, long end, long modseq) throws MessagingException {
        Message[] msgs;
        checkOpened();
        try {
            synchronized (this.messageCacheLock) {
                IMAPProtocol p = getProtocol();
                if (!p.hasCapability("CONDSTORE")) {
                    throw new BadCommandException("CONDSTORE not supported");
                }
                int[] nums = p.uidfetchChangedSince(start, end, modseq);
                msgs = new Message[nums.length];
                for (int i = 0; i < nums.length; i++) {
                    msgs[i] = getMessageBySeqNumber(nums[i]);
                }
            }
            return msgs;
        } catch (ConnectionException cex) {
            throw new FolderClosedException(this, cex.getMessage());
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    public Quota[] getQuota() throws MessagingException {
        return (Quota[]) doOptionalCommand("QUOTA not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.12
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.getQuotaRoot(IMAPFolder.this.fullName);
            }
        });
    }

    public void setQuota(final Quota quota) throws MessagingException {
        doOptionalCommand("QUOTA not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.13
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                p.setQuota(quota);
                return null;
            }
        });
    }

    public ACL[] getACL() throws MessagingException {
        return (ACL[]) doOptionalCommand("ACL not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.14
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.getACL(IMAPFolder.this.fullName);
            }
        });
    }

    public void addACL(ACL acl) throws MessagingException {
        setACL(acl, (char) 0);
    }

    public void removeACL(final String name) throws MessagingException {
        doOptionalCommand("ACL not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.15
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                p.deleteACL(IMAPFolder.this.fullName, name);
                return null;
            }
        });
    }

    public void addRights(ACL acl) throws MessagingException {
        setACL(acl, '+');
    }

    public void removeRights(ACL acl) throws MessagingException {
        setACL(acl, '-');
    }

    public Rights[] listRights(final String name) throws MessagingException {
        return (Rights[]) doOptionalCommand("ACL not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.16
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.listRights(IMAPFolder.this.fullName, name);
            }
        });
    }

    public Rights myRights() throws MessagingException {
        return (Rights) doOptionalCommand("ACL not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.17
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.myRights(IMAPFolder.this.fullName);
            }
        });
    }

    private void setACL(final ACL acl, final char mod) throws MessagingException {
        doOptionalCommand("ACL not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.18
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                p.setACL(IMAPFolder.this.fullName, mod, acl);
                return null;
            }
        });
    }

    public synchronized String[] getAttributes() throws MessagingException {
        checkExists();
        if (this.attributes == null) {
            exists();
        }
        return this.attributes == null ? new String[0] : (String[]) this.attributes.clone();
    }

    public void idle() throws MessagingException {
        idle(false);
    }

    public void idle(boolean once) throws MessagingException {
        synchronized (this) {
            if (this.protocol != null && this.protocol.getChannel() != null) {
                throw new MessagingException("idle method not supported with SocketChannels");
            }
        }
        startIdle(null);
        while (handleIdle(once)) {
        }
        int minidle = ((IMAPStore) this.store).getMinIdleTime();
        if (minidle > 0) {
            try {
                Thread.sleep(minidle);
            } catch (InterruptedException e) {
            }
        }
    }

    void startIdle(IdleManager im) throws MessagingException {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        this.idleManager = im;
        synchronized (this) {
            checkOpened();
            Boolean started = (Boolean) doOptionalCommand("IDLE not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.19
                @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
                public Object doCommand(IMAPProtocol p) throws ProtocolException {
                    if (IMAPFolder.this.idleState == 0) {
                        p.idleStart();
                        IMAPFolder.this.idleState = 1;
                        return Boolean.TRUE;
                    }
                    try {
                        IMAPFolder.this.messageCacheLock.wait();
                    } catch (InterruptedException e) {
                    }
                    return Boolean.FALSE;
                }
            });
            if (started.booleanValue()) {
            }
        }
    }

    boolean handleIdle(boolean once) throws MessagingException {
        Response r = this.protocol.readIdleResponse();
        try {
            synchronized (this.messageCacheLock) {
                if (r != null) {
                    try {
                        if (this.protocol != null && this.protocol.processIdleResponse(r)) {
                            if (once && this.idleState == 1) {
                                this.protocol.idleAbort();
                                this.idleState = 2;
                            }
                            return true;
                        }
                    } catch (ProtocolException pex) {
                        this.idleState = 0;
                        this.messageCacheLock.notifyAll();
                        throw pex;
                    }
                }
                this.idleState = 0;
                this.messageCacheLock.notifyAll();
                return false;
            }
        } catch (ConnectionException cex) {
            throwClosedException(cex);
            return true;
        } catch (ProtocolException pex2) {
            throw new MessagingException(pex2.getMessage(), pex2);
        }
    }

    void waitIfIdle() throws ProtocolException {
        if (!$assertionsDisabled && !Thread.holdsLock(this.messageCacheLock)) {
            throw new AssertionError();
        }
        while (this.idleState != 0) {
            if (this.idleState == 1) {
                IdleManager im = this.idleManager;
                if (im != null) {
                    im.requestAbort(this);
                } else {
                    this.protocol.idleAbort();
                }
                this.idleState = 2;
            }
            try {
                this.messageCacheLock.wait();
            } catch (InterruptedException e) {
            }
        }
    }

    void idleAbort() {
        this.idleManager = null;
        if (this.protocol != null) {
            this.protocol.idleAbort();
        }
    }

    SocketChannel getChannel() {
        if (this.protocol != null) {
            return this.protocol.getChannel();
        }
        return null;
    }

    public Map<String, String> id(final Map<String, String> clientParams) throws MessagingException {
        checkOpened();
        return (Map) doOptionalCommand("ID not supported", new ProtocolCommand() { // from class: com.sun.mail.imap.IMAPFolder.20
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.id(clientParams);
            }
        });
    }

    public long getStatusItem(String item) throws MessagingException {
        if (!this.opened) {
            checkExists();
            IMAPProtocol p = null;
            try {
                try {
                    p = getStoreProtocol();
                    String[] items = {item};
                    Status status = p.status(this.fullName, items);
                    long item2 = status.getItem(item);
                    releaseStoreProtocol(p);
                    return item2;
                } catch (BadCommandException e) {
                    releaseStoreProtocol(p);
                    return -1L;
                } catch (ConnectionException cex) {
                    throw new StoreClosedException(this.store, cex.getMessage());
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (Throwable th) {
                releaseStoreProtocol(p);
                throw th;
            }
        }
        return -1L;
    }

    @Override // com.sun.mail.iap.ResponseHandler
    public void handleResponse(Response r) {
        if (!$assertionsDisabled && !Thread.holdsLock(this.messageCacheLock)) {
            throw new AssertionError();
        }
        if (r.isOK() || r.isNO() || r.isBAD() || r.isBYE()) {
            ((IMAPStore) this.store).handleResponseCode(r);
        }
        if (r.isBYE()) {
            if (this.opened) {
                cleanup(false);
                return;
            }
            return;
        }
        if (r.isOK()) {
            r.skipSpaces();
            if (r.readByte() == 91) {
                String s = r.readAtom();
                if (s.equalsIgnoreCase("HIGHESTMODSEQ")) {
                    this.highestmodseq = r.readLong();
                }
            }
            r.reset();
            return;
        }
        if (!r.isUnTagged()) {
            return;
        }
        if (!(r instanceof IMAPResponse)) {
            this.logger.fine("UNEXPECTED RESPONSE : " + r.toString());
            return;
        }
        IMAPResponse ir = (IMAPResponse) r;
        if (ir.keyEquals("EXISTS")) {
            int exists = ir.getNumber();
            if (exists <= this.realTotal) {
                return;
            }
            int count = exists - this.realTotal;
            Message[] msgs = new Message[count];
            this.messageCache.addMessages(count, this.realTotal + 1);
            int oldtotal = this.total;
            this.realTotal += count;
            this.total += count;
            if (this.hasMessageCountListener) {
                for (int i = 0; i < count; i++) {
                    oldtotal++;
                    msgs[i] = this.messageCache.getMessage(oldtotal);
                }
                notifyMessageAddedListeners(msgs);
                return;
            }
            return;
        }
        if (ir.keyEquals("EXPUNGE")) {
            int seqnum = ir.getNumber();
            Message[] msgs2 = null;
            if (this.doExpungeNotification && this.hasMessageCountListener) {
                msgs2 = new Message[]{getMessageBySeqNumber(seqnum)};
            }
            this.messageCache.expungeMessage(seqnum);
            this.realTotal--;
            if (msgs2 != null) {
                notifyMessageRemovedListeners(false, msgs2);
                return;
            }
            return;
        }
        if (!ir.keyEquals("VANISHED")) {
            if (ir.keyEquals("FETCH")) {
                if (!$assertionsDisabled && !(ir instanceof FetchResponse)) {
                    throw new AssertionError("!ir instanceof FetchResponse");
                }
                Message msg = processFetchResponse((FetchResponse) ir);
                if (msg != null) {
                    notifyMessageChangedListeners(1, msg);
                    return;
                }
                return;
            }
            if (ir.keyEquals("RECENT")) {
                this.recent = ir.getNumber();
                return;
            }
            return;
        }
        String[] s2 = ir.readAtomStringList();
        if (s2 == null) {
            String uids = ir.readAtom();
            UIDSet[] uidset = UIDSet.parseUIDSets(uids);
            this.realTotal = (int) (this.realTotal - UIDSet.size(uidset));
            long[] luid = UIDSet.toArray(uidset);
            Message[] msgs3 = createMessagesForUIDs(luid);
            for (Message m : msgs3) {
                if (m.getMessageNumber() > 0) {
                    this.messageCache.expungeMessage(m.getMessageNumber());
                }
            }
            if (this.doExpungeNotification && this.hasMessageCountListener) {
                notifyMessageRemovedListeners(true, msgs3);
            }
        }
    }

    private Message processFetchResponse(FetchResponse fr) {
        IMAPMessage msg = getMessageBySeqNumber(fr.getNumber());
        if (msg != null) {
            boolean notify = false;
            UID uid = (UID) fr.getItem(UID.class);
            if (uid != null && msg.getUID() != uid.uid) {
                msg.setUID(uid.uid);
                if (this.uidTable == null) {
                    this.uidTable = new Hashtable();
                }
                this.uidTable.put(Long.valueOf(uid.uid), msg);
                notify = true;
            }
            MODSEQ modseq = (MODSEQ) fr.getItem(MODSEQ.class);
            if (modseq != null && msg._getModSeq() != modseq.modseq) {
                msg.setModSeq(modseq.modseq);
                notify = true;
            }
            FLAGS flags = (FLAGS) fr.getItem(FLAGS.class);
            if (flags != null) {
                msg._setFlags(flags);
                notify = true;
            }
            if (!notify) {
                msg = null;
            }
        }
        return msg;
    }

    void handleResponses(Response[] r) {
        for (int i = 0; i < r.length; i++) {
            if (r[i] != null) {
                handleResponse(r[i]);
            }
        }
    }

    protected synchronized IMAPProtocol getStoreProtocol() throws ProtocolException {
        this.connectionPoolLogger.fine("getStoreProtocol() borrowing a connection");
        return ((IMAPStore) this.store).getFolderStoreProtocol();
    }

    protected synchronized void throwClosedException(ConnectionException cex) throws FolderClosedException, StoreClosedException {
        if ((this.protocol != null && cex.getProtocol() == this.protocol) || (this.protocol == null && !this.reallyClosed)) {
            throw new FolderClosedException(this, cex.getMessage());
        }
        throw new StoreClosedException(this.store, cex.getMessage());
    }

    protected IMAPProtocol getProtocol() throws ProtocolException {
        if (!$assertionsDisabled && !Thread.holdsLock(this.messageCacheLock)) {
            throw new AssertionError();
        }
        waitIfIdle();
        return this.protocol;
    }

    public Object doCommand(ProtocolCommand cmd) throws MessagingException {
        try {
            return doProtocolCommand(cmd);
        } catch (ConnectionException cex) {
            throwClosedException(cex);
            return null;
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    public Object doOptionalCommand(String err, ProtocolCommand cmd) throws MessagingException {
        try {
            return doProtocolCommand(cmd);
        } catch (BadCommandException bex) {
            throw new MessagingException(err, bex);
        } catch (ConnectionException cex) {
            throwClosedException(cex);
            return null;
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    public Object doCommandIgnoreFailure(ProtocolCommand cmd) throws MessagingException {
        try {
            return doProtocolCommand(cmd);
        } catch (CommandFailedException e) {
            return null;
        } catch (ConnectionException cex) {
            throwClosedException(cex);
            return null;
        } catch (ProtocolException pex) {
            throw new MessagingException(pex.getMessage(), pex);
        }
    }

    protected Object doProtocolCommand(ProtocolCommand cmd) throws ProtocolException {
        Object doCommand;
        synchronized (this) {
            if (this.protocol != null) {
                synchronized (this.messageCacheLock) {
                    doCommand = cmd.doCommand(getProtocol());
                }
                return doCommand;
            }
            IMAPProtocol p = null;
            try {
                p = getStoreProtocol();
                Object doCommand2 = cmd.doCommand(p);
                releaseStoreProtocol(p);
                return doCommand2;
            } catch (Throwable th) {
                releaseStoreProtocol(p);
                throw th;
            }
        }
    }

    protected synchronized void releaseStoreProtocol(IMAPProtocol p) {
        if (p != this.protocol) {
            ((IMAPStore) this.store).releaseFolderStoreProtocol(p);
        } else {
            this.logger.fine("releasing our protocol as store protocol?");
        }
    }

    protected void releaseProtocol(boolean returnToPool) {
        if (this.protocol != null) {
            this.protocol.removeResponseHandler(this);
            if (returnToPool) {
                ((IMAPStore) this.store).releaseProtocol(this, this.protocol);
            } else {
                this.protocol.disconnect();
                ((IMAPStore) this.store).releaseProtocol(this, null);
            }
            this.protocol = null;
        }
    }

    protected void keepConnectionAlive(boolean keepStoreAlive) throws ProtocolException {
        if (System.currentTimeMillis() - this.protocol.getTimestamp() > 1000) {
            waitIfIdle();
            if (this.protocol != null) {
                this.protocol.noop();
            }
        }
        if (keepStoreAlive && ((IMAPStore) this.store).hasSeparateStoreConnection()) {
            IMAPProtocol p = null;
            try {
                p = ((IMAPStore) this.store).getFolderStoreProtocol();
                if (System.currentTimeMillis() - p.getTimestamp() > 1000) {
                    p.noop();
                }
                ((IMAPStore) this.store).releaseFolderStoreProtocol(p);
            } catch (Throwable th) {
                ((IMAPStore) this.store).releaseFolderStoreProtocol(p);
                throw th;
            }
        }
    }

    protected IMAPMessage getMessageBySeqNumber(int seqnum) {
        return this.messageCache.getMessageBySeqnum(seqnum);
    }

    private boolean isDirectory() {
        return (this.type & 2) != 0;
    }
}
