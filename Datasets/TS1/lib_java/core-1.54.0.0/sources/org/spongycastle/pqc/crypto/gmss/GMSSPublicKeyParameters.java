package org.spongycastle.pqc.crypto.gmss;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/gmss/GMSSPublicKeyParameters.class */
public class GMSSPublicKeyParameters extends GMSSKeyParameters {
    private byte[] gmssPublicKey;

    public GMSSPublicKeyParameters(byte[] key, GMSSParameters gmssParameterSet) {
        super(false, gmssParameterSet);
        this.gmssPublicKey = key;
    }

    public byte[] getPublicKey() {
        return this.gmssPublicKey;
    }
}
