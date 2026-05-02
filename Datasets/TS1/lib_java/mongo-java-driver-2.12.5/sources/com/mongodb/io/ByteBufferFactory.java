package com.mongodb.io;

import java.nio.ByteBuffer;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/io/ByteBufferFactory.class */
public interface ByteBufferFactory {
    ByteBuffer get();

    @Deprecated
    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory.class */
    public static class SimpleHeapByteBufferFactory implements ByteBufferFactory {
        final int _size;

        public SimpleHeapByteBufferFactory(int size) {
            this._size = size;
        }

        @Override // com.mongodb.io.ByteBufferFactory
        public ByteBuffer get() {
            return ByteBuffer.wrap(new byte[this._size]);
        }
    }
}
