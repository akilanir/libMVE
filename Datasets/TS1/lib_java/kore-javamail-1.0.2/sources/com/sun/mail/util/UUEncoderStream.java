package com.sun.mail.util;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/UUEncoderStream.class */
public class UUEncoderStream extends FilterOutputStream {
    private byte[] buffer;
    private int bufsize;
    private boolean wrotePrefix;
    private boolean wroteSuffix;
    private String name;
    private int mode;

    public UUEncoderStream(OutputStream out) {
        this(out, "encoder.buf", 420);
    }

    public UUEncoderStream(OutputStream out, String name) {
        this(out, name, 420);
    }

    public UUEncoderStream(OutputStream out, String name, int mode) {
        super(out);
        this.bufsize = 0;
        this.wrotePrefix = false;
        this.wroteSuffix = false;
        this.name = name;
        this.mode = mode;
        this.buffer = new byte[45];
    }

    public void setNameMode(String name, int mode) {
        this.name = name;
        this.mode = mode;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        for (int i = 0; i < len; i++) {
            write(b[off + i]);
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] data) throws IOException {
        write(data, 0, data.length);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int c) throws IOException {
        byte[] bArr = this.buffer;
        int i = this.bufsize;
        this.bufsize = i + 1;
        bArr[i] = (byte) c;
        if (this.bufsize == 45) {
            writePrefix();
            encode();
            this.bufsize = 0;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        if (this.bufsize > 0) {
            writePrefix();
            encode();
            this.bufsize = 0;
        }
        writeSuffix();
        this.out.flush();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        flush();
        this.out.close();
    }

    private void writePrefix() throws IOException {
        if (!this.wrotePrefix) {
            PrintStream ps = new PrintStream(this.out, false, "utf-8");
            ps.format("begin %o %s%n", Integer.valueOf(this.mode), this.name);
            ps.flush();
            this.wrotePrefix = true;
        }
    }

    private void writeSuffix() throws IOException {
        if (!this.wroteSuffix) {
            PrintStream ps = new PrintStream(this.out, false, "us-ascii");
            ps.println(" \nend");
            ps.flush();
            this.wroteSuffix = true;
        }
    }

    private void encode() throws IOException {
        byte b;
        byte b2;
        int i = 0;
        this.out.write((this.bufsize & 63) + 32);
        while (i < this.bufsize) {
            int i2 = i;
            i++;
            byte a = this.buffer[i2];
            if (i < this.bufsize) {
                i++;
                b = this.buffer[i];
                if (i < this.bufsize) {
                    i++;
                    b2 = this.buffer[i];
                } else {
                    b2 = 1;
                }
            } else {
                b = 1;
                b2 = 1;
            }
            byte c = b2;
            int c1 = (a >>> 2) & 63;
            int c2 = ((a << 4) & 48) | ((b >>> 4) & 15);
            int c3 = ((b << 2) & 60) | ((c >>> 6) & 3);
            int c4 = c & 63;
            this.out.write(c1 + 32);
            this.out.write(c2 + 32);
            this.out.write(c3 + 32);
            this.out.write(c4 + 32);
        }
        this.out.write(10);
    }
}
