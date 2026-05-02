package com.sun.mail.smtp;

import com.sun.mail.util.CRLFOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SMTPOutputStream.class */
public class SMTPOutputStream extends CRLFOutputStream {
    public SMTPOutputStream(OutputStream os) {
        super(os);
    }

    @Override // com.sun.mail.util.CRLFOutputStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(int b) throws IOException {
        if ((this.lastb == 10 || this.lastb == 13 || this.lastb == -1) && b == 46) {
            this.out.write(46);
        }
        super.write(b);
    }

    @Override // com.sun.mail.util.CRLFOutputStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        int lastc = this.lastb == -1 ? 10 : this.lastb;
        int start = off;
        int len2 = len + off;
        for (int i = off; i < len2; i++) {
            if ((lastc == 10 || lastc == 13) && b[i] == 46) {
                super.write(b, start, i - start);
                this.out.write(46);
                start = i;
            }
            lastc = b[i];
        }
        if (len2 - start > 0) {
            super.write(b, start, len2 - start);
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() {
    }

    public void ensureAtBOL() throws IOException {
        if (!this.atBOL) {
            super.writeln();
        }
    }
}
