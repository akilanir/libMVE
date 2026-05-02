package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/input/DemuxInputStream.class */
public class DemuxInputStream extends InputStream {
    private InheritableThreadLocal m_streams = new InheritableThreadLocal();

    public InputStream bindStream(InputStream input) {
        InputStream oldValue = getStream();
        this.m_streams.set(input);
        return oldValue;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        InputStream input = getStream();
        if (null != input) {
            input.close();
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        InputStream input = getStream();
        if (null != input) {
            return input.read();
        }
        return -1;
    }

    private InputStream getStream() {
        return (InputStream) this.m_streams.get();
    }
}
