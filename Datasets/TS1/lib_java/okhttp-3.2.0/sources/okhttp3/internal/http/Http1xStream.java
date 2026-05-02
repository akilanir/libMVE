package okhttp3.internal.http;

import java.io.EOFException;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.concurrent.TimeUnit;
import okhttp3.Headers;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okhttp3.internal.Internal;
import okhttp3.internal.Util;
import okhttp3.internal.io.RealConnection;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ForwardingTimeout;
import okio.Okio;
import okio.Sink;
import okio.Source;
import okio.Timeout;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream.class */
public final class Http1xStream implements HttpStream {
    private static final int STATE_IDLE = 0;
    private static final int STATE_OPEN_REQUEST_BODY = 1;
    private static final int STATE_WRITING_REQUEST_BODY = 2;
    private static final int STATE_READ_RESPONSE_HEADERS = 3;
    private static final int STATE_OPEN_RESPONSE_BODY = 4;
    private static final int STATE_READING_RESPONSE_BODY = 5;
    private static final int STATE_CLOSED = 6;
    private final StreamAllocation streamAllocation;
    private final BufferedSource source;
    private final BufferedSink sink;
    private HttpEngine httpEngine;
    private int state = STATE_IDLE;

    public Http1xStream(StreamAllocation streamAllocation, BufferedSource source, BufferedSink sink) {
        this.streamAllocation = streamAllocation;
        this.source = source;
        this.sink = sink;
    }

    @Override // okhttp3.internal.http.HttpStream
    public void setHttpEngine(HttpEngine httpEngine) {
        this.httpEngine = httpEngine;
    }

    @Override // okhttp3.internal.http.HttpStream
    public Sink createRequestBody(Request request, long contentLength) throws IOException {
        if ("chunked".equalsIgnoreCase(request.header("Transfer-Encoding"))) {
            return newChunkedSink();
        }
        if (contentLength != -1) {
            return newFixedLengthSink(contentLength);
        }
        throw new IllegalStateException("Cannot stream a request body without chunked encoding or a known content length!");
    }

    @Override // okhttp3.internal.http.HttpStream
    public void cancel() {
        RealConnection connection = this.streamAllocation.connection();
        if (connection != null) {
            connection.cancel();
        }
    }

    @Override // okhttp3.internal.http.HttpStream
    public void writeRequestHeaders(Request request) throws IOException {
        this.httpEngine.writingRequestHeaders();
        String requestLine = RequestLine.get(request, this.httpEngine.getConnection().route().proxy().type());
        writeRequest(request.headers(), requestLine);
    }

    @Override // okhttp3.internal.http.HttpStream
    public Response.Builder readResponseHeaders() throws IOException {
        return readResponse();
    }

    @Override // okhttp3.internal.http.HttpStream
    public ResponseBody openResponseBody(Response response) throws IOException {
        Source source = getTransferStream(response);
        return new RealResponseBody(response.headers(), Okio.buffer(source));
    }

    private Source getTransferStream(Response response) throws IOException {
        if (!HttpEngine.hasBody(response)) {
            return newFixedLengthSource(0L);
        }
        if ("chunked".equalsIgnoreCase(response.header("Transfer-Encoding"))) {
            return newChunkedSource(this.httpEngine);
        }
        long contentLength = OkHeaders.contentLength(response);
        if (contentLength != -1) {
            return newFixedLengthSource(contentLength);
        }
        return newUnknownLengthSource();
    }

    public boolean isClosed() {
        return this.state == STATE_CLOSED;
    }

    @Override // okhttp3.internal.http.HttpStream
    public void finishRequest() throws IOException {
        this.sink.flush();
    }

    public void writeRequest(Headers headers, String requestLine) throws IOException {
        if (this.state != 0) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.sink.writeUtf8(requestLine).writeUtf8("\r\n");
        int size = headers.size();
        for (int i = STATE_IDLE; i < size; i += STATE_OPEN_REQUEST_BODY) {
            this.sink.writeUtf8(headers.name(i)).writeUtf8(": ").writeUtf8(headers.value(i)).writeUtf8("\r\n");
        }
        this.sink.writeUtf8("\r\n");
        this.state = STATE_OPEN_REQUEST_BODY;
    }

    public Response.Builder readResponse() throws IOException {
        StatusLine statusLine;
        Response.Builder responseBuilder;
        if (this.state != STATE_OPEN_REQUEST_BODY && this.state != STATE_READ_RESPONSE_HEADERS) {
            throw new IllegalStateException("state: " + this.state);
        }
        do {
            try {
                statusLine = StatusLine.parse(this.source.readUtf8LineStrict());
                responseBuilder = new Response.Builder().protocol(statusLine.protocol).code(statusLine.code).message(statusLine.message).headers(readHeaders());
            } catch (EOFException e) {
                IOException exception = new IOException("unexpected end of stream on " + this.streamAllocation);
                exception.initCause(e);
                throw exception;
            }
        } while (statusLine.code == 100);
        this.state = STATE_OPEN_RESPONSE_BODY;
        return responseBuilder;
    }

