package org.msgpack.io;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/AbstractInput.class */
abstract class AbstractInput implements Input {
    private int readByteCount = 0;

    AbstractInput() {
    }

    @Override // org.msgpack.io.Input
    public int getReadByteCount() {
        return this.readByteCount;
    }

    @Override // org.msgpack.io.Input
    public void resetReadByteCount() {
        this.readByteCount = 0;
    }

    protected final void incrReadByteCount(int size) {
        this.readByteCount += size;
    }

    protected final void incrReadOneByteCount() {
        this.readByteCount++;
    }
}
