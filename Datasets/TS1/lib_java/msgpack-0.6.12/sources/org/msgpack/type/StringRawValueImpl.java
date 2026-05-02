package org.msgpack.type;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/StringRawValueImpl.class */
class StringRawValueImpl extends AbstractRawValue {
    private String string;

    StringRawValueImpl(String string) {
        this.string = string;
    }

    @Override // org.msgpack.type.RawValue
    public byte[] getByteArray() {
        try {
            return this.string.getBytes("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new MessageTypeException(ex);
        }
    }

    @Override // org.msgpack.type.RawValue
    public String getString() {
        return this.string;
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(this.string);
    }

    @Override // org.msgpack.type.AbstractRawValue
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        if (!v.isRawValue()) {
            return false;
        }
        if (v.getClass() == StringRawValueImpl.class) {
            return this.string.equals(((StringRawValueImpl) v).string);
        }
        return Arrays.equals(getByteArray(), v.asRawValue().getByteArray());
    }
}
