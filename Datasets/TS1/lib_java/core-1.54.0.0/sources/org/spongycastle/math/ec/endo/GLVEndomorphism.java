package org.spongycastle.math.ec.endo;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/endo/GLVEndomorphism.class */
public interface GLVEndomorphism extends ECEndomorphism {
    BigInteger[] decomposeScalar(BigInteger bigInteger);
}
