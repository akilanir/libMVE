package org.spongycastle.jcajce.provider.asymmetric;

import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.util.AsymmetricAlgorithmProvider;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/IES.class */
public class IES {
    private static final String PREFIX = "org.spongycastle.jcajce.provider.asymmetric.ies.";

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/IES$Mappings.class */
    public static class Mappings extends AsymmetricAlgorithmProvider {
        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("AlgorithmParameters.IES", "org.spongycastle.jcajce.provider.asymmetric.ies.AlgorithmParametersSpi");
            provider.addAlgorithm("AlgorithmParameters.ECIES", "org.spongycastle.jcajce.provider.asymmetric.ies.AlgorithmParametersSpi");
        }
    }
}
