package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/FloatTransform.class */
class FloatTransform implements Transform<Float> {
    FloatTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Float read(String value) {
        return Float.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Float value) {
        return value.toString();
    }
}
