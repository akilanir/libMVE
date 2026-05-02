package org.msgpack.type;

import java.io.IOException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/TrueValueImpl.class */
class TrueValueImpl extends AbstractBooleanValue {
    private static TrueValueImpl instance = new TrueValueImpl();

    private TrueValueImpl() {
    }

    static TrueValueImpl getInstance() {
        return instance;
    }

    @Override // org.msgpack.type.BooleanValue
    public boolean getBoolean() {
        return true;
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(true);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        return v.isBooleanValue() && v.asBooleanValue().getBoolean();
    }

    public int hashCode() {
        return 1231;
    }

    public String toString() {
        return "true";
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append("true");
    }
}
