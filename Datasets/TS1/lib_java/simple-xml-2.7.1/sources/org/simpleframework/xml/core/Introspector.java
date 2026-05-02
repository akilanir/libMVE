package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.Path;
import org.simpleframework.xml.Root;
import org.simpleframework.xml.strategy.Type;
import org.simpleframework.xml.stream.Format;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Introspector.class */
class Introspector {
    private final Annotation marker;
    private final Contact contact;
    private final Format format;
    private final Label label;

    public Introspector(Contact contact, Label label, Format format) {
        this.marker = contact.getAnnotation();
        this.contact = contact;
        this.format = format;
        this.label = label;
    }

    public Contact getContact() {
        return this.contact;
    }

    public Type getDependent() throws Exception {
        return this.label.getDependent();
    }

    public String getEntry() throws Exception {
        Type depend = getDependent();
        Class type = depend.getType();
        if (type.isArray()) {
            type = type.getComponentType();
        }
        return getName(type);
    }

    private String getName(Class type) throws Exception {
        String name = getRoot(type);
        if (name != null) {
            return name;
        }
        return Reflector.getName(type.getSimpleName());
    }

    private String getRoot(Class type) {
        while (type != null) {
            String name = getRoot(type, type);
            if (name != null) {
                return name;
            }
            type = type.getSuperclass();
        }
        return null;
    }

    private String getRoot(Class<?> real, Class<?> type) {
        String name = type.getSimpleName();
        Root root = (Root) type.getAnnotation(Root.class);
        if (root != null) {
            String text = root.name();
            if (!isEmpty(text)) {
                return text;
            }
            return Reflector.getName(name);
        }
        return null;
    }

    public String getName() throws Exception {
        String entry = this.label.getEntry();
        if (!this.label.isInline()) {
            entry = getDefault();
        }
        return entry;
    }

    private String getDefault() throws Exception {
        String name = this.label.getOverride();
        if (!isEmpty(name)) {
            return name;
        }
        return this.contact.getName();
    }

    public Expression getExpression() throws Exception {
        String path = getPath();
        if (path != null) {
            return new PathParser(path, this.contact, this.format);
        }
        return new EmptyExpression(this.format);
    }

    public String getPath() throws Exception {
        Path path = (Path) this.contact.getAnnotation(Path.class);
        if (path == null) {
            return null;
        }
        return path.value();
    }

    public boolean isEmpty(String value) {
        return value == null || value.length() == 0;
    }

    public String toString() {
        return String.format("%s on %s", this.marker, this.contact);
    }
}
