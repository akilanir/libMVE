package org.spongycastle.crypto;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/DSA.class */
public interface DSA {
    void init(boolean z, CipherParameters cipherParameters);

    BigInteger[] generateSignature(byte[] bArr);

    boolean verifySignature(byte[] bArr, BigInteger bigInteger, BigInteger bigInteger2);
}
