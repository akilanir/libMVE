package org.msgpack.template;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ListTemplate.class */
public class ListTemplate<E> extends AbstractTemplate<List<E>> {
    private Template<E> elementTemplate;

    public ListTemplate(Template<E> elementTemplate) {
        this.elementTemplate = elementTemplate;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, List<E> target, boolean required) throws IOException {
        if (!(target instanceof List)) {
            if (target == null) {
                if (required) {
                    throw new MessageTypeException("Attempted to write null");
                }
                pk.writeNil();
                return;
            }
            throw new MessageTypeException("Target is not a List but " + target.getClass());
        }
        pk.writeArrayBegin(target.size());
        for (E e : target) {
            this.elementTemplate.write(pk, e);
        }
        pk.writeArrayEnd();
    }

    @Override // org.msgpack.template.Template
    public List<E> read(Unpacker u, List<E> to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null) {
            to = new ArrayList(n);
        } else {
            to.clear();
        }
        for (int i = 0; i < n; i++) {
            E e = this.elementTemplate.read(u, null);
            to.add(e);
        }
        u.readArrayEnd();
        return to;
    }
}
