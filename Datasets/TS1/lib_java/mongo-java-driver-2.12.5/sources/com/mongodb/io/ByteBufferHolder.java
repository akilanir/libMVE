package com.mongodb.io;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/io/ByteBufferHolder.class */
public class ByteBufferHolder {
    List<ByteBuffer> _buffers;
    int _pos;
    final int _max;
    static final int _bufSize = 4096;

    public ByteBufferHolder() {
        this(1073741824);
    }

    public ByteBufferHolder(int max) {
        this._buffers = new ArrayList();
        this._pos = 0;
        this._max = max;
    }

    public byte get(int i) {
        if (i >= this._pos) {
            throw new RuntimeException("out of bounds");
        }
        int num = i / _bufSize;
        int pos = i % _bufSize;
        return this._buffers.get(num).get(pos);
    }

    public void get(int pos, byte[] b) {
        for (int i = 0; i < b.length; i++) {
            b[i] = get(i + pos);
        }
    }

    public void put(int i, byte val) {
        if (i >= this._pos) {
            throw new RuntimeException("out of bounds");
        }
        int num = i / _bufSize;
        int pos = i % _bufSize;
        this._buffers.get(num).put(pos, val);
    }

    public int position() {
        return this._pos;
    }

    public void position(int p) {
        this._pos = p;
        int num = this._pos / _bufSize;
        int pos = this._pos % _bufSize;
        while (this._buffers.size() <= num) {
            _addBucket();
        }
        ByteBuffer bb = this._buffers.get(num);
        bb.position(pos);
        for (int i = num + 1; i < this._buffers.size(); i++) {
            this._buffers.get(i).position(0);
        }
    }

    public int remaining() {
        return Integer.MAX_VALUE;
    }

    public void put(ByteBuffer in) {
        while (in.hasRemaining()) {
            int num = this._pos / _bufSize;
            if (num >= this._buffers.size()) {
                _addBucket();
            }
            ByteBuffer bb = this._buffers.get(num);
            int canRead = Math.min(bb.remaining(), in.remaining());
            int oldLimit = in.limit();
            in.limit(in.position() + canRead);
            bb.put(in);
            in.limit(oldLimit);
            this._pos += canRead;
        }
    }

    private void _addBucket() {
        if (capacity() + _bufSize > this._max) {
            throw new RuntimeException("too big current:" + capacity());
        }
        this._buffers.add(ByteBuffer.allocateDirect(_bufSize));
    }

    public int capacity() {
        return this._buffers.size() * _bufSize;
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("{ ByteBufferHolder pos:" + this._pos + " ");
        for (ByteBuffer bb : this._buffers) {
            buf.append(bb).append(" ");
        }
        return buf.append("}").toString();
    }
}
