package korex.mail.internet;

import com.sun.mail.imap.IMAPStore;
import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.FolderClosedIOException;
import com.sun.mail.util.LineOutputStream;
import com.sun.mail.util.MessageRemovedIOException;
import com.sun.mail.util.MimeUtil;
import com.sun.mail.util.PropUtil;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Vector;
import korex.activation.DataHandler;
import korex.activation.DataSource;
import korex.activation.FileDataSource;
import korex.mail.BodyPart;
import korex.mail.EncodingAware;
import korex.mail.FolderClosedException;
import korex.mail.Message;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.Part;
import korex.mail.internet.HeaderTokenizer;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeBodyPart.class */
public class MimeBodyPart extends BodyPart implements MimePart {
    private static final boolean setDefaultTextCharset = PropUtil.getBooleanSystemProperty("mail.mime.setdefaulttextcharset", true);
    private static final boolean setContentTypeFileName = PropUtil.getBooleanSystemProperty("mail.mime.setcontenttypefilename", true);
    private static final boolean encodeFileName = PropUtil.getBooleanSystemProperty("mail.mime.encodefilename", false);
    private static final boolean decodeFileName = PropUtil.getBooleanSystemProperty("mail.mime.decodefilename", false);
    private static final boolean ignoreMultipartEncoding = PropUtil.getBooleanSystemProperty("mail.mime.ignoremultipartencoding", true);
    static final boolean cacheMultipart = PropUtil.getBooleanSystemProperty("mail.mime.cachemultipart", true);
    protected DataHandler dh;
    protected byte[] content;
    protected InputStream contentStream;
    protected InternetHeaders headers;
    protected Object cachedContent;

    public MimeBodyPart() {
        this.headers = new InternetHeaders();
    }

    public MimeBodyPart(InputStream is) throws MessagingException {
        if (!(is instanceof ByteArrayInputStream) && !(is instanceof BufferedInputStream) && !(is instanceof SharedInputStream)) {
            is = new BufferedInputStream(is);
        }
        this.headers = new InternetHeaders(is);
        if (is instanceof SharedInputStream) {
            SharedInputStream sis = (SharedInputStream) is;
            this.contentStream = sis.newStream(sis.getPosition(), -1L);
        } else {
            try {
                this.content = ASCIIUtility.getBytes(is);
            } catch (IOException ioex) {
                throw new MessagingException("Error reading input stream", ioex);
            }
        }
    }

