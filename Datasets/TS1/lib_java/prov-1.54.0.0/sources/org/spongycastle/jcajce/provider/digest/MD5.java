package org.spongycastle.jcajce.provider.digest;

import org.spongycastle.asn1.iana.IANAObjectIdentifiers;
import org.spongycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.digests.MD5Digest;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;
import org.spongycastle.jce.X509KeyUsage;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/MD5.class */
public class MD5 {
    private MD5() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/MD5$HashMac.class */
    public static class HashMac extends BaseMac {
        public HashMac() {
            super(new HMac(new MD5Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/MD5$KeyGenerator.class */
    public static class KeyGenerator extends BaseKeyGenerator {
        public KeyGenerator() {
            super("HMACMD5", X509KeyUsage.digitalSignature, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/MD5$Digest.class */
    public static class Digest extends BCMessageDigest implements Cloneable {
        public Digest() {
            super(new MD5Digest());
        }

        @Override // java.security.MessageDigest, java.security.MessageDigestSpi
        public Object clone() throws CloneNotSupportedException {
            Digest d = (Digest) super.clone();
            d.digest = new MD5Digest(this.digest);
            return d;
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/MD5$Mappings.class */
    public static class Mappings extends DigestAlgorithmProvider {
        private static final String PREFIX = MD5.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("MessageDigest.MD5", PREFIX + "$Digest");
            provider.addAlgorithm("Alg.Alias.MessageDigest." + PKCSObjectIdentifiers.md5, "MD5");
            addHMACAlgorithm(provider, "MD5", PREFIX + "$HashMac", PREFIX + "$KeyGenerator");
            addHMACAlias(provider, "MD5", IANAObjectIdentifiers.hmacMD5);
        }
    }
}
