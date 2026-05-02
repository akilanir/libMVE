package com.squareup.okhttp.internal.framed;

import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.framed.FrameReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.ProtocolException;
import java.util.List;
import java.util.zip.Deflater;
import okio.Buffer;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.ByteString;
import okio.DeflaterSink;
import okio.Okio;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/framed/Spdy3.class */
public final class Spdy3 implements Variant {
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

    @Override // com.squareup.okhttp.internal.framed.Variant
    public Protocol getProtocol() {
        return Protocol.SPDY_3;
    }

    static {
        try {
            DICTIONARY = "������\u0007options������\u0004head������\u0004post������\u0003put������\u0006delete������\u0005trace������\u0006accept������\u000eaccept-charset������\u000faccept-encoding������\u000faccept-language������\raccept-ranges������\u0003age������\u0005allow������\rauthorization������\rcache-control������\nconnection������\fcontent-base������\u0010content-encoding������\u0010content-language������\u000econtent-length������\u0010content-location������\u000bcontent-md5������\rcontent-range������\fcontent-type������\u0004date������\u0004etag������\u0006expect������\u0007expires������\u0004from������\u0004host������\bif-match������\u0011if-modified-since������\rif-none-match������\bif-range������\u0013if-unmodified-since������\rlast-modified������\blocation������\fmax-forwards������\u0006pragma������\u0012proxy-authenticate������\u0013proxy-authorization������\u0005range������\u0007referer������\u000bretry-after������\u0006server������\u0002te������\u0007trailer������\u0011transfer-encoding������\u0007upgrade������\nuser-agent������\u0004vary������\u0003via������\u0007warning������\u0010www-authenticate������\u0006method������\u0003get������\u0006status������\u0006200 OK������\u0007version������\bHTTP/1.1������\u0003url������\u0006public������\nset-cookie������\nkeep-alive������\u0006origin100101201202205206300302303304305306307402405406407408409410411412413414415416417502504505203 Non-Authoritative Information204 No Content301 Moved Permanently400 Bad Request401 Unauthorized403 Forbidden404 Not Found500 Internal Server Error501 Not Implemented503 Service UnavailableJan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec 00:00:00 Mon, Tue, Wed, Thu, Fri, Sat, Sun, GMTchunked,text/html,image/png,image/jpg,image/gif,application/xml,application/xhtml+xml,text/plain,text/javascript,publicprivatemax-age=gzip,deflate,sdchcharset=utf-8charset=iso-8859-1,utf-,*,enq=0.".getBytes(Util.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError();
        }
    }

    @Override // com.squareup.okhttp.internal.framed.Variant
    public FrameReader newReader(BufferedSource source, boolean client) {
        return new Reader(source, client);
    }

    @Override // com.squareup.okhttp.internal.framed.Variant
    public FrameWriter newWriter(BufferedSink sink, boolean client) {
        return new Writer(sink, client);
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/framed/Spdy3$Reader.class */
    static final class Reader implements FrameReader {
        private final BufferedSource source;
        private final boolean client;
        private final NameValueBlockReader headerBlockReader;

        Reader(BufferedSource source, boolean client) {
            this.source = source;
            this.headerBlockReader = new NameValueBlockReader(this.source);
            this.client = client;
        }

        @Override // com.squareup.okhttp.internal.framed.FrameReader
        public void readConnectionPreface() {
        }

        @Override // com.squareup.okhttp.internal.framed.FrameReader
        public boolean nextFrame(FrameReader.Handler handler) throws IOException {
            try {
                int w1 = this.source.readInt();
                int w2 = this.source.readInt();
                boolean control = (w1 & Integer.MIN_VALUE) != 0;
                int flags = (w2 & (-16777216)) >>> 24;
                int length = w2 & 16777215;
                if (control) {
                    int version = (w1 & 2147418112) >>> 16;
                    int type = w1 & 65535;
                    if (version != 3) {
                        throw new ProtocolException("version != 3: " + version);
                    }
                    switch (type) {
                        case 1:
                            readSynStream(handler, flags, length);
                            return true;
                        case 2:
                            readSynReply(handler, flags, length);
                            return true;
                        case 3:
                            readRstStream(handler, flags, length);
                            return true;
                        case Spdy3.TYPE_SETTINGS /* 4 */:
                            readSettings(handler, flags, length);
                            return true;
                        case 5:
                        default:
                            this.source.skip(length);
                            return true;
                        case Spdy3.TYPE_PING /* 6 */:
                            readPing(handler, flags, length);
                            return true;
                        case Spdy3.TYPE_GOAWAY /* 7 */:
                            readGoAway(handler, flags, length);
                            return true;
                        case Spdy3.TYPE_HEADERS /* 8 */:
                            readHeaders(handler, flags, length);
                            return true;
                        case Spdy3.TYPE_WINDOW_UPDATE /* 9 */:
                            readWindowUpdate(handler, flags, length);
                            return true;
                    }
                }
                int streamId = w1 & Integer.MAX_VALUE;
                boolean inFinished = (flags & 1) != 0;
                handler.data(inFinished, streamId, this.source, length);
                return true;
            } catch (IOException e) {
                return false;
            }
        }

        private void readSynStream(FrameReader.Handler handler, int flags, int length) throws IOException {
            int w1 = this.source.readInt();
            int w2 = this.source.readInt();
            int streamId = w1 & Integer.MAX_VALUE;
            int associatedStreamId = w2 & Integer.MAX_VALUE;
            this.source.readShort();
            List<Header> headerBlock = this.headerBlockReader.readNameValueBlock(length - 10);
            boolean inFinished = (flags & 1) != 0;
            boolean outFinished = (flags & 2) != 0;
            handler.headers(outFinished, inFinished, streamId, associatedStreamId, headerBlock, HeadersMode.SPDY_SYN_STREAM);
        }

        private void readSynReply(FrameReader.Handler handler, int flags, int length) throws IOException {
            int w1 = this.source.readInt();
            int streamId = w1 & Integer.MAX_VALUE;
            List<Header> headerBlock = this.headerBlockReader.readNameValueBlock(length - Spdy3.TYPE_SETTINGS);
            boolean inFinished = (flags & 1) != 0;
            handler.headers(false, inFinished, streamId, -1, headerBlock, HeadersMode.SPDY_REPLY);
        }

        private void readRstStream(FrameReader.Handler handler, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_RST_STREAM length: %d != 8", Integer.valueOf(length));
            }
            int streamId = this.source.readInt() & Integer.MAX_VALUE;
            int errorCodeInt = this.source.readInt();
            ErrorCode errorCode = ErrorCode.fromSpdy3Rst(errorCodeInt);
            if (errorCode == null) {
                throw ioException("TYPE_RST_STREAM unexpected error code: %d", Integer.valueOf(errorCodeInt));
            }
            handler.rstStream(streamId, errorCode);
        }

        private void readHeaders(FrameReader.Handler handler, int flags, int length) throws IOException {
            int w1 = this.source.readInt();
            int streamId = w1 & Integer.MAX_VALUE;
            List<Header> headerBlock = this.headerBlockReader.readNameValueBlock(length - Spdy3.TYPE_SETTINGS);
            handler.headers(false, false, streamId, -1, headerBlock, HeadersMode.SPDY_HEADERS);
        }

        private void readWindowUpdate(FrameReader.Handler handler, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_WINDOW_UPDATE length: %d != 8", Integer.valueOf(length));
            }
            int w1 = this.source.readInt();
            int w2 = this.source.readInt();
            int streamId = w1 & Integer.MAX_VALUE;
            long increment = w2 & Integer.MAX_VALUE;
            if (increment == 0) {
                throw ioException("windowSizeIncrement was 0", Long.valueOf(increment));
            }
            handler.windowUpdate(streamId, increment);
        }

        private void readPing(FrameReader.Handler handler, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_SETTINGS) {
                throw ioException("TYPE_PING length: %d != 4", Integer.valueOf(length));
            }
            int id = this.source.readInt();
            boolean ack = this.client == ((id & 1) == 1);
            handler.ping(ack, id, Spdy3.TYPE_DATA);
        }

