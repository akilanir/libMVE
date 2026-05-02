package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/IntegerTransform.class */
class IntegerTransform implements Transform<Integer> {
    IntegerTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Integer read(String value) {
        return Integer.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Integer value) {
        return value.toString();
    }
}
