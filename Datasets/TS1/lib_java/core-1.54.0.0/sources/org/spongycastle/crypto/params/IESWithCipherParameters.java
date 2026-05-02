package org.spongycastle.crypto.params;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/IESWithCipherParameters.class */
public class IESWithCipherParameters extends IESParameters {
    private int cipherKeySize;

    public IESWithCipherParameters(byte[] derivation, byte[] encoding, int macKeySize, int cipherKeySize) {
        super(derivation, encoding, macKeySize);
        this.cipherKeySize = cipherKeySize;
    }

    public int getCipherKeySize() {
        return this.cipherKeySize;
    }
}
