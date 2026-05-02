package org.msgpack.type;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/RawValue.class */
public interface RawValue extends Value {
    byte[] getByteArray();

    String getString();
}
