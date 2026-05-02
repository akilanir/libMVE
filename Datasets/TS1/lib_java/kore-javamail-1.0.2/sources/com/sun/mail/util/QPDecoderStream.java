package com.sun.mail.util;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/QPDecoderStream.class */
public class QPDecoderStream extends FilterInputStream {
    protected byte[] ba;
    protected int spaces;

    public QPDecoderStream(InputStream in) {
        super(new PushbackInputStream(in, 2));
        this.ba = new byte[2];
        this.spaces = 0;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int c;
        if (this.spaces > 0) {
            this.spaces--;
            return 32;
        }
        int c2 = this.in.read();
        if (c2 == 32) {
            while (true) {
                int read = this.in.read();
                c = read;
                if (read != 32) {
                    break;
                }
                this.spaces++;
            }
            if (c == 13 || c == 10 || c == -1) {
                this.spaces = 0;
            } else {
                ((PushbackInputStream) this.in).unread(c);
                c = 32;
            }
            return c;
        }
        if (c2 == 61) {
            int a = this.in.read();
            if (a == 10) {
                return read();
            }
            if (a == 13) {
                int b = this.in.read();
                if (b != 10) {
                    ((PushbackInputStream) this.in).unread(b);
                }
                return read();
            }
            if (a == -1) {
                return -1;
            }
            this.ba[0] = (byte) a;
            this.ba[1] = (byte) this.in.read();
            try {
                return ASCIIUtility.parseInt(this.ba, 0, 2, 16);
            } catch (NumberFormatException e) {
                ((PushbackInputStream) this.in).unread(this.ba);
                return c2;
            }
        }
        return c2;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] buf, int off, int len) throws IOException {
        int i = 0;
        while (true) {
            if (i >= len) {
                break;
            }
            int c = read();
            if (c == -1) {
                if (i == 0) {
                    i = -1;
                }
            } else {
                buf[off + i] = (byte) c;
                i++;
            }
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long n) throws IOException {
        long skipped;
        long j = 0;
        while (true) {
            skipped = j;
            long j2 = n;
            n = j2 - 1;
            if (j2 <= 0 || read() < 0) {
                break;
            }
            j = skipped + 1;
        }
        return skipped;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return this.in.available();
    }
}
