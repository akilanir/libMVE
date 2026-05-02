package com.sun.mail.util;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.logging.Level;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/TraceInputStream.class */
public class TraceInputStream extends FilterInputStream {
    private boolean trace;
    private boolean quote;
    private OutputStream traceOut;

    public TraceInputStream(InputStream in, MailLogger logger) {
        super(in);
        this.trace = false;
        this.quote = false;
        this.trace = logger.isLoggable(Level.FINEST);
        this.traceOut = new LogOutputStream(logger);
    }

    public TraceInputStream(InputStream in, OutputStream traceOut) {
        super(in);
        this.trace = false;
        this.quote = false;
        this.traceOut = traceOut;
    }

    public void setTrace(boolean trace) {
        this.trace = trace;
    }

    public void setQuote(boolean quote) {
        this.quote = quote;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int b = this.in.read();
        if (this.trace && b != -1) {
            if (this.quote) {
                writeByte(b);
            } else {
                this.traceOut.write(b);
            }
        }
        return b;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int count = this.in.read(b, off, len);
        if (this.trace && count != -1) {
            if (this.quote) {
                for (int i = 0; i < count; i++) {
                    writeByte(b[off + i]);
                }
            } else {
                this.traceOut.write(b, off, count);
            }
        }
        return count;
    }

    private final void writeByte(int b) throws IOException {
        int b2 = b & 255;
        if (b2 > 127) {
            this.traceOut.write(77);
            this.traceOut.write(45);
            b2 &= 127;
        }
        if (b2 == 13) {
            this.traceOut.write(92);
            this.traceOut.write(114);
            return;
        }
        if (b2 == 10) {
            this.traceOut.write(92);
            this.traceOut.write(110);
            this.traceOut.write(10);
        } else if (b2 == 9) {
            this.traceOut.write(92);
            this.traceOut.write(116);
        } else if (b2 < 32) {
            this.traceOut.write(94);
            this.traceOut.write(64 + b2);
        } else {
            this.traceOut.write(b2);
        }
    }
}
