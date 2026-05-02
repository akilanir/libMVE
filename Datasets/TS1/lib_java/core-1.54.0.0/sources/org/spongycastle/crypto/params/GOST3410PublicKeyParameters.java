package org.spongycastle.crypto.params;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/GOST3410PublicKeyParameters.class */
public class GOST3410PublicKeyParameters extends GOST3410KeyParameters {
    private BigInteger y;

    public GOST3410PublicKeyParameters(BigInteger y, GOST3410Parameters params) {
        super(false, params);
        this.y = y;
    }

    public BigInteger getY() {
        return this.y;
    }
}
