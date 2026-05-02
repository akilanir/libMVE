package org.spongycastle.jcajce.provider.digest;

import org.spongycastle.asn1.nist.NISTObjectIdentifiers;
import org.spongycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.digests.SHA224Digest;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA224.class */
public class SHA224 {
    private SHA224() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA224$Digest.class */
    public static class Digest extends BCMessageDigest implements Cloneable {
        public Digest() {
            super(new SHA224Digest());
        }

        @Override // java.security.MessageDigest, java.security.MessageDigestSpi
        public Object clone() throws CloneNotSupportedException {
            Digest d = (Digest) super.clone();
            d.digest = new SHA224Digest(this.digest);
            return d;
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA224$HashMac.class */
    public static class HashMac extends BaseMac {
        public HashMac() {
            super(new HMac(new SHA224Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA224$KeyGenerator.class */
    public static class KeyGenerator extends BaseKeyGenerator {
        public KeyGenerator() {
            super("HMACSHA224", 224, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA224$Mappings.class */
    public static class Mappings extends DigestAlgorithmProvider {
        private static final String PREFIX = SHA224.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("MessageDigest.SHA-224", PREFIX + "$Digest");
            provider.addAlgorithm("Alg.Alias.MessageDigest.SHA224", "SHA-224");
            provider.addAlgorithm("Alg.Alias.MessageDigest." + NISTObjectIdentifiers.id_sha224, "SHA-224");
            addHMACAlgorithm(provider, "SHA224", PREFIX + "$HashMac", PREFIX + "$KeyGenerator");
            addHMACAlias(provider, "SHA224", PKCSObjectIdentifiers.id_hmacWithSHA224);
        }
    }
}
