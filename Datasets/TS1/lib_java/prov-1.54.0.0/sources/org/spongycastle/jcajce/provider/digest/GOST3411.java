package org.spongycastle.jcajce.provider.digest;

import org.spongycastle.asn1.cryptopro.CryptoProObjectIdentifiers;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.digests.GOST3411Digest;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;
import org.spongycastle.jcajce.provider.symmetric.util.PBESecretKeyFactory;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411.class */
public class GOST3411 {
    private GOST3411() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411$Digest.class */
    public static class Digest extends BCMessageDigest implements Cloneable {
        public Digest() {
            super(new GOST3411Digest());
        }

        @Override // java.security.MessageDigest, java.security.MessageDigestSpi
        public Object clone() throws CloneNotSupportedException {
            Digest d = (Digest) super.clone();
            d.digest = new GOST3411Digest(this.digest);
            return d;
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411$HashMac.class */
    public static class HashMac extends BaseMac {
        public HashMac() {
            super(new HMac(new GOST3411Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411$PBEWithMacKeyFactory.class */
    public static class PBEWithMacKeyFactory extends PBESecretKeyFactory {
        public PBEWithMacKeyFactory() {
            super("PBEwithHmacGOST3411", null, false, 2, 6, 256, 0);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411$KeyGenerator.class */
    public static class KeyGenerator extends BaseKeyGenerator {
        public KeyGenerator() {
            super("HMACGOST3411", 256, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/GOST3411$Mappings.class */
    public static class Mappings extends DigestAlgorithmProvider {
        private static final String PREFIX = GOST3411.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("MessageDigest.GOST3411", PREFIX + "$Digest");
            provider.addAlgorithm("Alg.Alias.MessageDigest.GOST", "GOST3411");
            provider.addAlgorithm("Alg.Alias.MessageDigest.GOST-3411", "GOST3411");
            provider.addAlgorithm("Alg.Alias.MessageDigest." + CryptoProObjectIdentifiers.gostR3411, "GOST3411");
            provider.addAlgorithm("SecretKeyFactory.PBEWITHHMACGOST3411", PREFIX + "$PBEWithMacKeyFactory");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory." + CryptoProObjectIdentifiers.gostR3411, "PBEWITHHMACGOST3411");
            addHMACAlgorithm(provider, "GOST3411", PREFIX + "$HashMac", PREFIX + "$KeyGenerator");
            addHMACAlias(provider, "GOST3411", CryptoProObjectIdentifiers.gostR3411);
        }
    }
}
