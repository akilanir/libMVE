package org.msgpack.type;

import java.io.IOException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/FalseValueImpl.class */
class FalseValueImpl extends AbstractBooleanValue {
    private static FalseValueImpl instance = new FalseValueImpl();

    private FalseValueImpl() {
    }

    static FalseValueImpl getInstance() {
        return instance;
    }

    @Override // org.msgpack.type.BooleanValue
    public boolean getBoolean() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(false);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        return v.isBooleanValue() && !v.asBooleanValue().getBoolean();
    }

    public int hashCode() {
        return 1237;
    }

    public String toString() {
        return "false";
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append("false");
    }
}
