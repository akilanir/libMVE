package org.msgpack.template;

import java.io.IOException;
import org.msgpack.MessagePackable;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/MessagePackableTemplate.class */
public class MessagePackableTemplate extends AbstractTemplate<MessagePackable> {
    private Class<?> targetClass;

    MessagePackableTemplate(Class<?> targetClass) {
        this.targetClass = targetClass;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, MessagePackable target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
            return;
        }
        target.writeTo(pk);
    }

    @Override // org.msgpack.template.Template
    public MessagePackable read(Unpacker u, MessagePackable to, boolean required) throws IOException {
        if (!required && u.trySkipNil()) {
            return null;
        }
        if (to == null) {
            try {
                to = (MessagePackable) this.targetClass.newInstance();
            } catch (IllegalAccessException e) {
                throw new MessageTypeException(e);
            } catch (InstantiationException e2) {
                throw new MessageTypeException(e2);
            }
        }
        to.readFrom(u);
        return to;
    }
}
