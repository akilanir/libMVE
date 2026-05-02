package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/LabelKey.class */
class LabelKey {
    private final Class label;
    private final Class owner;
    private final Class type;
    private final String name;

    public LabelKey(Contact contact, Annotation label) {
        this.owner = contact.getDeclaringClass();
        this.label = label.annotationType();
        this.name = contact.getName();
        this.type = contact.getType();
    }

    public int hashCode() {
        return this.name.hashCode() ^ this.owner.hashCode();
    }

    public boolean equals(Object value) {
        if (value instanceof LabelKey) {
            return equals((LabelKey) value);
        }
        return false;
    }

    private boolean equals(LabelKey key) {
        if (key == this) {
            return true;
        }
        if (key.label != this.label || key.owner != this.owner || key.type != this.type) {
            return false;
        }
        return key.name.equals(this.name);
    }

    public String toString() {
        return String.format("key '%s' for %s", this.name, this.owner);
    }
}
