package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/DemuxOutputStream.class */
public class DemuxOutputStream extends OutputStream {
    private InheritableThreadLocal m_streams = new InheritableThreadLocal();

    public OutputStream bindStream(OutputStream output) {
        OutputStream stream = getStream();
        this.m_streams.set(output);
        return stream;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        OutputStream output = getStream();
        if (null != output) {
            output.close();
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        OutputStream output = getStream();
        if (null != output) {
            output.flush();
        }
    }

    @Override // java.io.OutputStream
    public void write(int ch) throws IOException {
        OutputStream output = getStream();
        if (null != output) {
            output.write(ch);
        }
    }

    private OutputStream getStream() {
        return (OutputStream) this.m_streams.get();
    }
}
