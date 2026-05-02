package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Digest.class */
public interface Digest {
    String getAlgorithmName();

    int getDigestSize();

    void update(byte b);

    void update(byte[] bArr, int i, int i2);

    int doFinal(byte[] bArr, int i);

    void reset();
}
