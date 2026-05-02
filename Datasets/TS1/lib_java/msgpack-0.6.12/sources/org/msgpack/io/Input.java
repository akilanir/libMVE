package org.msgpack.io;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/Input.class */
public interface Input extends Closeable {
    int read(byte[] bArr, int i, int i2) throws IOException;

    boolean tryRefer(BufferReferer bufferReferer, int i) throws IOException;

    byte readByte() throws IOException;

    void advance();

    byte getByte() throws IOException;

    short getShort() throws IOException;

    int getInt() throws IOException;

    long getLong() throws IOException;

    float getFloat() throws IOException;

    double getDouble() throws IOException;

    int getReadByteCount();

    void resetReadByteCount();
}
