package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/Attribute.class */
interface Attribute {
    String getName();

    String getValue();

    String getReference();

    String getPrefix();

    Object getSource();

    boolean isReserved();
}
