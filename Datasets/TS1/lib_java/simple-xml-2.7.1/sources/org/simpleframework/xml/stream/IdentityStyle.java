package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/IdentityStyle.class */
class IdentityStyle implements Style {
    IdentityStyle() {
    }

    @Override // org.simpleframework.xml.stream.Style
    public String getAttribute(String name) {
        return name;
    }

    @Override // org.simpleframework.xml.stream.Style
    public String getElement(String name) {
        return name;
    }
}
