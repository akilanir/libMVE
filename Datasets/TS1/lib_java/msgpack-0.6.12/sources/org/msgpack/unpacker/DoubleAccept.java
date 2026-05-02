package org.msgpack.unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/DoubleAccept.class */
final class DoubleAccept extends Accept {
    double value;

    DoubleAccept() {
        super("float");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptFloat(float v) {
        this.value = v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptDouble(double v) {
        this.value = v;
    }
}
