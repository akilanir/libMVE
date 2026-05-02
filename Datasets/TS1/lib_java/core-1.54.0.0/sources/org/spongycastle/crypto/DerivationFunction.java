package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/DerivationFunction.class */
public interface DerivationFunction {
    void init(DerivationParameters derivationParameters);

    int generateBytes(byte[] bArr, int i, int i2) throws DataLengthException, IllegalArgumentException;
}
