package org.spongycastle.crypto.params;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/SRP6GroupParameters.class */
public class SRP6GroupParameters {
    private BigInteger N;
    private BigInteger g;

    public SRP6GroupParameters(BigInteger N, BigInteger g) {
        this.N = N;
        this.g = g;
    }

    public BigInteger getG() {
        return this.g;
    }

    public BigInteger getN() {
        return this.N;
    }
}
