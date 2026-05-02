package org.spongycastle.crypto.params;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/DHPublicKeyParameters.class */
public class DHPublicKeyParameters extends DHKeyParameters {
    private BigInteger y;

    public DHPublicKeyParameters(BigInteger y, DHParameters params) {
        super(false, params);
        this.y = y;
    }

    public BigInteger getY() {
        return this.y;
    }

    @Override // org.spongycastle.crypto.params.DHKeyParameters
    public int hashCode() {
        return this.y.hashCode() ^ super.hashCode();
    }

    @Override // org.spongycastle.crypto.params.DHKeyParameters
    public boolean equals(Object obj) {
        if (!(obj instanceof DHPublicKeyParameters)) {
            return false;
        }
        DHPublicKeyParameters other = (DHPublicKeyParameters) obj;
        return other.getY().equals(this.y) && super.equals(obj);
    }
}
