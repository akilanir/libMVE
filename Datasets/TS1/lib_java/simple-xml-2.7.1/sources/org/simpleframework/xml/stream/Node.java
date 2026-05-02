package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/Node.class */
public interface Node {
    String getName();

    String getValue() throws Exception;

    Node getParent();
}
