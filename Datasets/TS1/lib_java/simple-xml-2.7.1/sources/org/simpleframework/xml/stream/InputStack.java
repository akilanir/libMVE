package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/InputStack.class */
class InputStack extends Stack<InputNode> {
    public InputStack() {
        super(6);
    }

    public boolean isRelevant(InputNode value) {
        return contains(value) || isEmpty();
    }
}
