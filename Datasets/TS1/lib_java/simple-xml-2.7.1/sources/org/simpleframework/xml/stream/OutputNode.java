package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/OutputNode.class */
public interface OutputNode extends Node {
    boolean isRoot();

    NodeMap<OutputNode> getAttributes();

    Mode getMode();

    void setMode(Mode mode);

    void setData(boolean z);

    String getPrefix();

    String getPrefix(boolean z);

    String getReference();

    void setReference(String str);

    NamespaceMap getNamespaces();

    String getComment();

    void setComment(String str);

    void setValue(String str);

    void setName(String str);

    OutputNode setAttribute(String str, String str2);

    @Override // org.simpleframework.xml.stream.Node
    OutputNode getParent();

    OutputNode getChild(String str) throws Exception;

    void remove() throws Exception;

    void commit() throws Exception;

    boolean isCommitted();
}
