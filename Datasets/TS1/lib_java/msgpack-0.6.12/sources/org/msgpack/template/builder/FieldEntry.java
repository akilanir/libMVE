package org.msgpack.template.builder;

import java.lang.reflect.Type;
import org.msgpack.template.FieldOption;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/FieldEntry.class */
public abstract class FieldEntry {
    protected FieldOption option;

    public abstract String getName();

    public abstract Class<?> getType();

    public abstract Type getGenericType();

    public abstract Object get(Object obj);

    public abstract void set(Object obj, Object obj2);

    public FieldEntry() {
        this(FieldOption.IGNORE);
    }

    public FieldEntry(FieldOption option) {
        this.option = option;
    }

    public FieldOption getOption() {
        return this.option;
    }

    public void setOption(FieldOption option) {
        this.option = option;
    }

    public boolean isAvailable() {
        return this.option != FieldOption.IGNORE;
    }

    public boolean isOptional() {
        return this.option == FieldOption.OPTIONAL;
    }

    public boolean isNotNullable() {
        return this.option == FieldOption.NOTNULLABLE;
    }

    public String getJavaTypeName() {
        Class<?> type = getType();
        if (type.isArray()) {
            return arrayTypeToString(type);
        }
        return type.getName();
    }

    public String arrayTypeToString(Class<?> type) {
        int dim = 1;
        Class<?> baseType = type.getComponentType();
        while (baseType.isArray()) {
            baseType = baseType.getComponentType();
            dim++;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(baseType.getName());
        for (int i = 0; i < dim; i++) {
            sb.append("[]");
        }
        return sb.toString();
    }
}
