package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/EventNode.class */
interface EventNode extends Iterable<Attribute> {
    int getLine();

    String getName();

    String getValue();

    String getReference();

    String getPrefix();

    Object getSource();

    boolean isEnd();

    boolean isStart();

    boolean isText();
}
