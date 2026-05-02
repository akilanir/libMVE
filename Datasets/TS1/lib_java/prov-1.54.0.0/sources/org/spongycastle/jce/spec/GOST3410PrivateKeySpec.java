package org.spongycastle.jce.spec;

import java.math.BigInteger;
import java.security.spec.KeySpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/spec/GOST3410PrivateKeySpec.class */
public class GOST3410PrivateKeySpec implements KeySpec {
    private BigInteger x;
    private BigInteger p;
    private BigInteger q;
    private BigInteger a;

    public GOST3410PrivateKeySpec(BigInteger x, BigInteger p, BigInteger q, BigInteger a) {
        this.x = x;
        this.p = p;
        this.q = q;
        this.a = a;
    }

    public BigInteger getX() {
        return this.x;
    }

    public BigInteger getP() {
        return this.p;
    }

    public BigInteger getQ() {
        return this.q;
    }

    public BigInteger getA() {
        return this.a;
    }
}
