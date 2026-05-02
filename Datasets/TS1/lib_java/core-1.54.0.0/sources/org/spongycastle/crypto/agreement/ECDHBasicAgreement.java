package org.spongycastle.crypto.agreement;

import java.math.BigInteger;
import org.spongycastle.crypto.BasicAgreement;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.params.ECPrivateKeyParameters;
import org.spongycastle.crypto.params.ECPublicKeyParameters;
import org.spongycastle.math.ec.ECPoint;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/agreement/ECDHBasicAgreement.class */
public class ECDHBasicAgreement implements BasicAgreement {
    private ECPrivateKeyParameters key;

    @Override // org.spongycastle.crypto.BasicAgreement
    public void init(CipherParameters key) {
        this.key = (ECPrivateKeyParameters) key;
    }

    @Override // org.spongycastle.crypto.BasicAgreement
    public int getFieldSize() {
        return (this.key.getParameters().getCurve().getFieldSize() + 7) / 8;
    }

    @Override // org.spongycastle.crypto.BasicAgreement
    public BigInteger calculateAgreement(CipherParameters pubKey) {
        ECPublicKeyParameters pub = (ECPublicKeyParameters) pubKey;
        ECPoint P = pub.getQ().multiply(this.key.getD()).normalize();
        if (P.isInfinity()) {
            throw new IllegalStateException("Infinity is not a valid agreement value for ECDH");
        }
        return P.getAffineXCoord().toBigInteger();
    }
}