    public MimeBodyPart(InternetHeaders headers, byte[] content) throws MessagingException {
        this.headers = headers;
        this.content = content;
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
            s = "text/plain";
        }
        return s;
    }

    @Override // korex.mail.Part
    public boolean isMimeType(String mimeType) throws MessagingException {
        return isMimeType(this, mimeType);
    }

    @Override // korex.mail.Part
    public String getDisposition() throws MessagingException {
        return getDisposition(this);
    }

    @Override // korex.mail.Part
    public void setDisposition(String disposition) throws MessagingException {
        setDisposition(this, disposition);
    }

    public String getEncoding() throws MessagingException {
        return getEncoding(this);
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

    @Override // korex.mail.internet.MimePart
    public String[] getContentLanguage() throws MessagingException {
        return getContentLanguage(this);
    }

    @Override // korex.mail.internet.MimePart
    public void setContentLanguage(String[] languages) throws MessagingException {
        setContentLanguage(this, languages);
    }

    @Override // korex.mail.Part
    public String getDescription() throws MessagingException {
        return getDescription(this);
    }

    @Override // korex.mail.Part
    public void setDescription(String description) throws MessagingException {
        setDescription(description, null);
    }

    public void setDescription(String description, String charset) throws MessagingException {
        setDescription(this, description, charset);
    }

    @Override // korex.mail.Part
    public String getFileName() throws MessagingException {
        return getFileName(this);
    }

    @Override // korex.mail.Part
    public void setFileName(String filename) throws MessagingException {
        setFileName(this, filename);
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
            return new ByteArrayInputStream(this.content);
        }
        throw new MessagingException("No MimeBodyPart content");
    }

    public InputStream getRawInputStream() throws MessagingException {
        return getContentStream();
    }

    @Override // korex.mail.Part
    public DataHandler getDataHandler() throws MessagingException {
        if (this.dh == null) {
            this.dh = new MimePartDataHandler(this);
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
            if (cacheMultipart && (((c instanceof Multipart) || (c instanceof Message)) && (this.content != null || this.contentStream != null))) {
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
    public void setDataHandler(DataHandler dh) throws MessagingException {
        this.dh = dh;
        this.cachedContent = null;
        invalidateContentHeaders(this);
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
        setText(this, text, charset, "plain");
    }

    @Override // korex.mail.internet.MimePart
    public void setText(String text, String charset, String subtype) throws MessagingException {
        setText(this, text, charset, subtype);
    }

    @Override // korex.mail.Part
    public void setContent(Multipart mp) throws MessagingException {
        setDataHandler(new DataHandler(mp, mp.getContentType()));
        mp.setParent(this);
    }

    public void attachFile(File file) throws IOException, MessagingException {
        FileDataSource fds = new FileDataSource(file);
        setDataHandler(new DataHandler(fds));
        setFileName(fds.getName());
        setDisposition(Part.ATTACHMENT);
    }

    public void attachFile(String file) throws IOException, MessagingException {
        File f = new File(file);
        attachFile(f);
    }

    public void attachFile(File file, String contentType, String encoding) throws IOException, MessagingException {
        DataSource fds = new EncodedFileDataSource(file, contentType, encoding);
        setDataHandler(new DataHandler(fds));
        setFileName(fds.getName());
        setDisposition(Part.ATTACHMENT);
    }

    public void attachFile(String file, String contentType, String encoding) throws IOException, MessagingException {
        attachFile(new File(file), contentType, encoding);
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeBodyPart$EncodedFileDataSource.class */
    private static class EncodedFileDataSource extends FileDataSource implements EncodingAware {
        private String contentType;
        private String encoding;

        public EncodedFileDataSource(File file, String contentType, String encoding) {
            super(file);
            this.contentType = contentType;
            this.encoding = encoding;
        }

        @Override // korex.activation.FileDataSource, korex.activation.DataSource
        public String getContentType() {
            return this.contentType != null ? this.contentType : super.getContentType();
        }

        @Override // korex.mail.EncodingAware
        public String getEncoding() {
            return this.encoding;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0068 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void saveFile(java.io.File r7) throws java.io.IOException, korex.mail.MessagingException {
        /*
            r6 = this;
            r0 = 0
            r8 = r0
            r0 = 0
            r9 = r0
            java.io.BufferedOutputStream r0 = new java.io.BufferedOutputStream     // Catch: java.lang.Throwable -> L55
            r1 = r0
            java.io.FileOutputStream r2 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L55
            r3 = r2
            r4 = r7
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L55
            r1.<init>(r2)     // Catch: java.lang.Throwable -> L55
            r8 = r0
            r0 = r6
            java.io.InputStream r0 = r0.getInputStream()     // Catch: java.lang.Throwable -> L55
            r9 = r0
            r0 = 8192(0x2000, float:1.14794E-41)
            byte[] r0 = new byte[r0]     // Catch: java.lang.Throwable -> L55
            r10 = r0
        L20:
            r0 = r9
            r1 = r10
            int r0 = r0.read(r1)     // Catch: java.lang.Throwable -> L55
            r1 = r0
            r11 = r1
            if (r0 <= 0) goto L38
            r0 = r8
            r1 = r10
            r2 = 0
            r3 = r11
            r0.write(r1, r2, r3)     // Catch: java.lang.Throwable -> L55
            goto L20
        L38:
            r0 = r9
            if (r0 == 0) goto L40
            r0 = r9
            r0.close()     // Catch: java.io.IOException -> L43
        L40:
            goto L45
        L43:
            r10 = move-exception
        L45:
            r0 = r8
            if (r0 == 0) goto L4d
            r0 = r8
            r0.close()     // Catch: java.io.IOException -> L50
        L4d:
            goto L74
        L50:
            r10 = move-exception
            goto L74
        L55:
            r12 = move-exception
            r0 = r9
            if (r0 == 0) goto L5f
            r0 = r9
            r0.close()     // Catch: java.io.IOException -> L62
        L5f:
            goto L64
        L62:
            r13 = move-exception
        L64:
            r0 = r8
            if (r0 == 0) goto L6c
            r0 = r8
            r0.close()     // Catch: java.io.IOException -> L6f
        L6c:
            goto L71
        L6f:
            r13 = move-exception
        L71:
            r0 = r12
            throw r0
        L74:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.MimeBodyPart.saveFile(java.io.File):void");
    }

    public void saveFile(String file) throws IOException, MessagingException {
        File f = new File(file);
        saveFile(f);
    }

    @Override // korex.mail.Part
    public void writeTo(OutputStream os) throws IOException, MessagingException {
        writeTo(this, os, null);
    }

    @Override // korex.mail.Part
    public String[] getHeader(String name) throws MessagingException {
        return this.headers.getHeader(name);
    }

    @Override // korex.mail.internet.MimePart
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

    protected void updateHeaders() throws MessagingException {
        updateHeaders(this);
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

    static boolean isMimeType(MimePart part, String mimeType) throws MessagingException {
        try {
            ContentType ct = new ContentType(part.getContentType());
            return ct.match(mimeType);
        } catch (ParseException e) {
            return part.getContentType().equalsIgnoreCase(mimeType);
        }
    }

    static void setText(MimePart part, String text, String charset, String subtype) throws MessagingException {
        if (charset == null) {
            if (MimeUtility.checkAscii(text) != 1) {
                charset = MimeUtility.getDefaultMIMECharset();
            } else {
                charset = "us-ascii";
            }
        }
        part.setContent(text, "text/" + subtype + "; charset=" + MimeUtility.quote(charset, HeaderTokenizer.MIME));
    }

    static String getDisposition(MimePart part) throws MessagingException {
        String s = part.getHeader("Content-Disposition", null);
        if (s == null) {
            return null;
        }
        ContentDisposition cd = new ContentDisposition(s);
        return cd.getDisposition();
    }

    static void setDisposition(MimePart part, String disposition) throws MessagingException {
        if (disposition == null) {
            part.removeHeader("Content-Disposition");
            return;
        }
        String s = part.getHeader("Content-Disposition", null);
        if (s != null) {
            ContentDisposition cd = new ContentDisposition(s);
            cd.setDisposition(disposition);
            disposition = cd.toString();
        }
        part.setHeader("Content-Disposition", disposition);
    }

    static String getDescription(MimePart part) throws MessagingException {
        String rawvalue = part.getHeader("Content-Description", null);
        if (rawvalue == null) {
            return null;
        }
        try {
            return MimeUtility.decodeText(MimeUtility.unfold(rawvalue));
        } catch (UnsupportedEncodingException e) {
            return rawvalue;
        }
    }

    static void setDescription(MimePart part, String description, String charset) throws MessagingException {
        if (description == null) {
            part.removeHeader("Content-Description");
            return;
        }
        try {
            part.setHeader("Content-Description", MimeUtility.fold(21, MimeUtility.encodeText(description, charset, null)));
        } catch (UnsupportedEncodingException uex) {
            throw new MessagingException("Encoding error", uex);
        }
    }

    static String getFileName(MimePart part) throws MessagingException {
        String s;
        String filename = null;
        String s2 = part.getHeader("Content-Disposition", null);
        if (s2 != null) {
            ContentDisposition cd = new ContentDisposition(s2);
            filename = cd.getParameter("filename");
        }
        if (filename == null && (s = MimeUtil.cleanContentType(part, part.getHeader("Content-Type", null))) != null) {
            try {
                ContentType ct = new ContentType(s);
                filename = ct.getParameter(IMAPStore.ID_NAME);
            } catch (ParseException e) {
            }
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

    static void setFileName(MimePart part, String name) throws MessagingException {
        String s;
        if (encodeFileName && name != null) {
            try {
                name = MimeUtility.encodeText(name);
            } catch (UnsupportedEncodingException ex) {
                throw new MessagingException("Can't encode filename", ex);
            }
        }
        String s2 = part.getHeader("Content-Disposition", null);
        ContentDisposition cd = new ContentDisposition(s2 == null ? Part.ATTACHMENT : s2);
        cd.setParameter("filename", name);
        part.setHeader("Content-Disposition", cd.toString());
        if (setContentTypeFileName && (s = MimeUtil.cleanContentType(part, part.getHeader("Content-Type", null))) != null) {
            try {
                ContentType cType = new ContentType(s);
                cType.setParameter(IMAPStore.ID_NAME, name);
                part.setHeader("Content-Type", cType.toString());
            } catch (ParseException e) {
            }
        }
    }

    static String[] getContentLanguage(MimePart part) throws MessagingException {
        String s = part.getHeader("Content-Language", null);
        if (s == null) {
            return null;
        }
        HeaderTokenizer h = new HeaderTokenizer(s, HeaderTokenizer.MIME);
        Vector v = new Vector();
        while (true) {
            HeaderTokenizer.Token tk = h.next();
            int tkType = tk.getType();
            if (tkType == -4) {
                break;
            }
            if (tkType == -1) {
                v.addElement(tk.getValue());
            }
        }
        if (v.size() == 0) {
            return null;
        }
        String[] language = new String[v.size()];
        v.copyInto(language);
        return language;
    }

    static void setContentLanguage(MimePart part, String[] languages) throws MessagingException {
        StringBuffer sb = new StringBuffer(languages[0]);
        int len = "Content-Language".length() + 2 + languages[0].length();
        for (int i = 1; i < languages.length; i++) {
            sb.append(',');
            int len2 = len + 1;
            if (len2 > 76) {
                sb.append("\r\n\t");
                len2 = 8;
            }
            sb.append(languages[i]);
            len = len2 + languages[i].length();
        }
        part.setHeader("Content-Language", sb.toString());
    }

    static String getEncoding(MimePart part) throws MessagingException {
        HeaderTokenizer.Token tk;
        int tkType;
        String s = part.getHeader("Content-Transfer-Encoding", null);
        if (s == null) {
            return null;
        }
        String s2 = s.trim();
        if (s2.equalsIgnoreCase("7bit") || s2.equalsIgnoreCase("8bit") || s2.equalsIgnoreCase("quoted-printable") || s2.equalsIgnoreCase("binary") || s2.equalsIgnoreCase("base64")) {
            return s2;
        }
        HeaderTokenizer h = new HeaderTokenizer(s2, HeaderTokenizer.MIME);
        do {
            tk = h.next();
            tkType = tk.getType();
            if (tkType == -4) {
                return s2;
            }
        } while (tkType != -1);
        return tk.getValue();
    }

    static void setEncoding(MimePart part, String encoding) throws MessagingException {
        part.setHeader("Content-Transfer-Encoding", encoding);
    }

    static String restrictEncoding(MimePart part, String encoding) throws MessagingException {
        ContentType cType;
        if (!ignoreMultipartEncoding || encoding == null) {
            return encoding;
        }
        if (encoding.equalsIgnoreCase("7bit") || encoding.equalsIgnoreCase("8bit") || encoding.equalsIgnoreCase("binary")) {
            return encoding;
        }
        String type = part.getContentType();
        if (type == null) {
            return encoding;
        }
        try {
            cType = new ContentType(type);
        } catch (ParseException e) {
        }
        if (cType.match("multipart/*")) {
            return null;
        }
        if (cType.match("message/*")) {
            if (!PropUtil.getBooleanSystemProperty("mail.mime.allowencodedmessages", false)) {
                return null;
            }
        }
        return encoding;
    }

    static void updateHeaders(MimePart part) throws MessagingException {
        String charset;
        Object o;
        DataHandler dh = part.getDataHandler();
        if (dh == null) {
            return;
        }
        try {
            String type = dh.getContentType();
            boolean composite = false;
            boolean needCTHeader = part.getHeader("Content-Type") == null;
            ContentType cType = new ContentType(type);
            if (cType.match("multipart/*")) {
                composite = true;
                if (part instanceof MimeBodyPart) {
                    MimeBodyPart mbp = (MimeBodyPart) part;
                    o = mbp.cachedContent != null ? mbp.cachedContent : dh.getContent();
                } else if (part instanceof MimeMessage) {
                    MimeMessage msg = (MimeMessage) part;
                    o = msg.cachedContent != null ? msg.cachedContent : dh.getContent();
                } else {
                    o = dh.getContent();
                }
                if (o instanceof MimeMultipart) {
                    ((MimeMultipart) o).updateHeaders();
                } else {
                    throw new MessagingException("MIME part of type \"" + type + "\" contains object of type " + o.getClass().getName() + " instead of MimeMultipart");
                }
            } else if (cType.match("message/rfc822")) {
                composite = true;
            }
            if (dh instanceof MimePartDataHandler) {
                MimePartDataHandler mdh = (MimePartDataHandler) dh;
                MimePart mpart = mdh.getPart();
                if (mpart != part) {
                    setEncoding(part, mpart.getEncoding());
                    if (needCTHeader) {
                        part.setHeader("Content-Type", mpart.getContentType());
                        return;
                    }
                    return;
                }
                return;
            }
            if (!composite) {
                if (part.getHeader("Content-Transfer-Encoding") == null) {
                    setEncoding(part, MimeUtility.getEncoding(dh));
                }
                if (needCTHeader && setDefaultTextCharset && cType.match("text/*") && cType.getParameter("charset") == null) {
                    String enc = part.getEncoding();
                    if (enc != null && enc.equalsIgnoreCase("7bit")) {
                        charset = "us-ascii";
                    } else {
                        charset = MimeUtility.getDefaultMIMECharset();
                    }
                    cType.setParameter("charset", charset);
                    type = cType.toString();
                }
            }
            if (needCTHeader) {
                String s = part.getHeader("Content-Disposition", null);
                if (s != null) {
                    ContentDisposition cd = new ContentDisposition(s);
                    String filename = cd.getParameter("filename");
                    if (filename != null) {
                        cType.setParameter(IMAPStore.ID_NAME, filename);
                        type = cType.toString();
                    }
                }
                part.setHeader("Content-Type", type);
            }
        } catch (IOException ex) {
            throw new MessagingException("IOException updating headers", ex);
        }
    }

    static void invalidateContentHeaders(MimePart part) throws MessagingException {
        part.removeHeader("Content-Type");
        part.removeHeader("Content-Transfer-Encoding");
    }

    static void writeTo(MimePart part, OutputStream os, String[] ignoreList) throws IOException, MessagingException {
        LineOutputStream los;
        if (os instanceof LineOutputStream) {
            los = (LineOutputStream) os;
        } else {
            los = new LineOutputStream(os);
        }
        Enumeration hdrLines = part.getNonMatchingHeaderLines(ignoreList);
        while (hdrLines.hasMoreElements()) {
            los.writeln((String) hdrLines.nextElement());
        }
        los.writeln();
        InputStream is = null;
        try {
            DataHandler dh = part.getDataHandler();
            if (dh instanceof MimePartDataHandler) {
                is = ((MimePartDataHandler) dh).getContentStream();
            }
            if (is != null) {
                byte[] buf = new byte[8192];
                while (true) {
                    int len = is.read(buf);
                    if (len <= 0) {
                        break;
                    } else {
                        os.write(buf, 0, len);
                    }
                }
            } else {
                os = MimeUtility.encode(os, restrictEncoding(part, part.getEncoding()));
                part.getDataHandler().writeTo(os);
            }
            if (is != null) {
                is.close();
            }
            os.flush();
        } catch (Throwable th) {
            if (0 != 0) {
                is.close();
            }
            throw th;
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeBodyPart$MimePartDataHandler.class */
    static class MimePartDataHandler extends DataHandler {
        MimePart part;

        public MimePartDataHandler(MimePart part) {
            super(new MimePartDataSource(part));
            this.part = part;
        }

        InputStream getContentStream() throws MessagingException {
            InputStream is = null;
            if (this.part instanceof MimeBodyPart) {
                MimeBodyPart mbp = (MimeBodyPart) this.part;
                is = mbp.getContentStream();
            } else if (this.part instanceof MimeMessage) {
                MimeMessage msg = (MimeMessage) this.part;
                is = msg.getContentStream();
            }
            return is;
        }

        MimePart getPart() {
            return this.part;
        }
    }
}
