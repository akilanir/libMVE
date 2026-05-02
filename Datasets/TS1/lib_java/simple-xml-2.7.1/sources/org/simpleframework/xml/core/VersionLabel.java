package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.Version;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/VersionLabel.class */
class VersionLabel extends TemplateLabel {
    private Decorator decorator;
    private Introspector detail;
    private Expression path;
    private Version label;
    private Format format;
    private Class type;
    private String name;
    private boolean required;

    public VersionLabel(Contact contact, Version label, Format format) {
        this.detail = new Introspector(contact, this, format);
        this.decorator = new Qualifier(contact);
        this.required = label.required();
        this.type = contact.getType();
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
        String ignore = getEmpty(context);
        Type type = getContact();
        if (!context.isFloat(type)) {
            throw new AttributeException("Cannot use %s to represent %s", this.label, type);
        }
        return new Primitive(context, type, ignore);
    }

    @Override // org.simpleframework.xml.core.Label
    public String getEmpty(Context context) {
        return null;
    }

    @Override // org.simpleframework.xml.core.Label
    public String getName() throws Exception {
        Style style = this.format.getStyle();
        String name = this.detail.getName();
        return style.getAttribute(name);
    }

    @Override // org.simpleframework.xml.core.Label
    public String getPath() throws Exception {
        Expression path = getExpression();
        String name = getName();
        return path.getAttribute(name);
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

    @Override // org.simpleframework.xml.core.Label
    public String getOverride() {
        return this.name;
    }

    @Override // org.simpleframework.xml.core.Label
    public Contact getContact() {
        return this.detail.getContact();
    }

    @Override // org.simpleframework.xml.core.Label
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public boolean isAttribute() {
        return true;
    }

    @Override // org.simpleframework.xml.core.Label
    public boolean isRequired() {
        return this.required;
    }

    @Override // org.simpleframework.xml.core.Label
    public boolean isData() {
        return false;
    }

    @Override // org.simpleframework.xml.core.Label
    public String toString() {
        return this.detail.toString();
    }
}
