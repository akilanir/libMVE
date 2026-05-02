package org.spongycastle.crypto.ec;

import org.spongycastle.crypto.CipherParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/ec/ECPairTransform.class */
public interface ECPairTransform {
    void init(CipherParameters cipherParameters);

    ECPair transform(ECPair eCPair);
}
