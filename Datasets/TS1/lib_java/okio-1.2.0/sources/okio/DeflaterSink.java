package okio;

import java.io.IOException;
import java.util.zip.Deflater;
import org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement;

/* loaded from: okio-1.2.0.jar:okio/DeflaterSink.class */
public final class DeflaterSink implements Sink {
    private final BufferedSink sink;
    private final Deflater deflater;
    private boolean closed;

    public DeflaterSink(Sink sink, Deflater deflater) {
        this(Okio.buffer(sink), deflater);
    }

    DeflaterSink(BufferedSink sink, Deflater deflater) {
        if (sink == null) {
            throw new IllegalArgumentException("source == null");
        }
        if (deflater == null) {
            throw new IllegalArgumentException("inflater == null");
        }
        this.sink = sink;
        this.deflater = deflater;
    }

    @Override // okio.Sink
    public void write(Buffer source, long byteCount) throws IOException {
        Util.checkOffsetAndCount(source.size, 0L, byteCount);
        while (byteCount > 0) {
            Segment head = source.head;
            int toDeflate = (int) Math.min(byteCount, head.limit - head.pos);
            this.deflater.setInput(head.data, head.pos, toDeflate);
            deflate(false);
            source.size -= toDeflate;
            head.pos += toDeflate;
            if (head.pos == head.limit) {
                source.head = head.pop();
                SegmentPool.INSTANCE.recycle(head);
            }
            byteCount -= toDeflate;
        }
    }

    @IgnoreJRERequirement
    private void deflate(boolean syncFlush) throws IOException {
        Buffer buffer = this.sink.buffer();
        while (true) {
            Segment s = buffer.writableSegment(1);
            int deflated = syncFlush ? this.deflater.deflate(s.data, s.limit, 2048 - s.limit, 2) : this.deflater.deflate(s.data, s.limit, 2048 - s.limit);
            if (deflated > 0) {
                s.limit += deflated;
                buffer.size += deflated;
                this.sink.emitCompleteSegments();
            } else if (this.deflater.needsInput()) {
                return;
            }
        }
    }

    @Override // okio.Sink
    public void flush() throws IOException {
        deflate(true);
        this.sink.flush();
    }

    void finishDeflate() throws IOException {
        this.deflater.finish();
        deflate(false);
    }

    @Override // okio.Sink, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        Throwable thrown = null;
        try {
            finishDeflate();
        } catch (Throwable e) {
            thrown = e;
        }
        try {
            this.deflater.end();
        } catch (Throwable e2) {
            if (thrown == null) {
                thrown = e2;
            }
        }
        try {
            this.sink.close();
        } catch (Throwable e3) {
            if (thrown == null) {
                thrown = e3;
            }
        }
        this.closed = true;
        if (thrown != null) {
            Util.sneakyRethrow(thrown);
        }
    }

    @Override // okio.Sink
    public Timeout timeout() {
        return this.sink.timeout();
    }

    public String toString() {
        return "DeflaterSink(" + this.sink + ")";
    }
}
