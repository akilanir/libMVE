package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.stream.Format;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ElementListParameter.class */
class ElementListParameter extends TemplateParameter {
    private final Expression expression;
    private final Contact contact;
    private final Label label;
    private final String path;
    private final String name;
    private final Class type;
    private final Object key;
    private final int index;

    public ElementListParameter(Constructor factory, ElementList value, Format format, int index) throws Exception {
        this.contact = new Contact(value, factory, index);
        this.label = new ElementListLabel(this.contact, value, format);
        this.expression = this.label.getExpression();
        this.path = this.label.getPath();
        this.type = this.label.getType();
        this.name = this.label.getName();
        this.key = this.label.getKey();
        this.index = index;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Object getKey() {
        return this.key;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String getPath() {
        return this.path;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String getName() {
        return this.name;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Expression getExpression() {
        return this.expression;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public Annotation getAnnotation() {
        return this.contact.getAnnotation();
    }

    @Override // org.simpleframework.xml.core.Parameter
    public int getIndex() {
        return this.index;
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isRequired() {
        return this.label.isRequired();
    }

    @Override // org.simpleframework.xml.core.Parameter
    public boolean isPrimitive() {
        return this.type.isPrimitive();
    }

    @Override // org.simpleframework.xml.core.Parameter
    public String toString() {
        return this.contact.toString();
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ElementListParameter$Contact.class */
    private static class Contact extends ParameterContact<ElementList> {
        public Contact(ElementList label, Constructor factory, int index) {
            super(label, factory, index);
        }

        @Override // org.simpleframework.xml.core.ParameterContact, org.simpleframework.xml.core.Contact
        public String getName() {
            return ((ElementList) this.label).name();
        }
    }
}
