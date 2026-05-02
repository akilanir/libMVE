package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/KeyEncapsulation.class */
public interface KeyEncapsulation {
    void init(CipherParameters cipherParameters);

    CipherParameters encrypt(byte[] bArr, int i, int i2);

    CipherParameters decrypt(byte[] bArr, int i, int i2, int i3);
}
