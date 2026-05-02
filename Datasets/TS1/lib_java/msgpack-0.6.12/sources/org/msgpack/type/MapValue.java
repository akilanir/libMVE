package org.msgpack.type;

import java.util.Map;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/MapValue.class */
public interface MapValue extends Value, Map<Value, Value> {
    Value[] getKeyValueArray();
}
