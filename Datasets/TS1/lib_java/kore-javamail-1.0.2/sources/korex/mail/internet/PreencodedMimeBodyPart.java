package korex.mail.internet;

import com.sun.mail.util.LineOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/PreencodedMimeBodyPart.class */
public class PreencodedMimeBodyPart extends MimeBodyPart {
    private String encoding;

    public PreencodedMimeBodyPart(String encoding) {
        this.encoding = encoding;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.internet.MimePart
    public String getEncoding() throws MessagingException {
        return this.encoding;
    }

    @Override // korex.mail.internet.MimeBodyPart, korex.mail.Part
    public void writeTo(OutputStream os) throws IOException, MessagingException {
        LineOutputStream los;
        if (os instanceof LineOutputStream) {
            los = (LineOutputStream) os;
        } else {
            los = new LineOutputStream(os);
        }
        Enumeration hdrLines = getAllHeaderLines();
        while (hdrLines.hasMoreElements()) {
            los.writeln((String) hdrLines.nextElement());
        }
        los.writeln();
        getDataHandler().writeTo(os);
        os.flush();
    }

    @Override // korex.mail.internet.MimeBodyPart
    protected void updateHeaders() throws MessagingException {
        super.updateHeaders();
        MimeBodyPart.setEncoding(this, this.encoding);
    }
}
