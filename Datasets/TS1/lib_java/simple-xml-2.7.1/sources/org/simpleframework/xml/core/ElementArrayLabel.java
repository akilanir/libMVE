package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.ElementArray;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ElementArrayLabel.class */
class ElementArrayLabel extends TemplateLabel {
    private Decorator decorator;
    private ElementArray label;
    private Introspector detail;
    private Expression path;
    private Format format;
    private Class type;
    private String entry;
    private String name;
    private boolean required;
    private boolean data;

    public ElementArrayLabel(Contact contact, ElementArray label, Format format) {
        this.detail = new Introspector(contact, this, format);
        this.decorator = new Qualifier(contact);
        this.required = label.required();
        this.type = contact.getType();
        this.entry = label.entry();
        this.data = label.data();
        this.name = label.name();
        this.format = format;
        this.label = label;
    }

    @Override // org.simpleframework.xml.core.Label
    public Decorator getDecorator() throws Exception {
        return this.decorator;
    }

    @Override // org.simpleframework.xml.core.Label
    public Converter getConverter(Context context) throws Exception {
        Contact contact = getContact();
        String entry = getEntry();
        if (!this.type.isArray()) {
            throw new InstantiationException("Type is not an array %s for %s", this.type, contact);
        }
        return getConverter(context, entry);
    }

    private Converter getConverter(Context context, String name) throws Exception {
        Type entry = getDependent();
        Type type = getContact();
        if (!context.isPrimitive(entry)) {
            return new CompositeArray(context, type, entry, name);
        }
        return new PrimitiveArray(context, type, entry, name);
    }

    @Override // org.simpleframework.xml.core.Label
    public Object getEmpty(Context context) throws Exception {
        Type array = new ClassType(this.type);
        Factory factory = new ArrayFactory(context, array);
        if (!this.label.empty()) {
            return factory.getInstance();
        }
        return null;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public String getEntry() throws Exception {
        Style style = this.format.getStyle();
        if (this.detail.isEmpty(this.entry)) {
            this.entry = this.detail.getEntry();
        }
        return style.getElement(this.entry);
    }

    @Override // org.simpleframework.xml.core.Label
    public String getName() throws Exception {
        Style style = this.format.getStyle();
        String name = this.detail.getName();
        return style.getElement(name);
    }

    @Override // org.simpleframework.xml.core.Label
    public String getPath() throws Exception {
        Expression path = getExpression();
        String name = getName();
        return path.getElement(name);
    }

    @Override // org.simpleframework.xml.core.Label
    public Expression getExpression() throws Exception {
        if (this.path == null) {
            this.path = this.detail.getExpression();
        }
        return this.path;
    }

    @Override // org.simpleframework.xml.core.Label
    public Annotation getAnnotation() {
        return this.label;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public Type getDependent() {
        Class entry = this.type.getComponentType();
        if (entry == null) {
            return new ClassType(this.type);
        }
        return new ClassType(entry);
    }

    @Override // org.simpleframework.xml.core.Label
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.core.Label
    public Contact getContact() {
        return this.detail.getContact();
    }

    @Override // org.simpleframework.xml.core.Label
    public String getOverride() {
        return this.name;
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
