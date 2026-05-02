package com.sun.mail.util;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/BASE64EncoderStream.class */
public class BASE64EncoderStream extends FilterOutputStream {
    private byte[] buffer;
    private int bufsize;
    private byte[] outbuf;
    private int count;
    private int bytesPerLine;
    private int lineLimit;
    private boolean noCRLF;
    private static byte[] newline = {13, 10};
    private static final char[] pem_array = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'};

    public BASE64EncoderStream(OutputStream out, int bytesPerLine) {
        super(out);
        this.bufsize = 0;
        this.count = 0;
        this.noCRLF = false;
        this.buffer = new byte[3];
        if (bytesPerLine == Integer.MAX_VALUE || bytesPerLine < 4) {
            this.noCRLF = true;
            bytesPerLine = 76;
        }
        int bytesPerLine2 = (bytesPerLine / 4) * 4;
        this.bytesPerLine = bytesPerLine2;
        this.lineLimit = (bytesPerLine2 / 4) * 3;
        if (this.noCRLF) {
            this.outbuf = new byte[bytesPerLine2];
            return;
        }
        this.outbuf = new byte[bytesPerLine2 + 2];
        this.outbuf[bytesPerLine2] = 13;
        this.outbuf[bytesPerLine2 + 1] = 10;
    }

    public BASE64EncoderStream(OutputStream out) {
        this(out, 76);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public synchronized void write(byte[] b, int off, int len) throws IOException {
        int end = off + len;
        while (this.bufsize != 0 && off < end) {
            int i = off;
            off++;
            write(b[i]);
        }
        int blen = ((this.bytesPerLine - this.count) / 4) * 3;
        if (off + blen <= end) {
            int outlen = encodedSize(blen);
            if (!this.noCRLF) {
                int outlen2 = outlen + 1;
                this.outbuf[outlen] = 13;
                outlen = outlen2 + 1;
                this.outbuf[outlen2] = 10;
            }
            this.out.write(encode(b, off, blen, this.outbuf), 0, outlen);
            off += blen;
            this.count = 0;
        }
        while (off + this.lineLimit <= end) {
            this.out.write(encode(b, off, this.lineLimit, this.outbuf));
            off += this.lineLimit;
        }
        if (off + 3 <= end) {
            int blen2 = ((end - off) / 3) * 3;
            int outlen3 = encodedSize(blen2);
            this.out.write(encode(b, off, blen2, this.outbuf), 0, outlen3);
            off += blen2;
            this.count += outlen3;
        }
        while (off < end) {
            write(b[off]);
            off++;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public synchronized void write(int c) throws IOException {
        byte[] bArr = this.buffer;
        int i = this.bufsize;
        this.bufsize = i + 1;
        bArr[i] = (byte) c;
        if (this.bufsize == 3) {
            encode();
            this.bufsize = 0;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public synchronized void flush() throws IOException {
        if (this.bufsize > 0) {
            encode();
            this.bufsize = 0;
        }
        this.out.flush();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() throws IOException {
        flush();
        if (this.count > 0 && !this.noCRLF) {
            this.out.write(newline);
            this.out.flush();
        }
        this.out.close();
    }

    private void encode() throws IOException {
        int osize = encodedSize(this.bufsize);
        this.out.write(encode(this.buffer, 0, this.bufsize, this.outbuf), 0, osize);
        this.count += osize;
        if (this.count >= this.bytesPerLine) {
            if (!this.noCRLF) {
                this.out.write(newline);
            }
            this.count = 0;
        }
    }

    public static byte[] encode(byte[] inbuf) {
        if (inbuf.length == 0) {
            return inbuf;
        }
        return encode(inbuf, 0, inbuf.length, null);
    }

    private static byte[] encode(byte[] inbuf, int off, int size, byte[] outbuf) {
        if (outbuf == null) {
            outbuf = new byte[encodedSize(size)];
        }
        int inpos = off;
        int outpos = 0;
        while (size >= 3) {
            int i = inpos;
            int inpos2 = inpos + 1;
            int inpos3 = inpos2 + 1;
            int val = (((inbuf[i] & 255) << 8) | (inbuf[inpos2] & 255)) << 8;
            inpos = inpos3 + 1;
            int val2 = val | (inbuf[inpos3] & 255);
            outbuf[outpos + 3] = (byte) pem_array[val2 & 63];
            int val3 = val2 >> 6;
            outbuf[outpos + 2] = (byte) pem_array[val3 & 63];
            int val4 = val3 >> 6;
            outbuf[outpos + 1] = (byte) pem_array[val4 & 63];
            outbuf[outpos + 0] = (byte) pem_array[(val4 >> 6) & 63];
            size -= 3;
            outpos += 4;
        }
        if (size == 1) {
            int i2 = inpos;
            int i3 = inpos + 1;
            int val5 = (inbuf[i2] & 255) << 4;
            outbuf[outpos + 3] = 61;
            outbuf[outpos + 2] = 61;
            outbuf[outpos + 1] = (byte) pem_array[val5 & 63];
            outbuf[outpos + 0] = (byte) pem_array[(val5 >> 6) & 63];
        } else if (size == 2) {
            int i4 = inpos;
            int inpos4 = inpos + 1;
            int i5 = inpos4 + 1;
            int val6 = (((inbuf[i4] & 255) << 8) | (inbuf[inpos4] & 255)) << 2;
            outbuf[outpos + 3] = 61;
            outbuf[outpos + 2] = (byte) pem_array[val6 & 63];
            int val7 = val6 >> 6;
            outbuf[outpos + 1] = (byte) pem_array[val7 & 63];
            outbuf[outpos + 0] = (byte) pem_array[(val7 >> 6) & 63];
        }
        return outbuf;
    }

    private static int encodedSize(int size) {
        return ((size + 2) / 3) * 4;
    }
}
