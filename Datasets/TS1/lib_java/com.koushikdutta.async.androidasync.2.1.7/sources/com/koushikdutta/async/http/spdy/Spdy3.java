package com.koushikdutta.async.http.spdy;

import com.koushikdutta.async.BufferedDataSink;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataEmitterReader;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.DataCallback;
import com.koushikdutta.async.http.Protocol;
import com.koushikdutta.async.http.cache.ResponseCacheMiddleware;
import com.koushikdutta.async.http.spdy.FrameReader;
import com.koushikdutta.async.util.Charsets;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.ProtocolException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.List;
import java.util.zip.Deflater;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/spdy/Spdy3.class */
final class Spdy3 implements Variant {
    static final int TYPE_DATA = 0;
    static final int TYPE_SYN_STREAM = 1;
    static final int TYPE_SYN_REPLY = 2;
    static final int TYPE_RST_STREAM = 3;
    static final int TYPE_SETTINGS = 4;
    static final int TYPE_PING = 6;
    static final int TYPE_GOAWAY = 7;
    static final int TYPE_HEADERS = 8;
    static final int TYPE_WINDOW_UPDATE = 9;
    static final int FLAG_FIN = 1;
    static final int FLAG_UNIDIRECTIONAL = 2;
    static final int VERSION = 3;
    static final byte[] DICTIONARY;

    Spdy3() {
    }

    @Override // com.koushikdutta.async.http.spdy.Variant
    public Protocol getProtocol() {
        return Protocol.SPDY_3;
    }

