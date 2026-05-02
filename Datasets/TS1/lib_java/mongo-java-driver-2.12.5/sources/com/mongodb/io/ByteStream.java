package com.mongodb.io;

import java.nio.ByteBuffer;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/io/ByteStream.class */
public interface ByteStream {
    boolean hasMore();

    int write(ByteBuffer byteBuffer);
}
