package org.simpleframework.xml.core;

import org.simpleframework.xml.Version;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Schema.class */
interface Schema {
    boolean isPrimitive();

    Label getVersion();

    Version getRevision();

    Decorator getDecorator();

    Instantiator getInstantiator();

    Caller getCaller();

    Section getSection();

    Label getText();
}
