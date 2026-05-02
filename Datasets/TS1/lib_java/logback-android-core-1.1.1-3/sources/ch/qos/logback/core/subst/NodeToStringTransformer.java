package ch.qos.logback.core.subst;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.spi.PropertyContainer;
import ch.qos.logback.core.spi.ScanException;
import ch.qos.logback.core.util.OptionHelper;
import java.util.Iterator;
import java.util.Stack;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/NodeToStringTransformer.class */
public class NodeToStringTransformer {
    final Node node;
    final PropertyContainer propertyContainer0;
    final PropertyContainer propertyContainer1;

    public NodeToStringTransformer(Node node, PropertyContainer propertyContainer, PropertyContainer propertyContainer2) {
        this.node = node;
        this.propertyContainer0 = propertyContainer;
        this.propertyContainer1 = propertyContainer2;
    }

    public NodeToStringTransformer(Node node, PropertyContainer propertyContainer) {
        this(node, propertyContainer, null);
    }

    public static String substituteVariable(String str, PropertyContainer propertyContainer, PropertyContainer propertyContainer2) throws ScanException {
        return new NodeToStringTransformer(tokenizeAndParseString(str), propertyContainer, propertyContainer2).transform();
    }

    private static Node tokenizeAndParseString(String str) throws ScanException {
        return new Parser(new Tokenizer(str).tokenize()).parse();
    }

    public String transform() throws ScanException {
        StringBuilder sb = new StringBuilder();
        compileNode(this.node, sb, new Stack<>());
        return sb.toString();
    }

    private void compileNode(Node node, StringBuilder sb, Stack<Node> stack) throws ScanException {
        Node node2 = node;
        while (true) {
            Node node3 = node2;
            if (node3 == null) {
                return;
            }
            switch (node3.type) {
                case LITERAL:
                    handleLiteral(node3, sb);
                    break;
                case VARIABLE:
                    handleVariable(node3, sb, stack);
                    break;
            }
            node2 = node3.next;
        }
    }

    private void handleVariable(Node node, StringBuilder sb, Stack<Node> stack) throws ScanException {
        if (haveVisitedNodeAlready(node, stack)) {
            stack.push(node);
            throw new IllegalArgumentException(constructRecursionErrorMessage(stack));
        }
        stack.push(node);
        StringBuilder sb2 = new StringBuilder();
        compileNode((Node) node.payload, sb2, stack);
        String sb3 = sb2.toString();
        String lookupKey = lookupKey(sb3);
        if (lookupKey != null) {
            compileNode(tokenizeAndParseString(lookupKey), sb, stack);
            stack.pop();
        } else {
            if (node.defaultPart == null) {
                sb.append(sb3 + CoreConstants.UNDEFINED_PROPERTY_SUFFIX);
                stack.pop();
                return;
            }
            Node node2 = (Node) node.defaultPart;
            StringBuilder sb4 = new StringBuilder();
            compileNode(node2, sb4, stack);
            stack.pop();
            sb.append(sb4.toString());
        }
    }

    private String lookupKey(String str) {
        String property;
        String property2 = this.propertyContainer0.getProperty(str);
        if (property2 != null) {
            return property2;
        }
        if (this.propertyContainer1 != null && (property = this.propertyContainer1.getProperty(str)) != null) {
            return property;
        }
        String systemProperty = OptionHelper.getSystemProperty(str, null);
        if (systemProperty != null) {
            return systemProperty;
        }
        String env = OptionHelper.getEnv(str);
        if (env != null) {
            return env;
        }
        return null;
    }

    private void handleLiteral(Node node, StringBuilder sb) {
        sb.append((String) node.payload);
    }

    private String variableNodeValue(Node node) {
        return (String) ((Node) node.payload).payload;
    }

    private String constructRecursionErrorMessage(Stack<Node> stack) {
        StringBuilder sb = new StringBuilder("Circular variable reference detected while parsing input [");
        Iterator<Node> it = stack.iterator();
        while (it.hasNext()) {
            Node next = it.next();
            sb.append("${").append(variableNodeValue(next)).append("}");
            if (stack.lastElement() != next) {
                sb.append(" --> ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    private boolean haveVisitedNodeAlready(Node node, Stack<Node> stack) {
        Iterator<Node> it = stack.iterator();
        while (it.hasNext()) {
            if (equalNodes(node, it.next())) {
                return true;
            }
        }
        return false;
    }

    private boolean equalNodes(Node node, Node node2) {
        if (node.type != null && !node.type.equals(node2.type)) {
            return false;
        }
        if (node.payload == null || node.payload.equals(node2.payload)) {
            return node.defaultPart == null || node.defaultPart.equals(node2.defaultPart);
        }
        return false;
    }
}
