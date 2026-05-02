package org.spongycastle.jcajce.provider.symmetric;

import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.ChaChaEngine;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseStreamCipher;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/ChaCha.class */
public final class ChaCha {
    private ChaCha() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/ChaCha$Base.class */
    public static class Base extends BaseStreamCipher {
        public Base() {
            super(new ChaChaEngine(), 8);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/ChaCha$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            super("ChaCha", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/ChaCha$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = ChaCha.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Cipher.CHACHA", PREFIX + "$Base");
            provider.addAlgorithm("KeyGenerator.CHACHA", PREFIX + "$KeyGen");
        }
    }
}
