package org.spongycastle.crypto.params;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/ECPrivateKeyParameters.class */
public class ECPrivateKeyParameters extends ECKeyParameters {
    BigInteger d;

    public ECPrivateKeyParameters(BigInteger d, ECDomainParameters params) {
        super(true, params);
        this.d = d;
    }

    public BigInteger getD() {
        return this.d;
    }
}
