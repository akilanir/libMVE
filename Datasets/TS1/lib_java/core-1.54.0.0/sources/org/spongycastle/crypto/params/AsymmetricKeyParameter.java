package org.spongycastle.crypto.params;

import org.spongycastle.crypto.CipherParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/params/AsymmetricKeyParameter.class */
public class AsymmetricKeyParameter implements CipherParameters {
    boolean privateKey;

    public AsymmetricKeyParameter(boolean privateKey) {
        this.privateKey = privateKey;
    }

    public boolean isPrivate() {
        return this.privateKey;
    }
}
