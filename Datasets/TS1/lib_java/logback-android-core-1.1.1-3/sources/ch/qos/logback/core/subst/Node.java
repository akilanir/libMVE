package ch.qos.logback.core.subst;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Node.class */
public class Node {
    Type type;
    Object payload;
    Object defaultPart;
    Node next;

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Node$Type.class */
    enum Type {
        LITERAL,
        VARIABLE
    }

    public Node(Type type, Object obj) {
        this.type = type;
        this.payload = obj;
    }

    public Node(Type type, Object obj, Object obj2) {
        this.type = type;
        this.payload = obj;
        this.defaultPart = obj2;
    }

    void append(Node node) {
        if (node == null) {
            return;
        }
        Node node2 = this;
        while (true) {
            Node node3 = node2;
            if (node3.next == null) {
                node3.next = node;
                return;
            }
            node2 = node3.next;
        }
    }

    public String toString() {
        switch (this.type) {
            case LITERAL:
                return "Node{type=" + this.type + ", payload='" + this.payload + "'}";
            case VARIABLE:
                StringBuilder sb = new StringBuilder();
                StringBuilder sb2 = new StringBuilder();
                if (this.defaultPart != null) {
                    recursive((Node) this.defaultPart, sb2);
                }
                recursive((Node) this.payload, sb);
                String str = "Node{type=" + this.type + ", payload='" + sb.toString() + "'";
                if (this.defaultPart != null) {
                    str = str + ", defaultPart=" + sb2.toString();
                }
                return str + '}';
            default:
                return null;
        }
    }

    public void dump() {
        System.out.print(toString());
        System.out.print(" -> ");
        if (this.next != null) {
            this.next.dump();
        } else {
            System.out.print(" null");
        }
    }

    void recursive(Node node, StringBuilder sb) {
        Node node2 = node;
        while (true) {
            Node node3 = node2;
            if (node3 == null) {
                sb.append("null ");
                return;
            } else {
                sb.append(node3.toString()).append(" --> ");
                node2 = node3.next;
            }
        }
    }

    public void setNext(Node node) {
        this.next = node;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Node node = (Node) obj;
        if (this.type != node.type) {
            return false;
        }
        if (this.payload != null) {
            if (!this.payload.equals(node.payload)) {
                return false;
            }
        } else if (node.payload != null) {
            return false;
        }
        if (this.defaultPart != null) {
            if (!this.defaultPart.equals(node.defaultPart)) {
                return false;
            }
        } else if (node.defaultPart != null) {
            return false;
        }
        return this.next != null ? this.next.equals(node.next) : node.next == null;
    }

    public int hashCode() {
        return (31 * ((31 * ((31 * (this.type != null ? this.type.hashCode() : 0)) + (this.payload != null ? this.payload.hashCode() : 0))) + (this.defaultPart != null ? this.defaultPart.hashCode() : 0))) + (this.next != null ? this.next.hashCode() : 0);
    }
}
