package org.spongycastle.math.ec;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/ECMultiplier.class */
public interface ECMultiplier {
    ECPoint multiply(ECPoint eCPoint, BigInteger bigInteger);
}
