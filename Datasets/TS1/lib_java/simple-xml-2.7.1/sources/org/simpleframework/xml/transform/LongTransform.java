package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/LongTransform.class */
class LongTransform implements Transform<Long> {
    LongTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Long read(String value) {
        return Long.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Long value) {
        return value.toString();
    }
}
