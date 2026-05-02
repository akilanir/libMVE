package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.CoreConstants;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/Node.class */
public class Node {
    static final int LITERAL = 0;
    static final int SIMPLE_KEYWORD = 1;
    static final int COMPOSITE_KEYWORD = 2;
    final int type;
    final Object value;
    Node next;

    Node(int i) {
        this(i, null);
    }

    Node(int i, Object obj) {
        this.type = i;
        this.value = obj;
    }

    public int getType() {
        return this.type;
    }

    public Object getValue() {
        return this.value;
    }

    public Node getNext() {
        return this.next;
    }

    public void setNext(Node node) {
        this.next = node;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Node)) {
            return false;
        }
        Node node = (Node) obj;
        return this.type == node.type && (this.value == null ? node.value == null : this.value.equals(node.value)) && (this.next == null ? node.next == null : this.next.equals(node.next));
    }

    public int hashCode() {
        return (31 * this.type) + (this.value != null ? this.value.hashCode() : 0);
    }

    String printNext() {
        return this.next != null ? " -> " + this.next : CoreConstants.EMPTY_STRING;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        switch (this.type) {
            case 0:
                stringBuffer.append("LITERAL(" + this.value + ")");
                break;
            default:
                stringBuffer.append(super.toString());
                break;
        }
        stringBuffer.append(printNext());
        return stringBuffer.toString();
    }
}
