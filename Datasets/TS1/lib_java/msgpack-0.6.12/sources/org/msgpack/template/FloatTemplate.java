package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/FloatTemplate.class */
public class FloatTemplate extends AbstractTemplate<Float> {
    static final FloatTemplate instance = new FloatTemplate();

    private FloatTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Float target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.floatValue());
    }

    @Override // org.msgpack.template.Template
    public Float read(Unpacker u, Float to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Float.valueOf(u.readFloat());
    }

    public static FloatTemplate getInstance() {
        return instance;
    }
}
