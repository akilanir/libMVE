package org.msgpack.packer;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.msgpack.MessagePack;
import org.msgpack.template.Template;
import org.msgpack.type.Value;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/packer/AbstractPacker.class */
public abstract class AbstractPacker implements Packer {
    protected MessagePack msgpack;

    protected abstract void writeBoolean(boolean z) throws IOException;

    protected abstract void writeByte(byte b) throws IOException;

    protected abstract void writeShort(short s) throws IOException;

    protected abstract void writeInt(int i) throws IOException;

    protected abstract void writeLong(long j) throws IOException;

    protected abstract void writeBigInteger(BigInteger bigInteger) throws IOException;

    protected abstract void writeFloat(float f) throws IOException;

    protected abstract void writeDouble(double d) throws IOException;

    protected abstract void writeByteArray(byte[] bArr, int i, int i2) throws IOException;

    protected abstract void writeByteBuffer(ByteBuffer byteBuffer) throws IOException;

    protected abstract void writeString(String str) throws IOException;

    protected AbstractPacker(MessagePack msgpack) {
        this.msgpack = msgpack;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(boolean o) throws IOException {
        writeBoolean(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(byte o) throws IOException {
        writeByte(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(short o) throws IOException {
        writeShort(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(int o) throws IOException {
        writeInt(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(long o) throws IOException {
        writeLong(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(float o) throws IOException {
        writeFloat(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(double o) throws IOException {
        writeDouble(o);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Boolean o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeBoolean(o.booleanValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Byte o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeByte(o.byteValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Short o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeShort(o.shortValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Integer o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeInt(o.intValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Long o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeLong(o.longValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(BigInteger o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeBigInteger(o);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Float o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeFloat(o.floatValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Double o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeDouble(o.doubleValue());
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(byte[] o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeByteArray(o);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(byte[] o, int off, int len) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeByteArray(o, off, len);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(ByteBuffer o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeByteBuffer(o);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(String o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            writeString(o);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Object o) throws IOException {
        if (o == null) {
            writeNil();
        } else {
            Template tmpl = this.msgpack.lookup((Class) o.getClass());
            tmpl.write(this, o);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer write(Value v) throws IOException {
        if (v == null) {
            writeNil();
        } else {
            v.writeTo(this);
        }
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeArrayEnd() throws IOException {
        writeArrayEnd(true);
        return this;
    }

    @Override // org.msgpack.packer.Packer
    public Packer writeMapEnd() throws IOException {
        writeMapEnd(true);
        return this;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    protected void writeByteArray(byte[] b) throws IOException {
        writeByteArray(b, 0, b.length);
    }
}
