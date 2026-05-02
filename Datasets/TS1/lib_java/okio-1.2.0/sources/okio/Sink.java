package okio;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: okio-1.2.0.jar:okio/Sink.class */
public interface Sink extends Closeable {
    void write(Buffer buffer, long j) throws IOException;

    void flush() throws IOException;

    Timeout timeout();

    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close() throws IOException;
}
