package com.jcraft.jsch;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Buffer.class */
public class Buffer {
    final byte[] tmp;
    byte[] buffer;
    int index;
    int s;

    public Buffer(int size) {
        this.tmp = new byte[4];
        this.buffer = new byte[size];
        this.index = 0;
        this.s = 0;
    }

    public Buffer(byte[] buffer) {
        this.tmp = new byte[4];
        this.buffer = buffer;
        this.index = 0;
        this.s = 0;
    }

    public Buffer() {
        this(20480);
    }

    public void putByte(byte foo) {
        byte[] bArr = this.buffer;
        int i = this.index;
        this.index = i + 1;
        bArr[i] = foo;
    }

    public void putByte(byte[] foo) {
        putByte(foo, 0, foo.length);
    }

    public void putByte(byte[] foo, int begin, int length) {
        System.arraycopy(foo, begin, this.buffer, this.index, length);
        this.index += length;
    }

    public void putString(byte[] foo) {
        putString(foo, 0, foo.length);
    }

    public void putString(byte[] foo, int begin, int length) {
        putInt(length);
        putByte(foo, begin, length);
    }

    public void putInt(int val) {
        this.tmp[0] = (byte) (val >>> 24);
        this.tmp[1] = (byte) (val >>> 16);
        this.tmp[2] = (byte) (val >>> 8);
        this.tmp[3] = (byte) val;
        System.arraycopy(this.tmp, 0, this.buffer, this.index, 4);
        this.index += 4;
    }

    public void putLong(long val) {
        this.tmp[0] = (byte) (val >>> 56);
        this.tmp[1] = (byte) (val >>> 48);
        this.tmp[2] = (byte) (val >>> 40);
        this.tmp[3] = (byte) (val >>> 32);
        System.arraycopy(this.tmp, 0, this.buffer, this.index, 4);
        this.tmp[0] = (byte) (val >>> 24);
        this.tmp[1] = (byte) (val >>> 16);
        this.tmp[2] = (byte) (val >>> 8);
        this.tmp[3] = (byte) val;
        System.arraycopy(this.tmp, 0, this.buffer, this.index + 4, 4);
        this.index += 8;
    }

    void skip(int n) {
        this.index += n;
    }

    void putPad(int n) {
        while (n > 0) {
            byte[] bArr = this.buffer;
            int i = this.index;
            this.index = i + 1;
            bArr[i] = 0;
            n--;
        }
    }

    public void putMPInt(byte[] foo) {
        int i = foo.length;
        if ((foo[0] & 128) != 0) {
            putInt(i + 1);
            putByte((byte) 0);
        } else {
            putInt(i);
        }
        putByte(foo);
    }

    public int getLength() {
        return this.index - this.s;
    }

    public int getOffSet() {
        return this.s;
    }

    public void setOffSet(int s) {
        this.s = s;
    }

    public long getLong() {
        long foo = getInt() & 4294967295L;
        return (foo << 32) | (getInt() & 4294967295L);
    }

    public int getInt() {
        int foo = getShort();
        return ((foo << 16) & (-65536)) | (getShort() & 65535);
    }

    public long getUInt() {
        long foo = getByte();
        long foo2 = ((foo << 8) & 65280) | (getByte() & 255);
        long bar = getByte();
        return ((foo2 << 16) & (-65536)) | ((((bar << 8) & 65280) | (getByte() & 255)) & 65535);
    }

    int getShort() {
        int foo = getByte();
        return ((foo << 8) & 65280) | (getByte() & 255);
    }

    public int getByte() {
        byte[] bArr = this.buffer;
        int i = this.s;
        this.s = i + 1;
        return bArr[i] & 255;
    }

    public void getByte(byte[] foo) {
        getByte(foo, 0, foo.length);
    }

    void getByte(byte[] foo, int start, int len) {
        System.arraycopy(this.buffer, this.s, foo, start, len);
        this.s += len;
    }

    public int getByte(int len) {
        int foo = this.s;
        this.s += len;
        return foo;
    }

    public byte[] getMPInt() {
        int i = getInt();
        if (i < 0 || i > 8192) {
            i = 8192;
        }
        byte[] foo = new byte[i];
        getByte(foo, 0, i);
        return foo;
    }

    public byte[] getMPIntBits() {
        int bits = getInt();
        int bytes = (bits + 7) / 8;
        byte[] foo = new byte[bytes];
        getByte(foo, 0, bytes);
        if ((foo[0] & 128) != 0) {
            byte[] bar = new byte[foo.length + 1];
            bar[0] = 0;
            System.arraycopy(foo, 0, bar, 1, foo.length);
            foo = bar;
        }
        return foo;
    }

    public byte[] getString() {
        int i = getInt();
        if (i < 0 || i > 262144) {
            i = 262144;
        }
        byte[] foo = new byte[i];
        getByte(foo, 0, i);
        return foo;
    }

    byte[] getString(int[] start, int[] len) {
        int i = getInt();
        start[0] = getByte(i);
        len[0] = i;
        return this.buffer;
    }

    public void reset() {
        this.index = 0;
        this.s = 0;
    }

    public void shift() {
        if (this.s == 0) {
            return;
        }
        System.arraycopy(this.buffer, this.s, this.buffer, 0, this.index - this.s);
        this.index -= this.s;
        this.s = 0;
    }

    void rewind() {
        this.s = 0;
    }

    byte getCommand() {
        return this.buffer[5];
    }

    void checkFreeSize(int n) {
        int size = this.index + n + 84;
        if (this.buffer.length < size) {
            int i = this.buffer.length * 2;
            if (i < size) {
                i = size;
            }
            byte[] tmp = new byte[i];
            System.arraycopy(this.buffer, 0, tmp, 0, this.index);
            this.buffer = tmp;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [byte[], byte[][]] */
    byte[][] getBytes(int n, String msg) throws JSchException {
        ?? r0 = new byte[n];
        for (int i = 0; i < n; i++) {
            int j = getInt();
            if (getLength() < j) {
                throw new JSchException(msg);
            }
            r0[i] = new byte[j];
            getByte(r0[i]);
        }
        return r0;
    }

    static Buffer fromBytes(byte[][] args) {
        int length = args.length * 4;
        for (byte[] bArr : args) {
            length += bArr.length;
        }
        Buffer buf = new Buffer(length);
        for (byte[] bArr2 : args) {
            buf.putString(bArr2);
        }
        return buf;
    }
}