    static {
        try {
            DICTIONARY = "������\u0007options������\u0004head������\u0004post������\u0003put������\u0006delete������\u0005trace������\u0006accept������\u000eaccept-charset������\u000faccept-encoding������\u000faccept-language������\raccept-ranges������\u0003age������\u0005allow������\rauthorization������\rcache-control������\nconnection������\fcontent-base������\u0010content-encoding������\u0010content-language������\u000econtent-length������\u0010content-location������\u000bcontent-md5������\rcontent-range������\fcontent-type������\u0004date������\u0004etag������\u0006expect������\u0007expires������\u0004from������\u0004host������\bif-match������\u0011if-modified-since������\rif-none-match������\bif-range������\u0013if-unmodified-since������\rlast-modified������\blocation������\fmax-forwards������\u0006pragma������\u0012proxy-authenticate������\u0013proxy-authorization������\u0005range������\u0007referer������\u000bretry-after������\u0006server������\u0002te������\u0007trailer������\u0011transfer-encoding������\u0007upgrade������\nuser-agent������\u0004vary������\u0003via������\u0007warning������\u0010www-authenticate������\u0006method������\u0003get������\u0006status������\u0006200 OK������\u0007version������\bHTTP/1.1������\u0003url������\u0006public������\nset-cookie������\nkeep-alive������\u0006origin100101201202205206300302303304305306307402405406407408409410411412413414415416417502504505203 Non-Authoritative Information204 No Content301 Moved Permanently400 Bad Request401 Unauthorized403 Forbidden404 Not Found500 Internal Server Error501 Not Implemented503 Service UnavailableJan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec 00:00:00 Mon, Tue, Wed, Thu, Fri, Sat, Sun, GMTchunked,text/html,image/png,image/jpg,image/gif,application/xml,application/xhtml+xml,text/plain,text/javascript,publicprivatemax-age=gzip,deflate,sdchcharset=utf-8charset=iso-8859-1,utf-,*,enq=0.".getBytes(Charsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError();
        }
    }

    @Override // com.koushikdutta.async.http.spdy.Variant
    public FrameReader newReader(DataEmitter source, FrameReader.Handler handler, boolean client) {
        return new Reader(source, handler, client);
    }

    @Override // com.koushikdutta.async.http.spdy.Variant
    public FrameWriter newWriter(BufferedDataSink sink, boolean client) {
        return new Writer(sink, client);
    }

    @Override // com.koushikdutta.async.http.spdy.Variant
    public int maxFrameSize() {
        return 16383;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/spdy/Spdy3$Reader.class */
    static final class Reader implements FrameReader {
        private final DataEmitter emitter;
        private final boolean client;
        private final FrameReader.Handler handler;
        private final DataEmitterReader reader;
        int w1;
        int w2;
        int flags;
        int length;
        int streamId;
        boolean inFinished;
        private final HeaderReader headerReader = new HeaderReader();
        private final ByteBufferList emptyList = new ByteBufferList();
        private final DataCallback onFrame = new DataCallback() { // from class: com.koushikdutta.async.http.spdy.Spdy3.Reader.2
            @Override // com.koushikdutta.async.callback.DataCallback
            public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
                bb.order(ByteOrder.BIG_ENDIAN);
                Reader.this.w1 = bb.getInt();
                Reader.this.w2 = bb.getInt();
                boolean control = (Reader.this.w1 & Integer.MIN_VALUE) != 0;
                Reader.this.flags = (Reader.this.w2 & (-16777216)) >>> 24;
                Reader.this.length = Reader.this.w2 & 16777215;
                if (control) {
                    Reader.this.reader.read(Reader.this.length, Reader.this.onFullFrame);
                    return;
                }
                Reader.this.streamId = Reader.this.w1 & Integer.MAX_VALUE;
                Reader.this.inFinished = (Reader.this.flags & 1) != 0;
                emitter.setDataCallback(Reader.this.onDataFrame);
                if (Reader.this.length == 0) {
                    Reader.this.onDataFrame.onDataAvailable(emitter, Reader.this.emptyList);
                }
            }
        };
        ByteBufferList partial = new ByteBufferList();
        private final DataCallback onDataFrame = new DataCallback() { // from class: com.koushikdutta.async.http.spdy.Spdy3.Reader.3
            @Override // com.koushikdutta.async.callback.DataCallback
            public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
                int toRead = Math.min(bb.remaining(), Reader.this.length);
                if (toRead < bb.remaining()) {
                    bb.get(Reader.this.partial, toRead);
                    bb = Reader.this.partial;
                }
                Reader.this.length -= toRead;
                Reader.this.handler.data(Reader.this.length == 0 && Reader.this.inFinished, Reader.this.streamId, bb);
                if (Reader.this.length == 0) {
                    Reader.this.parseFrameHeader();
                }
            }
        };
        private final DataCallback onFullFrame = new DataCallback() { // from class: com.koushikdutta.async.http.spdy.Spdy3.Reader.4
            @Override // com.koushikdutta.async.callback.DataCallback
            public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
                bb.order(ByteOrder.BIG_ENDIAN);
                int version = (Reader.this.w1 & 2147418112) >>> 16;
                int type = Reader.this.w1 & 65535;
                try {
                    if (version == 3) {
                        switch (type) {
                            case ResponseCacheMiddleware.ENTRY_BODY /* 1 */:
                                Reader.this.readSynStream(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case ResponseCacheMiddleware.ENTRY_COUNT /* 2 */:
                                Reader.this.readSynReply(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case 3:
                                Reader.this.readRstStream(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case Spdy3.TYPE_SETTINGS /* 4 */:
                                Reader.this.readSettings(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case 5:
                            default:
                                bb.recycle();
                                break;
                            case Spdy3.TYPE_PING /* 6 */:
                                Reader.this.readPing(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case 7:
                                Reader.this.readGoAway(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case Spdy3.TYPE_HEADERS /* 8 */:
                                Reader.this.readHeaders(bb, Reader.this.flags, Reader.this.length);
                                break;
                            case Spdy3.TYPE_WINDOW_UPDATE /* 9 */:
                                Reader.this.readWindowUpdate(bb, Reader.this.flags, Reader.this.length);
                                break;
                        }
                        Reader.this.parseFrameHeader();
                        return;
                    }
                    throw new ProtocolException("version != 3: " + version);
                } catch (IOException e) {
                    Reader.this.handler.error(e);
                }
            }
        };

        Reader(DataEmitter emitter, FrameReader.Handler handler, boolean client) {
            this.emitter = emitter;
            this.handler = handler;
            this.client = client;
            emitter.setEndCallback(new CompletedCallback() { // from class: com.koushikdutta.async.http.spdy.Spdy3.Reader.1
                @Override // com.koushikdutta.async.callback.CompletedCallback
                public void onCompleted(Exception ex) {
                }
            });
            this.reader = new DataEmitterReader();
            parseFrameHeader();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void parseFrameHeader() {
            this.emitter.setDataCallback(this.reader);
            this.reader.read(Spdy3.TYPE_HEADERS, this.onFrame);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readSynStream(ByteBufferList source, int flags, int length) throws IOException {
            int w1 = source.getInt();
            int w2 = source.getInt();
            int streamId = w1 & Integer.MAX_VALUE;
            int associatedStreamId = w2 & Integer.MAX_VALUE;
            source.getShort();
            List<Header> headerBlock = this.headerReader.readHeader(source, length - 10);
            boolean inFinished = (flags & 1) != 0;
            boolean outFinished = (flags & 2) != 0;
            this.handler.headers(outFinished, inFinished, streamId, associatedStreamId, headerBlock, HeadersMode.SPDY_SYN_STREAM);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readSynReply(ByteBufferList source, int flags, int length) throws IOException {
            int w1 = source.getInt();
            int streamId = w1 & Integer.MAX_VALUE;
            List<Header> headerBlock = this.headerReader.readHeader(source, length - Spdy3.TYPE_SETTINGS);
            boolean inFinished = (flags & 1) != 0;
            this.handler.headers(false, inFinished, streamId, -1, headerBlock, HeadersMode.SPDY_REPLY);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readRstStream(ByteBufferList source, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_RST_STREAM length: %d != 8", Integer.valueOf(length));
            }
            int streamId = source.getInt() & Integer.MAX_VALUE;
            int errorCodeInt = source.getInt();
            ErrorCode errorCode = ErrorCode.fromSpdy3Rst(errorCodeInt);
            if (errorCode == null) {
                throw ioException("TYPE_RST_STREAM unexpected error code: %d", Integer.valueOf(errorCodeInt));
            }
            this.handler.rstStream(streamId, errorCode);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readHeaders(ByteBufferList source, int flags, int length) throws IOException {
            int w1 = source.getInt();
            int streamId = w1 & Integer.MAX_VALUE;
            List<Header> headerBlock = this.headerReader.readHeader(source, length - Spdy3.TYPE_SETTINGS);
            this.handler.headers(false, false, streamId, -1, headerBlock, HeadersMode.SPDY_HEADERS);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readWindowUpdate(ByteBufferList source, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_WINDOW_UPDATE length: %d != 8", Integer.valueOf(length));
            }
            int w1 = source.getInt();
            int w2 = source.getInt();
            int streamId = w1 & Integer.MAX_VALUE;
            long increment = w2 & Integer.MAX_VALUE;
            if (increment == 0) {
                throw ioException("windowSizeIncrement was 0", Long.valueOf(increment));
            }
            this.handler.windowUpdate(streamId, increment);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readPing(ByteBufferList source, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_SETTINGS) {
                throw ioException("TYPE_PING length: %d != 4", Integer.valueOf(length));
            }
            int id = source.getInt();
            boolean ack = this.client == ((id & 1) == 1);
            this.handler.ping(ack, id, 0);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readGoAway(ByteBufferList source, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_GOAWAY length: %d != 8", Integer.valueOf(length));
            }
            int lastGoodStreamId = source.getInt() & Integer.MAX_VALUE;
            int errorCodeInt = source.getInt();
            ErrorCode errorCode = ErrorCode.fromSpdyGoAway(errorCodeInt);
            if (errorCode == null) {
                throw ioException("TYPE_GOAWAY unexpected error code: %d", Integer.valueOf(errorCodeInt));
            }
            this.handler.goAway(lastGoodStreamId, errorCode, ByteString.EMPTY);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void readSettings(ByteBufferList source, int flags, int length) throws IOException {
            int numberOfEntries = source.getInt();
            if (length != Spdy3.TYPE_SETTINGS + (Spdy3.TYPE_HEADERS * numberOfEntries)) {
                throw ioException("TYPE_SETTINGS length: %d != 4 + 8 * %d", Integer.valueOf(length), Integer.valueOf(numberOfEntries));
            }
            Settings settings = new Settings();
            for (int i = 0; i < numberOfEntries; i++) {
                int w1 = source.getInt();
                int value = source.getInt();
                int idFlags = (w1 & (-16777216)) >>> 24;
                int id = w1 & 16777215;
                settings.set(id, idFlags, value);
            }
            boolean clearPrevious = (flags & 1) != 0;
            this.handler.settings(clearPrevious, settings);
        }

        private static IOException ioException(String message, Object... args) throws IOException {
            throw new IOException(String.format(message, args));
        }
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/spdy/Spdy3$Writer.class */
    static final class Writer implements FrameWriter {
        private final BufferedDataSink sink;
        private final boolean client;
        private boolean closed;
        private ByteBufferList frameHeader = new ByteBufferList();
        private final Deflater deflater = new Deflater();
        ByteBufferList dataList = new ByteBufferList();
        ByteBufferList headerBlockList = new ByteBufferList();

        Writer(BufferedDataSink sink, boolean client) {
            this.sink = sink;
            this.client = client;
            this.deflater.setDictionary(Spdy3.DICTIONARY);
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public void ackSettings() {
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public void pushPromise(int streamId, int promisedStreamId, List<Header> requestHeaders) throws IOException {
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void connectionPreface() {
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void synStream(boolean outFinished, boolean inFinished, int streamId, int associatedStreamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            ByteBufferList headerBlockBuffer = writeNameValueBlockToBuffer(headerBlock);
            int length = 10 + headerBlockBuffer.remaining();
            int flags = (outFinished ? 1 : 0) | (inFinished ? 2 : 0);
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (1 & 65535));
            sink.putInt(((flags & 255) << 24) | (length & 16777215));
            sink.putInt(streamId & Integer.MAX_VALUE);
            sink.putInt(associatedStreamId & Integer.MAX_VALUE);
            sink.putShort((short) (((0 & 7) << 13) | ((0 & 31) << Spdy3.TYPE_HEADERS) | (0 & 255)));
            sink.flip();
            this.sink.write(this.frameHeader.add(sink).add(headerBlockBuffer));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void synReply(boolean outFinished, int streamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            ByteBufferList headerBlockBuffer = writeNameValueBlockToBuffer(headerBlock);
            int flags = outFinished ? 1 : 0;
            int length = headerBlockBuffer.remaining() + Spdy3.TYPE_SETTINGS;
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (2 & 65535));
            sink.putInt(((flags & 255) << 24) | (length & 16777215));
            sink.putInt(streamId & Integer.MAX_VALUE);
            sink.flip();
            this.sink.write(this.frameHeader.add(sink).add(headerBlockBuffer));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void headers(int streamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            ByteBufferList headerBlockBuffer = writeNameValueBlockToBuffer(headerBlock);
            int length = headerBlockBuffer.remaining() + Spdy3.TYPE_SETTINGS;
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (Spdy3.TYPE_HEADERS & 65535));
            sink.putInt(((0 & 255) << 24) | (length & 16777215));
            sink.putInt(streamId & Integer.MAX_VALUE);
            sink.flip();
            this.sink.write(this.frameHeader.add(sink).add(headerBlockBuffer));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void rstStream(int streamId, ErrorCode errorCode) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (errorCode.spdyRstCode == -1) {
                throw new IllegalArgumentException();
            }
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (3 & 65535));
            sink.putInt(((0 & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            sink.putInt(streamId & Integer.MAX_VALUE);
            sink.putInt(errorCode.spdyRstCode);
            sink.flip();
            this.sink.write(this.frameHeader.addAll(sink));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void data(boolean outFinished, int streamId, ByteBufferList source) throws IOException {
            int flags = outFinished ? 1 : 0;
            sendDataFrame(streamId, flags, source);
        }

        void sendDataFrame(int streamId, int flags, ByteBufferList buffer) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            int byteCount = buffer.remaining();
            if (byteCount > 16777215) {
                throw new IllegalArgumentException("FRAME_TOO_LARGE max size is 16Mib: " + byteCount);
            }
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt(streamId & Integer.MAX_VALUE);
            sink.putInt(((flags & 255) << 24) | (byteCount & 16777215));
            sink.flip();
            this.dataList.add(sink).add(buffer);
            this.sink.write(this.dataList);
        }

        private ByteBufferList writeNameValueBlockToBuffer(List<Header> headerBlock) throws IOException {
            if (this.headerBlockList.hasRemaining()) {
                throw new IllegalStateException();
            }
            ByteBuffer headerBlockOut = ByteBufferList.obtain(8192).order(ByteOrder.BIG_ENDIAN);
            headerBlockOut.putInt(headerBlock.size());
            int size = headerBlock.size();
            for (int i = 0; i < size; i++) {
                ByteString name = headerBlock.get(i).name;
                headerBlockOut.putInt(name.size());
                headerBlockOut.put(name.toByteArray());
                ByteString value = headerBlock.get(i).value;
                headerBlockOut.putInt(value.size());
                headerBlockOut.put(value.toByteArray());
                if (headerBlockOut.remaining() < headerBlockOut.capacity() / 2) {
                    ByteBuffer newOut = ByteBufferList.obtain(headerBlockOut.capacity() * 2).order(ByteOrder.BIG_ENDIAN);
                    headerBlockOut.flip();
                    newOut.put(headerBlockOut);
                    ByteBufferList.reclaim(headerBlockOut);
                    headerBlockOut = newOut;
                }
            }
            headerBlockOut.flip();
            this.deflater.setInput(headerBlockOut.array(), 0, headerBlockOut.remaining());
            while (!this.deflater.needsInput()) {
                ByteBuffer deflated = ByteBufferList.obtain(headerBlockOut.capacity()).order(ByteOrder.BIG_ENDIAN);
                int read = this.deflater.deflate(deflated.array(), 0, deflated.capacity(), 2);
                deflated.limit(read);
                this.headerBlockList.add(deflated);
            }
            ByteBufferList.reclaim(headerBlockOut);
            return this.headerBlockList;
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void settings(Settings settings) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            int size = settings.size();
            int length = Spdy3.TYPE_SETTINGS + (size * Spdy3.TYPE_HEADERS);
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (Spdy3.TYPE_SETTINGS & 65535));
            sink.putInt(((0 & 255) << 24) | (length & 16777215));
            sink.putInt(size);
            for (int i = 0; i <= 10; i++) {
                if (settings.isSet(i)) {
                    int settingsFlags = settings.flags(i);
                    sink.putInt(((settingsFlags & 255) << 24) | (i & 16777215));
                    sink.putInt(settings.get(i));
                }
            }
            sink.flip();
            this.sink.write(this.frameHeader.addAll(sink));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void ping(boolean reply, int payload1, int payload2) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            boolean payloadIsReply = this.client != ((payload1 & 1) == 1);
            if (reply != payloadIsReply) {
                throw new IllegalArgumentException("payload != reply");
            }
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (Spdy3.TYPE_PING & 65535));
            sink.putInt(((0 & 255) << 24) | (Spdy3.TYPE_SETTINGS & 16777215));
            sink.putInt(payload1);
            sink.flip();
            this.sink.write(this.frameHeader.addAll(sink));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void goAway(int lastGoodStreamId, ErrorCode errorCode, byte[] ignored) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (errorCode.spdyGoAwayCode == -1) {
                throw new IllegalArgumentException("errorCode.spdyGoAwayCode == -1");
            }
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (7 & 65535));
            sink.putInt(((0 & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            sink.putInt(lastGoodStreamId);
            sink.putInt(errorCode.spdyGoAwayCode);
            sink.flip();
            this.sink.write(this.frameHeader.addAll(sink));
        }

        @Override // com.koushikdutta.async.http.spdy.FrameWriter
        public synchronized void windowUpdate(int streamId, long increment) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (increment == 0 || increment > 2147483647L) {
                throw new IllegalArgumentException("windowSizeIncrement must be between 1 and 0x7fffffff: " + increment);
            }
            ByteBuffer sink = ByteBufferList.obtain(256).order(ByteOrder.BIG_ENDIAN);
            sink.putInt((-2147287040) | (Spdy3.TYPE_WINDOW_UPDATE & 65535));
            sink.putInt(((0 & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            sink.putInt(streamId);
            sink.putInt((int) increment);
            sink.flip();
            this.sink.write(this.frameHeader.addAll(sink));
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public synchronized void close() throws IOException {
            this.closed = true;
        }
    }
}
