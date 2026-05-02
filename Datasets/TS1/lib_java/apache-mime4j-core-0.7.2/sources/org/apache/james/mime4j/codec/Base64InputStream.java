package org.apache.james.mime4j.codec;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/codec/Base64InputStream.class */
public class Base64InputStream extends InputStream {
    private static final int ENCODED_BUFFER_SIZE = 1536;
    private static final int[] BASE64_DECODE;
    private static final byte BASE64_PAD = 61;
    private static final int EOF = -1;
    private final byte[] singleByte;
    private final InputStream in;
    private final byte[] encoded;
    private final ByteArrayBuffer decodedBuf;
    private int position;
    private int size;
    private boolean closed;
    private boolean eof;
    private final DecodeMonitor monitor;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Base64InputStream.class.desiredAssertionStatus();
        BASE64_DECODE = new int[256];
        for (int i = 0; i < 256; i++) {
            BASE64_DECODE[i] = EOF;
        }
        for (int i2 = 0; i2 < Base64OutputStream.BASE64_TABLE.length; i2++) {
            BASE64_DECODE[Base64OutputStream.BASE64_TABLE[i2] & 255] = i2;
        }
    }

    public Base64InputStream(InputStream in, DecodeMonitor monitor) {
        this(ENCODED_BUFFER_SIZE, in, monitor);
    }

    protected Base64InputStream(int bufsize, InputStream in, DecodeMonitor monitor) {
        this.singleByte = new byte[1];
        this.position = 0;
        this.size = 0;
        this.closed = false;
        if (in == null) {
            throw new IllegalArgumentException();
        }
        this.encoded = new byte[bufsize];
        this.decodedBuf = new ByteArrayBuffer(512);
        this.in = in;
        this.monitor = monitor;
    }

    public Base64InputStream(InputStream in) {
        this(in, false);
    }

    public Base64InputStream(InputStream in, boolean strict) {
        this(ENCODED_BUFFER_SIZE, in, strict ? DecodeMonitor.STRICT : DecodeMonitor.SILENT);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int bytes;
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        do {
            bytes = read0(this.singleByte, 0, 1);
            if (bytes == EOF) {
                return EOF;
            }
        } while (bytes != 1);
        return this.singleByte[0] & 255;
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        if (buffer == null) {
            throw new NullPointerException();
        }
        if (buffer.length == 0) {
            return 0;
        }
        return read0(buffer, 0, buffer.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int offset, int length) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        if (buffer == null) {
            throw new NullPointerException();
        }
        if (offset < 0 || length < 0 || offset + length > buffer.length) {
            throw new IndexOutOfBoundsException();
        }
        if (length == 0) {
            return 0;
        }
        return read0(buffer, offset, length);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        this.closed = true;
    }

    private int read0(byte[] buffer, int off, int len) throws IOException {
        int to = off + len;
        int index = off;
        if (this.decodedBuf.length() > 0) {
            int chunk = Math.min(this.decodedBuf.length(), len);
            System.arraycopy(this.decodedBuf.buffer(), 0, buffer, index, chunk);
            this.decodedBuf.remove(0, chunk);
            index += chunk;
        }
        if (this.eof) {
            return index == off ? EOF : index - off;
        }
        int data = 0;
        int sextets = 0;
        while (index < to) {
            while (this.position == this.size) {
                int n = this.in.read(this.encoded, 0, this.encoded.length);
                if (n == EOF) {
                    this.eof = true;
                    if (sextets != 0) {
                        handleUnexpectedEof(sextets);
                    }
                    return index == off ? EOF : index - off;
                }
                if (n > 0) {
                    this.position = 0;
                    this.size = n;
                } else if (!$assertionsDisabled && n != 0) {
                    throw new AssertionError();
                }
            }
            while (this.position < this.size && index < to) {
                byte[] bArr = this.encoded;
                int i = this.position;
                this.position = i + 1;
                int value = bArr[i] & 255;
                if (value == BASE64_PAD) {
                    return decodePad(data, sextets, buffer, index, to) - off;
                }
                int decoded = BASE64_DECODE[value];
                if (decoded < 0) {
                    if (value != 13 && value != 10 && value != 32 && this.monitor.warn("Unexpected base64 byte: " + ((int) ((byte) value)), "ignoring.")) {
                        throw new IOException("Unexpected base64 byte");
                    }
                } else {
                    data = (data << 6) | decoded;
                    sextets++;
                    if (sextets == 4) {
                        sextets = 0;
                        byte b1 = (byte) (data >>> 16);
                        byte b2 = (byte) (data >>> 8);
                        byte b3 = (byte) data;
                        if (index < to - 2) {
                            int i2 = index;
                            int index2 = index + 1;
                            buffer[i2] = b1;
                            int index3 = index2 + 1;
                            buffer[index2] = b2;
                            index = index3 + 1;
                            buffer[index3] = b3;
                        } else {
                            if (index < to - 1) {
                                int i3 = index;
                                int index4 = index + 1;
                                buffer[i3] = b1;
                                index = index4 + 1;
                                buffer[index4] = b2;
                                this.decodedBuf.append(b3);
                            } else if (index < to) {
                                int i4 = index;
                                index++;
                                buffer[i4] = b1;
                                this.decodedBuf.append(b2);
                                this.decodedBuf.append(b3);
                            } else {
                                this.decodedBuf.append(b1);
                                this.decodedBuf.append(b2);
                                this.decodedBuf.append(b3);
                            }
                            if ($assertionsDisabled || index == to) {
                                return to - off;
                            }
                            throw new AssertionError();
                        }
                    } else {
                        continue;
                    }
                }
            }
        }
        if (!$assertionsDisabled && sextets != 0) {
            throw new AssertionError();
        }
        if ($assertionsDisabled || index == to) {
            return to - off;
        }
        throw new AssertionError();
    }

    private int decodePad(int data, int sextets, byte[] buffer, int index, int end) throws IOException {
        this.eof = true;
        if (sextets == 2) {
            byte b = (byte) (data >>> 4);
            if (index < end) {
                index++;
                buffer[index] = b;
            } else {
                this.decodedBuf.append(b);
            }
        } else if (sextets == 3) {
            byte b1 = (byte) (data >>> 10);
            byte b2 = (byte) ((data >>> 2) & 255);
            if (index < end - 1) {
                int index2 = index + 1;
                buffer[index] = b1;
                index = index2 + 1;
                buffer[index2] = b2;
            } else if (index < end) {
                index++;
                buffer[index] = b1;
                this.decodedBuf.append(b2);
            } else {
                this.decodedBuf.append(b1);
                this.decodedBuf.append(b2);
            }
        } else {
            handleUnexpecedPad(sextets);
        }
        return index;
    }

    private void handleUnexpectedEof(int sextets) throws IOException {
        if (this.monitor.warn("Unexpected end of BASE64 stream", "dropping " + sextets + " sextet(s)")) {
            throw new IOException("Unexpected end of BASE64 stream");
        }
    }

    private void handleUnexpecedPad(int sextets) throws IOException {
        if (this.monitor.warn("Unexpected padding character", "dropping " + sextets + " sextet(s)")) {
            throw new IOException("Unexpected padding character");
        }
    }
}
