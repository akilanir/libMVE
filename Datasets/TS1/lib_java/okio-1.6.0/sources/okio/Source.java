package okio;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: okio-1.6.0.jar:okio/Source.class */
public interface Source extends Closeable {
    long read(Buffer buffer, long j) throws IOException;

    Timeout timeout();

    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close() throws IOException;
}
