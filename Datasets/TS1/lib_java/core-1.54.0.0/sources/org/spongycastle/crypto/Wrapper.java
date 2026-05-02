package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Wrapper.class */
public interface Wrapper {
    void init(boolean z, CipherParameters cipherParameters);

    String getAlgorithmName();

    byte[] wrap(byte[] bArr, int i, int i2);

    byte[] unwrap(byte[] bArr, int i, int i2) throws InvalidCipherTextException;
}
