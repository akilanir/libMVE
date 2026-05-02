package com.drew.lang;

import com.drew.lang.annotations.NotNull;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/lang/SequentialReader.class */
public abstract class SequentialReader {
    private boolean _isMotorolaByteOrder = true;

    protected abstract byte getByte() throws IOException;

    @NotNull
    public abstract byte[] getBytes(int i) throws IOException;

    public abstract void skip(long j) throws IOException;

    public abstract boolean trySkip(long j) throws IOException;

    public void setMotorolaByteOrder(boolean motorolaByteOrder) {
        this._isMotorolaByteOrder = motorolaByteOrder;
    }

    public boolean isMotorolaByteOrder() {
        return this._isMotorolaByteOrder;
    }

    public short getUInt8() throws IOException {
        return (short) (getByte() & 255);
    }

    public byte getInt8() throws IOException {
        return getByte();
    }

    public int getUInt16() throws IOException {
        if (this._isMotorolaByteOrder) {
            return ((getByte() << 8) & 65280) | (getByte() & 255);
        }
        return (getByte() & 255) | ((getByte() << 8) & 65280);
    }

    public short getInt16() throws IOException {
        if (this._isMotorolaByteOrder) {
            return (short) (((getByte() << 8) & (-256)) | (getByte() & 255));
        }
        return (short) ((getByte() & 255) | ((getByte() << 8) & (-256)));
    }

    public long getUInt32() throws IOException {
        if (this._isMotorolaByteOrder) {
            return ((getByte() << 24) & 4278190080L) | ((getByte() << 16) & 16711680) | ((getByte() << 8) & 65280) | (getByte() & 255);
        }
        return (getByte() & 255) | ((getByte() << 8) & 65280) | ((getByte() << 16) & 16711680) | ((getByte() << 24) & 4278190080L);
    }

    public int getInt32() throws IOException {
        if (this._isMotorolaByteOrder) {
            return ((getByte() << 24) & (-16777216)) | ((getByte() << 16) & 16711680) | ((getByte() << 8) & 65280) | (getByte() & 255);
        }
        return (getByte() & 255) | ((getByte() << 8) & 65280) | ((getByte() << 16) & 16711680) | ((getByte() << 24) & (-16777216));
    }

    public long getInt64() throws IOException {
        if (this._isMotorolaByteOrder) {
            return ((getByte() << 56) & (-72057594037927936L)) | ((getByte() << 48) & 71776119061217280L) | ((getByte() << 40) & 280375465082880L) | ((getByte() << 32) & 1095216660480L) | ((getByte() << 24) & 4278190080L) | ((getByte() << 16) & 16711680) | ((getByte() << 8) & 65280) | (getByte() & 255);
        }
        return (getByte() & 255) | ((getByte() << 8) & 65280) | ((getByte() << 16) & 16711680) | ((getByte() << 24) & 4278190080L) | ((getByte() << 32) & 1095216660480L) | ((getByte() << 40) & 280375465082880L) | ((getByte() << 48) & 71776119061217280L) | ((getByte() << 56) & (-72057594037927936L));
    }

    public float getS15Fixed16() throws IOException {
        if (this._isMotorolaByteOrder) {
            float res = ((getByte() & 255) << 8) | (getByte() & 255);
            int d = ((getByte() & 255) << 8) | (getByte() & 255);
            return (float) (res + (d / 65536.0d));
        }
        int d2 = (getByte() & 255) | ((getByte() & 255) << 8);
        float res2 = (getByte() & 255) | ((getByte() & 255) << 8);
        return (float) (res2 + (d2 / 65536.0d));
    }

    public float getFloat32() throws IOException {
        return Float.intBitsToFloat(getInt32());
    }

    public double getDouble64() throws IOException {
        return Double.longBitsToDouble(getInt64());
    }

    @NotNull
    public String getString(int bytesRequested) throws IOException {
        return new String(getBytes(bytesRequested));
    }

    @NotNull
    public String getString(int bytesRequested, String charset) throws IOException {
        byte[] bytes = getBytes(bytesRequested);
        try {
            return new String(bytes, charset);
        } catch (UnsupportedEncodingException e) {
            return new String(bytes);
        }
    }

    @NotNull
    public String getNullTerminatedString(int maxLengthBytes) throws IOException {
        byte[] bytes = new byte[maxLengthBytes];
        int length = 0;
        while (length < bytes.length) {
            byte b = getByte();
            bytes[length] = b;
            if (b == 0) {
                break;
            }
            length++;
        }
        return new String(bytes, 0, length);
    }
}
