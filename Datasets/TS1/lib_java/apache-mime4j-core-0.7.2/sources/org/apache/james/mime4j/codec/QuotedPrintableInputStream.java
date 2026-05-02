package org.apache.james.mime4j.codec;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/codec/QuotedPrintableInputStream.class */
public class QuotedPrintableInputStream extends InputStream {
    private static final int DEFAULT_BUFFER_SIZE = 2048;
    private static final byte EQ = 61;
    private static final byte CR = 13;
    private static final byte LF = 10;
    private final byte[] singleByte;
    private final InputStream in;
    private final ByteArrayBuffer decodedBuf;
    private final ByteArrayBuffer blanks;
    private final byte[] encoded;
    private int pos;
    private int limit;
    private boolean closed;
    private final DecodeMonitor monitor;

    public QuotedPrintableInputStream(InputStream in, DecodeMonitor monitor) {
        this(DEFAULT_BUFFER_SIZE, in, monitor);
    }

    protected QuotedPrintableInputStream(int bufsize, InputStream in, DecodeMonitor monitor) {
        this.singleByte = new byte[1];
        this.pos = 0;
        this.limit = 0;
        this.in = in;
        this.encoded = new byte[bufsize];
        this.decodedBuf = new ByteArrayBuffer(512);
        this.blanks = new ByteArrayBuffer(512);
        this.closed = false;
        this.monitor = monitor;
    }

    protected QuotedPrintableInputStream(int bufsize, InputStream in, boolean strict) {
        this(bufsize, in, strict ? DecodeMonitor.STRICT : DecodeMonitor.SILENT);
    }

    public QuotedPrintableInputStream(InputStream in, boolean strict) {
        this(DEFAULT_BUFFER_SIZE, in, strict);
    }

    public QuotedPrintableInputStream(InputStream in) {
        this(in, false);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.closed = true;
    }

    private int fillBuffer() throws IOException {
        if (this.pos < this.limit) {
            System.arraycopy(this.encoded, this.pos, this.encoded, 0, this.limit - this.pos);
            this.limit -= this.pos;
            this.pos = 0;
        } else {
            this.limit = 0;
            this.pos = 0;
        }
        int capacity = this.encoded.length - this.limit;
        if (capacity > 0) {
            int bytesRead = this.in.read(this.encoded, this.limit, capacity);
            if (bytesRead > 0) {
                this.limit += bytesRead;
            }
            return bytesRead;
        }
        return 0;
    }

    private int getnext() {
        if (this.pos < this.limit) {
            byte b = this.encoded[this.pos];
            this.pos++;
            return b & 255;
        }
        return -1;
    }

    private int peek(int i) {
        if (this.pos + i < this.limit) {
            return this.encoded[this.pos + i] & 255;
        }
        return -1;
    }

    private int transfer(int b, byte[] buffer, int from, int to, boolean keepblanks) throws IOException {
        int index = from;
        if (keepblanks && this.blanks.length() > 0) {
            int chunk = Math.min(this.blanks.length(), to - index);
            System.arraycopy(this.blanks.buffer(), 0, buffer, index, chunk);
            index += chunk;
            int remaining = this.blanks.length() - chunk;
            if (remaining > 0) {
                this.decodedBuf.append(this.blanks.buffer(), chunk, remaining);
            }
            this.blanks.clear();
        } else if (this.blanks.length() > 0 && !keepblanks) {
            StringBuilder sb = new StringBuilder(this.blanks.length() * 3);
            for (int i = 0; i < this.blanks.length(); i++) {
                sb.append(" " + ((int) this.blanks.byteAt(i)));
            }
            if (this.monitor.warn("ignored blanks", sb.toString())) {
                throw new IOException("ignored blanks");
            }
        }
        if (b != -1) {
            if (index < to) {
                int i2 = index;
                index++;
                buffer[i2] = (byte) b;
            } else {
                this.decodedBuf.append(b);
            }
        }
        return index;
    }

