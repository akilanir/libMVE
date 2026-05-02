package org.spongycastle.pqc.math.ntru.polynomial;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/math/ntru/polynomial/Resultant.class */
public class Resultant {
    public BigIntPolynomial rho;
    public BigInteger res;

    Resultant(BigIntPolynomial rho, BigInteger res) {
        this.rho = rho;
        this.res = res;
    }
}
