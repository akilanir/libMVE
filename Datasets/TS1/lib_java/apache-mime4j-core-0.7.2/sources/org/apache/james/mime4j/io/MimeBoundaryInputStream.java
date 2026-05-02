package org.apache.james.mime4j.io;

import java.io.IOException;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.MimeIOException;
import org.apache.james.mime4j.util.ByteArrayBuffer;
import org.apache.james.mime4j.util.CharsetUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/MimeBoundaryInputStream.class */
public class MimeBoundaryInputStream extends LineReaderInputStream {
    private final byte[] boundary;
    private final boolean strict;
    private boolean eof;
    private int limit;
    private boolean atBoundary;
    private int boundaryLen;
    private boolean lastPart;
    private boolean completed;
    private BufferedLineReaderInputStream buffer;
    private int initialLength;

    public MimeBoundaryInputStream(BufferedLineReaderInputStream inbuffer, String boundary, boolean strict) throws IOException {
        super(inbuffer);
        int bufferSize = 2 * boundary.length();
        inbuffer.ensureCapacity(bufferSize < 4096 ? 4096 : bufferSize);
        this.buffer = inbuffer;
        this.eof = false;
        this.limit = -1;
        this.atBoundary = false;
        this.boundaryLen = 0;
        this.lastPart = false;
        this.initialLength = -1;
        this.completed = false;
        this.strict = strict;
        this.boundary = new byte[boundary.length() + 2];
        this.boundary[0] = 45;
        this.boundary[1] = 45;
        for (int i = 0; i < boundary.length(); i++) {
            byte ch = (byte) boundary.charAt(i);
            this.boundary[i + 2] = ch;
        }
        fillBuffer();
    }

    public MimeBoundaryInputStream(BufferedLineReaderInputStream inbuffer, String boundary) throws IOException {
        this(inbuffer, boundary, false);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    public boolean readAllowed() throws IOException {
        if (this.completed) {
            return false;
        }
        if (endOfStream() && !hasData()) {
            skipBoundary();
            verifyEndOfStream();
            return false;
        }
        return true;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        while (readAllowed()) {
            if (hasData()) {
                return this.buffer.read();
            }
            fillBuffer();
        }
        return -1;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        while (readAllowed()) {
            if (hasData()) {
                int chunk = Math.min(len, this.limit - this.buffer.pos());
                return this.buffer.read(b, off, chunk);
            }
            fillBuffer();
        }
        return -1;
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public int readLine(ByteArrayBuffer dst) throws IOException {
        int chunk;
        if (dst == null) {
            throw new IllegalArgumentException("Destination buffer may not be null");
        }
        if (!readAllowed()) {
            return -1;
        }
        int total = 0;
        boolean found = false;
        int bytesRead = 0;
        while (true) {
            if (found) {
                break;
            }
            if (!hasData()) {
                bytesRead = fillBuffer();
                if (endOfStream() && !hasData()) {
                    skipBoundary();
                    verifyEndOfStream();
                    bytesRead = -1;
                    break;
                }
            }
            int len = this.limit - this.buffer.pos();
            int i = this.buffer.indexOf((byte) 10, this.buffer.pos(), len);
            if (i != -1) {
                found = true;
                chunk = (i + 1) - this.buffer.pos();
            } else {
                chunk = len;
            }
            if (chunk > 0) {
                dst.append(this.buffer.buf(), this.buffer.pos(), chunk);
                this.buffer.skip(chunk);
                total += chunk;
            }
        }
        if (total == 0 && bytesRead == -1) {
            return -1;
        }
        return total;
    }

    private void verifyEndOfStream() throws IOException {
        if (this.strict && this.eof && !this.atBoundary) {
            throw new MimeIOException(new MimeException("Unexpected end of stream"));
        }
    }

    private boolean endOfStream() {
        return this.eof || this.atBoundary;
    }

    private boolean hasData() {
        return this.limit > this.buffer.pos() && this.limit <= this.buffer.limit();
    }

    private int fillBuffer() throws IOException {
        int bytesRead;
        int i;
        if (this.eof) {
            return -1;
        }
        if (!hasData()) {
            bytesRead = this.buffer.fillBuffer();
            if (bytesRead == -1) {
                this.eof = true;
            }
        } else {
            bytesRead = 0;
        }
        int pos = this.buffer.pos();
        while (true) {
            int off = pos;
            i = this.buffer.indexOf(this.boundary, off, this.buffer.limit() - off);
            if (i == -1) {
                break;
            }
            if (i == this.buffer.pos() || this.buffer.byteAt(i - 1) == 10) {
                int pos2 = i + this.boundary.length;
                int remaining = this.buffer.limit() - pos2;
                if (remaining <= 0) {
                    break;
                }
                char ch = (char) this.buffer.byteAt(pos2);
                if (CharsetUtil.isWhitespace(ch) || ch == '-') {
                    break;
                }
            }
            pos = i + this.boundary.length;
        }
        if (i != -1) {
            this.limit = i;
            this.atBoundary = true;
            calculateBoundaryLen();
        } else if (this.eof) {
            this.limit = this.buffer.limit();
        } else {
            this.limit = this.buffer.limit() - (this.boundary.length + 2);
        }
        return bytesRead;
    }

    public boolean isEmptyStream() {
        return this.initialLength == 0;
    }

    public boolean isFullyConsumed() {
        return this.completed && !this.buffer.hasBufferedData();
    }

    private void calculateBoundaryLen() throws IOException {
        this.boundaryLen = this.boundary.length;
        int len = this.limit - this.buffer.pos();
        if (len >= 0 && this.initialLength == -1) {
            this.initialLength = len;
        }
        if (len > 0 && this.buffer.byteAt(this.limit - 1) == 10) {
            this.boundaryLen++;
            this.limit--;
        }
        if (len > 1 && this.buffer.byteAt(this.limit - 1) == 13) {
            this.boundaryLen++;
            this.limit--;
        }
    }

    private void skipBoundary() throws IOException {
        if (!this.completed) {
            this.completed = true;
            this.buffer.skip(this.boundaryLen);
            boolean checkForLastPart = true;
            while (true) {
                if (this.buffer.length() > 1) {
                    int ch1 = this.buffer.byteAt(this.buffer.pos());
                    int ch2 = this.buffer.byteAt(this.buffer.pos() + 1);
                    if (checkForLastPart && ch1 == 45 && ch2 == 45) {
                        this.lastPart = true;
                        this.buffer.skip(2);
                        checkForLastPart = false;
                    } else if (ch1 == 13 && ch2 == 10) {
                        this.buffer.skip(2);
                        return;
                    } else {
                        if (ch1 == 10) {
                            this.buffer.skip(1);
                            return;
                        }
                        this.buffer.skip(1);
                    }
                } else if (!this.eof) {
                    fillBuffer();
                } else {
                    return;
                }
            }
        }
    }

    public boolean isLastPart() {
        return this.lastPart;
    }

    public boolean eof() {
        return this.eof && !this.buffer.hasBufferedData();
    }

    public String toString() {
        StringBuilder buffer = new StringBuilder("MimeBoundaryInputStream, boundary ");
        byte[] arr$ = this.boundary;
        for (byte b : arr$) {
            buffer.append((char) b);
        }
        return buffer.toString();
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public boolean unread(ByteArrayBuffer buf) {
        return false;
    }
}
