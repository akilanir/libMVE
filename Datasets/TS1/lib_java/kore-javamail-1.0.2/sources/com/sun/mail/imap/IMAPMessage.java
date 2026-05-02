package com.sun.mail.imap;

import com.sun.mail.iap.ConnectionException;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.iap.Response;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.Utility;
import com.sun.mail.imap.protocol.BODY;
import com.sun.mail.imap.protocol.BODYSTRUCTURE;
import com.sun.mail.imap.protocol.ENVELOPE;
import com.sun.mail.imap.protocol.FetchItem;
import com.sun.mail.imap.protocol.FetchResponse;
import com.sun.mail.imap.protocol.IMAPProtocol;
import com.sun.mail.imap.protocol.INTERNALDATE;
import com.sun.mail.imap.protocol.Item;
import com.sun.mail.imap.protocol.MODSEQ;
import com.sun.mail.imap.protocol.RFC822DATA;
import com.sun.mail.imap.protocol.RFC822SIZE;
import com.sun.mail.imap.protocol.UID;
import com.sun.mail.util.ReadableMime;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import korex.activation.DataHandler;
import korex.mail.Address;
import korex.mail.FetchProfile;
import korex.mail.Flags;
import korex.mail.FolderClosedException;
import korex.mail.Header;
import korex.mail.IllegalWriteException;
import korex.mail.Message;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.Session;
import korex.mail.UIDFolder;
import korex.mail.internet.ContentType;
import korex.mail.internet.InternetAddress;
import korex.mail.internet.InternetHeaders;
import korex.mail.internet.MimeMessage;
import korex.mail.internet.MimeUtility;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPMessage.class */
public class IMAPMessage extends MimeMessage implements ReadableMime {
    protected BODYSTRUCTURE bs;
    protected ENVELOPE envelope;
    protected Map items;
    private Date receivedDate;
    private int size;
    private Boolean peek;
    private volatile long uid;
    private volatile long modseq;
    protected String sectionId;
    private String type;
    private String subject;
    private String description;
    private volatile boolean headersLoaded;
    private volatile boolean bodyLoaded;
    private Hashtable loadedHeaders;
    static final String EnvelopeCmd = "ENVELOPE INTERNALDATE RFC822.SIZE";

    protected IMAPMessage(IMAPFolder folder, int msgnum) {
        super(folder, msgnum);
        this.size = -1;
        this.uid = -1L;
        this.modseq = -1L;
        this.headersLoaded = false;
        this.bodyLoaded = false;
        this.loadedHeaders = new Hashtable(1);
        this.flags = null;
    }

    protected IMAPMessage(Session session) {
        super(session);
        this.size = -1;
        this.uid = -1L;
        this.modseq = -1L;
        this.headersLoaded = false;
        this.bodyLoaded = false;
        this.loadedHeaders = new Hashtable(1);
    }

    protected IMAPProtocol getProtocol() throws ProtocolException, FolderClosedException {
        ((IMAPFolder) this.folder).waitIfIdle();
        IMAPProtocol p = ((IMAPFolder) this.folder).protocol;
        if (p == null) {
            throw new FolderClosedException(this.folder);
        }
        return p;
    }

    protected boolean isREV1() throws FolderClosedException {
        IMAPProtocol p = ((IMAPFolder) this.folder).protocol;
        if (p == null) {
            throw new FolderClosedException(this.folder);
        }
        return p.isREV1();
    }

    protected Object getMessageCacheLock() {
        return ((IMAPFolder) this.folder).messageCacheLock;
    }

    protected int getSequenceNumber() {
        return ((IMAPFolder) this.folder).messageCache.seqnumOf(getMessageNumber());
    }

    @Override // korex.mail.Message
    protected void setMessageNumber(int msgnum) {
        super.setMessageNumber(msgnum);
    }

    protected long getUID() {
        return this.uid;
    }

    protected void setUID(long uid) {
        this.uid = uid;
    }

