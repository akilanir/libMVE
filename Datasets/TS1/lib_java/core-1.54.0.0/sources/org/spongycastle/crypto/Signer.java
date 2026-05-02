package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Signer.class */
public interface Signer {
    void init(boolean z, CipherParameters cipherParameters);

    void update(byte b);

    void update(byte[] bArr, int i, int i2);

    byte[] generateSignature() throws CryptoException, DataLengthException;

    boolean verifySignature(byte[] bArr);

    void reset();
}