        private void readGoAway(FrameReader.Handler handler, int flags, int length) throws IOException {
            if (length != Spdy3.TYPE_HEADERS) {
                throw ioException("TYPE_GOAWAY length: %d != 8", Integer.valueOf(length));
            }
            int lastGoodStreamId = this.source.readInt() & Integer.MAX_VALUE;
            int errorCodeInt = this.source.readInt();
            ErrorCode errorCode = ErrorCode.fromSpdyGoAway(errorCodeInt);
            if (errorCode == null) {
                throw ioException("TYPE_GOAWAY unexpected error code: %d", Integer.valueOf(errorCodeInt));
            }
            handler.goAway(lastGoodStreamId, errorCode, ByteString.EMPTY);
        }

        private void readSettings(FrameReader.Handler handler, int flags, int length) throws IOException {
            int numberOfEntries = this.source.readInt();
            if (length != Spdy3.TYPE_SETTINGS + (Spdy3.TYPE_HEADERS * numberOfEntries)) {
                throw ioException("TYPE_SETTINGS length: %d != 4 + 8 * %d", Integer.valueOf(length), Integer.valueOf(numberOfEntries));
            }
            Settings settings = new Settings();
            for (int i = Spdy3.TYPE_DATA; i < numberOfEntries; i++) {
                int w1 = this.source.readInt();
                int value = this.source.readInt();
                int idFlags = (w1 & (-16777216)) >>> 24;
                int id = w1 & 16777215;
                settings.set(id, idFlags, value);
            }
            boolean clearPrevious = (flags & 1) != 0;
            handler.settings(clearPrevious, settings);
        }

