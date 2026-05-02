package org.spongycastle.pqc.crypto.mceliece;

import org.spongycastle.crypto.params.AsymmetricKeyParameter;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/mceliece/McElieceCCA2KeyParameters.class */
public class McElieceCCA2KeyParameters extends AsymmetricKeyParameter {
    private McElieceCCA2Parameters params;

    public McElieceCCA2KeyParameters(boolean isPrivate, McElieceCCA2Parameters params) {
        super(isPrivate);
        this.params = params;
    }

    public McElieceCCA2Parameters getParameters() {
        return this.params;
    }
}
