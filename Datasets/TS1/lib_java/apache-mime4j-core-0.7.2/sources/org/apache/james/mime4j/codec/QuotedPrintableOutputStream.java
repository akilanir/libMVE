package org.apache.james.mime4j.codec;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/codec/QuotedPrintableOutputStream.class */
public class QuotedPrintableOutputStream extends FilterOutputStream {
    private static final int DEFAULT_BUFFER_SIZE = 3072;
    private static final byte TB = 9;
    private static final byte SP = 32;
    private static final byte EQ = 61;
    private static final byte DOT = 46;
    private static final byte CR = 13;
    private static final byte LF = 10;
    private static final byte QUOTED_PRINTABLE_LAST_PLAIN = 126;
    private static final int QUOTED_PRINTABLE_MAX_LINE_LENGTH = 76;
    private static final int QUOTED_PRINTABLE_OCTETS_PER_ESCAPE = 3;
    private static final byte[] HEX_DIGITS = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70};
    private final byte[] outBuffer;
    private final boolean binary;
    private boolean pendingSpace;
    private boolean pendingTab;
    private boolean pendingCR;
    private int nextSoftBreak;
    private int outputIndex;
    private boolean closed;
    private byte[] singleByte;

    public QuotedPrintableOutputStream(int bufsize, OutputStream out, boolean binary) {
        super(out);
        this.closed = false;
        this.singleByte = new byte[1];
        this.outBuffer = new byte[bufsize];
        this.binary = binary;
        this.pendingSpace = false;
        this.pendingTab = false;
        this.pendingCR = false;
        this.outputIndex = 0;
        this.nextSoftBreak = 77;
    }

    public QuotedPrintableOutputStream(OutputStream out, boolean binary) {
        this(DEFAULT_BUFFER_SIZE, out, binary);
    }

    private void encodeChunk(byte[] buffer, int off, int len) throws IOException {
        for (int inputIndex = off; inputIndex < len + off; inputIndex++) {
            encode(buffer[inputIndex]);
        }
    }

    private void completeEncoding() throws IOException {
        writePending();
        flushOutput();
    }

    private void writePending() throws IOException {
        if (this.pendingSpace) {
            plain((byte) 32);
        } else if (this.pendingTab) {
            plain((byte) 9);
        } else if (this.pendingCR) {
            plain((byte) 13);
        }
        clearPending();
    }

    private void clearPending() throws IOException {
        this.pendingSpace = false;
        this.pendingTab = false;
        this.pendingCR = false;
    }

    private void encode(byte next) throws IOException {
        if (next == 10) {
            if (this.binary) {
                writePending();
                escape(next);
                return;
            } else {
                if (this.pendingCR) {
                    if (this.pendingSpace) {
                        escape((byte) 32);
                    } else if (this.pendingTab) {
                        escape((byte) 9);
                    }
                    lineBreak();
                    clearPending();
                    return;
                }
                writePending();
                plain(next);
                return;
            }
        }
        if (next == 13) {
            if (this.binary) {
                escape(next);
                return;
            } else {
                this.pendingCR = true;
                return;
            }
        }
        writePending();
        if (next == 32) {
            if (this.binary) {
                escape(next);
                return;
            } else {
                this.pendingSpace = true;
                return;
            }
        }
        if (next == 9) {
            if (this.binary) {
                escape(next);
                return;
            } else {
                this.pendingTab = true;
                return;
            }
        }
        if (next < 32) {
            escape(next);
            return;
        }
        if (next > QUOTED_PRINTABLE_LAST_PLAIN) {
            escape(next);
        } else if (next == EQ || next == DOT) {
            escape(next);
        } else {
            plain(next);
        }
    }

    private void plain(byte next) throws IOException {
        int i = this.nextSoftBreak - 1;
        this.nextSoftBreak = i;
        if (i <= 1) {
            softBreak();
        }
        write(next);
    }

    private void escape(byte next) throws IOException {
        int i = this.nextSoftBreak - 1;
        this.nextSoftBreak = i;
        if (i <= 3) {
            softBreak();
        }
        int nextUnsigned = next & 255;
        write((byte) 61);
        this.nextSoftBreak--;
        write(HEX_DIGITS[nextUnsigned >> 4]);
        this.nextSoftBreak--;
        write(HEX_DIGITS[nextUnsigned % 16]);
    }

    private void write(byte next) throws IOException {
        byte[] bArr = this.outBuffer;
        int i = this.outputIndex;
        this.outputIndex = i + 1;
        bArr[i] = next;
        if (this.outputIndex >= this.outBuffer.length) {
            flushOutput();
        }
    }

    private void softBreak() throws IOException {
        write((byte) 61);
        lineBreak();
    }

    private void lineBreak() throws IOException {
        write((byte) 13);
        write((byte) 10);
        this.nextSoftBreak = QUOTED_PRINTABLE_MAX_LINE_LENGTH;
    }

    void flushOutput() throws IOException {
        if (this.outputIndex < this.outBuffer.length) {
            this.out.write(this.outBuffer, 0, this.outputIndex);
        } else {
            this.out.write(this.outBuffer);
        }
        this.outputIndex = 0;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        try {
            completeEncoding();
            this.closed = true;
        } catch (Throwable th) {
            this.closed = true;
            throw th;
        }
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        flushOutput();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int b) throws IOException {
        this.singleByte[0] = (byte) b;
        write(this.singleByte, 0, 1);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been closed");
        }
        encodeChunk(b, off, len);
    }
}
