package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/input/CountingInputStream.class */
public class CountingInputStream extends ProxyInputStream {
    private long count;

    public CountingInputStream(InputStream in) {
        super(in);
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b) throws IOException {
        int found = super.read(b);
        this.count += found >= 0 ? found : 0L;
        return found;
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int found = super.read(b, off, len);
        this.count += found >= 0 ? found : 0L;
        return found;
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int found = super.read();
        this.count += found >= 0 ? 1L : 0L;
        return found;
    }

    @Override // org.apache.commons.io.input.ProxyInputStream, java.io.FilterInputStream, java.io.InputStream
    public long skip(long length) throws IOException {
        long skip = super.skip(length);
        this.count += skip;
        return skip;
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
