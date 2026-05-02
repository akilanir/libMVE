package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/LongTemplate.class */
public class LongTemplate extends AbstractTemplate<Long> {
    static final LongTemplate instance = new LongTemplate();

    private LongTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Long target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.write(target.longValue());
    }

    @Override // org.msgpack.template.Template
    public Long read(Unpacker u, Long to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        return Long.valueOf(u.readLong());
    }

    public static LongTemplate getInstance() {
        return instance;
    }
}
