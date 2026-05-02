package org.jsoup.nodes;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/BooleanAttribute.class */
public class BooleanAttribute extends Attribute {
    public BooleanAttribute(String key) {
        super(key, "");
    }

    @Override // org.jsoup.nodes.Attribute
    protected boolean isBooleanAttribute() {
        return true;
    }
}
