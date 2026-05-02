package org.spongycastle.crypto.prng;

import org.spongycastle.crypto.prng.drbg.SP80090DRBG;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/DRBGProvider.class */
interface DRBGProvider {
    SP80090DRBG get(EntropySource entropySource);
}
