package org.spongycastle.math.ec;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/ReferenceMultiplier.class */
public class ReferenceMultiplier extends AbstractECMultiplier {
    @Override // org.spongycastle.math.ec.AbstractECMultiplier
    protected ECPoint multiplyPositive(ECPoint p, BigInteger k) {
        return ECAlgorithms.referenceMultiply(p, k);
    }
}
