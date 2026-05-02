package org.msgpack.template;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/CollectionTemplate.class */
public class CollectionTemplate<E> extends AbstractTemplate<Collection<E>> {
    private Template<E> elementTemplate;

    public CollectionTemplate(Template<E> elementTemplate) {
        this.elementTemplate = elementTemplate;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, Collection<E> target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
        } else {
            pk.writeArrayBegin(target.size());
            for (E e : target) {
                this.elementTemplate.write(pk, e);
            }
            pk.writeArrayEnd();
        }
    }

    @Override // org.msgpack.template.Template
    public Collection<E> read(Unpacker u, Collection<E> to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        int n = u.readArrayBegin();
        if (to == null) {
            to = new LinkedList();
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
