package okio;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

/* loaded from: okio-1.3.0.jar:okio/RealBufferedSource.class */
final class RealBufferedSource implements BufferedSource {
    public final Buffer buffer;
    public final Source source;
    private boolean closed;

    public RealBufferedSource(Source source, Buffer buffer) {
        if (source == null) {
            throw new IllegalArgumentException("source == null");
        }
        this.buffer = buffer;
        this.source = source;
    }

    public RealBufferedSource(Source source) {
        this(source, new Buffer());
    }

    @Override // okio.BufferedSource, okio.BufferedSink
    public Buffer buffer() {
        return this.buffer;
    }

    @Override // okio.Source
    public long read(Buffer sink, long byteCount) throws IOException {
        if (sink == null) {
            throw new IllegalArgumentException("sink == null");
        }
        if (byteCount < 0) {
            throw new IllegalArgumentException("byteCount < 0: " + byteCount);
        }
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        if (this.buffer.size == 0) {
            long read = this.source.read(this.buffer, 2048L);
            if (read == -1) {
                return -1L;
            }
        }
        long toRead = Math.min(byteCount, this.buffer.size);
        return this.buffer.read(sink, toRead);
    }

    @Override // okio.BufferedSource
    public boolean exhausted() throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        return this.buffer.exhausted() && this.source.read(this.buffer, 2048L) == -1;
    }

    @Override // okio.BufferedSource
    public void require(long byteCount) throws IOException {
        if (!request(byteCount)) {
            throw new EOFException();
        }
    }

    @Override // okio.BufferedSource
    public boolean request(long byteCount) throws IOException {
        if (byteCount < 0) {
            throw new IllegalArgumentException("byteCount < 0: " + byteCount);
        }
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        while (this.buffer.size < byteCount) {
            if (this.source.read(this.buffer, 2048L) == -1) {
                return false;
            }
        }
        return true;
    }

    @Override // okio.BufferedSource
    public byte readByte() throws IOException {
        require(1L);
        return this.buffer.readByte();
    }

    @Override // okio.BufferedSource
    public ByteString readByteString() throws IOException {
        this.buffer.writeAll(this.source);
        return this.buffer.readByteString();
    }

    @Override // okio.BufferedSource
    public ByteString readByteString(long byteCount) throws IOException {
        require(byteCount);
        return this.buffer.readByteString(byteCount);
    }

    @Override // okio.BufferedSource
    public byte[] readByteArray() throws IOException {
        this.buffer.writeAll(this.source);
        return this.buffer.readByteArray();
    }

    @Override // okio.BufferedSource
    public byte[] readByteArray(long byteCount) throws IOException {
        require(byteCount);
        return this.buffer.readByteArray(byteCount);
    }

    @Override // okio.BufferedSource
    public int read(byte[] sink) throws IOException {
        return read(sink, 0, sink.length);
    }

    @Override // okio.BufferedSource
    public void readFully(byte[] sink) throws IOException {
        try {
            require(sink.length);
            this.buffer.readFully(sink);
        } catch (EOFException e) {
            int i = 0;
            while (true) {
                int offset = i;
                if (this.buffer.size > 0) {
                    int read = this.buffer.read(sink, offset, ((int) this.buffer.size) - offset);
                    if (read == -1) {
                        throw new AssertionError();
                    }
                    i = offset + read;
                } else {
                    throw e;
                }
            }
        }
    }

    @Override // okio.BufferedSource
    public int read(byte[] sink, int offset, int byteCount) throws IOException {
        Util.checkOffsetAndCount(sink.length, offset, byteCount);
        if (this.buffer.size == 0) {
            long read = this.source.read(this.buffer, 2048L);
            if (read == -1) {
                return -1;
            }
        }
        int toRead = (int) Math.min(byteCount, this.buffer.size);
        return this.buffer.read(sink, offset, toRead);
    }

    @Override // okio.BufferedSource
    public void readFully(Buffer sink, long byteCount) throws IOException {
        try {
            require(byteCount);
            this.buffer.readFully(sink, byteCount);
        } catch (EOFException e) {
            sink.writeAll(this.buffer);
            throw e;
        }
    }

    @Override // okio.BufferedSource
    public long readAll(Sink sink) throws IOException {
        if (sink == null) {
            throw new IllegalArgumentException("sink == null");
        }
        long totalBytesWritten = 0;
        while (this.source.read(this.buffer, 2048L) != -1) {
            long emitByteCount = this.buffer.completeSegmentByteCount();
            if (emitByteCount > 0) {
                totalBytesWritten += emitByteCount;
                sink.write(this.buffer, emitByteCount);
            }
        }
        if (this.buffer.size() > 0) {
            totalBytesWritten += this.buffer.size();
            sink.write(this.buffer, this.buffer.size());
        }
        return totalBytesWritten;
    }

    @Override // okio.BufferedSource
    public String readUtf8() throws IOException {
        this.buffer.writeAll(this.source);
        return this.buffer.readUtf8();
    }

    @Override // okio.BufferedSource
    public String readUtf8(long byteCount) throws IOException {
        require(byteCount);
        return this.buffer.readUtf8(byteCount);
    }

    @Override // okio.BufferedSource
    public String readString(Charset charset) throws IOException {
        if (charset == null) {
            throw new IllegalArgumentException("charset == null");
        }
        this.buffer.writeAll(this.source);
        return this.buffer.readString(charset);
    }

    @Override // okio.BufferedSource
    public String readString(long byteCount, Charset charset) throws IOException {
        require(byteCount);
        if (charset == null) {
            throw new IllegalArgumentException("charset == null");
        }
        return this.buffer.readString(byteCount, charset);
    }

    @Override // okio.BufferedSource
    public String readUtf8Line() throws IOException {
        long newline = indexOf((byte) 10);
        if (newline != -1) {
            return this.buffer.readUtf8Line(newline);
        }
        if (this.buffer.size != 0) {
            return readUtf8(this.buffer.size);
        }
        return null;
    }

    @Override // okio.BufferedSource
    public String readUtf8LineStrict() throws IOException {
        long newline = indexOf((byte) 10);
        if (newline == -1) {
            Buffer data = new Buffer();
            this.buffer.copyTo(data, 0L, Math.min(32L, this.buffer.size()));
            throw new EOFException("\\n not found: size=" + this.buffer.size() + " content=" + data.readByteString().hex() + "...");
        }
        return this.buffer.readUtf8Line(newline);
    }

    @Override // okio.BufferedSource
    public short readShort() throws IOException {
        require(2L);
        return this.buffer.readShort();
    }

    @Override // okio.BufferedSource
    public short readShortLe() throws IOException {
        require(2L);
        return this.buffer.readShortLe();
    }

    @Override // okio.BufferedSource
    public int readInt() throws IOException {
        require(4L);
        return this.buffer.readInt();
    }

    @Override // okio.BufferedSource
    public int readIntLe() throws IOException {
        require(4L);
        return this.buffer.readIntLe();
    }

    @Override // okio.BufferedSource
    public long readLong() throws IOException {
        require(8L);
        return this.buffer.readLong();
    }

    @Override // okio.BufferedSource
    public long readLongLe() throws IOException {
        require(8L);
        return this.buffer.readLongLe();
    }

    @Override // okio.BufferedSource
    public long readDecimalLong() throws IOException {
        byte b;
        int pos = 0;
        while (request(pos + 1) && (((b = this.buffer.getByte(pos)) >= 48 && b <= 57) || (pos == 0 && b == 45))) {
            pos++;
        }
        if (pos == 0) {
            throw new NumberFormatException("Expected leading [0-9] or '-' character but was 0x" + Integer.toHexString(this.buffer.getByte(0L)));
        }
        return this.buffer.readDecimalLong();
    }

    @Override // okio.BufferedSource
    public long readHexadecimalUnsignedLong() throws IOException {
        byte b;
        int pos = 0;
        while (request(pos + 1) && (((b = this.buffer.getByte(pos)) >= 48 && b <= 57) || ((b >= 97 && b <= 102) || (b >= 65 && b <= 70)))) {
            pos++;
        }
        if (pos == 0) {
            throw new NumberFormatException("Expected leading [0-9a-fA-F] character but was 0x" + Integer.toHexString(this.buffer.getByte(0L)));
        }
        return this.buffer.readHexadecimalUnsignedLong();
    }

    @Override // okio.BufferedSource
    public void skip(long byteCount) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        while (byteCount > 0) {
            if (this.buffer.size == 0 && this.source.read(this.buffer, 2048L) == -1) {
                throw new EOFException();
            }
            long toSkip = Math.min(byteCount, this.buffer.size());
            this.buffer.skip(toSkip);
            byteCount -= toSkip;
        }
    }

    @Override // okio.BufferedSource
    public long indexOf(byte b) throws IOException {
        return indexOf(b, 0L);
    }

    @Override // okio.BufferedSource
    public long indexOf(byte b, long fromIndex) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        while (fromIndex >= this.buffer.size) {
            if (this.source.read(this.buffer, 2048L) == -1) {
                return -1L;
            }
        }
        do {
            long index = this.buffer.indexOf(b, fromIndex);
            if (index == -1) {
                fromIndex = this.buffer.size;
            } else {
                return index;
            }
        } while (this.source.read(this.buffer, 2048L) != -1);
        return -1L;
    }

    @Override // okio.BufferedSource
    public long indexOfElement(ByteString targetBytes) throws IOException {
        return indexOfElement(targetBytes, 0L);
    }

    @Override // okio.BufferedSource
    public long indexOfElement(ByteString targetBytes, long fromIndex) throws IOException {
        if (this.closed) {
            throw new IllegalStateException("closed");
        }
        while (fromIndex >= this.buffer.size) {
            if (this.source.read(this.buffer, 2048L) == -1) {
                return -1L;
            }
        }
        do {
            long index = this.buffer.indexOfElement(targetBytes, fromIndex);
            if (index == -1) {
                fromIndex = this.buffer.size;
            } else {
                return index;
            }
        } while (this.source.read(this.buffer, 2048L) != -1);
        return -1L;
    }

    @Override // okio.BufferedSource
    public InputStream inputStream() {
        return new InputStream() { // from class: okio.RealBufferedSource.1
            @Override // java.io.InputStream
            public int read() throws IOException {
                if (RealBufferedSource.this.closed) {
                    throw new IOException("closed");
                }
                if (RealBufferedSource.this.buffer.size == 0) {
                    long count = RealBufferedSource.this.source.read(RealBufferedSource.this.buffer, 2048L);
                    if (count == -1) {
                        return -1;
                    }
                }
                return RealBufferedSource.this.buffer.readByte() & 255;
            }

            @Override // java.io.InputStream
            public int read(byte[] data, int offset, int byteCount) throws IOException {
                if (RealBufferedSource.this.closed) {
                    throw new IOException("closed");
                }
                Util.checkOffsetAndCount(data.length, offset, byteCount);
                if (RealBufferedSource.this.buffer.size == 0) {
                    long count = RealBufferedSource.this.source.read(RealBufferedSource.this.buffer, 2048L);
                    if (count == -1) {
                        return -1;
                    }
                }
                return RealBufferedSource.this.buffer.read(data, offset, byteCount);
            }

            @Override // java.io.InputStream
            public int available() throws IOException {
                if (RealBufferedSource.this.closed) {
                    throw new IOException("closed");
                }
                return (int) Math.min(RealBufferedSource.this.buffer.size, 2147483647L);
            }

            @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                RealBufferedSource.this.close();
            }

            public String toString() {
                return RealBufferedSource.this + ".inputStream()";
            }
        };
    }

    @Override // okio.Source, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        this.closed = true;
        this.source.close();
        this.buffer.clear();
    }

    @Override // okio.Source
    public Timeout timeout() {
        return this.source.timeout();
    }

    public String toString() {
        return "buffer(" + this.source + ")";
    }
}
