package org.msgpack.io;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/Output.class */
public interface Output extends Closeable, Flushable {
    void write(byte[] bArr, int i, int i2) throws IOException;

    void write(ByteBuffer byteBuffer) throws IOException;

    void writeByte(byte b) throws IOException;

    void writeShort(short s) throws IOException;

    void writeInt(int i) throws IOException;

    void writeLong(long j) throws IOException;

    void writeFloat(float f) throws IOException;

    void writeDouble(double d) throws IOException;

    void writeByteAndByte(byte b, byte b2) throws IOException;

    void writeByteAndShort(byte b, short s) throws IOException;

    void writeByteAndInt(byte b, int i) throws IOException;

    void writeByteAndLong(byte b, long j) throws IOException;

    void writeByteAndFloat(byte b, float f) throws IOException;

    void writeByteAndDouble(byte b, double d) throws IOException;
}
