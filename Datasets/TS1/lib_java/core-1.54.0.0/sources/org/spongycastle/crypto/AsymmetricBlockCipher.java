package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/AsymmetricBlockCipher.class */
public interface AsymmetricBlockCipher {
    void init(boolean z, CipherParameters cipherParameters);

    int getInputBlockSize();

    int getOutputBlockSize();

    byte[] processBlock(byte[] bArr, int i, int i2) throws InvalidCipherTextException;
}
