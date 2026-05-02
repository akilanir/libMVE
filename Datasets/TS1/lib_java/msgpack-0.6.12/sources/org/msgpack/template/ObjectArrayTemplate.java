package org.msgpack.template;

import java.io.IOException;
import java.lang.reflect.Array;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/ObjectArrayTemplate.class */
public class ObjectArrayTemplate extends AbstractTemplate {
    protected Class componentClass;
    protected Template componentTemplate;

    public ObjectArrayTemplate(Class componentClass, Template componentTemplate) {
        this.componentClass = componentClass;
        this.componentTemplate = componentTemplate;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer packer, Object v, boolean required) throws IOException {
        if (v == null) {
            if (required) {
                throw new MessageTypeException("Attempted to write null");
            }
            packer.writeNil();
        } else {
            if (!(v instanceof Object[]) || !this.componentClass.isAssignableFrom(v.getClass().getComponentType())) {
                throw new MessageTypeException();
            }
            Object[] array = (Object[]) v;
            int length = array.length;
            packer.writeArrayBegin(length);
            for (Object obj : array) {
                this.componentTemplate.write(packer, obj, required);
            }
            packer.writeArrayEnd();
        }
    }

    @Override // org.msgpack.template.Template
    public Object read(Unpacker unpacker, Object to, boolean required) throws IOException {
        if (!required && unpacker.trySkipNil()) {
            return null;
        }
        int length = unpacker.readArrayBegin();
        Object[] array = (Object[]) Array.newInstance((Class<?>) this.componentClass, length);
        for (int i = 0; i < length; i++) {
            array[i] = this.componentTemplate.read(unpacker, null, required);
        }
        unpacker.readArrayEnd();
        return array;
    }
}
