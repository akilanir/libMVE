package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.util.Arrays;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/RainbowParameterSpec.class */
public class RainbowParameterSpec implements AlgorithmParameterSpec {
    private static final int[] DEFAULT_VI = {6, 12, 17, 22, 33};
    private int[] vi;

    public RainbowParameterSpec() {
        this.vi = DEFAULT_VI;
    }

    public RainbowParameterSpec(int[] vi) {
        this.vi = vi;
        try {
            checkParams();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void checkParams() throws Exception {
        if (this.vi == null) {
            throw new IllegalArgumentException("no layers defined.");
        }
        if (this.vi.length > 1) {
            for (int i = 0; i < this.vi.length - 1; i++) {
                if (this.vi[i] >= this.vi[i + 1]) {
                    throw new IllegalArgumentException("v[i] has to be smaller than v[i+1]");
                }
            }
            return;
        }
        throw new IllegalArgumentException("Rainbow needs at least 1 layer, such that v1 < v2.");
    }

    public int getNumOfLayers() {
        return this.vi.length - 1;
    }

    public int getDocumentLength() {
        return this.vi[this.vi.length - 1] - this.vi[0];
    }

    public int[] getVi() {
        return Arrays.clone(this.vi);
    }
}
