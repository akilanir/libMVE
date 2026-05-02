package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;
import org.simpleframework.xml.stream.Style;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ElementListLabel.class */
class ElementListLabel extends TemplateLabel {
    private Decorator decorator;
    private Introspector detail;
    private ElementList label;
    private Expression cache;
    private Format format;
    private String override;
    private String entry;
    private String name;
    private String path;
    private Class type;
    private Class item;
    private boolean required;
    private boolean inline;
    private boolean data;

    public ElementListLabel(Contact contact, ElementList label, Format format) {
        this.detail = new Introspector(contact, this, format);
        this.decorator = new Qualifier(contact);
        this.required = label.required();
        this.type = contact.getType();
        this.override = label.name();
        this.inline = label.inline();
        this.entry = label.entry();
        this.data = label.data();
        this.item = label.type();
        this.format = format;
        this.label = label;
    }

    @Override // org.simpleframework.xml.core.Label
    public Decorator getDecorator() throws Exception {
        return this.decorator;
    }

    @Override // org.simpleframework.xml.core.Label
    public Converter getConverter(Context context) throws Exception {
        String entry = getEntry();
        if (!this.label.inline()) {
            return getConverter(context, entry);
        }
        return getInlineConverter(context, entry);
    }

    private Converter getConverter(Context context, String name) throws Exception {
        Type item = getDependent();
        Type type = getContact();
        if (!context.isPrimitive(item)) {
            return new CompositeList(context, type, item, name);
        }
        return new PrimitiveList(context, type, item, name);
    }

    private Converter getInlineConverter(Context context, String name) throws Exception {
        Type item = getDependent();
        Type type = getContact();
        if (!context.isPrimitive(item)) {
            return new CompositeInlineList(context, type, item, name);
        }
        return new PrimitiveInlineList(context, type, item, name);
    }

    @Override // org.simpleframework.xml.core.Label
    public Object getEmpty(Context context) throws Exception {
        Type list = new ClassType(this.type);
        Factory factory = new CollectionFactory(context, list);
        if (!this.label.empty()) {
            return factory.getInstance();
        }
        return null;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public Type getDependent() throws Exception {
        Contact contact = getContact();
        if (this.item == Void.TYPE) {
            this.item = contact.getDependent();
        }
        if (this.item == null) {
            throw new ElementException("Unable to determine generic type for %s", contact);
        }
        return new ClassType(this.item);
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
    public Class getType() {
        return this.type;
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
    public boolean isData() {
        return this.data;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public boolean isCollection() {
        return true;
    }

    @Override // org.simpleframework.xml.core.Label
    public boolean isRequired() {
        return this.required;
    }

    @Override // org.simpleframework.xml.core.TemplateLabel, org.simpleframework.xml.core.Label
    public boolean isInline() {
        return this.inline;
    }

    @Override // org.simpleframework.xml.core.Label
    public String toString() {
        return this.detail.toString();
    }
}
