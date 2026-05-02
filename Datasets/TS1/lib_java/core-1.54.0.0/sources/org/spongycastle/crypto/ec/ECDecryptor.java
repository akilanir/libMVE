package org.spongycastle.crypto.ec;

import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.math.ec.ECPoint;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/ec/ECDecryptor.class */
public interface ECDecryptor {
    void init(CipherParameters cipherParameters);

    ECPoint decrypt(ECPair eCPair);
}
