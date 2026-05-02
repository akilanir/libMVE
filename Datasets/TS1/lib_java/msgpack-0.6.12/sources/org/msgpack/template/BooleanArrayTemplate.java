package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/BooleanArrayTemplate.class */
public class BooleanArrayTemplate extends AbstractTemplate<boolean[]> {
    static final BooleanArrayTemplate instance = new BooleanArrayTemplate();

    private BooleanArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, boolean[] target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.writeArrayBegin(target.length);
        for (boolean a : target) {
            pk.write(a);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public boolean[] read(Unpacker u, boolean[] to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null || to.length != n) {
            to = new boolean[n];
        }
        for (int i = 0; i < n; i++) {
            to[i] = u.readBoolean();
        }
        u.readArrayEnd();
        return to;
    }

    public static BooleanArrayTemplate getInstance() {
        return instance;
    }
}
