package com.sun.mail.imap;

import com.sun.mail.iap.Literal;
import com.sun.mail.util.CRLFOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import korex.mail.Message;
import korex.mail.MessagingException;

/* compiled from: IMAPFolder.java */
/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/MessageLiteral.class */
class MessageLiteral implements Literal {
    private Message msg;
    private int msgSize;
    private byte[] buf;

    public MessageLiteral(Message msg, int maxsize) throws MessagingException, IOException {
        this.msgSize = -1;
        this.msg = msg;
        LengthCounter lc = new LengthCounter(maxsize);
        OutputStream os = new CRLFOutputStream(lc);
        msg.writeTo(os);
        os.flush();
        this.msgSize = lc.getSize();
        this.buf = lc.getBytes();
    }

    @Override // com.sun.mail.iap.Literal
    public int size() {
        return this.msgSize;
    }

    @Override // com.sun.mail.iap.Literal
    public void writeTo(OutputStream os) throws IOException {
        try {
            if (this.buf != null) {
                os.write(this.buf, 0, this.msgSize);
            } else {
                this.msg.writeTo(new CRLFOutputStream(os));
            }
        } catch (MessagingException mex) {
            throw new IOException("MessagingException while appending message: " + mex);
        }
    }
}
