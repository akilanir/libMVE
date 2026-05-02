package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/BooleanTemplate.class */
public class BooleanTemplate extends AbstractTemplate<Boolean> {
    static final BooleanTemplate instance = new BooleanTemplate();

    private BooleanTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Boolean target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.booleanValue());
    }

    @Override // org.msgpack.template.Template
    public Boolean read(Unpacker u, Boolean to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Boolean.valueOf(u.readBoolean());
    }

    public static BooleanTemplate getInstance() {
        return instance;
    }
}
