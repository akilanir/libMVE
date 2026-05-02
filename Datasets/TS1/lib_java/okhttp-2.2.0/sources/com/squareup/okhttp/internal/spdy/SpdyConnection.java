package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.spdy.FrameReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/spdy/SpdyConnection.class */
public final class SpdyConnection implements Closeable {
    private static final ExecutorService executor;
    final Protocol protocol;
    final boolean client;
    private final IncomingStreamHandler handler;
    private final Map<Integer, SpdyStream> streams;
    private final String hostName;
    private int lastGoodStreamId;
    private int nextStreamId;
    private boolean shutdown;
    private long idleStartTimeNs;
    private final ExecutorService pushExecutor;
    private Map<Integer, Ping> pings;
    private final PushObserver pushObserver;
    private int nextPingId;
    long unacknowledgedBytesRead;
    long bytesLeftInWriteWindow;
    final Settings okHttpSettings;
    private static final int OKHTTP_CLIENT_WINDOW_SIZE = 16777216;
    final Settings peerSettings;
    private boolean receivedInitialPeerSettings;
    final Variant variant;
    final Socket socket;
    final FrameWriter frameWriter;
    final Reader readerRunnable;
    private final Set<Integer> currentPushRequests;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !SpdyConnection.class.desiredAssertionStatus();
        executor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue(), Util.threadFactory("OkHttp SpdyConnection", true));
    }

    private SpdyConnection(Builder builder) throws IOException {
        this.streams = new HashMap();
        this.idleStartTimeNs = System.nanoTime();
        this.unacknowledgedBytesRead = 0L;
        this.okHttpSettings = new Settings();
        this.peerSettings = new Settings();
        this.receivedInitialPeerSettings = false;
        this.currentPushRequests = new LinkedHashSet();
        this.protocol = builder.protocol;
        this.pushObserver = builder.pushObserver;
        this.client = builder.client;
        this.handler = builder.handler;
        this.nextStreamId = builder.client ? 1 : 2;
        if (builder.client && this.protocol == Protocol.HTTP_2) {
            this.nextStreamId += 2;
        }
        this.nextPingId = builder.client ? 1 : 2;
        if (builder.client) {
            this.okHttpSettings.set(7, 0, OKHTTP_CLIENT_WINDOW_SIZE);
        }
        this.hostName = builder.hostName;
        if (this.protocol == Protocol.HTTP_2) {
            this.variant = new Http20Draft16();
            this.pushExecutor = new ThreadPoolExecutor(0, 1, 60L, TimeUnit.SECONDS, new LinkedBlockingQueue(), Util.threadFactory(String.format("OkHttp %s Push Observer", this.hostName), true));
            this.peerSettings.set(7, 0, 65535);
            this.peerSettings.set(5, 0, 16384);
        } else if (this.protocol == Protocol.SPDY_3) {
            this.variant = new Spdy3();
            this.pushExecutor = null;
        } else {
            throw new AssertionError(this.protocol);
        }
        this.bytesLeftInWriteWindow = this.peerSettings.getInitialWindowSize(65536);
        this.socket = builder.socket;
        this.frameWriter = this.variant.newWriter(Okio.buffer(Okio.sink(builder.socket)), this.client);
        this.readerRunnable = new Reader();
        new Thread(this.readerRunnable).start();
    }

    public Protocol getProtocol() {
        return this.protocol;
    }

    public synchronized int openStreamCount() {
        return this.streams.size();
    }

    synchronized SpdyStream getStream(int id) {
        return this.streams.get(Integer.valueOf(id));
    }

    synchronized SpdyStream removeStream(int streamId) {
        SpdyStream stream = this.streams.remove(Integer.valueOf(streamId));
        if (stream != null && this.streams.isEmpty()) {
            setIdle(true);
        }
        return stream;
    }

    private synchronized void setIdle(boolean value) {
        this.idleStartTimeNs = value ? System.nanoTime() : Long.MAX_VALUE;
    }

    public synchronized boolean isIdle() {
        return this.idleStartTimeNs != Long.MAX_VALUE;
    }

    public synchronized long getIdleStartTimeNs() {
        return this.idleStartTimeNs;
    }

    public SpdyStream pushStream(int associatedStreamId, List<Header> requestHeaders, boolean out) throws IOException {
        if (this.client) {
            throw new IllegalStateException("Client cannot push requests.");
        }
        if (this.protocol != Protocol.HTTP_2) {
            throw new IllegalStateException("protocol != HTTP_2");
        }
        return newStream(associatedStreamId, requestHeaders, out, false);
    }

    public SpdyStream newStream(List<Header> requestHeaders, boolean out, boolean in) throws IOException {
        return newStream(0, requestHeaders, out, in);
    }

    private SpdyStream newStream(int associatedStreamId, List<Header> requestHeaders, boolean out, boolean in) throws IOException {
        int streamId;
        SpdyStream stream;
        boolean outFinished = !out;
        boolean inFinished = !in;
        synchronized (this.frameWriter) {
            synchronized (this) {
                if (this.shutdown) {
                    throw new IOException("shutdown");
                }
                streamId = this.nextStreamId;
                this.nextStreamId += 2;
                stream = new SpdyStream(streamId, this, outFinished, inFinished, requestHeaders);
                if (stream.isOpen()) {
                    this.streams.put(Integer.valueOf(streamId), stream);
                    setIdle(false);
                }
            }
            if (associatedStreamId == 0) {
                this.frameWriter.synStream(outFinished, inFinished, streamId, associatedStreamId, requestHeaders);
            } else {
                if (this.client) {
                    throw new IllegalArgumentException("client streams shouldn't have associated stream IDs");
                }
                this.frameWriter.pushPromise(associatedStreamId, streamId, requestHeaders);
            }
        }
        if (!out) {
            this.frameWriter.flush();
        }
        return stream;
    }

    void writeSynReply(int streamId, boolean outFinished, List<Header> alternating) throws IOException {
        this.frameWriter.synReply(outFinished, streamId, alternating);
    }

    public void writeData(int streamId, boolean outFinished, Buffer buffer, long byteCount) throws IOException {
        int toWrite;
        if (byteCount == 0) {
            this.frameWriter.data(outFinished, streamId, buffer, 0);
            return;
        }
        while (byteCount > 0) {
            synchronized (this) {
                while (this.bytesLeftInWriteWindow <= 0) {
                    try {
                        wait();
                    } catch (InterruptedException e) {
                        throw new InterruptedIOException();
                    }
                }
                toWrite = Math.min((int) Math.min(byteCount, this.bytesLeftInWriteWindow), this.frameWriter.maxDataLength());
                this.bytesLeftInWriteWindow -= toWrite;
            }
            byteCount -= toWrite;
            this.frameWriter.data(outFinished && byteCount == 0, streamId, buffer, toWrite);
        }
    }

    void addBytesToWriteWindow(long delta) {
        this.bytesLeftInWriteWindow += delta;
        if (delta > 0) {
            notifyAll();
        }
    }

    void writeSynResetLater(final int streamId, final ErrorCode errorCode) {
        executor.submit(new NamedRunnable("OkHttp %s stream %d", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.1
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                try {
                    SpdyConnection.this.writeSynReset(streamId, errorCode);
                } catch (IOException e) {
                }
            }
        });
    }

    void writeSynReset(int streamId, ErrorCode statusCode) throws IOException {
        this.frameWriter.rstStream(streamId, statusCode);
    }

    void writeWindowUpdateLater(final int streamId, final long unacknowledgedBytesRead) {
        executor.submit(new NamedRunnable("OkHttp Window Update %s stream %d", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.2
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                try {
                    SpdyConnection.this.frameWriter.windowUpdate(streamId, unacknowledgedBytesRead);
                } catch (IOException e) {
                }
            }
        });
    }

    public Ping ping() throws IOException {
        int pingId;
        Ping ping = new Ping();
        synchronized (this) {
            if (this.shutdown) {
                throw new IOException("shutdown");
            }
            pingId = this.nextPingId;
            this.nextPingId += 2;
            if (this.pings == null) {
                this.pings = new HashMap();
            }
            this.pings.put(Integer.valueOf(pingId), ping);
        }
        writePing(false, pingId, 1330343787, ping);
        return ping;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writePingLater(final boolean reply, final int payload1, final int payload2, final Ping ping) {
        executor.submit(new NamedRunnable("OkHttp %s ping %08x%08x", new Object[]{this.hostName, Integer.valueOf(payload1), Integer.valueOf(payload2)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.3
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                try {
                    SpdyConnection.this.writePing(reply, payload1, payload2, ping);
                } catch (IOException e) {
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writePing(boolean reply, int payload1, int payload2, Ping ping) throws IOException {
        synchronized (this.frameWriter) {
            if (ping != null) {
                ping.send();
                this.frameWriter.ping(reply, payload1, payload2);
            } else {
                this.frameWriter.ping(reply, payload1, payload2);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized Ping removePing(int id) {
        if (this.pings != null) {
            return this.pings.remove(Integer.valueOf(id));
        }
        return null;
    }

    public void flush() throws IOException {
        this.frameWriter.flush();
    }

    public void shutdown(ErrorCode statusCode) throws IOException {
        synchronized (this.frameWriter) {
            synchronized (this) {
                if (this.shutdown) {
                    return;
                }
                this.shutdown = true;
                int lastGoodStreamId = this.lastGoodStreamId;
                this.frameWriter.goAway(lastGoodStreamId, statusCode, Util.EMPTY_BYTE_ARRAY);
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        close(ErrorCode.NO_ERROR, ErrorCode.CANCEL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void close(ErrorCode connectionCode, ErrorCode streamCode) throws IOException {
        if (!$assertionsDisabled && Thread.holdsLock(this)) {
            throw new AssertionError();
        }
        IOException thrown = null;
        try {
            shutdown(connectionCode);
        } catch (IOException e) {
            thrown = e;
        }
        SpdyStream[] streamsToClose = null;
        Ping[] pingsToCancel = null;
        synchronized (this) {
            if (!this.streams.isEmpty()) {
                streamsToClose = (SpdyStream[]) this.streams.values().toArray(new SpdyStream[this.streams.size()]);
                this.streams.clear();
                setIdle(false);
            }
            if (this.pings != null) {
                pingsToCancel = (Ping[]) this.pings.values().toArray(new Ping[this.pings.size()]);
                this.pings = null;
            }
        }
        if (streamsToClose != null) {
            for (SpdyStream stream : streamsToClose) {
                try {
                    stream.close(streamCode);
                } catch (IOException e2) {
                    if (thrown != null) {
                        thrown = e2;
                    }
                }
            }
        }
        if (pingsToCancel != null) {
            for (Ping ping : pingsToCancel) {
                ping.cancel();
            }
        }
        try {
            this.frameWriter.close();
        } catch (IOException e3) {
            if (thrown == null) {
                thrown = e3;
            }
        }
        try {
            this.socket.close();
        } catch (IOException e4) {
            thrown = e4;
        }
        if (thrown != null) {
            throw thrown;
        }
    }

    public void sendConnectionPreface() throws IOException {
        this.frameWriter.connectionPreface();
        this.frameWriter.settings(this.okHttpSettings);
        int windowSize = this.okHttpSettings.getInitialWindowSize(65536);
        if (windowSize != 65536) {
            this.frameWriter.windowUpdate(0, windowSize - 65536);
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/spdy/SpdyConnection$Builder.class */
    public static class Builder {
        private String hostName;
        private Socket socket;
        private IncomingStreamHandler handler;
        private Protocol protocol;
        private PushObserver pushObserver;
        private boolean client;

        public Builder(boolean client, Socket socket) throws IOException {
            this(((InetSocketAddress) socket.getRemoteSocketAddress()).getHostName(), client, socket);
        }

        public Builder(String hostName, boolean client, Socket socket) throws IOException {
            this.handler = IncomingStreamHandler.REFUSE_INCOMING_STREAMS;
            this.protocol = Protocol.SPDY_3;
            this.pushObserver = PushObserver.CANCEL;
            this.hostName = hostName;
            this.client = client;
            this.socket = socket;
        }

        public Builder handler(IncomingStreamHandler handler) {
            this.handler = handler;
            return this;
        }

        public Builder protocol(Protocol protocol) {
            this.protocol = protocol;
            return this;
        }

        public Builder pushObserver(PushObserver pushObserver) {
            this.pushObserver = pushObserver;
            return this;
        }

        public SpdyConnection build() throws IOException {
            return new SpdyConnection(this);
        }
    }

    /* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/spdy/SpdyConnection$Reader.class */
    class Reader extends NamedRunnable implements FrameReader.Handler {
        FrameReader frameReader;

        private Reader() {
            super("OkHttp %s", SpdyConnection.this.hostName);
        }

        @Override // com.squareup.okhttp.internal.NamedRunnable
        protected void execute() {
            ErrorCode connectionErrorCode = ErrorCode.INTERNAL_ERROR;
            ErrorCode streamErrorCode = ErrorCode.INTERNAL_ERROR;
            try {
                try {
                    this.frameReader = SpdyConnection.this.variant.newReader(Okio.buffer(Okio.source(SpdyConnection.this.socket)), SpdyConnection.this.client);
                    if (!SpdyConnection.this.client) {
                        this.frameReader.readConnectionPreface();
                    }
                    while (this.frameReader.nextFrame(this)) {
                    }
                    connectionErrorCode = ErrorCode.NO_ERROR;
                    streamErrorCode = ErrorCode.CANCEL;
                    try {
                        SpdyConnection.this.close(connectionErrorCode, streamErrorCode);
                    } catch (IOException e) {
                    }
                    Util.closeQuietly(this.frameReader);
                } catch (IOException e2) {
                    connectionErrorCode = ErrorCode.PROTOCOL_ERROR;
                    streamErrorCode = ErrorCode.PROTOCOL_ERROR;
                    try {
                        SpdyConnection.this.close(connectionErrorCode, streamErrorCode);
                    } catch (IOException e3) {
                    }
                    Util.closeQuietly(this.frameReader);
                }
            } catch (Throwable th) {
                try {
                    SpdyConnection.this.close(connectionErrorCode, streamErrorCode);
                } catch (IOException e4) {
                }
                Util.closeQuietly(this.frameReader);
                throw th;
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void data(boolean inFinished, int streamId, BufferedSource source, int length) throws IOException {
            if (SpdyConnection.this.pushedStream(streamId)) {
                SpdyConnection.this.pushDataLater(streamId, source, length, inFinished);
                return;
            }
            SpdyStream dataStream = SpdyConnection.this.getStream(streamId);
            if (dataStream == null) {
                SpdyConnection.this.writeSynResetLater(streamId, ErrorCode.INVALID_STREAM);
                source.skip(length);
            } else {
                dataStream.receiveData(source, length);
                if (inFinished) {
                    dataStream.receiveFin();
                }
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void headers(boolean outFinished, boolean inFinished, int streamId, int associatedStreamId, List<Header> headerBlock, HeadersMode headersMode) {
            if (SpdyConnection.this.pushedStream(streamId)) {
                SpdyConnection.this.pushHeadersLater(streamId, headerBlock, inFinished);
                return;
            }
            synchronized (SpdyConnection.this) {
                if (SpdyConnection.this.shutdown) {
                    return;
                }
                SpdyStream stream = SpdyConnection.this.getStream(streamId);
                if (stream == null) {
                    if (headersMode.failIfStreamAbsent()) {
                        SpdyConnection.this.writeSynResetLater(streamId, ErrorCode.INVALID_STREAM);
                        return;
                    }
                    if (streamId <= SpdyConnection.this.lastGoodStreamId) {
                        return;
                    }
                    if (streamId % 2 == SpdyConnection.this.nextStreamId % 2) {
                        return;
                    }
                    final SpdyStream newStream = new SpdyStream(streamId, SpdyConnection.this, outFinished, inFinished, headerBlock);
                    SpdyConnection.this.lastGoodStreamId = streamId;
                    SpdyConnection.this.streams.put(Integer.valueOf(streamId), newStream);
                    SpdyConnection.executor.submit(new NamedRunnable("OkHttp %s stream %d", new Object[]{SpdyConnection.this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.Reader.1
                        @Override // com.squareup.okhttp.internal.NamedRunnable
                        public void execute() {
                            try {
                                SpdyConnection.this.handler.receive(newStream);
                            } catch (IOException e) {
                                throw new RuntimeException(e);
                            }
                        }
                    });
                    return;
                }
                if (headersMode.failIfStreamPresent()) {
                    stream.closeLater(ErrorCode.PROTOCOL_ERROR);
                    SpdyConnection.this.removeStream(streamId);
                } else {
                    stream.receiveHeaders(headerBlock, headersMode);
                    if (inFinished) {
                        stream.receiveFin();
                    }
                }
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void rstStream(int streamId, ErrorCode errorCode) {
            if (SpdyConnection.this.pushedStream(streamId)) {
                SpdyConnection.this.pushResetLater(streamId, errorCode);
                return;
            }
            SpdyStream rstStream = SpdyConnection.this.removeStream(streamId);
            if (rstStream != null) {
                rstStream.receiveRstStream(errorCode);
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void settings(boolean clearPrevious, Settings newSettings) {
            long delta = 0;
            SpdyStream[] streamsToNotify = null;
            synchronized (SpdyConnection.this) {
                int priorWriteWindowSize = SpdyConnection.this.peerSettings.getInitialWindowSize(65536);
                if (clearPrevious) {
                    SpdyConnection.this.peerSettings.clear();
                }
                SpdyConnection.this.peerSettings.merge(newSettings);
                if (SpdyConnection.this.getProtocol() == Protocol.HTTP_2) {
                    ackSettingsLater(newSettings);
                }
                int peerInitialWindowSize = SpdyConnection.this.peerSettings.getInitialWindowSize(65536);
                if (peerInitialWindowSize != -1 && peerInitialWindowSize != priorWriteWindowSize) {
                    delta = peerInitialWindowSize - priorWriteWindowSize;
                    if (!SpdyConnection.this.receivedInitialPeerSettings) {
                        SpdyConnection.this.addBytesToWriteWindow(delta);
                        SpdyConnection.this.receivedInitialPeerSettings = true;
                    }
                    if (!SpdyConnection.this.streams.isEmpty()) {
                        streamsToNotify = (SpdyStream[]) SpdyConnection.this.streams.values().toArray(new SpdyStream[SpdyConnection.this.streams.size()]);
                    }
                }
            }
            if (streamsToNotify != null && delta != 0) {
                for (SpdyStream stream : streamsToNotify) {
                    synchronized (stream) {
                        stream.addBytesToWriteWindow(delta);
                    }
                }
            }
        }

        private void ackSettingsLater(final Settings peerSettings) {
            SpdyConnection.executor.submit(new NamedRunnable("OkHttp %s ACK Settings", new Object[]{SpdyConnection.this.hostName}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.Reader.2
                @Override // com.squareup.okhttp.internal.NamedRunnable
                public void execute() {
                    try {
                        SpdyConnection.this.frameWriter.ackSettings(peerSettings);
                    } catch (IOException e) {
                    }
                }
            });
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void ackSettings() {
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void ping(boolean reply, int payload1, int payload2) {
            if (reply) {
                Ping ping = SpdyConnection.this.removePing(payload1);
                if (ping != null) {
                    ping.receive();
                    return;
                }
                return;
            }
            SpdyConnection.this.writePingLater(true, payload1, payload2, null);
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void goAway(int lastGoodStreamId, ErrorCode errorCode, ByteString debugData) {
            SpdyStream[] streamsCopy;
            if (debugData.size() > 0) {
            }
            synchronized (SpdyConnection.this) {
                streamsCopy = (SpdyStream[]) SpdyConnection.this.streams.values().toArray(new SpdyStream[SpdyConnection.this.streams.size()]);
                SpdyConnection.this.shutdown = true;
            }
            for (SpdyStream spdyStream : streamsCopy) {
                if (spdyStream.getId() > lastGoodStreamId && spdyStream.isLocallyInitiated()) {
                    spdyStream.receiveRstStream(ErrorCode.REFUSED_STREAM);
                    SpdyConnection.this.removeStream(spdyStream.getId());
                }
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void windowUpdate(int streamId, long windowSizeIncrement) {
            if (streamId == 0) {
                synchronized (SpdyConnection.this) {
                    SpdyConnection.this.bytesLeftInWriteWindow += windowSizeIncrement;
                    SpdyConnection.this.notifyAll();
                }
                return;
            }
            SpdyStream stream = SpdyConnection.this.getStream(streamId);
            if (stream != null) {
                synchronized (stream) {
                    stream.addBytesToWriteWindow(windowSizeIncrement);
                }
            }
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void priority(int streamId, int streamDependency, int weight, boolean exclusive) {
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void pushPromise(int streamId, int promisedStreamId, List<Header> requestHeaders) {
            SpdyConnection.this.pushRequestLater(promisedStreamId, requestHeaders);
        }

        @Override // com.squareup.okhttp.internal.spdy.FrameReader.Handler
        public void alternateService(int streamId, String origin, ByteString protocol, String host, int port, long maxAge) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pushedStream(int streamId) {
        return this.protocol == Protocol.HTTP_2 && streamId != 0 && (streamId & 1) == 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pushRequestLater(final int streamId, final List<Header> requestHeaders) {
        synchronized (this) {
            if (this.currentPushRequests.contains(Integer.valueOf(streamId))) {
                writeSynResetLater(streamId, ErrorCode.PROTOCOL_ERROR);
            } else {
                this.currentPushRequests.add(Integer.valueOf(streamId));
                this.pushExecutor.submit(new NamedRunnable("OkHttp %s Push Request[%s]", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.4
                    @Override // com.squareup.okhttp.internal.NamedRunnable
                    public void execute() {
                        boolean cancel = SpdyConnection.this.pushObserver.onRequest(streamId, requestHeaders);
                        if (cancel) {
                            try {
                                SpdyConnection.this.frameWriter.rstStream(streamId, ErrorCode.CANCEL);
                                synchronized (SpdyConnection.this) {
                                    SpdyConnection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                                }
                            } catch (IOException e) {
                            }
                        }
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pushHeadersLater(final int streamId, final List<Header> requestHeaders, final boolean inFinished) {
        this.pushExecutor.submit(new NamedRunnable("OkHttp %s Push Headers[%s]", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.5
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                boolean cancel = SpdyConnection.this.pushObserver.onHeaders(streamId, requestHeaders, inFinished);
                if (cancel) {
                    try {
                        SpdyConnection.this.frameWriter.rstStream(streamId, ErrorCode.CANCEL);
                    } catch (IOException e) {
                        return;
                    }
                }
                if (cancel || inFinished) {
                    synchronized (SpdyConnection.this) {
                        SpdyConnection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pushDataLater(final int streamId, BufferedSource source, final int byteCount, final boolean inFinished) throws IOException {
        final Buffer buffer = new Buffer();
        source.require(byteCount);
        source.read(buffer, byteCount);
        if (buffer.size() != byteCount) {
            throw new IOException(buffer.size() + " != " + byteCount);
        }
        this.pushExecutor.submit(new NamedRunnable("OkHttp %s Push Data[%s]", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.6
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                try {
                    boolean cancel = SpdyConnection.this.pushObserver.onData(streamId, buffer, byteCount, inFinished);
                    if (cancel) {
                        SpdyConnection.this.frameWriter.rstStream(streamId, ErrorCode.CANCEL);
                    }
                    if (cancel || inFinished) {
                        synchronized (SpdyConnection.this) {
                            SpdyConnection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                        }
                    }
                } catch (IOException e) {
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pushResetLater(final int streamId, final ErrorCode errorCode) {
        this.pushExecutor.submit(new NamedRunnable("OkHttp %s Push Reset[%s]", new Object[]{this.hostName, Integer.valueOf(streamId)}) { // from class: com.squareup.okhttp.internal.spdy.SpdyConnection.7
            @Override // com.squareup.okhttp.internal.NamedRunnable
            public void execute() {
                SpdyConnection.this.pushObserver.onReset(streamId, errorCode);
                synchronized (SpdyConnection.this) {
                    SpdyConnection.this.currentPushRequests.remove(Integer.valueOf(streamId));
                }
            }
        });
    }
}