    public Headers readHeaders() throws IOException {
        Headers.Builder headers = new Headers.Builder();
        while (true) {
            String line = this.source.readUtf8LineStrict();
            if (line.length() != 0) {
                Internal.instance.addLenient(headers, line);
            } else {
                return headers.build();
            }
        }
    }

    public Sink newChunkedSink() {
        if (this.state != STATE_OPEN_REQUEST_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.state = STATE_WRITING_REQUEST_BODY;
        return new ChunkedSink();
    }

    public Sink newFixedLengthSink(long contentLength) {
        if (this.state != STATE_OPEN_REQUEST_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.state = STATE_WRITING_REQUEST_BODY;
        return new FixedLengthSink(contentLength);
    }

    @Override // okhttp3.internal.http.HttpStream
    public void writeRequestBody(RetryableSink requestBody) throws IOException {
        if (this.state != STATE_OPEN_REQUEST_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.state = STATE_READ_RESPONSE_HEADERS;
        requestBody.writeToSocket(this.sink);
    }

    public Source newFixedLengthSource(long length) throws IOException {
        if (this.state != STATE_OPEN_RESPONSE_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.state = STATE_READING_RESPONSE_BODY;
        return new FixedLengthSource(length);
    }

    public Source newChunkedSource(HttpEngine httpEngine) throws IOException {
        if (this.state != STATE_OPEN_RESPONSE_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        this.state = STATE_READING_RESPONSE_BODY;
        return new ChunkedSource(httpEngine);
    }

    public Source newUnknownLengthSource() throws IOException {
        if (this.state != STATE_OPEN_RESPONSE_BODY) {
            throw new IllegalStateException("state: " + this.state);
        }
        if (this.streamAllocation == null) {
            throw new IllegalStateException("streamAllocation == null");
        }
        this.state = STATE_READING_RESPONSE_BODY;
        this.streamAllocation.noNewStreams();
        return new UnknownLengthSource();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void detachTimeout(ForwardingTimeout timeout) {
        Timeout oldDelegate = timeout.delegate();
        timeout.setDelegate(Timeout.NONE);
        oldDelegate.clearDeadline();
        oldDelegate.clearTimeout();
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$FixedLengthSink.class */
    private final class FixedLengthSink implements Sink {
        private final ForwardingTimeout timeout;
        private boolean closed;
        private long bytesRemaining;

        private FixedLengthSink(long bytesRemaining) {
            this.timeout = new ForwardingTimeout(Http1xStream.this.sink.timeout());
            this.bytesRemaining = bytesRemaining;
        }

        public Timeout timeout() {
            return this.timeout;
        }

        public void write(Buffer source, long byteCount) throws IOException {
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            Util.checkOffsetAndCount(source.size(), 0L, byteCount);
            if (byteCount <= this.bytesRemaining) {
                Http1xStream.this.sink.write(source, byteCount);
                this.bytesRemaining -= byteCount;
                return;
            }
            throw new ProtocolException("expected " + this.bytesRemaining + " bytes but received " + byteCount);
        }

        public void flush() throws IOException {
            if (this.closed) {
                return;
            }
            Http1xStream.this.sink.flush();
        }

        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            this.closed = true;
            if (this.bytesRemaining > 0) {
                throw new ProtocolException("unexpected end of stream");
            }
            Http1xStream.this.detachTimeout(this.timeout);
            Http1xStream.this.state = Http1xStream.STATE_READ_RESPONSE_HEADERS;
        }
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$ChunkedSink.class */
    private final class ChunkedSink implements Sink {
        private final ForwardingTimeout timeout;
        private boolean closed;

        private ChunkedSink() {
            this.timeout = new ForwardingTimeout(Http1xStream.this.sink.timeout());
        }

        public Timeout timeout() {
            return this.timeout;
        }

        public void write(Buffer source, long byteCount) throws IOException {
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            if (byteCount == 0) {
                return;
            }
            Http1xStream.this.sink.writeHexadecimalUnsignedLong(byteCount);
            Http1xStream.this.sink.writeUtf8("\r\n");
            Http1xStream.this.sink.write(source, byteCount);
            Http1xStream.this.sink.writeUtf8("\r\n");
        }

        public synchronized void flush() throws IOException {
            if (this.closed) {
                return;
            }
            Http1xStream.this.sink.flush();
        }

        public synchronized void close() throws IOException {
            if (this.closed) {
                return;
            }
            this.closed = true;
            Http1xStream.this.sink.writeUtf8("0\r\n\r\n");
            Http1xStream.this.detachTimeout(this.timeout);
            Http1xStream.this.state = Http1xStream.STATE_READ_RESPONSE_HEADERS;
        }
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$AbstractSource.class */
    private abstract class AbstractSource implements Source {
        protected final ForwardingTimeout timeout;
        protected boolean closed;

        private AbstractSource() {
            this.timeout = new ForwardingTimeout(Http1xStream.this.source.timeout());
        }

        public Timeout timeout() {
            return this.timeout;
        }

        protected final void endOfInput(boolean reuseConnection) throws IOException {
            if (Http1xStream.this.state == Http1xStream.STATE_CLOSED) {
                return;
            }
            if (Http1xStream.this.state != Http1xStream.STATE_READING_RESPONSE_BODY) {
                throw new IllegalStateException("state: " + Http1xStream.this.state);
            }
            Http1xStream.this.detachTimeout(this.timeout);
            Http1xStream.this.state = Http1xStream.STATE_CLOSED;
            if (Http1xStream.this.streamAllocation != null) {
                Http1xStream.this.streamAllocation.streamFinished(!reuseConnection, Http1xStream.this);
            }
        }
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$FixedLengthSource.class */
    private class FixedLengthSource extends AbstractSource {
        private long bytesRemaining;

        public FixedLengthSource(long length) throws IOException {
            super();
            this.bytesRemaining = length;
            if (this.bytesRemaining == 0) {
                endOfInput(true);
            }
        }

        public long read(Buffer sink, long byteCount) throws IOException {
            if (byteCount < 0) {
                throw new IllegalArgumentException("byteCount < 0: " + byteCount);
            }
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            if (this.bytesRemaining == 0) {
                return -1L;
            }
            long read = Http1xStream.this.source.read(sink, Math.min(this.bytesRemaining, byteCount));
            if (read == -1) {
                endOfInput(false);
                throw new ProtocolException("unexpected end of stream");
            }
            this.bytesRemaining -= read;
            if (this.bytesRemaining == 0) {
                endOfInput(true);
            }
            return read;
        }

        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            if (this.bytesRemaining != 0 && !Util.discard(this, 100, TimeUnit.MILLISECONDS)) {
                endOfInput(false);
            }
            this.closed = true;
        }
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$ChunkedSource.class */
    private class ChunkedSource extends AbstractSource {
        private static final long NO_CHUNK_YET = -1;
        private long bytesRemainingInChunk;
        private boolean hasMoreChunks;
        private final HttpEngine httpEngine;

        ChunkedSource(HttpEngine httpEngine) throws IOException {
            super();
            this.bytesRemainingInChunk = NO_CHUNK_YET;
            this.hasMoreChunks = true;
            this.httpEngine = httpEngine;
        }

        public long read(Buffer sink, long byteCount) throws IOException {
            if (byteCount < 0) {
                throw new IllegalArgumentException("byteCount < 0: " + byteCount);
            }
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            if (!this.hasMoreChunks) {
                return NO_CHUNK_YET;
            }
            if (this.bytesRemainingInChunk == 0 || this.bytesRemainingInChunk == NO_CHUNK_YET) {
                readChunkSize();
                if (!this.hasMoreChunks) {
                    return NO_CHUNK_YET;
                }
            }
            long read = Http1xStream.this.source.read(sink, Math.min(byteCount, this.bytesRemainingInChunk));
            if (read == NO_CHUNK_YET) {
                endOfInput(false);
                throw new ProtocolException("unexpected end of stream");
            }
            this.bytesRemainingInChunk -= read;
            return read;
        }

        private void readChunkSize() throws IOException {
            if (this.bytesRemainingInChunk != NO_CHUNK_YET) {
                Http1xStream.this.source.readUtf8LineStrict();
            }
            try {
                this.bytesRemainingInChunk = Http1xStream.this.source.readHexadecimalUnsignedLong();
                String extensions = Http1xStream.this.source.readUtf8LineStrict().trim();
                if (this.bytesRemainingInChunk < 0 || !(extensions.isEmpty() || extensions.startsWith(";"))) {
                    throw new ProtocolException("expected chunk size and optional extensions but was \"" + this.bytesRemainingInChunk + extensions + "\"");
                }
                if (this.bytesRemainingInChunk == 0) {
                    this.hasMoreChunks = false;
                    this.httpEngine.receiveHeaders(Http1xStream.this.readHeaders());
                    endOfInput(true);
                }
            } catch (NumberFormatException e) {
                throw new ProtocolException(e.getMessage());
            }
        }

        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            if (this.hasMoreChunks && !Util.discard(this, 100, TimeUnit.MILLISECONDS)) {
                endOfInput(false);
            }
            this.closed = true;
        }
    }

    /* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/Http1xStream$UnknownLengthSource.class */
    private class UnknownLengthSource extends AbstractSource {
        private boolean inputExhausted;

        private UnknownLengthSource() {
            super();
        }

        public long read(Buffer sink, long byteCount) throws IOException {
            if (byteCount < 0) {
                throw new IllegalArgumentException("byteCount < 0: " + byteCount);
            }
            if (this.closed) {
                throw new IllegalStateException("closed");
            }
            if (this.inputExhausted) {
                return -1L;
            }
            long read = Http1xStream.this.source.read(sink, byteCount);
            if (read == -1) {
                this.inputExhausted = true;
                endOfInput(true);
                return -1L;
            }
            return read;
        }

        public void close() throws IOException {
            if (this.closed) {
                return;
            }
            if (!this.inputExhausted) {
                endOfInput(false);
            }
            this.closed = true;
        }
    }
}
