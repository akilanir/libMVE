package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/DoubleArrayTemplate.class */
public class DoubleArrayTemplate extends AbstractTemplate<double[]> {
    static final DoubleArrayTemplate instance = new DoubleArrayTemplate();

    private DoubleArrayTemplate() {
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, double[] target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        pk.writeArrayBegin(target.length);
        for (double a : target) {
            pk.write(a);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public double[] read(Unpacker u, double[] to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null || to.length != n) {
            to = new double[n];
        }
        for (int i = 0; i < n; i++) {
            to[i] = u.readDouble();
        }
        u.readArrayEnd();
        return to;
    }

    public static DoubleArrayTemplate getInstance() {
        return instance;
    }
}
