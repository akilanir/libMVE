package org.spongycastle.crypto.tls;

import org.spongycastle.crypto.DSA;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.DSAPublicKeyParameters;
import org.spongycastle.crypto.signers.DSASigner;
import org.spongycastle.crypto.signers.HMacDSAKCalculator;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsDSSSigner.class */
public class TlsDSSSigner extends TlsDSASigner {
    @Override // org.spongycastle.crypto.tls.TlsSigner
    public boolean isValidPublicKey(AsymmetricKeyParameter publicKey) {
        return publicKey instanceof DSAPublicKeyParameters;
    }

    @Override // org.spongycastle.crypto.tls.TlsDSASigner
    protected DSA createDSAImpl(short hashAlgorithm) {
        return new DSASigner(new HMacDSAKCalculator(TlsUtils.createHash(hashAlgorithm)));
    }

    @Override // org.spongycastle.crypto.tls.TlsDSASigner
    protected short getSignatureAlgorithm() {
        return (short) 2;
    }
}
