package org.msgpack.unpacker;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Iterator;
import org.msgpack.MessagePack;
import org.msgpack.packer.Unconverter;
import org.msgpack.template.Template;
import org.msgpack.type.Value;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/AbstractUnpacker.class */
public abstract class AbstractUnpacker implements Unpacker {
    protected MessagePack msgpack;
    protected int rawSizeLimit = 134217728;
    protected int arraySizeLimit = 4194304;
    protected int mapSizeLimit = 2097152;

    protected abstract void readValue(Unconverter unconverter) throws IOException;

    protected abstract boolean tryReadNil() throws IOException;

    protected AbstractUnpacker(MessagePack msgpack) {
        this.msgpack = msgpack;
    }

    @Override // org.msgpack.unpacker.Unpacker
    public ByteBuffer readByteBuffer() throws IOException {
        return ByteBuffer.wrap(readByteArray());
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readArrayEnd() throws IOException {
        readArrayEnd(false);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void readMapEnd() throws IOException {
        readMapEnd(false);
    }

    @Override // java.lang.Iterable
    /* renamed from: iterator, reason: merged with bridge method [inline-methods] */
    public Iterator<Value> iterator2() {
        return new UnpackerIterator(this);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public Value readValue() throws IOException {
        Unconverter uc = new Unconverter(this.msgpack);
        readValue(uc);
        return uc.getResult();
    }

    @Override // org.msgpack.unpacker.Unpacker
    public <T> T read(Class<T> klass) throws IOException {
        if (tryReadNil()) {
            return null;
        }
        Template<T> tmpl = this.msgpack.lookup((Class) klass);
        return tmpl.read(this, null);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public <T> T read(T to) throws IOException {
        if (tryReadNil()) {
            return null;
        }
        Template<T> tmpl = this.msgpack.lookup((Class) to.getClass());
        return tmpl.read(this, to);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public <T> T read(Template<T> tmpl) throws IOException {
        if (tryReadNil()) {
            return null;
        }
        return tmpl.read(this, null);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public <T> T read(T to, Template<T> tmpl) throws IOException {
        if (tryReadNil()) {
            return null;
        }
        return tmpl.read(this, to);
    }

    @Override // org.msgpack.unpacker.Unpacker
    public int getReadByteCount() {
        throw new UnsupportedOperationException("Not implemented");
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void resetReadByteCount() {
        throw new UnsupportedOperationException("Not implemented");
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void setRawSizeLimit(int size) {
        if (size < 32) {
            this.rawSizeLimit = 32;
        } else {
            this.rawSizeLimit = size;
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void setArraySizeLimit(int size) {
        if (size < 16) {
            this.arraySizeLimit = 16;
        } else {
            this.arraySizeLimit = size;
        }
    }

    @Override // org.msgpack.unpacker.Unpacker
    public void setMapSizeLimit(int size) {
        if (size < 16) {
            this.mapSizeLimit = 16;
        } else {
            this.mapSizeLimit = size;
        }
    }
}
