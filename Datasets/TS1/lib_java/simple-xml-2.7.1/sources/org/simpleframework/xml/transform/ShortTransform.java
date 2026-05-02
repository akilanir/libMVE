package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/ShortTransform.class */
class ShortTransform implements Transform<Short> {
    ShortTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Short read(String value) {
        return Short.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Short value) {
        return value.toString();
    }
}
