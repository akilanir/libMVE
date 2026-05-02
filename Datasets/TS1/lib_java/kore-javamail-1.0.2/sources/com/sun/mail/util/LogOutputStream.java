package com.sun.mail.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/LogOutputStream.class */
public class LogOutputStream extends OutputStream {
    protected MailLogger logger;
    private int lastb = -1;
    private byte[] buf = new byte[80];
    private int pos = 0;
    protected Level level = Level.FINEST;

    public LogOutputStream(MailLogger logger) {
        this.logger = logger;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        if (!this.logger.isLoggable(this.level)) {
            return;
        }
        if (b == 13) {
            logBuf();
        } else if (b == 10) {
            if (this.lastb != 13) {
                logBuf();
            }
        } else {
            expandCapacity(1);
            byte[] bArr = this.buf;
            int i = this.pos;
            this.pos = i + 1;
            bArr[i] = (byte) b;
        }
        this.lastb = b;
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        int start = off;
        if (!this.logger.isLoggable(this.level)) {
            return;
        }
        int len2 = len + off;
        for (int i = start; i < len2; i++) {
            if (b[i] == 13) {
                expandCapacity(i - start);
                System.arraycopy(b, start, this.buf, this.pos, i - start);
                this.pos += i - start;
                logBuf();
                start = i + 1;
            } else if (b[i] == 10) {
                if (this.lastb != 13) {
                    expandCapacity(i - start);
                    System.arraycopy(b, start, this.buf, this.pos, i - start);
                    this.pos += i - start;
                    logBuf();
                }
                start = i + 1;
            }
            this.lastb = b[i];
        }
        if (len2 - start > 0) {
            expandCapacity(len2 - start);
            System.arraycopy(b, start, this.buf, this.pos, len2 - start);
            this.pos += len2 - start;
        }
    }

    protected void log(String msg) {
        this.logger.log(this.level, msg);
    }

    private void logBuf() {
        String msg = new String(this.buf, 0, this.pos);
        this.pos = 0;
        log(msg);
    }

    private void expandCapacity(int len) {
        while (this.pos + len > this.buf.length) {
            byte[] nb = new byte[this.buf.length * 2];
            System.arraycopy(this.buf, 0, nb, 0, this.pos);
            this.buf = nb;
        }
    }
}
