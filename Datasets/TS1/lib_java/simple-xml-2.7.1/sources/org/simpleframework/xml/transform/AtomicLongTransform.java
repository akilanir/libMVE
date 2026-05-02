package org.simpleframework.xml.transform;

import java.util.concurrent.atomic.AtomicLong;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/AtomicLongTransform.class */
class AtomicLongTransform implements Transform<AtomicLong> {
    AtomicLongTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public AtomicLong read(String value) {
        Long number = Long.valueOf(value);
        return new AtomicLong(number.longValue());
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(AtomicLong value) {
        return value.toString();
    }
}