    public synchronized long getModSeq() throws MessagingException {
        if (this.modseq != -1) {
            return this.modseq;
        }
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                MODSEQ ms = p.fetchMODSEQ(getSequenceNumber());
                if (ms != null) {
                    this.modseq = ms.modseq;
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        return this.modseq;
    }

    long _getModSeq() {
        return this.modseq;
    }

    void setModSeq(long modseq) {
        this.modseq = modseq;
    }

    @Override // korex.mail.Message
    protected void setExpunged(boolean set) {
        super.setExpunged(set);
    }

    protected void checkExpunged() throws MessageRemovedException {
        if (this.expunged) {
            throw new MessageRemovedException();
        }
    }

    protected void forceCheckExpunged() throws MessageRemovedException, FolderClosedException {
        synchronized (getMessageCacheLock()) {
            try {
                getProtocol().noop();
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException e) {
            }
        }
        if (this.expunged) {
            throw new MessageRemovedException();
        }
    }

    protected int getFetchBlockSize() {
        return ((IMAPStore) this.folder.getStore()).getFetchBlockSize();
    }

    protected boolean ignoreBodyStructureSize() {
        return ((IMAPStore) this.folder.getStore()).ignoreBodyStructureSize();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public Address[] getFrom() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getFrom();
        }
        loadEnvelope();
        InternetAddress[] a = this.envelope.from;
        if (a == null || a.length == 0) {
            a = this.envelope.sender;
        }
        return aaclone(a);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void setFrom(Address address) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void addFrom(Address[] addresses) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage
    public Address getSender() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getSender();
        }
        loadEnvelope();
        if (this.envelope.sender != null && this.envelope.sender.length > 0) {
            return this.envelope.sender[0];
        }
        return null;
    }

    @Override // korex.mail.internet.MimeMessage
    public void setSender(Address address) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public Address[] getRecipients(Message.RecipientType type) throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getRecipients(type);
        }
        loadEnvelope();
        if (type == Message.RecipientType.TO) {
            return aaclone(this.envelope.to);
        }
        if (type == Message.RecipientType.CC) {
            return aaclone(this.envelope.cc);
        }
        if (type == Message.RecipientType.BCC) {
            return aaclone(this.envelope.bcc);
        }
        return super.getRecipients(type);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void setRecipients(Message.RecipientType type, Address[] addresses) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void addRecipients(Message.RecipientType type, Address[] addresses) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public Address[] getReplyTo() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getReplyTo();
        }
        loadEnvelope();
        if (this.envelope.replyTo == null || this.envelope.replyTo.length == 0) {
            return getFrom();
        }
        return aaclone(this.envelope.replyTo);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void setReplyTo(Address[] addresses) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public String getSubject() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getSubject();
        }
        if (this.subject != null) {
            return this.subject;
        }
        loadEnvelope();
        if (this.envelope.subject == null) {
            return null;
        }
        try {
            this.subject = MimeUtility.decodeText(MimeUtility.unfold(this.envelope.subject));
        } catch (UnsupportedEncodingException e) {
            this.subject = this.envelope.subject;
        }
        return this.subject;
    }

    @Override // korex.mail.internet.MimeMessage
    public void setSubject(String subject, String charset) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public Date getSentDate() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getSentDate();
        }
        loadEnvelope();
        if (this.envelope.date == null) {
            return null;
        }
        return new Date(this.envelope.date.getTime());
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public void setSentDate(Date d) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public Date getReceivedDate() throws MessagingException {
        checkExpunged();
        loadEnvelope();
        if (this.receivedDate == null) {
            return null;
        }
        return new Date(this.receivedDate.getTime());
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public int getSize() throws MessagingException {
        checkExpunged();
        if (this.size == -1) {
            loadEnvelope();
        }
        return this.size;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public int getLineCount() throws MessagingException {
        checkExpunged();
        loadBODYSTRUCTURE();
        return this.bs.lines;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String[] getContentLanguage() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getContentLanguage();
        }
        loadBODYSTRUCTURE();
        if (this.bs.language != null) {
            return (String[]) this.bs.language.clone();
        }
        return null;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public void setContentLanguage(String[] languages) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    public String getInReplyTo() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getHeader("In-Reply-To", " ");
        }
        loadEnvelope();
        return this.envelope.inReplyTo;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public synchronized String getContentType() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getContentType();
        }
        if (this.type == null) {
            loadBODYSTRUCTURE();
            ContentType ct = new ContentType(this.bs.type, this.bs.subtype, this.bs.cParams);
            this.type = ct.toString();
        }
        return this.type;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public String getDisposition() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getDisposition();
        }
        loadBODYSTRUCTURE();
        return this.bs.disposition;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void setDisposition(String disposition) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String getEncoding() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getEncoding();
        }
        loadBODYSTRUCTURE();
        return this.bs.encoding;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String getContentID() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getContentID();
        }
        loadBODYSTRUCTURE();
        return this.bs.id;
    }

    @Override // korex.mail.internet.MimeMessage
    public void setContentID(String cid) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String getContentMD5() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getContentMD5();
        }
        loadBODYSTRUCTURE();
        return this.bs.md5;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public void setContentMD5(String md5) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public String getDescription() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getDescription();
        }
        if (this.description != null) {
            return this.description;
        }
        loadBODYSTRUCTURE();
        if (this.bs.description == null) {
            return null;
        }
        try {
            this.description = MimeUtility.decodeText(this.bs.description);
        } catch (UnsupportedEncodingException e) {
            this.description = this.bs.description;
        }
        return this.description;
    }

    @Override // korex.mail.internet.MimeMessage
    public void setDescription(String description, String charset) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage
    public String getMessageID() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getMessageID();
        }
        loadEnvelope();
        return this.envelope.messageId;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public String getFileName() throws MessagingException {
        checkExpunged();
        if (this.bodyLoaded) {
            return super.getFileName();
        }
        String filename = null;
        loadBODYSTRUCTURE();
        if (this.bs.dParams != null) {
            filename = this.bs.dParams.get("filename");
        }
        if (filename == null && this.bs.cParams != null) {
            filename = this.bs.cParams.get(IMAPStore.ID_NAME);
        }
        return filename;
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void setFileName(String filename) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage
    protected InputStream getContentStream() throws MessagingException {
        BODY b;
        if (this.bodyLoaded) {
            return super.getContentStream();
        }
        InputStream is = null;
        boolean pk = getPeek();
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                if (p.isREV1() && getFetchBlockSize() != -1) {
                    return new IMAPInputStream(this, toSection("TEXT"), (this.bs == null || ignoreBodyStructureSize()) ? -1 : this.bs.size, pk);
                }
                if (p.isREV1()) {
                    if (pk) {
                        b = p.peekBody(getSequenceNumber(), toSection("TEXT"));
                    } else {
                        b = p.fetchBody(getSequenceNumber(), toSection("TEXT"));
                    }
                    if (b != null) {
                        is = b.getByteArrayInputStream();
                    }
                } else {
                    RFC822DATA rd = p.fetchRFC822(getSequenceNumber(), "TEXT");
                    if (rd != null) {
                        is = rd.getByteArrayInputStream();
                    }
                }
                if (is == null) {
                    throw new MessagingException("No content");
                }
                return is;
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public synchronized DataHandler getDataHandler() throws MessagingException {
        checkExpunged();
        if (this.dh == null && !this.bodyLoaded) {
            loadBODYSTRUCTURE();
            if (this.type == null) {
                ContentType ct = new ContentType(this.bs.type, this.bs.subtype, this.bs.cParams);
                this.type = ct.toString();
            }
            if (this.bs.isMulti()) {
                this.dh = new DataHandler(new IMAPMultipartDataSource(this, this.bs.bodies, this.sectionId, this));
            } else if (this.bs.isNested() && isREV1() && this.bs.envelope != null) {
                this.dh = new DataHandler(new IMAPNestedMessage(this, this.bs.bodies[0], this.bs.envelope, this.sectionId == null ? "1" : this.sectionId + ".1"), this.type);
            }
        }
        return super.getDataHandler();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void setDataHandler(DataHandler content) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // com.sun.mail.util.ReadableMime
    public InputStream getMimeStream() throws MessagingException {
        BODY b;
        InputStream is = null;
        boolean pk = getPeek();
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                if (p.isREV1() && getFetchBlockSize() != -1) {
                    return new IMAPInputStream(this, this.sectionId, -1, pk);
                }
                if (p.isREV1()) {
                    if (pk) {
                        b = p.peekBody(getSequenceNumber(), this.sectionId);
                    } else {
                        b = p.fetchBody(getSequenceNumber(), this.sectionId);
                    }
                    if (b != null) {
                        is = b.getByteArrayInputStream();
                    }
                } else {
                    RFC822DATA rd = p.fetchRFC822(getSequenceNumber(), null);
                    if (rd != null) {
                        is = rd.getByteArrayInputStream();
                    }
                }
                if (is == null) {
                    forceCheckExpunged();
                    throw new MessagingException("No content");
                }
                return is;
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void writeTo(OutputStream os) throws IOException, MessagingException {
        if (this.bodyLoaded) {
            super.writeTo(os);
            return;
        }
        InputStream is = getMimeStream();
        try {
            byte[] bytes = new byte[16384];
            while (true) {
                int count = is.read(bytes);
                if (count != -1) {
                    os.write(bytes, 0, count);
                } else {
                    return;
                }
            }
        } finally {
            is.close();
        }
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public String[] getHeader(String name) throws MessagingException {
        checkExpunged();
        if (isHeaderLoaded(name)) {
            return this.headers.getHeader(name);
        }
        InputStream is = null;
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                if (p.isREV1()) {
                    BODY b = p.peekBody(getSequenceNumber(), toSection("HEADER.FIELDS (" + name + ")"));
                    if (b != null) {
                        is = b.getByteArrayInputStream();
                    }
                } else {
                    RFC822DATA rd = p.fetchRFC822(getSequenceNumber(), "HEADER.LINES (" + name + ")");
                    if (rd != null) {
                        is = rd.getByteArrayInputStream();
                    }
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        if (is == null) {
            return null;
        }
        if (this.headers == null) {
            this.headers = new InternetHeaders();
        }
        this.headers.load(is);
        setHeaderLoaded(name);
        return this.headers.getHeader(name);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public String getHeader(String name, String delimiter) throws MessagingException {
        checkExpunged();
        if (getHeader(name) == null) {
            return null;
        }
        return this.headers.getHeader(name, delimiter);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void setHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void addHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public void removeHeader(String name) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getAllHeaders() throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getAllHeaders();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getMatchingHeaders(String[] names) throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Part
    public Enumeration getNonMatchingHeaders(String[] names) throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getNonMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public void addHeaderLine(String line) throws MessagingException {
        throw new IllegalWriteException("IMAPMessage is read-only");
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getAllHeaderLines() throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getAllHeaderLines();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getMatchingHeaderLines(String[] names) throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getMatchingHeaderLines(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.internet.MimePart
    public Enumeration getNonMatchingHeaderLines(String[] names) throws MessagingException {
        checkExpunged();
        loadHeaders();
        return super.getNonMatchingHeaderLines(names);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public synchronized Flags getFlags() throws MessagingException {
        checkExpunged();
        loadFlags();
        return super.getFlags();
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public synchronized boolean isSet(Flags.Flag flag) throws MessagingException {
        checkExpunged();
        loadFlags();
        return super.isSet(flag);
    }

    @Override // korex.mail.internet.MimeMessage, korex.mail.Message
    public synchronized void setFlags(Flags flag, boolean set) throws MessagingException {
        synchronized (getMessageCacheLock()) {
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    checkExpunged();
                    p.storeFlags(getSequenceNumber(), flag, set);
                } catch (ConnectionException cex) {
                    throw new FolderClosedException(this.folder, cex.getMessage());
                }
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    public synchronized void setPeek(boolean peek) {
        this.peek = Boolean.valueOf(peek);
    }

    public synchronized boolean getPeek() {
        if (this.peek == null) {
            return ((IMAPStore) this.folder.getStore()).getPeek();
        }
        return this.peek.booleanValue();
    }

    public synchronized void invalidateHeaders() {
        this.headersLoaded = false;
        this.loadedHeaders.clear();
        this.headers = null;
        this.envelope = null;
        this.bs = null;
        this.receivedDate = null;
        this.size = -1;
        this.type = null;
        this.subject = null;
        this.description = null;
        this.flags = null;
        this.content = null;
        this.contentStream = null;
        this.bodyLoaded = false;
    }

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPMessage$FetchProfileCondition.class */
    public static class FetchProfileCondition implements Utility.Condition {
        private boolean needEnvelope;
        private boolean needFlags;
        private boolean needBodyStructure;
        private boolean needUID;
        private boolean needHeaders;
        private boolean needSize;
        private boolean needMessage;
        private String[] hdrs;
        private Set need = new HashSet();

        public FetchProfileCondition(FetchProfile fp, FetchItem[] fitems) {
            this.needEnvelope = false;
            this.needFlags = false;
            this.needBodyStructure = false;
            this.needUID = false;
            this.needHeaders = false;
            this.needSize = false;
            this.needMessage = false;
            this.hdrs = null;
            if (fp.contains(FetchProfile.Item.ENVELOPE)) {
                this.needEnvelope = true;
            }
            if (fp.contains(FetchProfile.Item.FLAGS)) {
                this.needFlags = true;
            }
            if (fp.contains(FetchProfile.Item.CONTENT_INFO)) {
                this.needBodyStructure = true;
            }
            if (fp.contains(FetchProfile.Item.SIZE)) {
                this.needSize = true;
            }
            if (fp.contains(UIDFolder.FetchProfileItem.UID)) {
                this.needUID = true;
            }
            if (fp.contains(IMAPFolder.FetchProfileItem.HEADERS)) {
                this.needHeaders = true;
            }
            if (fp.contains(IMAPFolder.FetchProfileItem.SIZE)) {
                this.needSize = true;
            }
            if (fp.contains(IMAPFolder.FetchProfileItem.MESSAGE)) {
                this.needMessage = true;
            }
            this.hdrs = fp.getHeaderNames();
            for (int i = 0; i < fitems.length; i++) {
                if (fp.contains(fitems[i].getFetchProfileItem())) {
                    this.need.add(fitems[i]);
                }
            }
        }

        @Override // com.sun.mail.imap.Utility.Condition
        public boolean test(IMAPMessage m) {
            if (this.needEnvelope && m._getEnvelope() == null && !m.bodyLoaded) {
                return true;
            }
            if (this.needFlags && m._getFlags() == null) {
                return true;
            }
            if (this.needBodyStructure && m._getBodyStructure() == null && !m.bodyLoaded) {
                return true;
            }
            if (this.needUID && m.getUID() == -1) {
                return true;
            }
            if (this.needHeaders && !m.areHeadersLoaded()) {
                return true;
            }
            if (this.needSize && m.size == -1 && !m.bodyLoaded) {
                return true;
            }
            if (this.needMessage && !m.bodyLoaded) {
                return true;
            }
            for (int i = 0; i < this.hdrs.length; i++) {
                if (!m.isHeaderLoaded(this.hdrs[i])) {
                    return true;
                }
            }
            for (FetchItem fitem : this.need) {
                if (m.items == null || m.items.get(fitem.getName()) == null) {
                    return true;
                }
            }
            return false;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected boolean handleFetchItem(Item item, String[] hdrs, boolean allHeaders) throws MessagingException {
        InputStream headerStream;
        boolean isHeader;
        if (item instanceof Flags) {
            this.flags = (Flags) item;
            return true;
        }
        if (item instanceof ENVELOPE) {
            this.envelope = (ENVELOPE) item;
            return true;
        }
        if (item instanceof INTERNALDATE) {
            this.receivedDate = ((INTERNALDATE) item).getDate();
            return true;
        }
        if (item instanceof RFC822SIZE) {
            this.size = ((RFC822SIZE) item).size;
            return true;
        }
        if (item instanceof BODYSTRUCTURE) {
            this.bs = (BODYSTRUCTURE) item;
            return true;
        }
        if (item instanceof UID) {
            UID u = (UID) item;
            this.uid = u.uid;
            if (((IMAPFolder) this.folder).uidTable == null) {
                ((IMAPFolder) this.folder).uidTable = new Hashtable();
            }
            ((IMAPFolder) this.folder).uidTable.put(Long.valueOf(u.uid), this);
            return true;
        }
        if ((item instanceof RFC822DATA) || (item instanceof BODY)) {
            if (item instanceof RFC822DATA) {
                headerStream = ((RFC822DATA) item).getByteArrayInputStream();
                isHeader = ((RFC822DATA) item).isHeader();
            } else {
                headerStream = ((BODY) item).getByteArrayInputStream();
                isHeader = ((BODY) item).isHeader();
            }
            if (!isHeader) {
                try {
                    this.size = headerStream.available();
                } catch (IOException e) {
                }
                parse(headerStream);
                this.bodyLoaded = true;
                setHeadersLoaded(true);
                return true;
            }
            InternetHeaders h = new InternetHeaders();
            if (headerStream != null) {
                h.load(headerStream);
            }
            if (this.headers == null || allHeaders) {
                this.headers = h;
            } else {
                Enumeration e2 = h.getAllHeaders();
                while (e2.hasMoreElements()) {
                    Header he = (Header) e2.nextElement();
                    if (!isHeaderLoaded(he.getName())) {
                        this.headers.addHeader(he.getName(), he.getValue());
                    }
                }
            }
            if (allHeaders) {
                setHeadersLoaded(true);
                return true;
            }
            for (String str : hdrs) {
                setHeaderLoaded(str);
            }
            return true;
        }
        return false;
    }

    protected void handleExtensionFetchItems(Map extensionItems) throws MessagingException {
        if (this.items == null) {
            this.items = extensionItems;
        } else {
            this.items.putAll(extensionItems);
        }
    }

    protected Object fetchItem(FetchItem fitem) throws MessagingException {
        Object obj;
        synchronized (getMessageCacheLock()) {
            Object robj = null;
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    checkExpunged();
                    int seqnum = getSequenceNumber();
                    Response[] r = p.fetch(seqnum, fitem.getName());
                    for (int i = 0; i < r.length; i++) {
                        if (r[i] != null && (r[i] instanceof FetchResponse) && ((FetchResponse) r[i]).getNumber() == seqnum) {
                            FetchResponse f = (FetchResponse) r[i];
                            Object o = f.getExtensionItems().get(fitem.getName());
                            if (o != null) {
                                robj = o;
                            }
                        }
                    }
                    p.notifyResponseHandlers(r);
                    p.handleResult(r[r.length - 1]);
                    obj = robj;
                } catch (ConnectionException cex) {
                    throw new FolderClosedException(this.folder, cex.getMessage());
                }
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        return obj;
    }

    public synchronized Object getItem(FetchItem fitem) throws MessagingException {
        Object item = this.items == null ? null : this.items.get(fitem.getName());
        if (item == null) {
            item = fetchItem(fitem);
        }
        return item;
    }

    private synchronized void loadEnvelope() throws MessagingException {
        if (this.envelope != null) {
            return;
        }
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                int seqnum = getSequenceNumber();
                Response[] r = p.fetch(seqnum, EnvelopeCmd);
                for (int i = 0; i < r.length; i++) {
                    if (r[i] != null && (r[i] instanceof FetchResponse) && ((FetchResponse) r[i]).getNumber() == seqnum) {
                        FetchResponse f = (FetchResponse) r[i];
                        int count = f.getItemCount();
                        for (int j = 0; j < count; j++) {
                            Item item = f.getItem(j);
                            if (item instanceof ENVELOPE) {
                                this.envelope = (ENVELOPE) item;
                            } else if (item instanceof INTERNALDATE) {
                                this.receivedDate = ((INTERNALDATE) item).getDate();
                            } else if (item instanceof RFC822SIZE) {
                                this.size = ((RFC822SIZE) item).size;
                            }
                        }
                    }
                }
                p.notifyResponseHandlers(r);
                p.handleResult(r[r.length - 1]);
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
        if (this.envelope == null) {
            throw new MessagingException("Failed to load IMAP envelope");
        }
    }

    private synchronized void loadBODYSTRUCTURE() throws MessagingException {
        if (this.bs != null) {
            return;
        }
        synchronized (getMessageCacheLock()) {
            try {
                IMAPProtocol p = getProtocol();
                checkExpunged();
                this.bs = p.fetchBodyStructure(getSequenceNumber());
                if (this.bs == null) {
                    forceCheckExpunged();
                    throw new MessagingException("Unable to load BODYSTRUCTURE");
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            } catch (ProtocolException pex) {
                forceCheckExpunged();
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    private synchronized void loadHeaders() throws MessagingException {
        if (this.headersLoaded) {
            return;
        }
        InputStream is = null;
        synchronized (getMessageCacheLock()) {
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    checkExpunged();
                    if (p.isREV1()) {
                        BODY b = p.peekBody(getSequenceNumber(), toSection("HEADER"));
                        if (b != null) {
                            is = b.getByteArrayInputStream();
                        }
                    } else {
                        RFC822DATA rd = p.fetchRFC822(getSequenceNumber(), "HEADER");
                        if (rd != null) {
                            is = rd.getByteArrayInputStream();
                        }
                    }
                } catch (ProtocolException pex) {
                    forceCheckExpunged();
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            }
        }
        if (is == null) {
            throw new MessagingException("Cannot load header");
        }
        this.headers = new InternetHeaders(is);
        this.headersLoaded = true;
    }

    private synchronized void loadFlags() throws MessagingException {
        if (this.flags != null) {
            return;
        }
        synchronized (getMessageCacheLock()) {
            try {
                try {
                    IMAPProtocol p = getProtocol();
                    checkExpunged();
                    this.flags = p.fetchFlags(getSequenceNumber());
                    if (this.flags == null) {
                        this.flags = new Flags();
                    }
                } catch (ProtocolException pex) {
                    forceCheckExpunged();
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.folder, cex.getMessage());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean areHeadersLoaded() {
        return this.headersLoaded;
    }

    private void setHeadersLoaded(boolean loaded) {
        this.headersLoaded = loaded;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isHeaderLoaded(String name) {
        if (this.headersLoaded) {
            return true;
        }
        return this.loadedHeaders.containsKey(name.toUpperCase(Locale.ENGLISH));
    }

    private void setHeaderLoaded(String name) {
        this.loadedHeaders.put(name.toUpperCase(Locale.ENGLISH), name);
    }

    private String toSection(String what) {
        if (this.sectionId == null) {
            return what;
        }
        return this.sectionId + "." + what;
    }

    private InternetAddress[] aaclone(InternetAddress[] aa) {
        if (aa == null) {
            return null;
        }
        return (InternetAddress[]) aa.clone();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Flags _getFlags() {
        return this.flags;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ENVELOPE _getEnvelope() {
        return this.envelope;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public BODYSTRUCTURE _getBodyStructure() {
        return this.bs;
    }

    void _setFlags(Flags flags) {
        this.flags = flags;
    }

    Session _getSession() {
        return this.session;
    }
}
