package com.mindprod.ledatastream;

import java.io.DataInput;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: apktool-lib-1.4.4-3.jar:com/mindprod/ledatastream/LEDataInputStream.class */
public final class LEDataInputStream implements DataInput {
    private static final String EMBEDDED_COPYRIGHT = "copyright (c) 1999-2010 Roedy Green, Canadian Mind Products, http://mindprod.com";
    protected final DataInputStream dis;
    protected final InputStream is;
    protected final byte[] work = new byte[8];

    public static String readUTF(DataInput dataInput) throws IOException {
        return DataInputStream.readUTF(dataInput);
    }

    public LEDataInputStream(InputStream inputStream) {
        this.is = inputStream;
        this.dis = new DataInputStream(inputStream);
    }

    public final void close() throws IOException {
        this.dis.close();
    }

    public final int read(byte[] bArr, int i, int i2) throws IOException {
        return this.is.read(bArr, i, i2);
    }

    @Override // java.io.DataInput
    public final boolean readBoolean() throws IOException {
        return this.dis.readBoolean();
    }

    @Override // java.io.DataInput
    public final byte readByte() throws IOException {
        return this.dis.readByte();
    }

    @Override // java.io.DataInput
    public final char readChar() throws IOException {
        this.dis.readFully(this.work, 0, 2);
        return (char) (((this.work[1] & 255) << 8) | (this.work[0] & 255));
    }

    @Override // java.io.DataInput
    public final double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    @Override // java.io.DataInput
    public final float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    @Override // java.io.DataInput
    public final void readFully(byte[] bArr) throws IOException {
        this.dis.readFully(bArr, 0, bArr.length);
    }

    @Override // java.io.DataInput
    public final void readFully(byte[] bArr, int i, int i2) throws IOException {
        this.dis.readFully(bArr, i, i2);
    }

    @Override // java.io.DataInput
    public final int readInt() throws IOException {
        this.dis.readFully(this.work, 0, 4);
        return (this.work[3] << 24) | ((this.work[2] & 255) << 16) | ((this.work[1] & 255) << 8) | (this.work[0] & 255);
    }

    @Override // java.io.DataInput
    public final String readLine() throws IOException {
        return this.dis.readLine();
    }

    @Override // java.io.DataInput
    public final long readLong() throws IOException {
        this.dis.readFully(this.work, 0, 8);
        return (this.work[7] << 56) | ((this.work[6] & 255) << 48) | ((this.work[5] & 255) << 40) | ((this.work[4] & 255) << 32) | ((this.work[3] & 255) << 24) | ((this.work[2] & 255) << 16) | ((this.work[1] & 255) << 8) | (this.work[0] & 255);
    }

    @Override // java.io.DataInput
    public final short readShort() throws IOException {
        this.dis.readFully(this.work, 0, 2);
        return (short) (((this.work[1] & 255) << 8) | (this.work[0] & 255));
    }

    @Override // java.io.DataInput
    public final String readUTF() throws IOException {
        return this.dis.readUTF();
    }

    @Override // java.io.DataInput
    public final int readUnsignedByte() throws IOException {
        return this.dis.readUnsignedByte();
    }

    @Override // java.io.DataInput
    public final int readUnsignedShort() throws IOException {
        this.dis.readFully(this.work, 0, 2);
        return ((this.work[1] & 255) << 8) | (this.work[0] & 255);
    }

    @Override // java.io.DataInput
    public final int skipBytes(int i) throws IOException {
        return this.dis.skipBytes(i);
    }
}
