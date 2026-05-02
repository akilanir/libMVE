package com.squareup.okhttp.internal.spdy;

import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.ArrayList;
import java.util.List;
import okio.AsyncTimeout;
import okio.Buffer;
import okio.BufferedSource;
import okio.Sink;
import okio.Source;
import okio.Timeout;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/SpdyStream.class */
public final class SpdyStream {
    long bytesLeftInWriteWindow;
    private final int id;
    private final SpdyConnection connection;
    private final List<Header> requestHeaders;
    private List<Header> responseHeaders;
    private final SpdyDataSource source;
    final SpdyDataSink sink;
    static final /* synthetic */ boolean $assertionsDisabled;
    long unacknowledgedBytesRead = 0;
    private final SpdyTimeout readTimeout = new SpdyTimeout();
    private final SpdyTimeout writeTimeout = new SpdyTimeout();
    private ErrorCode errorCode = null;

    static {
        $assertionsDisabled = !SpdyStream.class.desiredAssertionStatus();
    }

    SpdyStream(int id, SpdyConnection connection, boolean outFinished, boolean inFinished, List<Header> requestHeaders) {
        if (connection == null) {
            throw new NullPointerException("connection == null");
        }
        if (requestHeaders == null) {
            throw new NullPointerException("requestHeaders == null");
        }
        this.id = id;
        this.connection = connection;
        this.bytesLeftInWriteWindow = connection.peerSettings.getInitialWindowSize(65536);
        this.source = new SpdyDataSource(connection.okHttpSettings.getInitialWindowSize(65536));
        this.sink = new SpdyDataSink();
        this.source.finished = inFinished;
        this.sink.finished = outFinished;
        this.requestHeaders = requestHeaders;
    }

    public int getId() {
        return this.id;
    }

    public synchronized boolean isOpen() {
        if (this.errorCode != null) {
            return false;
        }
        if (!this.source.finished && !this.source.closed) {
            return true;
        }
        if ((this.sink.finished || this.sink.closed) && this.responseHeaders != null) {
            return false;
        }
        return true;
    }

    public boolean isLocallyInitiated() {
        boolean streamIsClient = (this.id & 1) == 1;
        return this.connection.client == streamIsClient;
    }

    public SpdyConnection getConnection() {
        return this.connection;
    }

    public List<Header> getRequestHeaders() {
        return this.requestHeaders;
    }

    public synchronized List<Header> getResponseHeaders() throws IOException {
        this.readTimeout.enter();
        while (this.responseHeaders == null && this.errorCode == null) {
            try {
                waitForIo();
            } finally {
                this.readTimeout.exitAndThrowIfTimedOut();
            }
        }
        if (this.responseHeaders != null) {
            return this.responseHeaders;
        }
        throw new IOException("stream was reset: " + this.errorCode);
    }

    public synchronized ErrorCode getErrorCode() {
        return this.errorCode;
    }

    public void reply(List<Header> responseHeaders, boolean out) throws IOException {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        boolean outFinished = false;
        synchronized (this) {
            if (responseHeaders == null) {
                throw new NullPointerException("responseHeaders == null");
            }
            if (this.responseHeaders != null) {
                throw new IllegalStateException("reply already sent");
            }
            this.responseHeaders = responseHeaders;
            if (!out) {
                this.sink.finished = true;
                outFinished = true;
            }
        }
        this.connection.writeSynReply(this.id, outFinished, responseHeaders);
        if (outFinished) {
            this.connection.flush();
        }
    }

    public Timeout readTimeout() {
        return this.readTimeout;
    }

    public Timeout writeTimeout() {
        return this.writeTimeout;
    }

    public Source getSource() {
        return this.source;
    }

    public Sink getSink() {
        synchronized (this) {
            if (this.responseHeaders == null && !isLocallyInitiated()) {
                throw new IllegalStateException("reply before requesting the sink");
            }
        }
        return this.sink;
    }

    public void close(ErrorCode rstStatusCode) throws IOException {
        if (!closeInternal(rstStatusCode)) {
            return;
        }
        this.connection.writeSynReset(this.id, rstStatusCode);
    }

    public void closeLater(ErrorCode errorCode) {
        if (!closeInternal(errorCode)) {
            return;
        }
        this.connection.writeSynResetLater(this.id, errorCode);
    }

