package com.sun.mail.imap;

import com.sun.mail.iap.ConnectionException;
import com.sun.mail.iap.ProtocolException;
import com.sun.mail.imap.protocol.BODY;
import com.sun.mail.imap.protocol.BODYSTRUCTURE;
import com.sun.mail.imap.protocol.IMAPProtocol;
import com.sun.mail.util.LineOutputStream;
import com.sun.mail.util.PropUtil;
import com.sun.mail.util.ReadableMime;
import com.sun.mail.util.SharedByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import korex.activation.DataHandler;
import korex.mail.FolderClosedException;
import korex.mail.IllegalWriteException;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.internet.ContentType;
import korex.mail.internet.InternetHeaders;
import korex.mail.internet.MimeBodyPart;
import korex.mail.internet.MimeUtility;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPBodyPart.class */
public class IMAPBodyPart extends MimeBodyPart implements ReadableMime {
    private IMAPMessage message;
    private BODYSTRUCTURE bs;
    private String sectionId;
    private String type;
    private String description;
    private boolean headersLoaded = false;
    private static final boolean decodeFileName = PropUtil.getBooleanSystemProperty("mail.mime.decodefilename", false);

    protected IMAPBodyPart(BODYSTRUCTURE bs, String sid, IMAPMessage message) {
        this.bs = bs;
        this.sectionId = sid;
        this.message = message;
        ContentType ct = new ContentType(bs.type, bs.subtype, bs.cParams);
        this.type = ct.toString();
    }

