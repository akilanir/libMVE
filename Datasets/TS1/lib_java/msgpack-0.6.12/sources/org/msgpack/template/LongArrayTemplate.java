package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/LongArrayTemplate.class */
public class LongArrayTemplate extends AbstractTemplate<long[]> {
    static final LongArrayTemplate instance = new LongArrayTemplate();

    private LongArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, long[] target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.writeArrayBegin(target.length);
        for (long a : target) {
            pk.write(a);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public long[] read(Unpacker u, long[] to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null || to.length != n) {
            to = new long[n];
        }
        for (int i = 0; i < n; i++) {
            to[i] = u.readLong();
        }
        u.readArrayEnd();
        return to;
    }

    public static LongArrayTemplate getInstance() {
        return instance;
    }
}
