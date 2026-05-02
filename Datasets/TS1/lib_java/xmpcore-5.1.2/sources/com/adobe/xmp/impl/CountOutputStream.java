package com.adobe.xmp.impl;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: xmpcore-5.1.2.jar:com/adobe/xmp/impl/CountOutputStream.class */
public final class CountOutputStream extends OutputStream {
    private final OutputStream out;
    private int bytesWritten = 0;

    CountOutputStream(OutputStream out) {
        this.out = out;
    }

    @Override // java.io.OutputStream
    public void write(byte[] buf, int off, int len) throws IOException {
        this.out.write(buf, off, len);
        this.bytesWritten += len;
    }

    @Override // java.io.OutputStream
    public void write(byte[] buf) throws IOException {
        this.out.write(buf);
        this.bytesWritten += buf.length;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.out.write(b);
        this.bytesWritten++;
    }

    public int getBytesWritten() {
        return this.bytesWritten;
    }
}
