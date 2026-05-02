package org.bson.io;

import com.mongodb.Bytes;
import java.io.DataOutput;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/io/BasicOutputBuffer.class */
public class BasicOutputBuffer extends OutputBuffer {
    private int _cur;
    private int _size;
    private byte[] _buffer = new byte[512];

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] b) {
        write(b, 0, b.length);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] b, int off, int len) {
        _ensure(len);
        System.arraycopy(b, off, this._buffer, this._cur, len);
        this._cur += len;
        this._size = Math.max(this._cur, this._size);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(int b) {
        _ensure(1);
        byte[] bArr = this._buffer;
        int i = this._cur;
        this._cur = i + 1;
        bArr[i] = (byte) (255 & b);
        this._size = Math.max(this._cur, this._size);
    }

    @Override // org.bson.io.OutputBuffer
    public int getPosition() {
        return this._cur;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void setPosition(int position) {
        this._cur = position;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekEnd() {
        this._cur = this._size;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekStart() {
        this._cur = 0;
    }

    @Override // org.bson.io.OutputBuffer
    public int size() {
        return this._size;
    }

    @Override // org.bson.io.OutputBuffer
    public int pipe(OutputStream out) throws IOException {
        out.write(this._buffer, 0, this._size);
        return this._size;
    }

    @Deprecated
    public int pipe(DataOutput out) throws IOException {
        out.write(this._buffer, 0, this._size);
        return this._size;
    }

    void _ensure(int more) {
        int need = this._cur + more;
        if (need < this._buffer.length) {
            return;
        }
        int newSize = this._buffer.length * 2;
        if (newSize <= need) {
            newSize = need + Bytes.QUERYOPTION_PARTIAL;
        }
        byte[] n = new byte[newSize];
        System.arraycopy(this._buffer, 0, n, 0, this._size);
        this._buffer = n;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public String asString() {
        return new String(this._buffer, 0, this._size);
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public String asString(String encoding) throws UnsupportedEncodingException {
        return new String(this._buffer, 0, this._size, encoding);
    }
}
