package org.spongycastle.jcajce.spec;

import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.util.Arrays;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/spec/UserKeyingMaterialSpec.class */
public class UserKeyingMaterialSpec implements AlgorithmParameterSpec {
    private final byte[] userKeyingMaterial;

    public UserKeyingMaterialSpec(byte[] userKeyingMaterial) {
        this.userKeyingMaterial = Arrays.clone(userKeyingMaterial);
    }

    public byte[] getUserKeyingMaterial() {
        return Arrays.clone(this.userKeyingMaterial);
    }
}
