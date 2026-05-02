package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/AnyTemplate.class */
public class AnyTemplate<T> extends AbstractTemplate<T> {
    private TemplateRegistry registry;

    public AnyTemplate(TemplateRegistry registry) {
        this.registry = registry;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, T target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        this.registry.lookup(target.getClass()).write(pk, target);
    }

    @Override // org.msgpack.template.Template
    public T read(Unpacker unpacker, T t, boolean z) throws IOException, MessageTypeException {
        if (!z && unpacker.trySkipNil()) {
            return null;
        }
        if (t == null) {
            throw new MessageTypeException("convert into unknown type is invalid");
        }
        T t2 = (T) unpacker.read((Unpacker) t);
        if (z && t2 == null) {
            throw new MessageTypeException("Unexpected nil value");
        }
        return t2;
    }
}
