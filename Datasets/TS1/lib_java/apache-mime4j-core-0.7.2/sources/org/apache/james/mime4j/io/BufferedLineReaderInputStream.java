package org.apache.james.mime4j.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/BufferedLineReaderInputStream.class */
public class BufferedLineReaderInputStream extends LineReaderInputStream {
    private boolean truncated;
    boolean tempBuffer;
    private byte[] origBuffer;
    private int origBufpos;
    private int origBuflen;
    private byte[] buffer;
    private int bufpos;
    private int buflen;
    private final int maxLineLen;

    public BufferedLineReaderInputStream(InputStream instream, int buffersize, int maxLineLen) {
        super(instream);
        this.tempBuffer = false;
        if (instream == null) {
            throw new IllegalArgumentException("Input stream may not be null");
        }
        if (buffersize <= 0) {
            throw new IllegalArgumentException("Buffer size may not be negative or zero");
        }
        this.buffer = new byte[buffersize];
        this.bufpos = 0;
        this.buflen = 0;
        this.maxLineLen = maxLineLen;
        this.truncated = false;
    }

    public BufferedLineReaderInputStream(InputStream instream, int buffersize) {
        this(instream, buffersize, -1);
    }

    private void expand(int newlen) {
        byte[] newbuffer = new byte[newlen];
        int len = bufferLen();
        if (len > 0) {
            System.arraycopy(this.buffer, this.bufpos, newbuffer, this.bufpos, len);
        }
        this.buffer = newbuffer;
    }

    public void ensureCapacity(int len) {
        if (len > this.buffer.length) {
            expand(len);
        }
    }

    public int fillBuffer() throws IOException {
        if (this.tempBuffer) {
            if (this.bufpos != this.buflen) {
                throw new IllegalStateException("unread only works when a buffer is fully read before the next refill is asked!");
            }
            this.buffer = this.origBuffer;
            this.buflen = this.origBuflen;
            this.bufpos = this.origBufpos;
            this.tempBuffer = false;
            return bufferLen();
        }
        if (this.bufpos > 0) {
            int len = bufferLen();
            if (len > 0) {
                System.arraycopy(this.buffer, this.bufpos, this.buffer, 0, len);
            }
            this.bufpos = 0;
            this.buflen = len;
        }
        int off = this.buflen;
        int l = this.in.read(this.buffer, off, this.buffer.length - off);
        if (l == -1) {
            return -1;
        }
        this.buflen = off + l;
        return l;
    }

    private int bufferLen() {
        return this.buflen - this.bufpos;
    }

    public boolean hasBufferedData() {
        return bufferLen() > 0;
    }

    public void truncate() {
        clear();
        this.truncated = true;
    }

