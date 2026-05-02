package org.spongycastle.crypto;

import java.math.BigInteger;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/BasicAgreement.class */
public interface BasicAgreement {
    void init(CipherParameters cipherParameters);

    int getFieldSize();

    BigInteger calculateAgreement(CipherParameters cipherParameters);
}
