package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ShortTemplate.class */
public class ShortTemplate extends AbstractTemplate<Short> {
    static final ShortTemplate instance = new ShortTemplate();

    private ShortTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Short target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target);
    }

    @Override // org.msgpack.template.Template
    public Short read(Unpacker u, Short to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Short.valueOf(u.readShort());
    }

    public static ShortTemplate getInstance() {
        return instance;
    }
}
