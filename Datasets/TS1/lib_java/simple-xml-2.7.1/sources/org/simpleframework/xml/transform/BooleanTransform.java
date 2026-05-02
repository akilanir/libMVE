package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/BooleanTransform.class */
class BooleanTransform implements Transform<Boolean> {
    BooleanTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Boolean read(String value) {
        return Boolean.valueOf(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Boolean value) {
        return value.toString();
    }
}
