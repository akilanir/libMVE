package org.spongycastle.jcajce.provider.symmetric;

import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import org.spongycastle.asn1.cryptopro.CryptoProObjectIdentifiers;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.BufferedBlockCipher;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.engines.GOST28147Engine;
import org.spongycastle.crypto.macs.GOST28147Mac;
import org.spongycastle.crypto.modes.CBCBlockCipher;
import org.spongycastle.crypto.modes.GCFBBlockCipher;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseAlgorithmParameterGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseBlockCipher;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;
import org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147.class */
public final class GOST28147 {
    private GOST28147() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$ECB.class */
    public static class ECB extends BaseBlockCipher {
        public ECB() {
            super((BlockCipher) new GOST28147Engine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$CBC.class */
    public static class CBC extends BaseBlockCipher {
        public CBC() {
            super((BlockCipher) new CBCBlockCipher(new GOST28147Engine()), 64);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$GCFB.class */
    public static class GCFB extends BaseBlockCipher {
        public GCFB() {
            super(new BufferedBlockCipher(new GCFBBlockCipher(new GOST28147Engine())), 64);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$Mac.class */
    public static class Mac extends BaseMac {
        public Mac() {
            super(new GOST28147Mac());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$KeyGen.class */
    public static class KeyGen extends BaseKeyGenerator {
        public KeyGen() {
            this(256);
        }

        public KeyGen(int keySize) {
            super("GOST28147", keySize, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$AlgParamGen.class */
    public static class AlgParamGen extends BaseAlgorithmParameterGenerator {
        @Override // java.security.AlgorithmParameterGeneratorSpi
        protected void engineInit(AlgorithmParameterSpec genParamSpec, SecureRandom random) throws InvalidAlgorithmParameterException {
            throw new InvalidAlgorithmParameterException("No supported AlgorithmParameterSpec for GOST28147 parameter generation.");
        }

        @Override // java.security.AlgorithmParameterGeneratorSpi
        protected AlgorithmParameters engineGenerateParameters() {
            byte[] iv = new byte[16];
            if (this.random == null) {
                this.random = new SecureRandom();
            }
            this.random.nextBytes(iv);
            try {
                AlgorithmParameters params = createParametersInstance("GOST28147");
                params.init(new IvParameterSpec(iv));
                return params;
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$AlgParams.class */
    public static class AlgParams extends IvAlgorithmParameters {
        @Override // org.spongycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters, java.security.AlgorithmParametersSpi
        protected String engineToString() {
            return "GOST IV";
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/GOST28147$Mappings.class */
    public static class Mappings extends AlgorithmProvider {
        private static final String PREFIX = GOST28147.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("Cipher.GOST28147", PREFIX + "$ECB");
            provider.addAlgorithm("Alg.Alias.Cipher.GOST", "GOST28147");
            provider.addAlgorithm("Alg.Alias.Cipher.GOST-28147", "GOST28147");
            provider.addAlgorithm("Cipher." + CryptoProObjectIdentifiers.gostR28147_gcfb, PREFIX + "$GCFB");
            provider.addAlgorithm("KeyGenerator.GOST28147", PREFIX + "$KeyGen");
            provider.addAlgorithm("Alg.Alias.KeyGenerator.GOST", "GOST28147");
            provider.addAlgorithm("Alg.Alias.KeyGenerator.GOST-28147", "GOST28147");
            provider.addAlgorithm("Alg.Alias.KeyGenerator." + CryptoProObjectIdentifiers.gostR28147_gcfb, "GOST28147");
            provider.addAlgorithm("Mac.GOST28147MAC", PREFIX + "$Mac");
            provider.addAlgorithm("Alg.Alias.Mac.GOST28147", "GOST28147MAC");
        }
    }
}
