package org.apache.james.mime4j.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.util.ByteArrayBuffer;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/LineReaderInputStreamAdaptor.class */
public class LineReaderInputStreamAdaptor extends LineReaderInputStream {
    private final LineReaderInputStream bis;
    private final int maxLineLen;
    private boolean used;
    private boolean eof;

    public LineReaderInputStreamAdaptor(InputStream is, int maxLineLen) {
        super(is);
        this.used = false;
        this.eof = false;
        if (is instanceof LineReaderInputStream) {
            this.bis = (LineReaderInputStream) is;
        } else {
            this.bis = null;
        }
        this.maxLineLen = maxLineLen;
    }

    public LineReaderInputStreamAdaptor(InputStream is) {
        this(is, -1);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i = this.in.read();
        this.eof = i == -1;
        this.used = true;
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int i = this.in.read(b, off, len);
        this.eof = i == -1;
        this.used = true;
        return i;
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public int readLine(ByteArrayBuffer dst) throws MaxLineLimitException, IOException {
        int i;
        if (this.bis != null) {
            i = this.bis.readLine(dst);
        } else {
            i = doReadLine(dst);
        }
        this.eof = i == -1;
        this.used = true;
        return i;
    }

    private int doReadLine(ByteArrayBuffer dst) throws MaxLineLimitException, IOException {
        int ch;
        int total = 0;
        do {
            ch = this.in.read();
            if (ch == -1) {
                break;
            }
            dst.append(ch);
            total++;
            if (this.maxLineLen > 0 && dst.length() >= this.maxLineLen) {
                throw new MaxLineLimitException("Maximum line length limit exceeded");
            }
        } while (ch != 10);
        if (total == 0 && ch == -1) {
            return -1;
        }
        return total;
    }

    public boolean eof() {
        return this.eof;
    }

    public boolean isUsed() {
        return this.used;
    }

    public String toString() {
        return "[LineReaderInputStreamAdaptor: " + this.bis + "]";
    }

    @Override // org.apache.james.mime4j.io.LineReaderInputStream
    public boolean unread(ByteArrayBuffer buf) {
        if (this.bis != null) {
            return this.bis.unread(buf);
        }
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long count) throws IOException {
        int res;
        if (count <= 0) {
            return 0L;
        }
        int bufferSize = count > 8192 ? 8192 : (int) count;
        byte[] buffer = new byte[bufferSize];
        long result = 0;
        while (count > 0 && (res = read(buffer)) != -1) {
            result += res;
            count -= res;
        }
        return result;
    }
}
