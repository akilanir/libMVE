package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/MethodContact.class */
class MethodContact implements Contact {
    private Annotation label;
    private MethodPart set;
    private MethodPart get;
    private Class[] items;
    private Class owner;
    private Class item;
    private Class type;
    private String name;

    public MethodContact(MethodPart get) {
        this(get, null);
    }

    public MethodContact(MethodPart get, MethodPart set) {
        this.owner = get.getDeclaringClass();
        this.label = get.getAnnotation();
        this.items = get.getDependents();
        this.item = get.getDependent();
        this.type = get.getType();
        this.name = get.getName();
        this.set = set;
        this.get = get;
    }

    @Override // org.simpleframework.xml.core.Contact
    public boolean isReadOnly() {
        return this.set == null;
    }

    public MethodPart getRead() {
        return this.get;
    }

    public MethodPart getWrite() {
        return this.set;
    }

    @Override // org.simpleframework.xml.core.Contact
    public Annotation getAnnotation() {
        return this.label;
    }

    @Override // org.simpleframework.xml.strategy.Type
    public <T extends Annotation> T getAnnotation(Class<T> cls) {
        T t = (T) this.get.getAnnotation(cls);
        if (cls == this.label.annotationType()) {
            return (T) this.label;
        }
        if (t == null && this.set != null) {
            return (T) this.set.getAnnotation(cls);
        }
        return t;
    }

    @Override // org.simpleframework.xml.strategy.Type
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.core.Contact
    public Class getDependent() {
        return this.item;
    }

    @Override // org.simpleframework.xml.core.Contact
    public Class[] getDependents() {
        return this.items;
    }

    @Override // org.simpleframework.xml.core.Contact
    public Class getDeclaringClass() {
        return this.owner;
    }

    @Override // org.simpleframework.xml.core.Contact
    public String getName() {
        return this.name;
    }

    @Override // org.simpleframework.xml.core.Contact
    public void set(Object source, Object value) throws Exception {
        Method method = this.get.getMethod();
        Class type = method.getDeclaringClass();
        if (this.set == null) {
            throw new MethodException("Property '%s' is read only in %s", this.name, type);
        }
        this.set.getMethod().invoke(source, value);
    }

    @Override // org.simpleframework.xml.core.Contact
    public Object get(Object source) throws Exception {
        return this.get.getMethod().invoke(source, new Object[0]);
    }

    @Override // org.simpleframework.xml.core.Contact, org.simpleframework.xml.strategy.Type
    public String toString() {
        return String.format("method '%s'", this.name);
    }
}
