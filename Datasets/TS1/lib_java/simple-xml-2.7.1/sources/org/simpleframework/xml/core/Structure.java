package org.simpleframework.xml.core;

import org.simpleframework.xml.Version;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Structure.class */
class Structure {
    private final Instantiator factory;
    private final Label version;
    private final Label text;
    private final Model model;
    private final boolean primitive;

    public Structure(Instantiator factory, Model model, Label version, Label text, boolean primitive) {
        this.primitive = primitive;
        this.factory = factory;
        this.version = version;
        this.model = model;
        this.text = text;
    }

    public Instantiator getInstantiator() {
        return this.factory;
    }

    public Section getSection() {
        return new ModelSection(this.model);
    }

    public boolean isPrimitive() {
        return this.primitive;
    }

    public Version getRevision() {
        if (this.version != null) {
            Contact contact = this.version.getContact();
            return (Version) contact.getAnnotation(Version.class);
        }
        return null;
    }

    public Label getVersion() {
        return this.version;
    }

    public Label getText() {
        return this.text;
    }
}
