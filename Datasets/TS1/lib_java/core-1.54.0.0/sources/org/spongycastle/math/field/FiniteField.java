package org.spongycastle.math.field;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/field/FiniteField.class */
public interface FiniteField {
    BigInteger getCharacteristic();

    int getDimension();
}
