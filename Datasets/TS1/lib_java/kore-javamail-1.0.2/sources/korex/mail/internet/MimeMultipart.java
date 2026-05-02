package korex.mail.internet;

import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.LineOutputStream;
import com.sun.mail.util.PropUtil;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import korex.activation.DataSource;
import korex.mail.BodyPart;
import korex.mail.MessageAware;
import korex.mail.MessageContext;
import korex.mail.MessagingException;
import korex.mail.Multipart;
import korex.mail.MultipartDataSource;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MimeMultipart.class */
public class MimeMultipart extends Multipart {
    protected DataSource ds;
    protected boolean parsed;
    protected boolean complete;
    protected String preamble;
    protected boolean ignoreMissingEndBoundary;
    protected boolean ignoreMissingBoundaryParameter;
    protected boolean ignoreExistingBoundaryParameter;
    protected boolean allowEmpty;

    public MimeMultipart() {
        this("mixed");
    }

    public MimeMultipart(String subtype) {
        this.ds = null;
        this.parsed = true;
        this.complete = true;
        this.preamble = null;
        this.ignoreMissingEndBoundary = true;
        this.ignoreMissingBoundaryParameter = true;
        this.ignoreExistingBoundaryParameter = false;
        this.allowEmpty = false;
        String boundary = UniqueValue.getUniqueBoundaryValue();
        ContentType cType = new ContentType("multipart", subtype, null);
        cType.setParameter("boundary", boundary);
        this.contentType = cType.toString();
        initializeProperties();
    }

    public MimeMultipart(BodyPart... parts) throws MessagingException {
        this();
        for (BodyPart bp : parts) {
            super.addBodyPart(bp);
        }
    }

    public MimeMultipart(String subtype, BodyPart... parts) throws MessagingException {
        this(subtype);
        for (BodyPart bp : parts) {
            super.addBodyPart(bp);
        }
    }

    public MimeMultipart(DataSource ds) throws MessagingException {
        this.ds = null;
        this.parsed = true;
        this.complete = true;
        this.preamble = null;
        this.ignoreMissingEndBoundary = true;
        this.ignoreMissingBoundaryParameter = true;
        this.ignoreExistingBoundaryParameter = false;
        this.allowEmpty = false;
        if (ds instanceof MessageAware) {
            MessageContext mc = ((MessageAware) ds).getMessageContext();
            setParent(mc.getPart());
        }
        if (ds instanceof MultipartDataSource) {
            setMultipartDataSource((MultipartDataSource) ds);
            return;
        }
        this.parsed = false;
        this.ds = ds;
        this.contentType = ds.getContentType();
    }

    protected void initializeProperties() {
        this.ignoreMissingEndBoundary = PropUtil.getBooleanSystemProperty("mail.mime.multipart.ignoremissingendboundary", true);
        this.ignoreMissingBoundaryParameter = PropUtil.getBooleanSystemProperty("mail.mime.multipart.ignoremissingboundaryparameter", true);
        this.ignoreExistingBoundaryParameter = PropUtil.getBooleanSystemProperty("mail.mime.multipart.ignoreexistingboundaryparameter", false);
        this.allowEmpty = PropUtil.getBooleanSystemProperty("mail.mime.multipart.allowempty", false);
    }

    public synchronized void setSubType(String subtype) throws MessagingException {
        ContentType cType = new ContentType(this.contentType);
        cType.setSubType(subtype);
        this.contentType = cType.toString();
    }

    @Override // korex.mail.Multipart
    public synchronized int getCount() throws MessagingException {
        parse();
        return super.getCount();
    }

    @Override // korex.mail.Multipart
    public synchronized BodyPart getBodyPart(int index) throws MessagingException {
        parse();
        return super.getBodyPart(index);
    }

    public synchronized BodyPart getBodyPart(String CID) throws MessagingException {
        parse();
        int count = getCount();
        for (int i = 0; i < count; i++) {
            MimeBodyPart part = (MimeBodyPart) getBodyPart(i);
            String s = part.getContentID();
            if (s != null && s.equals(CID)) {
                return part;
            }
        }
        return null;
    }

