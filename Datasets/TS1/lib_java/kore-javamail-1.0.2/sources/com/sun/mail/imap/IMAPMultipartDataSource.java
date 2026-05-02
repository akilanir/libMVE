package com.sun.mail.imap;

import com.sun.mail.imap.protocol.BODYSTRUCTURE;
import java.util.Vector;
import korex.mail.BodyPart;
import korex.mail.MessagingException;
import korex.mail.MultipartDataSource;
import korex.mail.internet.MimePart;
import korex.mail.internet.MimePartDataSource;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPMultipartDataSource.class */
public class IMAPMultipartDataSource extends MimePartDataSource implements MultipartDataSource {
    private Vector parts;

    protected IMAPMultipartDataSource(MimePart part, BODYSTRUCTURE[] bs, String sectionId, IMAPMessage msg) {
        String str;
        super(part);
        this.parts = new Vector(bs.length);
        for (int i = 0; i < bs.length; i++) {
            Vector vector = this.parts;
            BODYSTRUCTURE bodystructure = bs[i];
            if (sectionId == null) {
                str = Integer.toString(i + 1);
            } else {
                str = sectionId + "." + Integer.toString(i + 1);
            }
            vector.addElement(new IMAPBodyPart(bodystructure, str, msg));
        }
    }

    @Override // korex.mail.MultipartDataSource
    public int getCount() {
        return this.parts.size();
    }

    @Override // korex.mail.MultipartDataSource
    public BodyPart getBodyPart(int index) throws MessagingException {
        return (BodyPart) this.parts.elementAt(index);
    }
}
