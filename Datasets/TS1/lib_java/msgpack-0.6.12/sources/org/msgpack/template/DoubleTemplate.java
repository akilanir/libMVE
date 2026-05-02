package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/DoubleTemplate.class */
public class DoubleTemplate extends AbstractTemplate<Double> {
    static final DoubleTemplate instance = new DoubleTemplate();

    private DoubleTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Double target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.doubleValue());
    }

    @Override // org.msgpack.template.Template
    public Double read(Unpacker u, Double to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Double.valueOf(u.readDouble());
    }

    public static DoubleTemplate getInstance() {
        return instance;
    }
}
