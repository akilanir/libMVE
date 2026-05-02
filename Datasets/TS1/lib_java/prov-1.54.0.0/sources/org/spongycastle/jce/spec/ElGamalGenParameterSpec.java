package org.spongycastle.jce.spec;

import java.security.spec.AlgorithmParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/spec/ElGamalGenParameterSpec.class */
public class ElGamalGenParameterSpec implements AlgorithmParameterSpec {
    private int primeSize;

    public ElGamalGenParameterSpec(int primeSize) {
        this.primeSize = primeSize;
    }

    public int getPrimeSize() {
        return this.primeSize;
    }
}
