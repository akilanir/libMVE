package org.spongycastle.pqc.jcajce.spec;

import org.spongycastle.pqc.crypto.gmss.GMSSParameters;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/GMSSPublicKeySpec.class */
public class GMSSPublicKeySpec extends GMSSKeySpec {
    private byte[] gmssPublicKey;

    public GMSSPublicKeySpec(byte[] key, GMSSParameters gmssParameterSet) {
        super(gmssParameterSet);
        this.gmssPublicKey = key;
    }

    public byte[] getPublicKey() {
        return this.gmssPublicKey;
    }
}
