package com.fasterxml.jackson.core.io;

import java.io.CharConversionException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/UTF32Reader.class */
public class UTF32Reader extends BaseReader {
    protected final boolean _bigEndian;
    protected char _surrogate;
    protected int _charCount;
    protected int _byteCount;
    protected final boolean _managedBuffers;

    @Override // com.fasterxml.jackson.core.io.BaseReader, java.io.Reader
    public /* bridge */ /* synthetic */ int read() throws IOException {
        return super.read();
    }

    @Override // com.fasterxml.jackson.core.io.BaseReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public /* bridge */ /* synthetic */ void close() throws IOException {
        super.close();
    }

    public UTF32Reader(IOContext iOContext, InputStream inputStream, byte[] bArr, int i, int i2, boolean z) {
        super(iOContext, inputStream, bArr, i, i2);
        this._surrogate = (char) 0;
        this._charCount = 0;
        this._byteCount = 0;
        this._bigEndian = z;
        this._managedBuffers = inputStream != null;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x015e A[PHI: r10 r12
      0x015e: PHI (r10v4 int) = (r10v2 int), (r10v6 int) binds: [B:31:0x00fc, B:36:0x0151] A[DONT_GENERATE, DONT_INLINE]
      0x015e: PHI (r12v2 int) = (r12v1 int), (r12v4 int) binds: [B:31:0x00fc, B:36:0x0151] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // java.io.Reader
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int read(char[] r7, int r8, int r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 394
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.core.io.UTF32Reader.read(char[], int, int):int");
    }

    private void reportUnexpectedEOF(int i, int i2) throws IOException {
        throw new CharConversionException("Unexpected EOF in the middle of a 4-byte UTF-32 char: got " + i + ", needed " + i2 + ", at char #" + this._charCount + ", byte #" + (this._byteCount + i) + ")");
    }

    private void reportInvalid(int i, int i2, String str) throws IOException {
        throw new CharConversionException("Invalid UTF-32 character 0x" + Integer.toHexString(i) + str + " at char #" + (this._charCount + i2) + ", byte #" + ((this._byteCount + this._ptr) - 1) + ")");
    }

    private boolean loadMore(int i) throws IOException {
        this._byteCount += this._length - i;
        if (i > 0) {
            if (this._ptr > 0) {
                for (int i2 = 0; i2 < i; i2++) {
                    this._buffer[i2] = this._buffer[this._ptr + i2];
                }
                this._ptr = 0;
            }
            this._length = i;
        } else {
            this._ptr = 0;
            int read = this._in == null ? -1 : this._in.read(this._buffer);
            if (read < 1) {
                this._length = 0;
                if (read < 0) {
                    if (this._managedBuffers) {
                        freeBuffers();
                        return false;
                    }
                    return false;
                }
                reportStrangeStream();
            }
            this._length = read;
        }
        while (this._length < 4) {
            int read2 = this._in == null ? -1 : this._in.read(this._buffer, this._length, this._buffer.length - this._length);
            if (read2 < 1) {
                if (read2 < 0) {
                    if (this._managedBuffers) {
                        freeBuffers();
                    }
                    reportUnexpectedEOF(this._length, 4);
                }
                reportStrangeStream();
            }
            this._length += read2;
        }
        return true;
    }
}
