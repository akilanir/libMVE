package org.msgpack.template.builder;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import org.msgpack.MessageTypeException;
import org.msgpack.template.FieldOption;
import org.msgpack.template.builder.beans.PropertyDescriptor;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/BeansFieldEntry.class */
public class BeansFieldEntry extends FieldEntry {
    protected PropertyDescriptor desc;

    public BeansFieldEntry() {
    }

    public BeansFieldEntry(BeansFieldEntry e) {
        super(e.option);
        this.desc = e.getPropertyDescriptor();
    }

    public BeansFieldEntry(PropertyDescriptor desc) {
        this(desc, FieldOption.DEFAULT);
    }

    public BeansFieldEntry(PropertyDescriptor desc, FieldOption option) {
        super(option);
        this.desc = desc;
    }

    public String getGetterName() {
        return getPropertyDescriptor().getReadMethod().getName();
    }

    public String getSetterName() {
        return getPropertyDescriptor().getWriteMethod().getName();
    }

    public PropertyDescriptor getPropertyDescriptor() {
        return this.desc;
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public String getName() {
        return getPropertyDescriptor().getDisplayName();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Class<?> getType() {
        return getPropertyDescriptor().getPropertyType();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Type getGenericType() {
        return getPropertyDescriptor().getReadMethod().getGenericReturnType();
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public Object get(Object target) {
        try {
            return getPropertyDescriptor().getReadMethod().invoke(target, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new MessageTypeException(e);
        } catch (IllegalArgumentException e2) {
            throw new MessageTypeException(e2);
        } catch (InvocationTargetException e3) {
            throw new MessageTypeException(e3);
        }
    }

    @Override // org.msgpack.template.builder.FieldEntry
    public void set(Object target, Object value) {
        try {
            getPropertyDescriptor().getWriteMethod().invoke(target, value);
        } catch (IllegalAccessException e) {
            throw new MessageTypeException(e);
        } catch (IllegalArgumentException e2) {
            throw new MessageTypeException(e2);
        } catch (InvocationTargetException e3) {
            throw new MessageTypeException(e3);
        }
    }
}
