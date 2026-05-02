package org.msgpack.packer;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.msgpack.type.Value;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/packer/Packer.class */
public interface Packer extends Closeable, Flushable {
    Packer write(boolean z) throws IOException;

    Packer write(byte b) throws IOException;

    Packer write(short s) throws IOException;

    Packer write(int i) throws IOException;

    Packer write(long j) throws IOException;

    Packer write(float f) throws IOException;

    Packer write(double d) throws IOException;

    Packer write(Boolean bool) throws IOException;

    Packer write(Byte b) throws IOException;

    Packer write(Short sh) throws IOException;

    Packer write(Integer num) throws IOException;

    Packer write(Long l) throws IOException;

    Packer write(Float f) throws IOException;

    Packer write(Double d) throws IOException;

    Packer write(BigInteger bigInteger) throws IOException;

    Packer write(byte[] bArr) throws IOException;

    Packer write(byte[] bArr, int i, int i2) throws IOException;

    Packer write(ByteBuffer byteBuffer) throws IOException;

    Packer write(String str) throws IOException;

    Packer write(Value value) throws IOException;

    Packer write(Object obj) throws IOException;

    Packer writeNil() throws IOException;

    Packer writeArrayBegin(int i) throws IOException;

    Packer writeArrayEnd(boolean z) throws IOException;

    Packer writeArrayEnd() throws IOException;

    Packer writeMapBegin(int i) throws IOException;

    Packer writeMapEnd(boolean z) throws IOException;

    Packer writeMapEnd() throws IOException;
}
