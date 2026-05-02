package org.apache.commons.io.output;

import java.io.OutputStream;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/output/CloseShieldOutputStream.class */
public class CloseShieldOutputStream extends ProxyOutputStream {
    public CloseShieldOutputStream(OutputStream out) {
        super(out);
    }

    @Override // org.apache.commons.io.output.ProxyOutputStream, java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.out = new ClosedOutputStream();
    }
}
