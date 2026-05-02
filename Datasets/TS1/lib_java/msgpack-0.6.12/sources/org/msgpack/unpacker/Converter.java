package org.msgpack.unpacker;

import java.io.EOFException;
import java.io.IOException;
import java.math.BigInteger;
import org.msgpack.MessagePack;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Unconverter;
import org.msgpack.type.ArrayValue;
import org.msgpack.type.MapValue;
import org.msgpack.type.Value;
import org.msgpack.type.ValueType;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/Converter.class */
public class Converter extends AbstractUnpacker {
    private final UnpackerStack stack;
    private Object[] values;
    protected Value value;

    public Converter(Value value) {
        this(new MessagePack(), value);
    }

    public Converter(MessagePack msgpack, Value value) {
        super(msgpack);
        this.stack = new UnpackerStack();
        this.values = new Object[128];
        this.value = value;
    }

    protected Value nextValue() throws IOException {
        throw new EOFException();
    }

    private void ensureValue() throws IOException {
        if (this.value == null) {
            this.value = nextValue();
        }
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker
    public boolean tryReadNil() throws IOException {
        this.stack.checkCount();
        if (getTop().isNilValue()) {
            this.stack.reduceCount();
            if (this.stack.getDepth() == 0) {
                this.value = null;
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public boolean trySkipNil() throws IOException {
        ensureValue();
        if (this.stack.getDepth() > 0 && this.stack.getTopCount() <= 0) {
            return true;
        }
        if (getTop().isNilValue()) {
            this.stack.reduceCount();
            if (this.stack.getDepth() == 0) {
                this.value = null;
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readNil() throws IOException {
        if (!getTop().isNilValue()) {
            throw new MessageTypeException("Expected nil but got not nil value");
        }
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public boolean readBoolean() throws IOException {
        boolean v = getTop().asBooleanValue().getBoolean();
        this.stack.reduceCount();
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public byte readByte() throws IOException {
        byte v = getTop().asIntegerValue().getByte();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public short readShort() throws IOException {
        short v = getTop().asIntegerValue().getShort();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readInt() throws IOException {
        int v = getTop().asIntegerValue().getInt();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public long readLong() throws IOException {
        long v = getTop().asIntegerValue().getLong();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public BigInteger readBigInteger() throws IOException {
        BigInteger v = getTop().asIntegerValue().getBigInteger();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public float readFloat() throws IOException {
        float v = getTop().asFloatValue().getFloat();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public double readDouble() throws IOException {
        double v = getTop().asFloatValue().getDouble();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return v;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public byte[] readByteArray() throws IOException {
        byte[] raw = getTop().asRawValue().getByteArray();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return raw;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public String readString() throws IOException {
        String str = getTop().asRawValue().getString();
        this.stack.reduceCount();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
        return str;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readArrayBegin() throws IOException {
        Value v = getTop();
        if (!v.isArrayValue()) {
            throw new MessageTypeException("Expected array but got not array value");
        }
        ArrayValue a = v.asArrayValue();
        this.stack.reduceCount();
        this.stack.pushArray(a.size());
        this.values[this.stack.getDepth()] = a.getElementArray();
        return a.size();
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readArrayEnd(boolean check) throws IOException {
        if (!this.stack.topIsArray()) {
            throw new MessageTypeException("readArrayEnd() is called but readArrayBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("readArrayEnd(check=true) is called but the array is not end");
            }
            for (int i = 0; i < remain; i++) {
                skip();
            }
        }
        this.stack.pop();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int readMapBegin() throws IOException {
        Value v = getTop();
        if (!v.isMapValue()) {
            throw new MessageTypeException("Expected map but got not map value");
        }
        MapValue m = v.asMapValue();
        this.stack.reduceCount();
        this.stack.pushMap(m.size());
        this.values[this.stack.getDepth()] = m.getKeyValueArray();
        return m.size();
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readMapEnd(boolean check) throws IOException {
        if (!this.stack.topIsMap()) {
            throw new MessageTypeException("readMapEnd() is called but readMapBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("readMapEnd(check=true) is called but the map is not end");
            }
            for (int i = 0; i < remain; i++) {
                skip();
            }
        }
        this.stack.pop();
        if (this.stack.getDepth() == 0) {
            this.value = null;
        }
    }

    private Value getTop() throws IOException {
        ensureValue();
        this.stack.checkCount();
        if (this.stack.getDepth() == 0) {
            return this.value;
        }
        Value[] array = (Value[]) this.values[this.stack.getDepth()];
        return array[array.length - this.stack.getTopCount()];
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public Value readValue() throws IOException {
        if (this.stack.getDepth() == 0) {
            if (this.value == null) {
                return nextValue();
            }
            Value v = this.value;
            this.value = null;
            return v;
        }
        return super.readValue();
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker
    protected void readValue(Unconverter uc) throws IOException {
        if (uc.getResult() != null) {
            uc.resetResult();
        }
        this.stack.checkCount();
        Value v = getTop();
        if (!v.isArrayValue() && !v.isMapValue()) {
            uc.write(v);
            this.stack.reduceCount();
            if (this.stack.getDepth() == 0) {
                this.value = null;
            }
            if (uc.getResult() != null) {
                return;
            }
        }
        while (true) {
            if (this.stack.getDepth() != 0 && this.stack.getTopCount() == 0) {
                if (this.stack.topIsArray()) {
                    uc.writeArrayEnd(true);
                    this.stack.pop();
                } else if (this.stack.topIsMap()) {
                    uc.writeMapEnd(true);
                    this.stack.pop();
                } else {
                    throw new RuntimeException("invalid stack");
                }
                if (this.stack.getDepth() == 0) {
                    this.value = null;
                }
                if (uc.getResult() != null) {
                    return;
                }
            } else {
                this.stack.checkCount();
                Value v2 = getTop();
                if (v2.isArrayValue()) {
                    ArrayValue a = v2.asArrayValue();
                    uc.writeArrayBegin(a.size());
                    this.stack.reduceCount();
                    this.stack.pushArray(a.size());
                    this.values[this.stack.getDepth()] = a.getElementArray();
                } else if (v2.isMapValue()) {
                    MapValue m = v2.asMapValue();
                    uc.writeMapBegin(m.size());
                    this.stack.reduceCount();
                    this.stack.pushMap(m.size());
                    this.values[this.stack.getDepth()] = m.getKeyValueArray();
                } else {
                    uc.write(v2);
                    this.stack.reduceCount();
                }
            }
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void skip() throws IOException {
        this.stack.checkCount();
        Value v = getTop();
        if (!v.isArrayValue() && !v.isMapValue()) {
            this.stack.reduceCount();
            if (this.stack.getDepth() == 0) {
                this.value = null;
                return;
            }
            return;
        }
        int targetDepth = this.stack.getDepth();
        while (true) {
            if (this.stack.getTopCount() == 0) {
                this.stack.pop();
                if (this.stack.getDepth() == 0) {
                    this.value = null;
                }
                if (this.stack.getDepth() <= targetDepth) {
                    return;
                }
            } else {
                this.stack.checkCount();
                Value v2 = getTop();
                if (v2.isArrayValue()) {
                    ArrayValue a = v2.asArrayValue();
                    this.stack.reduceCount();
                    this.stack.pushArray(a.size());
                    this.values[this.stack.getDepth()] = a.getElementArray();
                } else if (v2.isMapValue()) {
                    MapValue m = v2.asMapValue();
                    this.stack.reduceCount();
                    this.stack.pushMap(m.size());
                    this.values[this.stack.getDepth()] = m.getKeyValueArray();
                } else {
                    this.stack.reduceCount();
                }
            }
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public ValueType getNextType() throws IOException {
        return getTop().getType();
    }

    public void reset() {
        this.stack.clear();
        this.value = null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public int getReadByteCount() {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public void setRawSizeLimit(int size) {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public void setArraySizeLimit(int size) {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public void setMapSizeLimit(int size) {
        throw new UnsupportedOperationException("Not implemented yet");
    }
}
