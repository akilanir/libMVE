package korex.mail.internet;

import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.FolderClosedIOException;
import com.sun.mail.util.LineOutputStream;
import com.sun.mail.util.MessageRemovedIOException;
import com.sun.mail.util.MimeUtil;
import com.sun.mail.util.PropUtil;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectStreamException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Vector;
import korex.activation.DataHandler;
import korex.mail.Address;
import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.FolderClosedException;
import korex.mail.Message;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.Session;
import korex.mail.internet.MimeBodyPart;
import korex.mail.util.SharedByteArrayInputStream;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeMessage.class */
public class MimeMessage extends Message implements MimePart {
    protected DataHandler dh;
    protected byte[] content;
    protected InputStream contentStream;
    protected InternetHeaders headers;
    protected Flags flags;
    protected boolean modified;
    protected boolean saved;
    protected Object cachedContent;
    private boolean strict;
    private static final MailDateFormat mailDateFormat = new MailDateFormat();
    private static final Flags answeredFlag = new Flags(Flags.Flag.ANSWERED);

    public MimeMessage(Session session) {
        super(session);
        this.modified = false;
        this.saved = false;
        this.strict = true;
        this.modified = true;
        this.headers = new InternetHeaders();
        this.flags = new Flags();
        initStrict();
    }

    public MimeMessage(Session session, InputStream is) throws MessagingException {
        super(session);
        this.modified = false;
        this.saved = false;
        this.strict = true;
        this.flags = new Flags();
        initStrict();
        parse(is);
        this.saved = true;
    }

    public MimeMessage(MimeMessage source) throws MessagingException {
        ByteArrayOutputStream bos;
        super(source.session);
        this.modified = false;
        this.saved = false;
        this.strict = true;
        this.flags = source.getFlags();
        if (this.flags == null) {
            this.flags = new Flags();
        }
        int size = source.getSize();
        if (size > 0) {
            bos = new ByteArrayOutputStream(size);
        } else {
            bos = new ByteArrayOutputStream();
        }
        try {
            this.strict = source.strict;
            source.writeTo(bos);
            bos.close();
            SharedByteArrayInputStream bis = new SharedByteArrayInputStream(bos.toByteArray());
            parse(bis);
            bis.close();
            this.saved = true;
        } catch (IOException ex) {
            throw new MessagingException("IOException while copying message", ex);
        }
    }

    protected MimeMessage(Folder folder, int msgnum) {
        super(folder, msgnum);
        this.modified = false;
        this.saved = false;
        this.strict = true;
        this.flags = new Flags();
        this.saved = true;
        initStrict();
    }

    protected MimeMessage(Folder folder, InputStream is, int msgnum) throws MessagingException {
        this(folder, msgnum);
        initStrict();
        parse(is);
    }

    protected MimeMessage(Folder folder, InternetHeaders headers, byte[] content, int msgnum) throws MessagingException {
        this(folder, msgnum);
        this.headers = headers;
        this.content = content;
        initStrict();
    }

    private void initStrict() {
        if (this.session != null) {
            this.strict = PropUtil.getBooleanSessionProperty(this.session, "mail.mime.address.strict", true);
        }
    }

    protected void parse(InputStream is) throws MessagingException {
        if (!(is instanceof ByteArrayInputStream) && !(is instanceof BufferedInputStream) && !(is instanceof SharedInputStream)) {
            is = new BufferedInputStream(is);
        }
        this.headers = createInternetHeaders(is);
        if (is instanceof SharedInputStream) {
            SharedInputStream sis = (SharedInputStream) is;
            this.contentStream = sis.newStream(sis.getPosition(), -1L);
        } else {
            try {
                this.content = ASCIIUtility.getBytes(is);
            } catch (IOException ioex) {
                throw new MessagingException("IOException", ioex);
            }
        }
        this.modified = false;
    }

    @Override // korex.mail.Message
    public Address[] getFrom() throws MessagingException {
        Address[] a = getAddressHeader("From");
        if (a == null) {
            a = getAddressHeader("Sender");
        }
        return a;
    }

    @Override // korex.mail.Message
    public void setFrom(Address address) throws MessagingException {
        if (address == null) {
            removeHeader("From");
        } else {
            setHeader("From", address.toString());
        }
    }

