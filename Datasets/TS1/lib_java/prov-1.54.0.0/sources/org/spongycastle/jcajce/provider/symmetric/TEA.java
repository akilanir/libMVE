package org.spongycastle.jcajce.provider.symmetric;

import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.TEAEngine;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseBlockCipher;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/TEA.class */
public final class TEA {
    private TEA() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/TEA$ECB.class */
    public static class ECB extends BaseBlockCipher {
        public ECB() {
            super((BlockCipher) new TEAEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/TEA$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            super("TEA", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/TEA$AlgParams.class */
    public static class AlgParams extends IvAlgorithmParameters {
        @Override // org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters, java.security.AlgorithmParametersSpi
        protected String engineToString() {
            return "TEA IV";
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/TEA$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = TEA.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Cipher.TEA", PREFIX + "$ECB");
            provider.addAlgorithm("KeyGenerator.TEA", PREFIX + "$KeyGen");
            provider.addAlgorithm("AlgorithmParameters.TEA", PREFIX + "$AlgParams");
        }
    }
}
