package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/FloatArrayTemplate.class */
public class FloatArrayTemplate extends AbstractTemplate<float[]> {
    static final FloatArrayTemplate instance = new FloatArrayTemplate();

    private FloatArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, float[] target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.writeArrayBegin(target.length);
        for (float a : target) {
            pk.write(a);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public float[] read(Unpacker u, float[] to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null || to.length != n) {
            to = new float[n];
        }
        for (int i = 0; i < n; i++) {
            to[i] = u.readFloat();
        }
        u.readArrayEnd();
        return to;
    }

    public static FloatArrayTemplate getInstance() {
        return instance;
    }
}
