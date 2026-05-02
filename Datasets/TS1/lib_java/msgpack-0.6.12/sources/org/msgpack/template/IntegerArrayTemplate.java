package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/IntegerArrayTemplate.class */
public class IntegerArrayTemplate extends AbstractTemplate<int[]> {
    static final IntegerArrayTemplate instance = new IntegerArrayTemplate();

    private IntegerArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, int[] target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.writeArrayBegin(target.length);
        for (int a : target) {
            pk.write(a);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public int[] read(Unpacker u, int[] to, boolean required) throws IOException {
        int[] array;
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to != null && to.length == n) {
            array = to;
        } else {
            array = new int[n];
        }
        for (int i = 0; i < n; i++) {
            array[i] = u.readInt();
        }
        u.readArrayEnd();
        return array;
    }

    public static IntegerArrayTemplate getInstance() {
        return instance;
    }
}
