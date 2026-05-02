package org.spongycastle.jce.spec;

import java.math.BigInteger;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/spec/ElGamalPrivateKeySpec.class */
public class ElGamalPrivateKeySpec extends ElGamalKeySpec {
    private BigInteger x;

    public ElGamalPrivateKeySpec(BigInteger x, ElGamalParameterSpec spec) {
        super(spec);
        this.x = x;
    }

    public BigInteger getX() {
        return this.x;
    }
}