    private int read0(byte[] buffer, int off, int len) throws IOException {
        boolean eof = false;
        int to = off + len;
        int index = off;
        if (this.decodedBuf.length() > 0) {
            int chunk = Math.min(this.decodedBuf.length(), to - index);
            System.arraycopy(this.decodedBuf.buffer(), 0, buffer, index, chunk);
            this.decodedBuf.remove(0, chunk);
            index += chunk;
        }
        while (index < to) {
            if (this.limit - this.pos < 3) {
                int bytesRead = fillBuffer();
                eof = bytesRead == -1;
            }
            if (this.limit - this.pos == 0 && eof) {
                if (index == off) {
                    return -1;
                }
                return index - off;
            }
            boolean lastWasCR = false;
            while (true) {
                if (this.pos >= this.limit || index >= to) {
                    break;
                }
                byte[] bArr = this.encoded;
                int i = this.pos;
                this.pos = i + 1;
                int b = bArr[i] & 255;
                if (lastWasCR && b != 10) {
                    if (this.monitor.warn("Found CR without LF", "Leaving it as is")) {
                        throw new IOException("Found CR without LF");
                    }
                    index = transfer(13, buffer, index, to, false);
                } else if (!lastWasCR && b == 10 && this.monitor.warn("Found LF without CR", "Translating to CRLF")) {
                    throw new IOException("Found LF without CR");
                }
                if (b == 13) {
                    lastWasCR = true;
                } else {
                    lastWasCR = false;
                    if (b == 10) {
                        if (this.blanks.length() == 0 || this.blanks.byteAt(0) != EQ) {
                            index = transfer(10, buffer, transfer(13, buffer, index, to, false), to, false);
                        }
                        this.blanks.clear();
                    } else if (b == EQ) {
                        if (this.limit - this.pos < 2 && !eof) {
                            this.pos--;
                            break;
                        }
                        int b2 = getnext();
                        if (b2 == EQ) {
                            index = transfer(b2, buffer, index, to, true);
                            int bb1 = peek(0);
                            int bb2 = peek(1);
                            if (bb1 == 10 || (bb1 == 13 && bb2 == 10)) {
                                this.monitor.warn("Unexpected ==EOL encountered", "== 0x" + bb1 + " 0x" + bb2);
                                this.blanks.append(b2);
                            } else {
                                this.monitor.warn("Unexpected == encountered", "==");
                            }
                        } else if (Character.isWhitespace((char) b2)) {
                            index = transfer(-1, buffer, index, to, true);
                            if (b2 != 10) {
                                this.blanks.append(b);
                                this.blanks.append(b2);
                            }
                        } else {
                            int b3 = getnext();
                            int upper = convert(b2);
                            int lower = convert(b3);
                            if (upper < 0 || lower < 0) {
                                this.monitor.warn("Malformed encoded value encountered", "leaving =" + ((char) b2) + ((char) b3) + " as is");
                                index = transfer(b3, buffer, transfer(b2, buffer, transfer(EQ, buffer, index, to, true), to, false), to, false);
                            } else {
                                index = transfer((upper << 4) | lower, buffer, index, to, true);
                            }
                        }
                    } else if (Character.isWhitespace(b)) {
                        this.blanks.append(b);
                    } else {
                        index = transfer(b & 255, buffer, index, to, true);
                    }
                }
            }
        }
        return to - off;
    }

    private int convert(int c) {
        if (c >= 48 && c <= 57) {
            return c - 48;
        }
        if (c >= 65 && c <= 70) {
            return 10 + (c - 65);
        }
        if (c >= 97 && c <= 102) {
            return 10 + (c - 97);
        }
        return -1;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int bytes;
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        do {
            bytes = read(this.singleByte, 0, 1);
            if (bytes == -1) {
                return -1;
            }
        } while (bytes != 1);
        return this.singleByte[0] & 255;
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        return read0(b, off, len);
    }
}
