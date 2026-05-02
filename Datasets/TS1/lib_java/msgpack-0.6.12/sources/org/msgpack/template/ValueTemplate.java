package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.type.Value;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ValueTemplate.class */
public class ValueTemplate extends AbstractTemplate<Value> {
    static final ValueTemplate instance = new ValueTemplate();

    private ValueTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Value target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        target.writeTo(pk);
    }

    @Override // org.msgpack.template.Template
    public Value read(Unpacker u, Value to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return u.readValue();
    }

    public static ValueTemplate getInstance() {
        return instance;
    }
}
