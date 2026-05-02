package org.msgpack.type;

import java.io.IOException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/Value.class */
public interface Value {
    ValueType getType();

    boolean isNilValue();

    boolean isBooleanValue();

    boolean isIntegerValue();

    boolean isFloatValue();

    boolean isArrayValue();

    boolean isMapValue();

    boolean isRawValue();

    NilValue asNilValue();

    BooleanValue asBooleanValue();

    IntegerValue asIntegerValue();

    FloatValue asFloatValue();

    ArrayValue asArrayValue();

    MapValue asMapValue();

    RawValue asRawValue();

    void writeTo(Packer packer) throws IOException;

    StringBuilder toString(StringBuilder sb);
}