    @Override // korex.mail.internet.MimeBodyPart
    protected void updateHeaders() {
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public int getSize() throws MessagingException {
        return this.bs.size;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public int getLineCount() throws MessagingException {
        return this.bs.lines;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public String getContentType() throws MessagingException {
        return this.type;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public String getDisposition() throws MessagingException {
        return this.bs.disposition;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setDisposition(String disposition) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public String getEncoding() throws MessagingException {
        return this.bs.encoding;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public String getContentID() throws MessagingException {
        return this.bs.id;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public String getContentMD5() throws MessagingException {
        return this.bs.md5;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public void setContentMD5(String md5) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public String getDescription() throws MessagingException {
        if (this.description != null) {
            return this.description;
        }
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

    @Override // korex.mail.internet.MimeBodyPart
    public void setDescription(String description, String charset) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public String getFileName() throws MessagingException {
        String filename = null;
        if (this.bs.dParams != null) {
            filename = this.bs.dParams.get("filename");
        }
        if (filename == null && this.bs.cParams != null) {
            filename = this.bs.cParams.get(IMAPStore.ID_NAME);
        }
        if (decodeFileName && filename != null) {
            try {
                filename = MimeUtility.decodeText(filename);
            } catch (UnsupportedEncodingException ex) {
                throw new MessagingException("Can't decode filename", ex);
            }
        }
        return filename;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setFileName(String filename) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart
    protected InputStream getContentStream() throws MessagingException {
        BODY b;
        InputStream is = null;
        boolean pk = this.message.getPeek();
        synchronized (this.message.getMessageCacheLock()) {
            try {
                IMAPProtocol p = this.message.getProtocol();
                this.message.checkExpunged();
                if (p.isREV1() && this.message.getFetchBlockSize() != -1) {
                    return new IMAPInputStream(this.message, this.sectionId, this.message.ignoreBodyStructureSize() ? -1 : this.bs.size, pk);
                }
                int seqnum = this.message.getSequenceNumber();
                if (pk) {
                    b = p.peekBody(seqnum, this.sectionId);
                } else {
                    b = p.fetchBody(seqnum, this.sectionId);
                }
                if (b != null) {
                    is = b.getByteArrayInputStream();
                }
                if (is == null) {
                    throw new MessagingException("No content");
                }
                return is;
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.message.getFolder(), cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    private InputStream getHeaderStream() throws MessagingException {
        if (!this.message.isREV1()) {
            loadHeaders();
        }
        synchronized (this.message.getMessageCacheLock()) {
            try {
                IMAPProtocol p = this.message.getProtocol();
                this.message.checkExpunged();
                if (p.isREV1()) {
                    int seqnum = this.message.getSequenceNumber();
                    BODY b = p.peekBody(seqnum, this.sectionId + ".MIME");
                    if (b == null) {
                        throw new MessagingException("Failed to fetch headers");
                    }
                    ByteArrayInputStream bis = b.getByteArrayInputStream();
                    if (bis == null) {
                        throw new MessagingException("Failed to fetch headers");
                    }
                    return bis;
                }
                SharedByteArrayOutputStream bos = new SharedByteArrayOutputStream(0);
                LineOutputStream los = new LineOutputStream(bos);
                try {
                    Enumeration hdrLines = super.getAllHeaderLines();
                    while (hdrLines.hasMoreElements()) {
                        los.writeln((String) hdrLines.nextElement());
                    }
                    los.writeln();
                    try {
                        los.close();
                    } catch (IOException e) {
                    }
                } catch (IOException e2) {
                    try {
                        los.close();
                    } catch (IOException e3) {
                    }
                } catch (Throwable th) {
                    try {
                        los.close();
                    } catch (IOException e4) {
                    }
                    throw th;
                }
                return bos.toStream();
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.message.getFolder(), cex.getMessage());
            } catch (ProtocolException pex) {
                throw new MessagingException(pex.getMessage(), pex);
            }
        }
    }

    @Override // com.sun.mail.util.ReadableMime
    public InputStream getMimeStream() throws MessagingException {
        return new SequenceInputStream(getHeaderStream(), getContentStream());
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public synchronized DataHandler getDataHandler() throws MessagingException {
        if (this.dh == null) {
            if (this.bs.isMulti()) {
                this.dh = new DataHandler(new IMAPMultipartDataSource(this, this.bs.bodies, this.sectionId, this.message));
            } else if (this.bs.isNested() && this.message.isREV1() && this.bs.envelope != null) {
                this.dh = new DataHandler(new IMAPNestedMessage(this.message, this.bs.bodies[0], this.bs.envelope, this.sectionId), this.type);
            }
        }
        return super.getDataHandler();
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setDataHandler(DataHandler content) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setContent(Object o, String type) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setContent(Multipart mp) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public String[] getHeader(String name) throws MessagingException {
        loadHeaders();
        return super.getHeader(name);
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void setHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void addHeader(String name, String value) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void removeHeader(String name) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public Enumeration getAllHeaders() throws MessagingException {
        loadHeaders();
        return super.getAllHeaders();
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public Enumeration getMatchingHeaders(String[] names) throws MessagingException {
        loadHeaders();
        return super.getMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public Enumeration getNonMatchingHeaders(String[] names) throws MessagingException {
        loadHeaders();
        return super.getNonMatchingHeaders(names);
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public void addHeaderLine(String line) throws MessagingException {
        throw new IllegalWriteException("IMAPBodyPart is read-only");
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public Enumeration getAllHeaderLines() throws MessagingException {
        loadHeaders();
        return super.getAllHeaderLines();
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public Enumeration getMatchingHeaderLines(String[] names) throws MessagingException {
        loadHeaders();
        return super.getMatchingHeaderLines(names);
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public Enumeration getNonMatchingHeaderLines(String[] names) throws MessagingException {
        loadHeaders();
        return super.getNonMatchingHeaderLines(names);
    }

    private synchronized void loadHeaders() throws MessagingException {
        if (this.headersLoaded) {
            return;
        }
        if (this.headers == null) {
            this.headers = new InternetHeaders();
        }
        synchronized (this.message.getMessageCacheLock()) {
            try {
                try {
                    IMAPProtocol p = this.message.getProtocol();
                    this.message.checkExpunged();
                    if (p.isREV1()) {
                        int seqnum = this.message.getSequenceNumber();
                        BODY b = p.peekBody(seqnum, this.sectionId + ".MIME");
                        if (b == null) {
                            throw new MessagingException("Failed to fetch headers");
                        }
                        ByteArrayInputStream bis = b.getByteArrayInputStream();
                        if (bis == null) {
                            throw new MessagingException("Failed to fetch headers");
                        }
                        this.headers.load(bis);
                    } else {
                        this.headers.addHeader("Content-Type", this.type);
                        this.headers.addHeader("Content-Transfer-Encoding", this.bs.encoding);
                        if (this.bs.description != null) {
                            this.headers.addHeader("Content-Description", this.bs.description);
                        }
                        if (this.bs.id != null) {
                            this.headers.addHeader("Content-ID", this.bs.id);
                        }
                        if (this.bs.md5 != null) {
                            this.headers.addHeader("Content-MD5", this.bs.md5);
                        }
                    }
                } catch (ProtocolException pex) {
                    throw new MessagingException(pex.getMessage(), pex);
                }
            } catch (ConnectionException cex) {
                throw new FolderClosedException(this.message.getFolder(), cex.getMessage());
            }
        }
        this.headersLoaded = true;
    }
}
