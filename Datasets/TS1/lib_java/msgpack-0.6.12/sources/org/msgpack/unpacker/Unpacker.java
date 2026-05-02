package org.msgpack.unpacker;

import java.io.Closeable;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.util.Iterator;
import org.msgpack.template.Template;
import org.msgpack.type.Value;
import org.msgpack.type.ValueType;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/Unpacker.class */
public interface Unpacker extends Iterable<Value>, Closeable {
    <T> T read(Class<T> cls) throws IOException;

    <T> T read(T t) throws IOException;

    <T> T read(Template<T> template) throws IOException;

    <T> T read(T t, Template<T> template) throws IOException;

    void skip() throws IOException;

    int readArrayBegin() throws IOException;

    void readArrayEnd(boolean z) throws IOException;

    void readArrayEnd() throws IOException;

    int readMapBegin() throws IOException;

    void readMapEnd(boolean z) throws IOException;

    void readMapEnd() throws IOException;

    void readNil() throws IOException;

    boolean trySkipNil() throws IOException;

    boolean readBoolean() throws IOException;

    byte readByte() throws IOException;

    short readShort() throws IOException;

    int readInt() throws IOException;

    long readLong() throws IOException;

    BigInteger readBigInteger() throws IOException;

    float readFloat() throws IOException;

    double readDouble() throws IOException;

    byte[] readByteArray() throws IOException;

    ByteBuffer readByteBuffer() throws IOException;

    String readString() throws IOException;

    Value readValue() throws IOException;

    ValueType getNextType() throws IOException;

    @Override // java.lang.Iterable
    Iterator<Value> iterator();

    int getReadByteCount();

    void resetReadByteCount();

    void setRawSizeLimit(int i);

    void setArraySizeLimit(int i);

    void setMapSizeLimit(int i);
}
