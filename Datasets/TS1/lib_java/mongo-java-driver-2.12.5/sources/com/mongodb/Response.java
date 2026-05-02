package com.mongodb;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.bson.io.Bits;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Response.class */
class Response {
    final ServerAddress _host;
    final int _len;
    final int _id;
    final int _responseTo;
    final int _operation;
    final int _flags;
    long _cursor;
    final int _startingFrom;
    final int _num;
    final List<DBObject> _objects;
    private static final int MAX_LENGTH = 33554432;

    Response(ServerAddress addr, DBCollection collection, InputStream in, DBDecoder decoder) throws IOException {
        this._host = addr;
        byte[] b = new byte[36];
        Bits.readFully(in, b);
        this._len = Bits.readInt(b, 0);
        int pos = 0 + 4;
        if (this._len > MAX_LENGTH) {
            throw new IllegalArgumentException("response too long: " + this._len);
        }
        this._id = Bits.readInt(b, pos);
        int pos2 = pos + 4;
        this._responseTo = Bits.readInt(b, pos2);
        int pos3 = pos2 + 4;
        this._operation = Bits.readInt(b, pos3);
        int pos4 = pos3 + 4;
        this._flags = Bits.readInt(b, pos4);
        int pos5 = pos4 + 4;
        this._cursor = Bits.readLong(b, pos5);
        int pos6 = pos5 + 8;
        this._startingFrom = Bits.readInt(b, pos6);
        int pos7 = pos6 + 4;
        this._num = Bits.readInt(b, pos7);
        int i = pos7 + 4;
        MyInputStream user = new MyInputStream(in, this._len - b.length);
        if (this._num < 2) {
            this._objects = new LinkedList();
        } else {
            this._objects = new ArrayList(this._num);
        }
        for (int i2 = 0; i2 < this._num; i2++) {
            if (user._toGo < 5) {
                throw new IOException("should have more objects, but only " + user._toGo + " bytes left");
            }
            this._objects.add(decoder.decode(user, collection));
        }
        if (user._toGo != 0) {
            throw new IOException("finished reading objects but still have: " + user._toGo + " bytes to read!' ");
        }
        if (this._num != this._objects.size()) {
            throw new RuntimeException("something is really broken");
        }
    }

    public int size() {
        return this._num;
    }

    public ServerAddress serverUsed() {
        return this._host;
    }

    public DBObject get(int i) {
        return this._objects.get(i);
    }

    public Iterator<DBObject> iterator() {
        return this._objects.iterator();
    }

    public long cursor() {
        return this._cursor;
    }

    public ServerError getError() {
        if (this._num != 1) {
            return null;
        }
        DBObject obj = get(0);
        if (ServerError.getMsg(obj, null) == null) {
            return null;
        }
        return new ServerError(obj);
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Response$MyInputStream.class */
    static class MyInputStream extends InputStream {
        final InputStream _in;
        private int _toGo;

        MyInputStream(InputStream in, int max) {
            this._in = in;
            this._toGo = max;
        }

        @Override // java.io.InputStream
        public int available() throws IOException {
            return this._in.available();
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            if (this._toGo <= 0) {
                return -1;
            }
            int val = this._in.read();
            this._toGo--;
            return val;
        }

        @Override // java.io.InputStream
        public int read(byte[] b, int off, int len) throws IOException {
            if (this._toGo <= 0) {
                return -1;
            }
            int n = this._in.read(b, off, Math.min(this._toGo, len));
            this._toGo -= n;
            return n;
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            throw new RuntimeException("can't close thos");
        }
    }

    public String toString() {
        return "flags:" + this._flags + " _cursor:" + this._cursor + " _startingFrom:" + this._startingFrom + " _num:" + this._num;
    }
}
