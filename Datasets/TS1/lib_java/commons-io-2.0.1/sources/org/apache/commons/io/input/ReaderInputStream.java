package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;

/* loaded from: commons-io-2.0.1.jar:org/apache/commons/io/input/ReaderInputStream.class */
public class ReaderInputStream extends InputStream {
    private static final int DEFAULT_BUFFER_SIZE = 1024;
    private final Reader reader;
    private final CharsetEncoder encoder;
    private final CharBuffer encoderIn;
    private final ByteBuffer encoderOut;
    private CoderResult lastCoderResult;
    private boolean endOfInput;

    public ReaderInputStream(Reader reader, Charset charset, int bufferSize) {
        this.encoderOut = ByteBuffer.allocate(128);
        this.reader = reader;
        this.encoder = charset.newEncoder();
        this.encoderIn = CharBuffer.allocate(bufferSize);
        this.encoderIn.flip();
    }

    public ReaderInputStream(Reader reader, Charset charset) {
        this(reader, charset, DEFAULT_BUFFER_SIZE);
    }

    public ReaderInputStream(Reader reader, String charsetName, int bufferSize) {
        this(reader, Charset.forName(charsetName), bufferSize);
    }

    public ReaderInputStream(Reader reader, String charsetName) {
        this(reader, charsetName, DEFAULT_BUFFER_SIZE);
    }

    public ReaderInputStream(Reader reader) {
        this(reader, Charset.defaultCharset());
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int read = 0;
        while (len > 0) {
            if (this.encoderOut.position() > 0) {
                this.encoderOut.flip();
                int c = Math.min(this.encoderOut.remaining(), len);
                this.encoderOut.get(b, off, c);
                off += c;
                len -= c;
                read += c;
                this.encoderOut.compact();
            } else {
                if (!this.endOfInput && (this.lastCoderResult == null || this.lastCoderResult.isUnderflow())) {
                    this.encoderIn.compact();
                    int position = this.encoderIn.position();
                    int c2 = this.reader.read(this.encoderIn.array(), position, this.encoderIn.remaining());
                    if (c2 == -1) {
                        this.endOfInput = true;
                    } else {
                        this.encoderIn.position(position + c2);
                    }
                    this.encoderIn.flip();
                }
                this.lastCoderResult = this.encoder.encode(this.encoderIn, this.encoderOut, this.endOfInput);
                if (this.endOfInput && this.encoderOut.position() == 0) {
                    break;
                }
            }
        }
        if (read == 0 && this.endOfInput) {
            return -1;
        }
        return read;
    }

    @Override // java.io.InputStream
    public int read(byte[] b) throws IOException {
        return read(b, 0, b.length);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        byte[] b = new byte[1];
        if (read(b) == -1) {
            return -1;
        }
        return b[0] & 255;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }
}
