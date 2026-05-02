package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import org.spongycastle.pqc.crypto.gmss.GMSSParameters;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/GMSSKeySpec.class */
public class GMSSKeySpec implements KeySpec {
    private GMSSParameters gmssParameterSet;

    protected GMSSKeySpec(GMSSParameters gmssParameterSet) {
        this.gmssParameterSet = gmssParameterSet;
    }

    public GMSSParameters getParameters() {
        return this.gmssParameterSet;
    }
}