        private static IOException ioException(String message, Object... args) throws IOException {
            throw new IOException(String.format(message, args));
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.headerBlockReader.close();
        }
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/framed/Spdy3$Writer.class */
    static final class Writer implements FrameWriter {
        private final BufferedSink sink;
        private final Buffer headerBlockBuffer;
        private final BufferedSink headerBlockOut;
        private final boolean client;
        private boolean closed;

        Writer(BufferedSink sink, boolean client) {
            this.sink = sink;
            this.client = client;
            Deflater deflater = new Deflater();
            deflater.setDictionary(Spdy3.DICTIONARY);
            this.headerBlockBuffer = new Buffer();
            this.headerBlockOut = Okio.buffer(new DeflaterSink(this.headerBlockBuffer, deflater));
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public void ackSettings(Settings peerSettings) {
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public void pushPromise(int streamId, int promisedStreamId, List<Header> requestHeaders) throws IOException {
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void connectionPreface() {
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void flush() throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void synStream(boolean outFinished, boolean inFinished, int streamId, int associatedStreamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            writeNameValueBlockToBuffer(headerBlock);
            int length = (int) (10 + this.headerBlockBuffer.size());
            int flags = (outFinished ? 1 : Spdy3.TYPE_DATA) | (inFinished ? 2 : Spdy3.TYPE_DATA);
            this.sink.writeInt((-2147287040) | (1 & 65535));
            this.sink.writeInt(((flags & 255) << 24) | (length & 16777215));
            this.sink.writeInt(streamId & Integer.MAX_VALUE);
            this.sink.writeInt(associatedStreamId & Integer.MAX_VALUE);
            this.sink.writeShort(((Spdy3.TYPE_DATA & Spdy3.TYPE_GOAWAY) << 13) | ((Spdy3.TYPE_DATA & 31) << Spdy3.TYPE_HEADERS) | (Spdy3.TYPE_DATA & 255));
            this.sink.writeAll(this.headerBlockBuffer);
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void synReply(boolean outFinished, int streamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            writeNameValueBlockToBuffer(headerBlock);
            int flags = outFinished ? 1 : Spdy3.TYPE_DATA;
            int length = (int) (this.headerBlockBuffer.size() + 4);
            this.sink.writeInt((-2147287040) | (2 & 65535));
            this.sink.writeInt(((flags & 255) << 24) | (length & 16777215));
            this.sink.writeInt(streamId & Integer.MAX_VALUE);
            this.sink.writeAll(this.headerBlockBuffer);
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void headers(int streamId, List<Header> headerBlock) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            writeNameValueBlockToBuffer(headerBlock);
            int length = (int) (this.headerBlockBuffer.size() + 4);
            this.sink.writeInt((-2147287040) | (Spdy3.TYPE_HEADERS & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (length & 16777215));
            this.sink.writeInt(streamId & Integer.MAX_VALUE);
            this.sink.writeAll(this.headerBlockBuffer);
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void rstStream(int streamId, ErrorCode errorCode) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (errorCode.spdyRstCode == -1) {
                throw new IllegalArgumentException();
            }
            this.sink.writeInt((-2147287040) | (3 & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            this.sink.writeInt(streamId & Integer.MAX_VALUE);
            this.sink.writeInt(errorCode.spdyRstCode);
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public int maxDataLength() {
            return 16383;
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void data(boolean outFinished, int streamId, Buffer source, int byteCount) throws IOException {
            int flags = outFinished ? 1 : Spdy3.TYPE_DATA;
            sendDataFrame(streamId, flags, source, byteCount);
        }

        void sendDataFrame(int streamId, int flags, Buffer buffer, int byteCount) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (byteCount > 16777215) {
                throw new IllegalArgumentException("FRAME_TOO_LARGE max size is 16Mib: " + byteCount);
            }
            this.sink.writeInt(streamId & Integer.MAX_VALUE);
            this.sink.writeInt(((flags & 255) << 24) | (byteCount & 16777215));
            if (byteCount > 0) {
                this.sink.write(buffer, byteCount);
            }
        }

        private void writeNameValueBlockToBuffer(List<Header> headerBlock) throws IOException {
            this.headerBlockOut.writeInt(headerBlock.size());
            int size = headerBlock.size();
            for (int i = Spdy3.TYPE_DATA; i < size; i++) {
                ByteString name = headerBlock.get(i).name;
                this.headerBlockOut.writeInt(name.size());
                this.headerBlockOut.write(name);
                ByteString value = headerBlock.get(i).value;
                this.headerBlockOut.writeInt(value.size());
                this.headerBlockOut.write(value);
            }
            this.headerBlockOut.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void settings(Settings settings) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            int size = settings.size();
            int length = Spdy3.TYPE_SETTINGS + (size * Spdy3.TYPE_HEADERS);
            this.sink.writeInt((-2147287040) | (Spdy3.TYPE_SETTINGS & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (length & 16777215));
            this.sink.writeInt(size);
            for (int i = Spdy3.TYPE_DATA; i <= 10; i++) {
                if (settings.isSet(i)) {
                    int settingsFlags = settings.flags(i);
                    this.sink.writeInt(((settingsFlags & 255) << 24) | (i & 16777215));
                    this.sink.writeInt(settings.get(i));
                }
            }
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void ping(boolean reply, int payload1, int payload2) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            boolean payloadIsReply = this.client != ((payload1 & 1) == 1);
            if (reply != payloadIsReply) {
                throw new IllegalArgumentException("payload != reply");
            }
            this.sink.writeInt((-2147287040) | (Spdy3.TYPE_PING & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (Spdy3.TYPE_SETTINGS & 16777215));
            this.sink.writeInt(payload1);
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void goAway(int lastGoodStreamId, ErrorCode errorCode, byte[] ignored) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (errorCode.spdyGoAwayCode == -1) {
                throw new IllegalArgumentException("errorCode.spdyGoAwayCode == -1");
            }
            this.sink.writeInt((-2147287040) | (Spdy3.TYPE_GOAWAY & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            this.sink.writeInt(lastGoodStreamId);
            this.sink.writeInt(errorCode.spdyGoAwayCode);
            this.sink.flush();
        }

        @Override // com.squareup.okhttp.internal.framed.FrameWriter
        public synchronized void windowUpdate(int streamId, long increment) throws IOException {
            if (this.closed) {
                throw new IOException("closed");
            }
            if (increment == 0 || increment > 2147483647L) {
                throw new IllegalArgumentException("windowSizeIncrement must be between 1 and 0x7fffffff: " + increment);
            }
            this.sink.writeInt((-2147287040) | (Spdy3.TYPE_WINDOW_UPDATE & 65535));
            this.sink.writeInt(((Spdy3.TYPE_DATA & 255) << 24) | (Spdy3.TYPE_HEADERS & 16777215));
            this.sink.writeInt(streamId);
            this.sink.writeInt((int) increment);
            this.sink.flush();
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public synchronized void close() throws IOException {
            this.closed = true;
            Util.closeAll(this.sink, this.headerBlockOut);
        }
    }
}