    @Override // korex.mail.Multipart
    public boolean removeBodyPart(BodyPart part) throws MessagingException {
        parse();
        return super.removeBodyPart(part);
    }

    @Override // korex.mail.Multipart
    public void removeBodyPart(int index) throws MessagingException {
        parse();
        super.removeBodyPart(index);
    }

    @Override // korex.mail.Multipart
    public synchronized void addBodyPart(BodyPart part) throws MessagingException {
        parse();
        super.addBodyPart(part);
    }

    @Override // korex.mail.Multipart
    public synchronized void addBodyPart(BodyPart part, int index) throws MessagingException {
        parse();
        super.addBodyPart(part, index);
    }

    public synchronized boolean isComplete() throws MessagingException {
        parse();
        return this.complete;
    }

    public synchronized String getPreamble() throws MessagingException {
        parse();
        return this.preamble;
    }

    public synchronized void setPreamble(String preamble) throws MessagingException {
        this.preamble = preamble;
    }

    protected synchronized void updateHeaders() throws MessagingException {
        parse();
        for (int i = 0; i < this.parts.size(); i++) {
            ((MimeBodyPart) this.parts.elementAt(i)).updateHeaders();
        }
    }

    @Override // korex.mail.Multipart
    public synchronized void writeTo(OutputStream os) throws IOException, MessagingException {
        parse();
        String boundary = "--" + new ContentType(this.contentType).getParameter("boundary");
        LineOutputStream los = new LineOutputStream(os);
        if (this.preamble != null) {
            byte[] pb = ASCIIUtility.getBytes(this.preamble);
            los.write(pb);
            if (pb.length > 0 && pb[pb.length - 1] != 13 && pb[pb.length - 1] != 10) {
                los.writeln();
            }
        }
        if (this.parts.size() == 0) {
            if (this.allowEmpty) {
                los.writeln(boundary);
                los.writeln();
            } else {
                throw new MessagingException("Empty multipart: " + this.contentType);
            }
        } else {
            for (int i = 0; i < this.parts.size(); i++) {
                los.writeln(boundary);
                ((MimeBodyPart) this.parts.elementAt(i)).writeTo(os);
                los.writeln();
            }
        }
        los.writeln(boundary + "--");
    }

    /* JADX WARN: Removed duplicated region for block: B:258:0x01b1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0178  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected synchronized void parse() throws korex.mail.MessagingException {
        /*
            Method dump skipped, instructions count: 1369
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.MimeMultipart.parse():void");
    }

    private static boolean allDashes(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) != '-') {
                return false;
            }
        }
        return true;
    }

    private static int readFully(InputStream in, byte[] buf, int off, int len) throws IOException {
        int bsize;
        if (len == 0) {
            return 0;
        }
        int total = 0;
        while (len > 0 && (bsize = in.read(buf, off, len)) > 0) {
            off += bsize;
            total += bsize;
            len -= bsize;
        }
        if (total > 0) {
            return total;
        }
        return -1;
    }

    private void skipFully(InputStream in, long offset) throws IOException {
        while (offset > 0) {
            long cur = in.skip(offset);
            if (cur <= 0) {
                throw new EOFException("can't skip");
            }
            offset -= cur;
        }
    }

    protected InternetHeaders createInternetHeaders(InputStream is) throws MessagingException {
        return new InternetHeaders(is);
    }

    protected MimeBodyPart createMimeBodyPart(InternetHeaders headers, byte[] content) throws MessagingException {
        return new MimeBodyPart(headers, content);
    }

    protected MimeBodyPart createMimeBodyPart(InputStream is) throws MessagingException {
        return new MimeBodyPart(is);
    }

    private MimeBodyPart createMimeBodyPartIs(InputStream is) throws MessagingException {
        try {
            return createMimeBodyPart(is);
        } finally {
            try {
                is.close();
            } catch (IOException e) {
            }
        }
    }
}
