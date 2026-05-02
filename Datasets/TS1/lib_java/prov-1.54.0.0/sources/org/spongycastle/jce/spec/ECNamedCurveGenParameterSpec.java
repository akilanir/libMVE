package org.spongycastle.jce.spec;

import java.security.spec.AlgorithmParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/spec/ECNamedCurveGenParameterSpec.class */
public class ECNamedCurveGenParameterSpec implements AlgorithmParameterSpec {
    private String name;

    public ECNamedCurveGenParameterSpec(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}
