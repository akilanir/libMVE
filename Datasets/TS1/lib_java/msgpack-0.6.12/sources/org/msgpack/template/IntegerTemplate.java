package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/IntegerTemplate.class */
public class IntegerTemplate extends AbstractTemplate<Integer> {
    static final IntegerTemplate instance = new IntegerTemplate();

    private IntegerTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Integer target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.intValue());
    }

    @Override // org.msgpack.template.Template
    public Integer read(Unpacker u, Integer to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Integer.valueOf(u.readInt());
    }

    public static IntegerTemplate getInstance() {
        return instance;
    }
}
