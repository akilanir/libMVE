package org.spongycastle.jcajce.provider.symmetric;

import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.Grain128Engine;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseStreamCipher;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Grain128.class */
public final class Grain128 {
    private Grain128() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Grain128$Base.class */
    public static class Base extends BaseStreamCipher {
        public Base() {
            super(new Grain128Engine(), 12);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Grain128$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            super("Grain128", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Grain128$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = Grain128.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Cipher.Grain128", PREFIX + "$Base");
            provider.addAlgorithm("KeyGenerator.Grain128", PREFIX + "$KeyGen");
        }
    }
}
