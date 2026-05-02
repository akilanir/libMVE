package com.drew.lang;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.SuppressWarnings;
import java.io.IOException;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/lang/ByteArrayReader.class */
public class ByteArrayReader extends RandomAccessReader {

    @NotNull
    private final byte[] _buffer;

    @SuppressWarnings(value = "EI_EXPOSE_REP2", justification = "Design intent")
    public ByteArrayReader(@NotNull byte[] buffer) {
        if (buffer == null) {
            throw new NullPointerException();
        }
        this._buffer = buffer;
    }

    @Override // com.drew.lang.RandomAccessReader
    public long getLength() {
        return this._buffer.length;
    }

    @Override // com.drew.lang.RandomAccessReader
    protected byte getByte(int index) throws IOException {
        return this._buffer[index];
    }

    @Override // com.drew.lang.RandomAccessReader
    protected void validateIndex(int index, int bytesRequested) throws IOException {
        if (!isValidIndex(index, bytesRequested)) {
            throw new BufferBoundsException(index, bytesRequested, this._buffer.length);
        }
    }

    @Override // com.drew.lang.RandomAccessReader
    protected boolean isValidIndex(int index, int bytesRequested) throws IOException {
        return bytesRequested >= 0 && index >= 0 && (((long) index) + ((long) bytesRequested)) - 1 < ((long) this._buffer.length);
    }

    @Override // com.drew.lang.RandomAccessReader
    @NotNull
    public byte[] getBytes(int index, int count) throws IOException {
        validateIndex(index, count);
        byte[] bytes = new byte[count];
        System.arraycopy(this._buffer, index, bytes, 0, count);
        return bytes;
    }
}
