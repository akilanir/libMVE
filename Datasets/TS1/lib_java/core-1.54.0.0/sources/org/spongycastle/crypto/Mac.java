package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/Mac.class */
public interface Mac {
    void init(CipherParameters cipherParameters) throws IllegalArgumentException;

    String getAlgorithmName();

    int getMacSize();

    void update(byte b) throws IllegalStateException;

    void update(byte[] bArr, int i, int i2) throws DataLengthException, IllegalStateException;

    int doFinal(byte[] bArr, int i) throws DataLengthException, IllegalStateException;

    void reset();
}
