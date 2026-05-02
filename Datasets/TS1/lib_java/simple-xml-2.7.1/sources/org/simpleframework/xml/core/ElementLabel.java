package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ElementLabel.class */
class ElementLabel extends TemplateLabel {
    private Decorator decorator;
    private Introspector detail;
    private Expression cache;
    private Element label;
    private Format format;
    private String override;
    private String path;
    private String name;
    private Class expect;
    private Class type;
    private boolean required;
    private boolean data;

    public ElementLabel(Contact contact, Element label, Format format) {
        this.detail = new Introspector(contact, this, format);
        this.decorator = new Qualifier(contact);
        this.required = label.required();
        this.type = contact.getType();
        this.override = label.name();
        this.expect = label.type();
        this.data = label.data();
        this.format = format;
        this.label = label;
    }

    @Override // org.simpleframework.xml.core.Label
    public Decorator getDecorator() throws Exception {
        return this.decorator;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public Type getType(Class type) {
        Type contact = getContact();
        if (this.expect == Void.TYPE) {
            return contact;
        }
        return new OverrideType(contact, this.expect);
    }

    @Override // org.simpleframework.xml.core.Label
    public Converter getConverter(Context context) throws Exception {
        Type type = getContact();
        if (context.isPrimitive(type)) {
            return new Primitive(context, type);
        }
        if (this.expect == Void.TYPE) {
            return new Composite(context, type);
        }
        return new Composite(context, type, this.expect);
    }

    @Override // org.simpleframework.xml.core.Label
    public Object getEmpty(Context context) {
        return null;
    }

    @Override // org.simpleframework.xml.core.Label
    public String getName() throws Exception {
        if (this.name == null) {
            Style style = this.format.getStyle();
            String value = this.detail.getName();
            this.name = style.getElement(value);
        }
        return this.name;
    }

    @Override // org.simpleframework.xml.core.Label
    public String getPath() throws Exception {
        if (this.path == null) {
            Expression expression = getExpression();
            String name = getName();
            this.path = expression.getElement(name);
        }
        return this.path;
    }

    @Override // org.simpleframework.xml.core.Label
    public Expression getExpression() throws Exception {
        if (this.cache == null) {
            this.cache = this.detail.getExpression();
        }
        return this.cache;
    }

    @Override // org.simpleframework.xml.core.Label
    public Annotation getAnnotation() {
        return this.label;
    }

    @Override // org.simpleframework.xml.core.Label
    public Contact getContact() {
        return this.detail.getContact();
    }

    @Override // org.simpleframework.xml.core.Label
    public String getOverride() {
        return this.override;
    }

    @Override // org.simpleframework.xml.core.Label
    public Class getType() {
        if (this.expect == Void.TYPE) {
            return this.type;
        }
        return this.expect;
    }

    @Override // org.simpleframework.xml.core.Label
    public boolean isRequired() {
        return this.required;
    }

    @Override // org.simpleframework.xml.core.Label
    public boolean isData() {
        return this.data;
    }

    @Override // org.simpleframework.xml.core.Label
    public String toString() {
        return this.detail.toString();
    }
}
