package org.msgpack.io;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/BufferReferer.class */
public interface BufferReferer {
    void refer(ByteBuffer byteBuffer, boolean z) throws IOException;
}
