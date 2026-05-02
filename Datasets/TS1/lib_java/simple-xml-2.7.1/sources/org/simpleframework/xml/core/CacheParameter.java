package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/CacheParameter.class */
class CacheParameter implements Parameter {
    private final Annotation annotation;
    private final Expression expression;
    private final String name;
    private final String path;
    private final String string;
    private final Class type;
    private final Object key;
    private final int index;
    private final boolean primitive;
    private final boolean required;
    private final boolean attribute;
    private final boolean text;

    public CacheParameter(Parameter value, Label label) throws Exception {
        this.annotation = value.getAnnotation();
        this.expression = value.getExpression();
        this.attribute = value.isAttribute();
        this.primitive = value.isPrimitive();
        this.required = label.isRequired();
        this.string = value.toString();
        this.text = value.isText();
        this.index = value.getIndex();
        this.name = value.getName();
        this.path = value.getPath();
        this.type = value.getType();
        this.key = label.getKey();
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Object getKey() {
        return this.key;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public int getIndex() {
        return this.index;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Annotation getAnnotation() {
        return this.annotation;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Expression getExpression() {
        return this.expression;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String getName() {
        return this.name;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String getPath() {
        return this.path;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isRequired() {
        return this.required;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isPrimitive() {
        return this.primitive;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isAttribute() {
        return this.attribute;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isText() {
        return this.text;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String toString() {
        return this.string;
    }
}
