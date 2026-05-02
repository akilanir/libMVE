package com.fasterxml.jackson.databind.introspect;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember.class */
public class VirtualAnnotatedMember extends AnnotatedMember implements Serializable {
    private static final long serialVersionUID = 1;
    protected final Class<?> _declaringClass;
    protected final Class<?> _rawType;
    protected final String _name;

    public VirtualAnnotatedMember(AnnotatedClass contextClass, Class<?> declaringClass, String name, Class<?> rawType) {
        super(contextClass, null);
        this._declaringClass = declaringClass;
        this._rawType = rawType;
        this._name = name;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Annotated withAnnotations(AnnotationMap fallback) {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Field getAnnotated() {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public int getModifiers() {
        return 0;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public String getName() {
        return this._name;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public <A extends Annotation> A getAnnotation(Class<A> acls) {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Type getGenericType() {
        return this._rawType;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Class<?> getRawType() {
        return this._rawType;
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Class<?> getDeclaringClass() {
        return this._declaringClass;
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Member getMember() {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public void setValue(Object pojo, Object value) throws IllegalArgumentException {
        throw new IllegalArgumentException("Can not set virtual property '" + this._name + "'");
    }

    @Override // com.fasterxml.jackson.databind.introspect.AnnotatedMember
    public Object getValue(Object pojo) throws IllegalArgumentException {
        throw new IllegalArgumentException("Can not get virtual property '" + this._name + "'");
    }

    public String getFullName() {
        return getDeclaringClass().getName() + "#" + getName();
    }

    public int getAnnotationCount() {
        return 0;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public int hashCode() {
        return this._name.hashCode();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || o.getClass() != getClass()) {
            return false;
        }
        VirtualAnnotatedMember other = (VirtualAnnotatedMember) o;
        return other._declaringClass == this._declaringClass && other._name.equals(this._name);
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public String toString() {
        return "[field " + getFullName() + "]";
    }
}