    protected boolean readAllowed() {
        return !this.truncated;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        if (!readAllowed()) {
            return -1;
        }
        while (!hasBufferedData()) {
            int noRead = fillBuffer();
            if (noRead == -1) {
                return -1;
            }
        }
        byte[] bArr = this.buffer;
        int i = this.bufpos;
        this.bufpos = i + 1;
        return bArr[i] & 255;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        if (!readAllowed()) {
            return -1;
        }
        if (b == null) {
            return 0;
        }
        while (!hasBufferedData()) {
            int noRead = fillBuffer();
            if (noRead == -1) {
                return -1;
            }
        }
        int chunk = bufferLen();
        if (chunk > len) {
            chunk = len;
        }
        System.arraycopy(this.buffer, this.bufpos, b, off, chunk);
        this.bufpos += chunk;
        return chunk;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b) throws IOException {
        if (!readAllowed()) {
            return -1;
        }
        if (b == null) {
            return 0;
        }
        return read(b, 0, b.length);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public int readLine(ByteArrayBuffer dst) throws MaxLineLimitException, IOException {
        int chunk;
        if (dst == null) {
            throw new IllegalArgumentException("Buffer may not be null");
        }
        if (!readAllowed()) {
            return -1;
        }
        int total = 0;
        boolean found = false;
        int bytesRead = 0;
        while (!found) {
            if (!hasBufferedData()) {
                bytesRead = fillBuffer();
                if (bytesRead == -1) {
                    break;
                }
            }
            int i = indexOf((byte) 10);
            if (i != -1) {
                found = true;
                chunk = (i + 1) - pos();
            } else {
                chunk = length();
            }
            if (chunk > 0) {
                dst.append(buf(), pos(), chunk);
                skip(chunk);
                total += chunk;
            }
            if (this.maxLineLen > 0 && dst.length() >= this.maxLineLen) {
                throw new MaxLineLimitException("Maximum line length limit exceeded");
            }
        }
        if (total == 0 && bytesRead == -1) {
            return -1;
        }
        return total;
    }

    public int indexOf(byte[] pattern, int off, int len) {
        if (pattern == null) {
            throw new IllegalArgumentException("Pattern may not be null");
        }
        if (off < this.bufpos || len < 0 || off + len > this.buflen) {
            throw new IndexOutOfBoundsException("looking for " + off + "(" + len + ") in " + this.bufpos + "/" + this.buflen);
        }
        if (len < pattern.length) {
            return -1;
        }
        int[] shiftTable = new int[256];
        for (int i = 0; i < shiftTable.length; i++) {
            shiftTable[i] = pattern.length + 1;
        }
        for (int i2 = 0; i2 < pattern.length; i2++) {
            int x = pattern[i2] & 255;
            shiftTable[x] = pattern.length - i2;
        }
        int i3 = 0;
        while (true) {
            int j = i3;
            if (j <= len - pattern.length) {
                int cur = off + j;
                boolean match = true;
                int i4 = 0;
                while (true) {
                    if (i4 >= pattern.length) {
                        break;
                    }
                    if (this.buffer[cur + i4] == pattern[i4]) {
                        i4++;
                    } else {
                        match = false;
                        break;
                    }
                }
                if (match) {
                    return cur;
                }
                int pos = cur + pattern.length;
                if (pos < this.buffer.length) {
                    int x2 = this.buffer[pos] & 255;
                    i3 = j + shiftTable[x2];
                } else {
                    return -1;
                }
            } else {
                return -1;
            }
        }
    }

    public int indexOf(byte[] pattern) {
        return indexOf(pattern, this.bufpos, this.buflen - this.bufpos);
    }

    public int indexOf(byte b, int off, int len) {
        if (off < this.bufpos || len < 0 || off + len > this.buflen) {
            throw new IndexOutOfBoundsException();
        }
        for (int i = off; i < off + len; i++) {
            if (this.buffer[i] == b) {
                return i;
            }
        }
        return -1;
    }

    public int indexOf(byte b) {
        return indexOf(b, this.bufpos, bufferLen());
    }

    public int byteAt(int pos) {
        if (pos < this.bufpos || pos > this.buflen) {
            throw new IndexOutOfBoundsException("looking for " + pos + " in " + this.bufpos + "/" + this.buflen);
        }
        return this.buffer[pos] & 255;
    }

    protected byte[] buf() {
        return this.buffer;
    }

    protected int pos() {
        return this.bufpos;
    }

    protected int limit() {
        return this.buflen;
    }

    protected int length() {
        return bufferLen();
    }

    public int capacity() {
        return this.buffer.length;
    }

    protected int skip(int n) {
        int chunk = Math.min(n, bufferLen());
        this.bufpos += chunk;
        return chunk;
    }

    private void clear() {
        this.bufpos = 0;
        this.buflen = 0;
    }

    public String toString() {
        StringBuilder buffer = new StringBuilder();
        buffer.append("[pos: ");
        buffer.append(this.bufpos);
        buffer.append("]");
        buffer.append("[limit: ");
        buffer.append(this.buflen);
        buffer.append("]");
        buffer.append("[");
        for (int i = this.bufpos; i < this.buflen; i++) {
            buffer.append((char) this.buffer[i]);
        }
        buffer.append("]");
        if (this.tempBuffer) {
            buffer.append("-ORIG[pos: ");
            buffer.append(this.origBufpos);
            buffer.append("]");
            buffer.append("[limit: ");
            buffer.append(this.origBuflen);
            buffer.append("]");
            buffer.append("[");
            for (int i2 = this.origBufpos; i2 < this.origBuflen; i2++) {
                buffer.append((char) this.origBuffer[i2]);
            }
            buffer.append("]");
        }
        return buffer.toString();
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public boolean unread(ByteArrayBuffer buf) {
        if (this.tempBuffer) {
            return false;
        }
        this.origBuffer = this.buffer;
        this.origBuflen = this.buflen;
        this.origBufpos = this.bufpos;
        this.bufpos = 0;
        this.buflen = buf.length();
        this.buffer = buf.buffer();
        this.tempBuffer = true;
        return true;
    }
}
