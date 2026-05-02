package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/AsymmetricCipherKeyPairGenerator.class */
public interface AsymmetricCipherKeyPairGenerator {
    void init(KeyGenerationParameters keyGenerationParameters);

    AsymmetricCipherKeyPair generateKeyPair();
}
