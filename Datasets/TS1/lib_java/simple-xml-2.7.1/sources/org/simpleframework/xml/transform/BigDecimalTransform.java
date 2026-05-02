package org.simpleframework.xml.transform;

import java.math.BigDecimal;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/BigDecimalTransform.class */
class BigDecimalTransform implements Transform<BigDecimal> {
    BigDecimalTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public BigDecimal read(String value) {
        return new BigDecimal(value);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(BigDecimal value) {
        return value.toString();
    }
}
