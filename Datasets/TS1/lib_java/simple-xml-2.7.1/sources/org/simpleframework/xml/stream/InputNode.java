package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/InputNode.class */
public interface InputNode extends Node {
    boolean isRoot();

    boolean isElement();

    String getPrefix();

    String getReference();

    Position getPosition();

    InputNode getAttribute(String str);

    NodeMap<InputNode> getAttributes();

    @Override // org.simpleframework.xml.stream.Node
    InputNode getParent();

    Object getSource();

    InputNode getNext() throws Exception;

    InputNode getNext(String str) throws Exception;

    void skip() throws Exception;

    boolean isEmpty() throws Exception;
}
