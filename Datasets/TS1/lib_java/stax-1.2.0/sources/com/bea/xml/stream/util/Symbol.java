package com.bea.xml.stream.util;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/Symbol.class */
class Symbol {
    String name;
    String value;
    int depth;

    Symbol(String name, String value, int depth) {
        this.name = name;
        this.value = value;
        this.depth = depth;
    }

    public String getName() {
        return this.name;
    }

    public String getValue() {
        return this.value;
    }

    public int getDepth() {
        return this.depth;
    }

    public String toString() {
        return new StringBuffer().append("[").append(this.depth).append("][").append(this.name).append("][").append(this.value).append("]").toString();
    }
}