    private boolean closeInternal(ErrorCode errorCode) {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this) {
            if (this.errorCode != null) {
                return false;
            }
            if (this.source.finished && this.sink.finished) {
                return false;
            }
            this.errorCode = errorCode;
            notifyAll();
            this.connection.removeStream(this.id);
            return true;
        }
    }

    void receiveHeaders(List<Header> headers, HeadersMode headersMode) {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        ErrorCode errorCode = null;
        boolean open = true;
        synchronized (this) {
            if (this.responseHeaders == null) {
                if (headersMode.failIfHeadersAbsent()) {
                    errorCode = ErrorCode.PROTOCOL_ERROR;
                } else {
                    this.responseHeaders = headers;
                    open = isOpen();
                    notifyAll();
                }
            } else if (headersMode.failIfHeadersPresent()) {
                errorCode = ErrorCode.STREAM_IN_USE;
            } else {
                List<Header> newHeaders = new ArrayList<>();
                newHeaders.addAll(this.responseHeaders);
                newHeaders.addAll(headers);
                this.responseHeaders = newHeaders;
            }
        }
        if (errorCode != null) {
            closeLater(errorCode);
        } else if (!open) {
            this.connection.removeStream(this.id);
        }
    }

    void receiveData(BufferedSource in, int length) throws IOException {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        this.source.receive(in, length);
    }

    void receiveFin() {
        boolean open;
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this) {
            this.source.finished = true;
            open = isOpen();
            notifyAll();
        }
        if (!open) {
            this.connection.removeStream(this.id);
        }
    }

    synchronized void receiveRstStream(ErrorCode errorCode) {
        if (this.errorCode == null) {
            this.errorCode = errorCode;
            notifyAll();
        }
    }

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource.class */
    private final class SpdyDataSource implements Source {
        private final Buffer receiveBuffer;
        private final Buffer readBuffer;
        private final long maxByteCount;
        private boolean closed;
        private boolean finished;
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !SpdyStream.class.desiredAssertionStatus();
        }

        private SpdyDataSource(long maxByteCount) {
            this.receiveBuffer = new Buffer();
            this.readBuffer = new Buffer();
            this.maxByteCount = maxByteCount;
        }

        public long read(Buffer sink, long byteCount) throws IOException {
            if (byteCount < 0) {
                throw new IllegalArgumentException("byteCount < 0: " + byteCount);
            }
            synchronized (SpdyStream.this) {
                waitUntilReadable();
                checkNotClosed();
                if (this.readBuffer.size() == 0) {
                    return -1L;
                }
                long read = this.readBuffer.read(sink, Math.min(byteCount, this.readBuffer.size()));
                SpdyStream.this.unacknowledgedBytesRead += read;
                if (SpdyStream.this.unacknowledgedBytesRead >= SpdyStream.this.connection.okHttpSettings.getInitialWindowSize(65536) / 2) {
                    SpdyStream.this.connection.writeWindowUpdateLater(SpdyStream.this.id, SpdyStream.this.unacknowledgedBytesRead);
                    SpdyStream.this.unacknowledgedBytesRead = 0L;
                }
                synchronized (SpdyStream.this.connection) {
                    SpdyStream.this.connection.unacknowledgedBytesRead += read;
                    if (SpdyStream.this.connection.unacknowledgedBytesRead >= SpdyStream.this.connection.okHttpSettings.getInitialWindowSize(65536) / 2) {
                        SpdyStream.this.connection.writeWindowUpdateLater(0, SpdyStream.this.connection.unacknowledgedBytesRead);
                        SpdyStream.this.connection.unacknowledgedBytesRead = 0L;
                    }
                }
                return read;
            }
        }

        private void waitUntilReadable() throws IOException {
            SpdyStream.this.readTimeout.enter();
            while (this.readBuffer.size() == 0 && !this.finished && !this.closed && SpdyStream.this.errorCode == null) {
                try {
                    SpdyStream.this.waitForIo();
                } finally {
                    SpdyStream.this.readTimeout.exitAndThrowIfTimedOut();
                }
            }
        }

        void receive(BufferedSource in, long byteCount) throws IOException {
            boolean finished;
            boolean flowControlError;
            if (!$assertionsDisabled && Thread.holdsLock(SpdyStream.this)) {
                throw new AssertionError();
            }
            while (byteCount > 0) {
                synchronized (SpdyStream.this) {
                    finished = this.finished;
                    flowControlError = byteCount + this.readBuffer.size() > this.maxByteCount;
                }
                if (flowControlError) {
                    in.skip(byteCount);
                    SpdyStream.this.closeLater(ErrorCode.FLOW_CONTROL_ERROR);
                    return;
                }
                if (finished) {
                    in.skip(byteCount);
                    return;
                }
                long read = in.read(this.receiveBuffer, byteCount);
                if (read == -1) {
                    throw new EOFException();
                }
                byteCount -= read;
                synchronized (SpdyStream.this) {
                    boolean wasEmpty = this.readBuffer.size() == 0;
                    this.readBuffer.writeAll(this.receiveBuffer);
                    if (wasEmpty) {
                        SpdyStream.this.notifyAll();
                    }
                }
            }
        }

        public Timeout timeout() {
            return SpdyStream.this.readTimeout;
        }

        public void close() throws IOException {
            synchronized (SpdyStream.this) {
                this.closed = true;
                this.readBuffer.clear();
                SpdyStream.this.notifyAll();
            }
            SpdyStream.this.cancelStreamIfNecessary();
        }

        private void checkNotClosed() throws IOException {
            if (!this.closed) {
                if (SpdyStream.this.errorCode != null) {
                    throw new IOException("stream was reset: " + SpdyStream.this.errorCode);
                }
                return;
            }
            throw new IOException("stream closed");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelStreamIfNecessary() throws IOException {
        boolean cancel;
        boolean open;
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        synchronized (this) {
            cancel = !this.source.finished && this.source.closed && (this.sink.finished || this.sink.closed);
            open = isOpen();
        }
        if (cancel) {
            close(ErrorCode.CANCEL);
        } else if (!open) {
            this.connection.removeStream(this.id);
        }
    }

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSink.class */
    final class SpdyDataSink implements Sink {
        private static final long EMIT_BUFFER_SIZE = 16384;
        private final Buffer sendBuffer = new Buffer();
        private boolean closed;
        private boolean finished;
        static final /* synthetic */ boolean $assertionsDisabled;

        SpdyDataSink() {
        }

        static {
            $assertionsDisabled = !SpdyStream.class.desiredAssertionStatus();
        }

        public void write(Buffer source, long byteCount) throws IOException {
            if (!$assertionsDisabled && Thread.holdsLock(SpdyStream.this)) {
                throw new AssertionError();
            }
            this.sendBuffer.write(source, byteCount);
            while (this.sendBuffer.size() >= EMIT_BUFFER_SIZE) {
                emitDataFrame(false);
            }
        }

        /* JADX WARN: Finally extract failed */
        private void emitDataFrame(boolean outFinished) throws IOException {
            long toWrite;
            synchronized (SpdyStream.this) {
                SpdyStream.this.writeTimeout.enter();
                while (SpdyStream.this.bytesLeftInWriteWindow <= 0 && !this.finished && !this.closed && SpdyStream.this.errorCode == null) {
                    try {
                        SpdyStream.this.waitForIo();
                    } catch (Throwable th) {
                        SpdyStream.this.writeTimeout.exitAndThrowIfTimedOut();
                        throw th;
                    }
                }
                SpdyStream.this.writeTimeout.exitAndThrowIfTimedOut();
                SpdyStream.this.checkOutNotClosed();
                toWrite = Math.min(SpdyStream.this.bytesLeftInWriteWindow, this.sendBuffer.size());
                SpdyStream.this.bytesLeftInWriteWindow -= toWrite;
            }
            SpdyStream.this.connection.writeData(SpdyStream.this.id, outFinished && toWrite == this.sendBuffer.size(), this.sendBuffer, toWrite);
        }

        public void flush() throws IOException {
            if (!$assertionsDisabled && Thread.holdsLock(SpdyStream.this)) {
                throw new AssertionError();
            }
            synchronized (SpdyStream.this) {
                SpdyStream.this.checkOutNotClosed();
            }
            while (this.sendBuffer.size() > 0) {
                emitDataFrame(false);
            }
            SpdyStream.this.connection.flush();
        }

        public Timeout timeout() {
            return SpdyStream.this.writeTimeout;
        }

        public void close() throws IOException {
            if (!$assertionsDisabled && Thread.holdsLock(SpdyStream.this)) {
                throw new AssertionError();
            }
            synchronized (SpdyStream.this) {
                if (this.closed) {
                    return;
                }
                if (!SpdyStream.this.sink.finished) {
                    if (this.sendBuffer.size() > 0) {
                        while (this.sendBuffer.size() > 0) {
                            emitDataFrame(true);
                        }
                    } else {
                        SpdyStream.this.connection.writeData(SpdyStream.this.id, true, null, 0L);
                    }
                }
                synchronized (SpdyStream.this) {
                    this.closed = true;
                }
                SpdyStream.this.connection.flush();
                SpdyStream.this.cancelStreamIfNecessary();
            }
        }
    }

    void addBytesToWriteWindow(long delta) {
        this.bytesLeftInWriteWindow += delta;
        if (delta > 0) {
            notifyAll();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkOutNotClosed() throws IOException {
        if (!this.sink.closed) {
            if (this.sink.finished) {
                throw new IOException("stream finished");
            }
            if (this.errorCode != null) {
                throw new IOException("stream was reset: " + this.errorCode);
            }
            return;
        }
        throw new IOException("stream closed");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void waitForIo() throws InterruptedIOException {
        try {
            wait();
        } catch (InterruptedException e) {
            throw new InterruptedIOException();
        }
    }

    /* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout.class */
    class SpdyTimeout extends AsyncTimeout {
        SpdyTimeout() {
        }

        protected void timedOut() {
            SpdyStream.this.closeLater(ErrorCode.CANCEL);
        }

        public void exitAndThrowIfTimedOut() throws InterruptedIOException {
            if (exit()) {
                throw new InterruptedIOException("timeout");
            }
        }
    }
}
