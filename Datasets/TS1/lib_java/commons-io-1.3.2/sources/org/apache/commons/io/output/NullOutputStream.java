package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/NullOutputStream.class */
public class NullOutputStream extends OutputStream {
    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) {
    }

    @Override // java.io.OutputStream
    public void write(int b) {
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
    }
}
