package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.AlgorithmParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/McElieceCCA2ParameterSpec.class */
public class McElieceCCA2ParameterSpec implements AlgorithmParameterSpec {
    public static final String DEFAULT_MD = "SHA256";
    private String mdName;

    public McElieceCCA2ParameterSpec() {
        this(DEFAULT_MD);
    }

    public McElieceCCA2ParameterSpec(String mdName) {
        this.mdName = mdName;
    }

    public String getMDName() {
        return this.mdName;
    }
}
