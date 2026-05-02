package org.spongycastle.crypto.params;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/DSAKeyParameters.class */
public class DSAKeyParameters extends AsymmetricKeyParameter {
    private DSAParameters params;

    public DSAKeyParameters(boolean isPrivate, DSAParameters params) {
        super(isPrivate);
        this.params = params;
    }

    public DSAParameters getParameters() {
        return this.params;
    }
}
