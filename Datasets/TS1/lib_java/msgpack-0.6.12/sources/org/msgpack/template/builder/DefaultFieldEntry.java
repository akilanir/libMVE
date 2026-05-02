package org.msgpack.template.builder;

import java.lang.reflect.Field;
import java.lang.reflect.Type;
import org.msgpack.MessageTypeException;
import org.msgpack.template.FieldOption;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/DefaultFieldEntry.class */
public class DefaultFieldEntry extends FieldEntry {
    protected Field field;

    public DefaultFieldEntry() {
        this(null, FieldOption.IGNORE);
    }

    public DefaultFieldEntry(DefaultFieldEntry e) {
        this(e.field, e.option);
    }

    public DefaultFieldEntry(Field field, FieldOption option) {
        super(option);
        this.field = field;
    }

    public Field getField() {
        return this.field;
    }

    public void setField(Field field) {
        this.field = field;
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public String getName() {
        return this.field.getName();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Class<?> getType() {
        return this.field.getType();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Type getGenericType() {
        return this.field.getGenericType();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Object get(Object target) {
        try {
            return getField().get(target);
        } catch (IllegalAccessException e) {
            throw new MessageTypeException(e);
        } catch (IllegalArgumentException e2) {
            throw new MessageTypeException(e2);
        }
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public void set(Object target, Object value) {
        try {
            this.field.set(target, value);
        } catch (IllegalAccessException e) {
            throw new MessageTypeException(e);
        } catch (IllegalArgumentException e2) {
            throw new MessageTypeException(e2);
        }
    }
}
