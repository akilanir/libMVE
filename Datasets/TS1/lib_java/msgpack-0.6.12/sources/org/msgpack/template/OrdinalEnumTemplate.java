package org.msgpack.template;

import java.io.IOException;
import java.util.HashMap;
import org.msgpack.MessageTypeException;
import org.msgpack.annotation.OrdinalEnum;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/OrdinalEnumTemplate.class */
public class OrdinalEnumTemplate<T> extends AbstractTemplate<T> {
    protected T[] entries;
    protected HashMap<T, Integer> reverse = new HashMap<>();
    protected boolean strict;

    public OrdinalEnumTemplate(Class<T> targetClass) {
        this.entries = targetClass.getEnumConstants();
        for (int i = 0; i < this.entries.length; i++) {
            this.reverse.put(this.entries[i], Integer.valueOf(i));
        }
        this.strict = !targetClass.isAnnotationPresent(OrdinalEnum.class) || ((OrdinalEnum) targetClass.getAnnotation(OrdinalEnum.class)).strict();
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, T target, boolean required) throws IOException {
        if (target == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            pk.writeNil();
        } else {
            Integer ordinal = this.reverse.get(target);
            if (ordinal == null) {
                throw new MessageTypeException(new IllegalArgumentException("ordinal: " + ordinal));
            }
            pk.write(ordinal.intValue());
        }
    }

    @Override // org.msgpack.template.Template
    public T read(Unpacker pac, T to, boolean required) throws IOException, MessageTypeException {
        if (!required && pac.trySkipNil()) {
            return null;
        }
        int ordinal = pac.readInt();
        if (ordinal < this.entries.length) {
            return this.entries[ordinal];
        }
        if (!this.strict) {
            return null;
        }
        throw new MessageTypeException(new IllegalArgumentException("ordinal: " + ordinal));
    }
}
