package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/CountingOutputStream.class */
public class CountingOutputStream extends ProxyOutputStream {
    private long count;

    public CountingOutputStream(OutputStream out) {
        super(out);
    }

    @Override // org.apache.commons.io.output.ProxyOutputStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b) throws IOException {
        this.count += b.length;
        super.write(b);
    }

    @Override // org.apache.commons.io.output.ProxyOutputStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        this.count += len;
        super.write(b, off, len);
    }

    @Override // org.apache.commons.io.output.ProxyOutputStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(int b) throws IOException {
        this.count++;
        super.write(b);
    }

    public synchronized int getCount() {
        long result = getByteCount();
        if (result > 2147483647L) {
            throw new ArithmeticException(new StringBuffer().append("The byte count ").append(result).append(" is too large to be converted to an int").toString());
        }
        return (int) result;
    }

    public synchronized int resetCount() {
        long result = resetByteCount();
        if (result > 2147483647L) {
            throw new ArithmeticException(new StringBuffer().append("The byte count ").append(result).append(" is too large to be converted to an int").toString());
        }
        return (int) result;
    }

    public synchronized long getByteCount() {
        return this.count;
    }

    public synchronized long resetByteCount() {
        long tmp = this.count;
        this.count = 0L;
        return tmp;
    }
}
