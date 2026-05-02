package okhttp3.internal.http;

import java.io.IOException;
import java.net.ProtocolException;
import okhttp3.internal.Util;
import okio.Buffer;
import okio.Sink;
import okio.Timeout;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/RetryableSink.class */
public final class RetryableSink implements Sink {
    private boolean closed;
    private final int limit;
    private final Buffer content;

    public RetryableSink(int limit) {
        this.content = new Buffer();
        this.limit = limit;
    }

    public RetryableSink() {
        this(-1);
    }

    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        this.closed = true;
        if (this.content.size() < this.limit) {
            throw new ProtocolException("content-length promised " + this.limit + " bytes, but received " + this.content.size());
        }
    }

    public void write(Buffer source, long byteCount) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        Util.checkOffsetAndCount(source.size(), 0L, byteCount);
        if (this.limit != -1 && this.content.size() > this.limit - byteCount) {
            throw new ProtocolException("exceeded content-length limit of " + this.limit + " bytes");
        }
        this.content.write(source, byteCount);
    }

    public void flush() throws IOException {
    }

    public Timeout timeout() {
        return Timeout.NONE;
    }

    public long contentLength() throws IOException {
        return this.content.size();
    }

    public void writeToSocket(Sink socketOut) throws IOException {
        Buffer buffer = new Buffer();
        this.content.copyTo(buffer, 0L, this.content.size());
        socketOut.write(buffer, buffer.size());
    }
}
