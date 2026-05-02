package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/DoubleTransform.class */
class DoubleTransform implements Transform<Double> {
    DoubleTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Double read(String value) {
        return Double.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Double value) {
        return value.toString();
    }
}
