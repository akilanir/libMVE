package org.spongycastle.jce.spec;

import java.security.spec.KeySpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/spec/ElGamalKeySpec.class */
public class ElGamalKeySpec implements KeySpec {
    private ElGamalParameterSpec spec;

    public ElGamalKeySpec(ElGamalParameterSpec spec) {
        this.spec = spec;
    }

    public ElGamalParameterSpec getParams() {
        return this.spec;
    }
}
