package org.spongycastle.crypto.params;

import org.spongycastle.crypto.DerivationParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/ISO18033KDFParameters.class */
public class ISO18033KDFParameters implements DerivationParameters {
    byte[] seed;

    public ISO18033KDFParameters(byte[] seed) {
        this.seed = seed;
    }

    public byte[] getSeed() {
        return this.seed;
    }
}
