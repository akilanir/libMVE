package org.bson.types;

import java.io.Serializable;
import java.util.Arrays;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/types/Binary.class */
public class Binary implements Serializable {
    private static final long serialVersionUID = 7902997490338209467L;
    final byte _type;
    final byte[] _data;

    public Binary(byte[] data) {
        this((byte) 0, data);
    }

    public Binary(byte type, byte[] data) {
        this._type = type;
        this._data = data;
    }

    public byte getType() {
        return this._type;
    }

    public byte[] getData() {
        return this._data;
    }

    public int length() {
        return this._data.length;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Binary)) {
            return false;
        }
        Binary binary = (Binary) o;
        if (this._type != binary._type || !Arrays.equals(this._data, binary._data)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this._type;
        return (31 * result) + (this._data != null ? Arrays.hashCode(this._data) : 0);
    }
}
