package org.simpleframework.xml.transform;

import java.math.BigInteger;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/BigIntegerTransform.class */
class BigIntegerTransform implements Transform<BigInteger> {
    BigIntegerTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public BigInteger read(String value) {
        return new BigInteger(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(BigInteger value) {
        return value.toString();
    }
}
