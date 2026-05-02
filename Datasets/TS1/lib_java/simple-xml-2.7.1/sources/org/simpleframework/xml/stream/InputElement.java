package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/InputElement.class */
class InputElement implements InputNode {
    private final InputNodeMap map;
    private final NodeReader reader;
    private final InputNode parent;
    private final EventNode node;

    public InputElement(InputNode parent, NodeReader reader, EventNode node) {
        this.map = new InputNodeMap(this, node);
        this.reader = reader;
        this.parent = parent;
        this.node = node;
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public Object getSource() {
        return this.node.getSource();
    }

    @Override // org.simpleframework.xml.stream.Node
    public InputNode getParent() {
        return this.parent;
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public Position getPosition() {
        return new InputPosition(this.node);
    }

    @Override // org.simpleframework.xml.stream.Node
    public String getName() {
        return this.node.getName();
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public String getPrefix() {
        return this.node.getPrefix();
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public String getReference() {
        return this.node.getReference();
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public boolean isRoot() {
        return this.reader.isRoot(this);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public boolean isElement() {
        return true;
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public InputNode getAttribute(String name) {
        return this.map.get(name);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public NodeMap<InputNode> getAttributes() {
        return this.map;
    }

    @Override // org.simpleframework.xml.stream.Node
    public String getValue() throws Exception {
        return this.reader.readValue(this);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public InputNode getNext() throws Exception {
        return this.reader.readElement(this);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public InputNode getNext(String name) throws Exception {
        return this.reader.readElement(this, name);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public void skip() throws Exception {
        this.reader.skipElement(this);
    }

    @Override // org.simpleframework.xml.stream.InputNode
    public boolean isEmpty() throws Exception {
        if (!this.map.isEmpty()) {
            return false;
        }
        return this.reader.isEmpty(this);
    }

    public String toString() {
        return String.format("element %s", getName());
    }
}
