package org.apache.commons.io.input;

import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/input/NullReader.class */
public class NullReader extends Reader {
    private long size;
    private long position;
    private long mark;
    private long readlimit;
    private boolean eof;
    private boolean throwEofException;
    private boolean markSupported;

    public NullReader(long size) {
        this(size, true, false);
    }

    public NullReader(long size, boolean markSupported, boolean throwEofException) {
        this.mark = -1L;
        this.size = size;
        this.markSupported = markSupported;
        this.throwEofException = throwEofException;
    }

    public long getPosition() {
        return this.position;
    }

    public long getSize() {
        return this.size;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.eof = false;
        this.position = 0L;
        this.mark = -1L;
    }

    @Override // java.io.Reader
    public synchronized void mark(int readlimit) {
        if (!this.markSupported) {
            throw new UnsupportedOperationException("Mark not supported");
        }
        this.mark = this.position;
        this.readlimit = readlimit;
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        return this.markSupported;
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        if (this.eof) {
            throw new IOException("Read after end of file");
        }
        if (this.position == this.size) {
            return doEndOfFile();
        }
        this.position++;
        return processChar();
    }

    @Override // java.io.Reader
    public int read(char[] chars) throws IOException {
        return read(chars, 0, chars.length);
    }

    @Override // java.io.Reader
    public int read(char[] chars, int offset, int length) throws IOException {
        if (this.eof) {
            throw new IOException("Read after end of file");
        }
        if (this.position == this.size) {
            return doEndOfFile();
        }
        this.position += length;
        int returnLength = length;
        if (this.position > this.size) {
            returnLength = length - ((int) (this.position - this.size));
            this.position = this.size;
        }
        processChars(chars, offset, returnLength);
        return returnLength;
    }

    @Override // java.io.Reader
    public synchronized void reset() throws IOException {
        if (!this.markSupported) {
            throw new UnsupportedOperationException("Mark not supported");
        }
        if (this.mark < 0) {
            throw new IOException("No position has been marked");
        }
        if (this.position > this.mark + this.readlimit) {
            throw new IOException(new StringBuffer().append("Marked position [").append(this.mark).append("] is no longer valid - passed the read limit [").append(this.readlimit).append("]").toString());
        }
        this.position = this.mark;
        this.eof = false;
    }

    @Override // java.io.Reader
    public long skip(long numberOfChars) throws IOException {
        if (this.eof) {
            throw new IOException("Skip after end of file");
        }
        if (this.position == this.size) {
            return doEndOfFile();
        }
        this.position += numberOfChars;
        long returnLength = numberOfChars;
        if (this.position > this.size) {
            returnLength = numberOfChars - (this.position - this.size);
            this.position = this.size;
        }
        return returnLength;
    }

    protected int processChar() {
        return 0;
    }

    protected void processChars(char[] chars, int offset, int length) {
    }

    private int doEndOfFile() throws EOFException {
        this.eof = true;
        if (this.throwEofException) {
            throw new EOFException();
        }
        return -1;
    }
}
