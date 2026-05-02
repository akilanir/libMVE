package org.msgpack.packer;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.msgpack.MessagePack;
import org.msgpack.MessageTypeException;
import org.msgpack.type.Value;
import org.msgpack.type.ValueFactory;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/packer/Unconverter.class */
public class Unconverter extends AbstractPacker {
    private PackerStack stack;
    private Object[] values;
    private Value result;

    public Unconverter() {
        this(new MessagePack());
    }

    public Unconverter(MessagePack msgpack) {
        super(msgpack);
        this.stack = new PackerStack();
        this.values = new Object[128];
    }

    public Value getResult() {
        return this.result;
    }

    public void resetResult() {
        this.result = null;
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeBoolean(boolean v) throws IOException {
        put(ValueFactory.createBooleanValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeByte(byte v) throws IOException {
        put(ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeShort(short v) throws IOException {
        put(ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeInt(int v) throws IOException {
        put(ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeBigInteger(BigInteger v) throws IOException {
        put(ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeLong(long v) throws IOException {
        put(ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeFloat(float v) throws IOException {
        put(ValueFactory.createFloatValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeDouble(double v) throws IOException {
        put(ValueFactory.createFloatValue(v));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeByteArray(byte[] b, int off, int len) throws IOException {
        put(ValueFactory.createRawValue(b, off, len));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeByteBuffer(ByteBuffer bb) throws IOException {
        put(ValueFactory.createRawValue(bb));
    }

    @Override // org.msgpack.packer.AbstractPacker
    public void writeString(String s) throws IOException {
        put(ValueFactory.createRawValue(s));
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeNil() throws IOException {
        put(ValueFactory.createNilValue());
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeArrayBegin(int size) throws IOException {
        if (size == 0) {
            putContainer(ValueFactory.createArrayValue());
            this.stack.pushArray(0);
            this.values[this.stack.getDepth()] = null;
        } else {
            Value[] array = new Value[size];
            putContainer(ValueFactory.createArrayValue(array, true));
            this.stack.pushArray(size);
            this.values[this.stack.getDepth()] = array;
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeArrayEnd(boolean check) throws IOException {
        if (!this.stack.topIsArray()) {
            throw new MessageTypeException("writeArrayEnd() is called but writeArrayBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("writeArrayEnd(check=true) is called but the array is not end");
            }
            for (int i = 0; i < remain; i++) {
                writeNil();
            }
        }
        this.stack.pop();
        if (this.stack.getDepth() <= 0) {
            this.result = (Value) this.values[0];
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeMapBegin(int size) throws IOException {
        this.stack.checkCount();
        if (size == 0) {
            putContainer(ValueFactory.createMapValue());
            this.stack.pushMap(0);
            this.values[this.stack.getDepth()] = null;
        } else {
            Value[] array = new Value[size * 2];
            putContainer(ValueFactory.createMapValue(array, true));
            this.stack.pushMap(size);
            this.values[this.stack.getDepth()] = array;
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeMapEnd(boolean check) throws IOException {
        if (!this.stack.topIsMap()) {
            throw new MessageTypeException("writeMapEnd() is called but writeMapBegin() is not called");
        }
        int remain = this.stack.getTopCount();
        if (remain > 0) {
            if (check) {
                throw new MessageTypeException("writeMapEnd(check=true) is called but the map is not end");
            }
            for (int i = 0; i < remain; i++) {
                writeNil();
            }
        }
        this.stack.pop();
        if (this.stack.getDepth() <= 0) {
            this.result = (Value) this.values[0];
        }
        return this;
    }

    @Override // org.msgpack.packer.AbstractPacker, org.msgpack.packer.Packer
    public Packer write(Value v) throws IOException {
        put(v);
        return this;
    }

    private void put(Value v) {
        if (this.stack.getDepth() <= 0) {
            this.result = v;
            return;
        }
        this.stack.checkCount();
        Value[] array = (Value[]) this.values[this.stack.getDepth()];
        array[array.length - this.stack.getTopCount()] = v;
        this.stack.reduceCount();
    }

    private void putContainer(Value v) {
        if (this.stack.getDepth() <= 0) {
            this.values[0] = v;
            return;
        }
        this.stack.checkCount();
        Value[] array = (Value[]) this.values[this.stack.getDepth()];
        array[array.length - this.stack.getTopCount()] = v;
        this.stack.reduceCount();
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
    }

    @Override // org.msgpack.packer.AbstractPacker, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