    public void setFrom(String address) throws MessagingException {
        if (address == null) {
            removeHeader("From");
        } else {
            setAddressHeader("From", InternetAddress.parse(address));
        }
    }

    @Override // korex.mail.Message
    public void setFrom() throws MessagingException {
        try {
            InternetAddress me = InternetAddress._getLocalAddress(this.session);
            if (me != null) {
                setFrom(me);
                return;
            }
            throw new MessagingException("No From address");
        } catch (Exception ex) {
            throw new MessagingException("No From address", ex);
        }
    }

    @Override // korex.mail.Message
    public void addFrom(Address[] addresses) throws MessagingException {
        addAddressHeader("From", addresses);
    }

    public Address getSender() throws MessagingException {
        Address[] a = getAddressHeader("Sender");
        if (a == null || a.length == 0) {
            return null;
        }
        return a[0];
    }

    public void setSender(Address address) throws MessagingException {
        if (address == null) {
            removeHeader("Sender");
        } else {
            setHeader("Sender", address.toString());
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeMessage$RecipientType.class */
    public static class RecipientType extends Message.RecipientType {
        private static final long serialVersionUID = -5468290701714395543L;
        public static final RecipientType NEWSGROUPS = new RecipientType("Newsgroups");

        protected RecipientType(String type) {
            super(type);
        }

        @Override // korex.mail.Message.RecipientType
        protected Object readResolve() throws ObjectStreamException {
            if (this.type.equals("Newsgroups")) {
                return NEWSGROUPS;
            }
            return super.readResolve();
        }
    }

    @Override // korex.mail.Message
    public Address[] getRecipients(Message.RecipientType type) throws MessagingException {
        if (type == RecipientType.NEWSGROUPS) {
            String s = getHeader("Newsgroups", ",");
            if (s == null) {
                return null;
            }
            return NewsAddress.parse(s);
        }
        return getAddressHeader(getHeaderName(type));
    }

    @Override // korex.mail.Message
    public Address[] getAllRecipients() throws MessagingException {
        Address[] all = super.getAllRecipients();
        Address[] ng = getRecipients(RecipientType.NEWSGROUPS);
        if (ng == null) {
            return all;
        }
        if (all == null) {
            return ng;
        }
        Address[] addresses = new Address[all.length + ng.length];
        System.arraycopy(all, 0, addresses, 0, all.length);
        System.arraycopy(ng, 0, addresses, all.length, ng.length);
        return addresses;
    }

    @Override // korex.mail.Message
    public void setRecipients(Message.RecipientType type, Address[] addresses) throws MessagingException {
        if (type == RecipientType.NEWSGROUPS) {
            if (addresses == null || addresses.length == 0) {
                removeHeader("Newsgroups");
                return;
            } else {
                setHeader("Newsgroups", NewsAddress.toString(addresses));
                return;
            }
        }
        setAddressHeader(getHeaderName(type), addresses);
    }

    public void setRecipients(Message.RecipientType type, String addresses) throws MessagingException {
        if (type == RecipientType.NEWSGROUPS) {
            if (addresses == null || addresses.length() == 0) {
                removeHeader("Newsgroups");
                return;
            } else {
                setHeader("Newsgroups", addresses);
                return;
            }
        }
        setAddressHeader(getHeaderName(type), addresses == null ? null : InternetAddress.parse(addresses));
    }

    @Override // korex.mail.Message
    public void addRecipients(Message.RecipientType type, Address[] addresses) throws MessagingException {
        if (type == RecipientType.NEWSGROUPS) {
            String s = NewsAddress.toString(addresses);
            if (s != null) {
                addHeader("Newsgroups", s);
                return;
            }
            return;
        }
        addAddressHeader(getHeaderName(type), addresses);
    }

    public void addRecipients(Message.RecipientType type, String addresses) throws MessagingException {
        if (type == RecipientType.NEWSGROUPS) {
            if (addresses != null && addresses.length() != 0) {
                addHeader("Newsgroups", addresses);
                return;
            }
            return;
        }
        addAddressHeader(getHeaderName(type), InternetAddress.parse(addresses));
    }

    @Override // korex.mail.Message
    public Address[] getReplyTo() throws MessagingException {
        Address[] a = getAddressHeader("Reply-To");
        if (a == null || a.length == 0) {
            a = getFrom();
        }
        return a;
    }

    @Override // korex.mail.Message
    public void setReplyTo(Address[] addresses) throws MessagingException {
        setAddressHeader("Reply-To", addresses);
    }

    private Address[] getAddressHeader(String name) throws MessagingException {
        String s = getHeader(name, ",");
        if (s == null) {
            return null;
        }
        return InternetAddress.parseHeader(s, this.strict);
    }

    private void setAddressHeader(String name, Address[] addresses) throws MessagingException {
        String s = InternetAddress.toString(addresses, name.length() + 2);
        if (s == null) {
            removeHeader(name);
        } else {
            setHeader(name, s);
        }
    }

    private void addAddressHeader(String name, Address[] addresses) throws MessagingException {
        Address[] anew;
        if (addresses == null || addresses.length == 0) {
            return;
        }
        Address[] a = getAddressHeader(name);
        if (a == null || a.length == 0) {
            anew = addresses;
        } else {
            anew = new Address[a.length + addresses.length];
            System.arraycopy(a, 0, anew, 0, a.length);
            System.arraycopy(addresses, 0, anew, a.length, addresses.length);
        }
        String s = InternetAddress.toString(anew, name.length() + 2);
        if (s == null) {
            return;
        }
        setHeader(name, s);
    }

    @Override // korex.mail.Message
    public String getSubject() throws MessagingException {
        String rawvalue = getHeader("Subject", null);
        if (rawvalue == null) {
            return null;
        }
        try {
            return MimeUtility.decodeText(MimeUtility.unfold(rawvalue));
        } catch (UnsupportedEncodingException e) {
            return rawvalue;
        }
    }

    @Override // korex.mail.Message
    public void setSubject(String subject) throws MessagingException {
        setSubject(subject, null);
    }

    public void setSubject(String subject, String charset) throws MessagingException {
        if (subject == null) {
            removeHeader("Subject");
            return;
        }
        try {
            setHeader("Subject", MimeUtility.fold(9, MimeUtility.encodeText(subject, charset, null)));
        } catch (UnsupportedEncodingException uex) {
            throw new MessagingException("Encoding error", uex);
        }
    }

    @Override // korex.mail.Message
    public Date getSentDate() throws MessagingException {
        Date parse;
        String s = getHeader("Date", null);
        if (s != null) {
            try {
                synchronized (mailDateFormat) {
                    parse = mailDateFormat.parse(s);
                }
                return parse;
            } catch (java.text.ParseException e) {
                return null;
            }
        }
        return null;
    }

    @Override // korex.mail.Message
    public void setSentDate(Date d) throws MessagingException {
        if (d == null) {
            removeHeader("Date");
            return;
        }
        synchronized (mailDateFormat) {
            setHeader("Date", mailDateFormat.format(d));
        }
    }

    @Override // korex.mail.Message
    public Date getReceivedDate() throws MessagingException {
        return null;
    }

    @Override // korex.mail.Part
    public int getSize() throws MessagingException {
        if (this.content != null) {
            return this.content.length;
        }
        if (this.contentStream != null) {
            try {
                int size = this.contentStream.available();
                if (size > 0) {
                    return size;
                }
                return -1;
            } catch (IOException e) {
                return -1;
            }
        }
        return -1;
    }

    @Override // korex.mail.Part
    public int getLineCount() throws MessagingException {
        return -1;
    }

    @Override // korex.mail.Part
    public String getContentType() throws MessagingException {
        String s = MimeUtil.cleanContentType(this, getHeader("Content-Type", null));
        if (s == null) {
            return "text/plain";
        }
        return s;
    }

    @Override // korex.mail.Part
    public boolean isMimeType(String mimeType) throws MessagingException {
        return MimeBodyPart.isMimeType(this, mimeType);
    }

    @Override // korex.mail.Part
    public String getDisposition() throws MessagingException {
        return MimeBodyPart.getDisposition(this);
    }

    @Override // korex.mail.Part
    public void setDisposition(String disposition) throws MessagingException {
        MimeBodyPart.setDisposition(this, disposition);
    }

    public String getEncoding() throws MessagingException {
        return MimeBodyPart.getEncoding(this);
    }

    public String getContentID() throws MessagingException {
        return getHeader("Content-Id", null);
    }

    public void setContentID(String cid) throws MessagingException {
        if (cid == null) {
            removeHeader("Content-ID");
        } else {
            setHeader("Content-ID", cid);
        }
    }

    public String getContentMD5() throws MessagingException {
        return getHeader("Content-MD5", null);
    }

    public void setContentMD5(String md5) throws MessagingException {
        setHeader("Content-MD5", md5);
    }

    @Override // korex.mail.Part
    public String getDescription() throws MessagingException {
        return MimeBodyPart.getDescription(this);
    }

    @Override // korex.mail.Part
    public void setDescription(String description) throws MessagingException {
        setDescription(description, null);
    }

    public void setDescription(String description, String charset) throws MessagingException {
        MimeBodyPart.setDescription(this, description, charset);
    }

    public String[] getContentLanguage() throws MessagingException {
        return MimeBodyPart.getContentLanguage(this);
    }

    public void setContentLanguage(String[] languages) throws MessagingException {
        MimeBodyPart.setContentLanguage(this, languages);
    }

    public String getMessageID() throws MessagingException {
        return getHeader("Message-ID", null);
    }

    @Override // korex.mail.Part
    public String getFileName() throws MessagingException {
        return MimeBodyPart.getFileName(this);
    }

    @Override // korex.mail.Part
    public void setFileName(String filename) throws MessagingException {
        MimeBodyPart.setFileName(this, filename);
    }

    private String getHeaderName(Message.RecipientType type) throws MessagingException {
        String headerName;
        if (type == Message.RecipientType.TO) {
            headerName = "To";
        } else if (type == Message.RecipientType.CC) {
            headerName = "Cc";
        } else if (type == Message.RecipientType.BCC) {
            headerName = "Bcc";
        } else if (type == RecipientType.NEWSGROUPS) {
            headerName = "Newsgroups";
        } else {
            throw new MessagingException("Invalid Recipient Type");
        }
        return headerName;
    }

    @Override // korex.mail.Part
    public InputStream getInputStream() throws IOException, MessagingException {
        return getDataHandler().getInputStream();
    }

    protected InputStream getContentStream() throws MessagingException {
        if (this.contentStream != null) {
            return ((SharedInputStream) this.contentStream).newStream(0L, -1L);
        }
        if (this.content != null) {
            return new SharedByteArrayInputStream(this.content);
        }
        throw new MessagingException("No MimeMessage content");
    }

    public InputStream getRawInputStream() throws MessagingException {
        return getContentStream();
    }

    @Override // korex.mail.Part
    public synchronized DataHandler getDataHandler() throws MessagingException {
        if (this.dh == null) {
            this.dh = new MimeBodyPart.MimePartDataHandler(this);
        }
        return this.dh;
    }

    @Override // korex.mail.Part
    public Object getContent() throws IOException, MessagingException {
        if (this.cachedContent != null) {
            return this.cachedContent;
        }
        try {
            Object c = getDataHandler().getContent();
            if (MimeBodyPart.cacheMultipart && (((c instanceof Multipart) || (c instanceof Message)) && (this.content != null || this.contentStream != null))) {
                this.cachedContent = c;
                if (c instanceof MimeMultipart) {
                    ((MimeMultipart) c).parse();
                }
            }
            return c;
        } catch (FolderClosedIOException fex) {
            throw new FolderClosedException(fex.getFolder(), fex.getMessage());
        } catch (MessageRemovedIOException mex) {
            throw new MessageRemovedException(mex.getMessage());
        }
    }

    @Override // korex.mail.Part
    public synchronized void setDataHandler(DataHandler dh) throws MessagingException {
        this.dh = dh;
        this.cachedContent = null;
        MimeBodyPart.invalidateContentHeaders(this);
    }

    @Override // korex.mail.Part
    public void setContent(Object o, String type) throws MessagingException {
        if (o instanceof Multipart) {
            setContent((Multipart) o);
        } else {
            setDataHandler(new DataHandler(o, type));
        }
    }

    @Override // korex.mail.Part, korex.mail.internet.MimePart
    public void setText(String text) throws MessagingException {
        setText(text, null);
    }

    @Override // korex.mail.internet.MimePart
    public void setText(String text, String charset) throws MessagingException {
        MimeBodyPart.setText(this, text, charset, "plain");
    }

    @Override // korex.mail.internet.MimePart
    public void setText(String text, String charset, String subtype) throws MessagingException {
        MimeBodyPart.setText(this, text, charset, subtype);
    }

    @Override // korex.mail.Part
    public void setContent(Multipart mp) throws MessagingException {
        setDataHandler(new DataHandler(mp, mp.getContentType()));
        mp.setParent(this);
    }

    @Override // korex.mail.Message
    public Message reply(boolean replyToAll) throws MessagingException {
        return reply(replyToAll, true);
    }

    public Message reply(boolean replyToAll, boolean setAnswered) throws MessagingException {
        MimeMessage reply = createMimeMessage(this.session);
        String subject = getHeader("Subject", null);
        if (subject != null) {
            if (!subject.regionMatches(true, 0, "Re: ", 0, 4)) {
                subject = "Re: " + subject;
            }
            reply.setHeader("Subject", subject);
        }
        Address[] a = getReplyTo();
        reply.setRecipients(Message.RecipientType.TO, a);
        if (replyToAll) {
            Vector v = new Vector();
            InternetAddress me = InternetAddress.getLocalAddress(this.session);
            if (me != null) {
                v.addElement(me);
            }
            String alternates = null;
            if (this.session != null) {
                alternates = this.session.getProperty("mail.alternates");
            }
            if (alternates != null) {
                eliminateDuplicates(v, InternetAddress.parse(alternates, false));
            }
            boolean replyallcc = false;
            if (this.session != null) {
                replyallcc = PropUtil.getBooleanSessionProperty(this.session, "mail.replyallcc", false);
            }
            eliminateDuplicates(v, a);
            Address[] a2 = eliminateDuplicates(v, getRecipients(Message.RecipientType.TO));
            if (a2 != null && a2.length > 0) {
                if (replyallcc) {
                    reply.addRecipients(Message.RecipientType.CC, a2);
                } else {
                    reply.addRecipients(Message.RecipientType.TO, a2);
                }
            }
            Address[] a3 = eliminateDuplicates(v, getRecipients(Message.RecipientType.CC));
            if (a3 != null && a3.length > 0) {
                reply.addRecipients(Message.RecipientType.CC, a3);
            }
            Address[] a4 = getRecipients(RecipientType.NEWSGROUPS);
            if (a4 != null && a4.length > 0) {
                reply.setRecipients(RecipientType.NEWSGROUPS, a4);
            }
        }
        String msgId = getHeader("Message-Id", null);
        if (msgId != null) {
            reply.setHeader("In-Reply-To", msgId);
        }
        String refs = getHeader("References", " ");
        if (refs == null) {
            refs = getHeader("In-Reply-To", " ");
        }
        if (msgId != null) {
            if (refs != null) {
                refs = MimeUtility.unfold(refs) + " " + msgId;
            } else {
                refs = msgId;
            }
        }
        if (refs != null) {
            reply.setHeader("References", MimeUtility.fold(12, refs));
        }
        if (setAnswered) {
            try {
                setFlags(answeredFlag, true);
            } catch (MessagingException e) {
            }
        }
        return reply;
    }

    private Address[] eliminateDuplicates(Vector v, Address[] addrs) {
        Address[] a;
        if (addrs == null) {
            return null;
        }
        int gone = 0;
        for (int i = 0; i < addrs.length; i++) {
            boolean found = false;
            int j = 0;
            while (true) {
                if (j >= v.size()) {
                    break;
                }
                if (!((InternetAddress) v.elementAt(j)).equals(addrs[i])) {
                    j++;
                } else {
                    found = true;
                    gone++;
                    addrs[i] = null;
                    break;
                }
            }
            if (!found) {
                v.addElement(addrs[i]);
            }
        }
        if (gone != 0) {
            if (addrs instanceof InternetAddress[]) {
                a = new InternetAddress[addrs.length - gone];
            } else {
                a = new Address[addrs.length - gone];
            }
            int j2 = 0;
            for (int i2 = 0; i2 < addrs.length; i2++) {
                if (addrs[i2] != null) {
                    int i3 = j2;
                    j2++;
                    a[i3] = addrs[i2];
                }
            }
            addrs = a;
        }
        return addrs;
    }

    @Override // korex.mail.Part
    public void writeTo(OutputStream os) throws IOException, MessagingException {
        writeTo(os, null);
    }

    public void writeTo(OutputStream os, String[] ignoreList) throws IOException, MessagingException {
        if (!this.saved) {
            saveChanges();
        }
        if (this.modified) {
            MimeBodyPart.writeTo(this, os, ignoreList);
            return;
        }
        Enumeration hdrLines = getNonMatchingHeaderLines(ignoreList);
        LineOutputStream los = new LineOutputStream(os);
        while (hdrLines.hasMoreElements()) {
            los.writeln((String) hdrLines.nextElement());
        }
        los.writeln();
        if (this.content == null) {
            InputStream is = null;
            byte[] buf = new byte[8192];
            try {
                is = getContentStream();
                while (true) {
                    int len = is.read(buf);
                    if (len <= 0) {
                        break;
                    } else {
                        os.write(buf, 0, len);
                    }
                }
                if (is != null) {
                    is.close();
                }
            } catch (Throwable th) {
                if (is != null) {
                    is.close();
                }
                throw th;
            }
        } else {
            os.write(this.content);
        }
        os.flush();
    }

    @Override // korex.mail.Part
    public String[] getHeader(String name) throws MessagingException {
        return this.headers.getHeader(name);
    }

    public String getHeader(String name, String delimiter) throws MessagingException {
        return this.headers.getHeader(name, delimiter);
    }

    @Override // korex.mail.Part
    public void setHeader(String name, String value) throws MessagingException {
        this.headers.setHeader(name, value);
    }

    @Override // korex.mail.Part
    public void addHeader(String name, String value) throws MessagingException {
        this.headers.addHeader(name, value);
    }

    @Override // korex.mail.Part
    public void removeHeader(String name) throws MessagingException {
        this.headers.removeHeader(name);
    }

    @Override // korex.mail.Part
    public Enumeration getAllHeaders() throws MessagingException {
        return this.headers.getAllHeaders();
    }

    @Override // korex.mail.Part
    public Enumeration getMatchingHeaders(String[] names) throws MessagingException {
        return this.headers.getMatchingHeaders(names);
    }

    @Override // korex.mail.Part
    public Enumeration getNonMatchingHeaders(String[] names) throws MessagingException {
        return this.headers.getNonMatchingHeaders(names);
    }

    public void addHeaderLine(String line) throws MessagingException {
        this.headers.addHeaderLine(line);
    }

    public Enumeration getAllHeaderLines() throws MessagingException {
        return this.headers.getAllHeaderLines();
    }

    public Enumeration getMatchingHeaderLines(String[] names) throws MessagingException {
        return this.headers.getMatchingHeaderLines(names);
    }

    public Enumeration getNonMatchingHeaderLines(String[] names) throws MessagingException {
        return this.headers.getNonMatchingHeaderLines(names);
    }

    @Override // korex.mail.Message
    public synchronized Flags getFlags() throws MessagingException {
        return (Flags) this.flags.clone();
    }

    @Override // korex.mail.Message
    public synchronized boolean isSet(Flags.Flag flag) throws MessagingException {
        return this.flags.contains(flag);
    }

    @Override // korex.mail.Message
    public synchronized void setFlags(Flags flag, boolean set) throws MessagingException {
        if (set) {
            this.flags.add(flag);
        } else {
            this.flags.remove(flag);
        }
    }

    @Override // korex.mail.Message
    public void saveChanges() throws MessagingException {
        this.modified = true;
        this.saved = true;
        updateHeaders();
    }

    protected void updateMessageID() throws MessagingException {
        setHeader("Message-ID", "<" + UniqueValue.getUniqueMessageIDValue(this.session) + ">");
    }

    protected synchronized void updateHeaders() throws MessagingException {
        MimeBodyPart.updateHeaders(this);
        setHeader("MIME-Version", "1.0");
        updateMessageID();
        if (this.cachedContent != null) {
            this.dh = new DataHandler(this.cachedContent, getContentType());
            this.cachedContent = null;
            this.content = null;
            if (this.contentStream != null) {
                try {
                    this.contentStream.close();
                } catch (IOException e) {
                }
            }
            this.contentStream = null;
        }
    }

    protected InternetHeaders createInternetHeaders(InputStream is) throws MessagingException {
        return new InternetHeaders(is);
    }

    protected MimeMessage createMimeMessage(Session session) throws MessagingException {
        return new MimeMessage(session);
    }
}
