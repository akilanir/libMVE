package org.bson.io;

import java.io.UnsupportedEncodingException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import org.bson.BSONException;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/io/BSONByteBuffer.class */
public class BSONByteBuffer {
    protected ByteBuffer buf;

    private BSONByteBuffer(ByteBuffer buf) {
        this.buf = buf;
        buf.order(ByteOrder.LITTLE_ENDIAN);
    }

    public static BSONByteBuffer wrap(byte[] bytes, int offset, int length) {
        return new BSONByteBuffer(ByteBuffer.wrap(bytes, offset, length));
    }

    public static BSONByteBuffer wrap(byte[] bytes) {
        return new BSONByteBuffer(ByteBuffer.wrap(bytes));
    }

    public byte get(int i) {
        return this.buf.get(i);
    }

    public ByteBuffer get(byte[] bytes, int offset, int length) {
        return this.buf.get(bytes, offset, length);
    }

    public ByteBuffer get(byte[] bytes) {
        return this.buf.get(bytes);
    }

    public byte[] array() {
        return this.buf.array();
    }

    public String toString() {
        return this.buf.toString();
    }

    public int hashCode() {
        return this.buf.hashCode();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BSONByteBuffer that = (BSONByteBuffer) o;
        return this.buf != null ? this.buf.equals(that.buf) : that.buf == null;
    }

    public int getInt(int i) {
        return getIntLE(i);
    }

    public int getIntLE(int i) {
        int x = 0 | ((255 & this.buf.get(i + 0)) << 0);
        return x | ((255 & this.buf.get(i + 1)) << 8) | ((255 & this.buf.get(i + 2)) << 16) | ((255 & this.buf.get(i + 3)) << 24);
    }

    public int getIntBE(int i) {
        int x = 0 | ((255 & this.buf.get(i + 0)) << 24);
        return x | ((255 & this.buf.get(i + 1)) << 16) | ((255 & this.buf.get(i + 2)) << 8) | ((255 & this.buf.get(i + 3)) << 0);
    }

    public long getLong(int i) {
        return this.buf.getLong(i);
    }

    public String getCString(int offset) {
        int end = offset;
        while (get(end) != 0) {
            end++;
        }
        int len = end - offset;
        return new String(array(), offset, len);
    }

    public String getUTF8String(int valueOffset) {
        int size = getInt(valueOffset) - 1;
        try {
            return new String(array(), valueOffset + 4, size, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new BSONException("Cannot decode string as UTF-8.");
        }
    }

    public Buffer position(int i) {
        return this.buf.position(i);
    }

    public Buffer reset() {
        return this.buf.reset();
    }

    public int size() {
        return getInt(0);
    }
}
