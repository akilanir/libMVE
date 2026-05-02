package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-2.4.jar:org/apache/commons/io/output/ClosedOutputStream.class */
public class ClosedOutputStream extends OutputStream {
    public static final ClosedOutputStream CLOSED_OUTPUT_STREAM = new ClosedOutputStream();

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        throw new IOException("write(" + b + ") failed: stream is closed");
    }
}
