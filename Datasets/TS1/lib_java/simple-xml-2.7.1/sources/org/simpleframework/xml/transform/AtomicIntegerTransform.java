package org.simpleframework.xml.transform;

import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/AtomicIntegerTransform.class */
class AtomicIntegerTransform implements Transform<AtomicInteger> {
    AtomicIntegerTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public AtomicInteger read(String value) {
        Integer number = Integer.valueOf(value);
        return new AtomicInteger(number.intValue());
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(AtomicInteger value) {
        return value.toString();
    }
}
