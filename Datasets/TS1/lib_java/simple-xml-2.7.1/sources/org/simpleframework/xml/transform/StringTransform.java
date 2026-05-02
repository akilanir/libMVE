package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/StringTransform.class */
class StringTransform implements Transform<String> {
    StringTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public String read(String value) {
        return value;
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(String value) {
        return value;
    }
}
