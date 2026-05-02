package org.msgpack.type;

import java.util.List;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/ArrayValue.class */
public interface ArrayValue extends Value, List<Value> {
    Value[] getElementArray();
}
