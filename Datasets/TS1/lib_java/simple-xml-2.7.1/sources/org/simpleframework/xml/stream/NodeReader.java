package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/NodeReader.class */
class NodeReader {
    private final EventReader reader;
    private final StringBuilder text = new StringBuilder();
    private final InputStack stack = new InputStack();

    public NodeReader(EventReader reader) {
        this.reader = reader;
    }

    public boolean isRoot(InputNode node) {
        return this.stack.bottom() == node;
    }

    public InputNode readRoot() throws Exception {
        if (this.stack.isEmpty()) {
            InputNode node = readElement(null);
            if (node == null) {
                throw new NodeException("Document has no root element");
            }
            return node;
        }
        return null;
    }

    public InputNode readElement(InputNode from) throws Exception {
        if (!this.stack.isRelevant(from)) {
            return null;
        }
        EventNode next = this.reader.next();
        while (true) {
            EventNode event = next;
            if (event != null) {
                if (event.isEnd()) {
                    if (this.stack.pop() == from) {
                        return null;
                    }
                } else if (event.isStart()) {
                    return readStart(from, event);
                }
                next = this.reader.next();
            } else {
                return null;
            }
        }
    }

    public InputNode readElement(InputNode from, String name) throws Exception {
        if (!this.stack.isRelevant(from)) {
            return null;
        }
        EventNode peek = this.reader.peek();
        while (true) {
            EventNode event = peek;
            if (event != null) {
                if (event.isText()) {
                    fillText(from);
                } else if (event.isEnd()) {
                    if (this.stack.top() == from) {
                        return null;
                    }
                    this.stack.pop();
                } else if (event.isStart()) {
                    if (isName(event, name)) {
                        return readElement(from);
                    }
                    return null;
                }
                this.reader.next();
                peek = this.reader.peek();
            } else {
                return null;
            }
        }
    }

    private InputNode readStart(InputNode from, EventNode event) throws Exception {
        InputElement input = new InputElement(from, this, event);
        if (this.text.length() > 0) {
            this.text.setLength(0);
        }
        if (event.isStart()) {
            return this.stack.push(input);
        }
        return input;
    }

    private boolean isName(EventNode node, String name) {
        String local = node.getName();
        if (local == null) {
            return false;
        }
        return local.equals(name);
    }

    public String readValue(InputNode from) throws Exception {
        if (!this.stack.isRelevant(from)) {
            return null;
        }
        int length = this.text.length();
        if (length <= 0) {
            EventNode event = this.reader.peek();
            if (event.isEnd()) {
                if (this.stack.top() == from) {
                    return null;
                }
                this.stack.pop();
                this.reader.next();
            }
        }
        return readText(from);
    }

    private String readText(InputNode from) throws Exception {
        EventNode peek = this.reader.peek();
        while (true) {
            EventNode event = peek;
            if (this.stack.top() != from || !event.isText()) {
                break;
            }
            fillText(from);
            this.reader.next();
            peek = this.reader.peek();
        }
        return readBuffer(from);
    }

    private String readBuffer(InputNode from) throws Exception {
        int length = this.text.length();
        if (length > 0) {
            String value = this.text.toString();
            this.text.setLength(0);
            return value;
        }
        return null;
    }

    private void fillText(InputNode from) throws Exception {
        EventNode event = this.reader.peek();
        if (event.isText()) {
            String data = event.getValue();
            this.text.append(data);
        }
    }

    public boolean isEmpty(InputNode from) throws Exception {
        if (this.stack.top() == from) {
            EventNode event = this.reader.peek();
            if (event.isEnd()) {
                return true;
            }
            return false;
        }
        return false;
    }

    public void skipElement(InputNode from) throws Exception {
        while (readElement(from) != null) {
        }
    }
}
