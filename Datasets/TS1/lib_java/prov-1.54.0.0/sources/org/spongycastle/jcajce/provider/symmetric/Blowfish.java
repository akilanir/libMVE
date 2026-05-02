package org.spongycastle.jcajce.provider.symmetric;

import org.spongycastle.asn1.misc.MiscObjectIdentifiers;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.BlowfishEngine;
import org.spongycastle.crypto.macs.CMac;
import org.spongycastle.crypto.modes.CBCBlockCipher;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseBlockCipher;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;
import org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish.class */
public final class Blowfish {
    private Blowfish() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$ECB.class */
    public static class ECB extends BaseBlockCipher {
        public ECB() {
            super((BlockCipher) new BlowfishEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$CBC.class */
    public static class CBC extends BaseBlockCipher {
        public CBC() {
            super((BlockCipher) new CBCBlockCipher(new BlowfishEngine()), 64);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$CMAC.class */
    public static class CMAC extends BaseMac {
        public CMAC() {
            super(new CMac(new BlowfishEngine()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            super("Blowfish", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$AlgParams.class */
    public static class AlgParams extends IvAlgorithmParameters {
        @Override // org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters, java.security.AlgorithmParametersSpi
        protected String engineToString() {
            return "Blowfish IV";
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/Blowfish$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = Blowfish.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Mac.BLOWFISHCMAC", PREFIX + "$CMAC");
            provider.addAlgorithm("Cipher.BLOWFISH", PREFIX + "$ECB");
            provider.addAlgorithm("Cipher", MiscObjectIdentifiers.cryptlib_algorithm_blowfish_CBC, PREFIX + "$CBC");
            provider.addAlgorithm("KeyGenerator.BLOWFISH", PREFIX + "$KeyGen");
            provider.addAlgorithm("Alg.Alias.KeyGenerator", MiscObjectIdentifiers.cryptlib_algorithm_blowfish_CBC, "BLOWFISH");
            provider.addAlgorithm("AlgorithmParameters.BLOWFISH", PREFIX + "$AlgParams");
            provider.addAlgorithm("Alg.Alias.AlgorithmParameters", MiscObjectIdentifiers.cryptlib_algorithm_blowfish_CBC, "BLOWFISH");
        }
    }
}
