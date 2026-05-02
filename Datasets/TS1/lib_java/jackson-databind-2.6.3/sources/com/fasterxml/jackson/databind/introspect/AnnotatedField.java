package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.util.ClassUtil;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/introspect/AnnotatedField.class */
public final class AnnotatedField extends AnnotatedMember implements Serializable {
    private static final long serialVersionUID = 1;
    protected final transient Field _field;
    protected Serialization _serialization;

    public AnnotatedField(AnnotatedClass contextClass, Field field, AnnotationMap annMap) {
        super(contextClass, annMap);
        this._field = field;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public AnnotatedField withAnnotations(AnnotationMap ann) {
        return new AnnotatedField(this._context, this._field, ann);
    }

    protected AnnotatedField(Serialization ser) {
        super(null, null);
        this._field = null;
        this._serialization = ser;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Field getAnnotated() {
        return this._field;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public int getModifiers() {
        return this._field.getModifiers();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public String getName() {
        return this._field.getName();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public <A extends Annotation> A getAnnotation(Class<A> cls) {
        if (this._annotations == null) {
            return null;
        }
        return (A) this._annotations.get(cls);
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Type getGenericType() {
        return this._field.getGenericType();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Class<?> getRawType() {
        return this._field.getType();
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Class<?> getDeclaringClass() {
        return this._field.getDeclaringClass();
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Member getMember() {
        return this._field;
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public void setValue(Object pojo, Object value) throws IllegalArgumentException {
        try {
            this._field.set(pojo, value);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException("Failed to setValue() for field " + getFullName() + ": " + e.getMessage(), e);
        }
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Object getValue(Object pojo) throws IllegalArgumentException {
        try {
            return this._field.get(pojo);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException("Failed to getValue() for field " + getFullName() + ": " + e.getMessage(), e);
        }
    }

    public String getFullName() {
        return getDeclaringClass().getName() + "#" + getName();
    }

    public int getAnnotationCount() {
        return this._annotations.size();
    }

    public boolean isTransient() {
        return Modifier.isTransient(getModifiers());
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public int hashCode() {
        return this._field.getName().hashCode();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        return o != null && o.getClass() == getClass() && ((AnnotatedField) o)._field == this._field;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public String toString() {
        return "[field " + getFullName() + "]";
    }

    Object writeReplace() {
        return new AnnotatedField(new Serialization(this._field));
    }

    Object readResolve() {
        Class<?> clazz = this._serialization.clazz;
        try {
            Field f = clazz.getDeclaredField(this._serialization.name);
            if (!f.isAccessible()) {
                ClassUtil.checkAndFixAccess(f);
            }
            return new AnnotatedField(null, f, null);
        } catch (Exception e) {
            throw new IllegalArgumentException("Could not find method '" + this._serialization.name + "' from Class '" + clazz.getName());
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/introspect/AnnotatedField$Serialization.class */
    private static final class Serialization implements Serializable {
        private static final long serialVersionUID = 1;
        protected Class<?> clazz;
        protected String name;

        public Serialization(Field f) {
            this.clazz = f.getDeclaringClass();
            this.name = f.getName();
        }
    }
}
