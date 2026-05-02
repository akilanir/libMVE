package ch.qos.logback.core.pattern.parser;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/CompositeNode.class */
public class CompositeNode extends SimpleKeywordNode {
    Node childNode;

    CompositeNode(String str) {
        super(2, str);
    }

    public Node getChildNode() {
        return this.childNode;
    }

    public void setChildNode(Node node) {
        this.childNode = node;
    }

    @Override // ch.qos.logback.core.pattern.parser.SimpleKeywordNode, ch.qos.logback.core.pattern.parser.FormattingNode, ch.qos.logback.core.pattern.parser.Node
    public boolean equals(Object obj) {
        if (!super.equals(obj) || !(obj instanceof CompositeNode)) {
            return false;
        }
        CompositeNode compositeNode = (CompositeNode) obj;
        return this.childNode != null ? this.childNode.equals(compositeNode.childNode) : compositeNode.childNode == null;
    }

    @Override // ch.qos.logback.core.pattern.parser.SimpleKeywordNode, ch.qos.logback.core.pattern.parser.FormattingNode, ch.qos.logback.core.pattern.parser.Node
    public int hashCode() {
        return super.hashCode();
    }

    @Override // ch.qos.logback.core.pattern.parser.SimpleKeywordNode, ch.qos.logback.core.pattern.parser.Node
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (this.childNode != null) {
            stringBuffer.append("CompositeNode(" + this.childNode + ")");
        } else {
            stringBuffer.append("CompositeNode(no child)");
        }
        stringBuffer.append(printNext());
        return stringBuffer.toString();
    }
}
