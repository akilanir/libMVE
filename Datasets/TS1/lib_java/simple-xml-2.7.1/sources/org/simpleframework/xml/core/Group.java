package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Group.class */
interface Group {
    boolean isInline();

    boolean isTextList();

    Label getLabel(Class cls);

    LabelMap getElements() throws Exception;

    Label getText() throws Exception;

    String toString();
}
