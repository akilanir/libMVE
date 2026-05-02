package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/EphemeralKeyPair.class */
public class EphemeralKeyPair {
    private AsymmetricCipherKeyPair keyPair;
    private KeyEncoder publicKeyEncoder;

    public EphemeralKeyPair(AsymmetricCipherKeyPair keyPair, KeyEncoder publicKeyEncoder) {
        this.keyPair = keyPair;
        this.publicKeyEncoder = publicKeyEncoder;
    }

    public AsymmetricCipherKeyPair getKeyPair() {
        return this.keyPair;
    }

    public byte[] getEncodedPublicKey() {
        return this.publicKeyEncoder.getEncoded(this.keyPair.getPublic());
    }
}
