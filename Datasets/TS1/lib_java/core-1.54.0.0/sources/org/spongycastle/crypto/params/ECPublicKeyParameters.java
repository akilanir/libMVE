package org.spongycastle.crypto.params;

import org.spongycastle.math.ec.ECPoint;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/ECPublicKeyParameters.class */
public class ECPublicKeyParameters extends ECKeyParameters {
    ECPoint Q;

    public ECPublicKeyParameters(ECPoint Q, ECDomainParameters params) {
        super(false, params);
        this.Q = Q.normalize();
    }

    public ECPoint getQ() {
        return this.Q;
    }
}
