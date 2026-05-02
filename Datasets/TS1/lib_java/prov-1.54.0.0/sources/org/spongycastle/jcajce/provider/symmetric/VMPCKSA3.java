package org.spongycastle.jcajce.provider.symmetric;

import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.VMPCKSA3Engine;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseStreamCipher;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/VMPCKSA3.class */
public final class VMPCKSA3 {
    private VMPCKSA3() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/VMPCKSA3$Base.class */
    public static class Base extends BaseStreamCipher {
        public Base() {
            super(new VMPCKSA3Engine(), 16);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/VMPCKSA3$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            super("VMPC-KSA3", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/VMPCKSA3$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = VMPCKSA3.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Cipher.VMPC-KSA3", PREFIX + "$Base");
            provider.addAlgorithm("KeyGenerator.VMPC-KSA3", PREFIX + "$KeyGen");
        }
    }
}
