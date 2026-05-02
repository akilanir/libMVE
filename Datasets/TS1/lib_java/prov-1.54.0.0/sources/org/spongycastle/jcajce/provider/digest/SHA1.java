package org.spongycastle.jcajce.provider.digest;

import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import javax.crypto.SecretKey;
import javax.crypto.spec.PBEKeySpec;
import org.spongycastle.asn1.iana.IANAObjectIdentifiers;
import org.spongycastle.asn1.oiw.OIWObjectIdentifiers;
import org.spongycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.symmetric.util.BCPBEKey;
import org.spongycastle.jcajce.provider.symmetric.util.BaseKeyGenerator;
import org.spongycastle.jcajce.provider.symmetric.util.BaseMac;
import org.spongycastle.jcajce.provider.symmetric.util.BaseSecretKeyFactory;
import org.spongycastle.jcajce.provider.symmetric.util.PBE;
import org.spongycastle.jcajce.provider.symmetric.util.PBESecretKeyFactory;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1.class */
public class SHA1 {
    private SHA1() {
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$Digest.class */
    public static class Digest extends BCMessageDigest implements Cloneable {
        public Digest() {
            super(new SHA1Digest());
        }

        @Override // java.security.MessageDigest, java.security.MessageDigestSpi
        public Object clone() throws CloneNotSupportedException {
            Digest d = (Digest) super.clone();
            d.digest = new SHA1Digest(this.digest);
            return d;
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$HashMac.class */
    public static class HashMac extends BaseMac {
        public HashMac() {
            super(new HMac(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$KeyGenerator.class */
    public static class KeyGenerator extends BaseKeyGenerator {
        public KeyGenerator() {
            super("HMACSHA1", 160, new CipherKeyGenerator());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$SHA1Mac.class */
    public static class SHA1Mac extends BaseMac {
        public SHA1Mac() {
            super(new HMac(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$PBEWithMacKeyFactory.class */
    public static class PBEWithMacKeyFactory extends PBESecretKeyFactory {
        public PBEWithMacKeyFactory() {
            super("PBEwithHmacSHA", null, false, 2, 1, 160, 0);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$BasePBKDF2WithHmacSHA1.class */
    public static class BasePBKDF2WithHmacSHA1 extends BaseSecretKeyFactory {
        private int scheme;

        public BasePBKDF2WithHmacSHA1(String name, int scheme) {
            super(name, PKCSObjectIdentifiers.id_PBKDF2);
            this.scheme = scheme;
        }

        @Override // org.spongycastle.jcajce.provider.symmetric.util.BaseSecretKeyFactory, javax.crypto.SecretKeyFactorySpi
        protected SecretKey engineGenerateSecret(KeySpec keySpec) throws InvalidKeySpecException {
            if (keySpec instanceof PBEKeySpec) {
                PBEKeySpec pbeSpec = (PBEKeySpec) keySpec;
                if (pbeSpec.getSalt() == null) {
                    throw new InvalidKeySpecException("missing required salt");
                }
                if (pbeSpec.getIterationCount() <= 0) {
                    throw new InvalidKeySpecException("positive iteration count required: " + pbeSpec.getIterationCount());
                }
                if (pbeSpec.getKeyLength() <= 0) {
                    throw new InvalidKeySpecException("positive key length required: " + pbeSpec.getKeyLength());
                }
                if (pbeSpec.getPassword().length == 0) {
                    throw new IllegalArgumentException("password empty");
                }
                int keySize = pbeSpec.getKeyLength();
                CipherParameters param = PBE.Util.makePBEMacParameters(pbeSpec, this.scheme, 1, keySize);
                return new BCPBEKey(this.algName, this.algOid, this.scheme, 1, keySize, -1, pbeSpec, param);
            }
            throw new InvalidKeySpecException("Invalid KeySpec");
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$PBKDF2WithHmacSHA1UTF8.class */
    public static class PBKDF2WithHmacSHA1UTF8 extends BasePBKDF2WithHmacSHA1 {
        public PBKDF2WithHmacSHA1UTF8() {
            super("PBKDF2WithHmacSHA1", 5);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$PBKDF2WithHmacSHA18BIT.class */
    public static class PBKDF2WithHmacSHA18BIT extends BasePBKDF2WithHmacSHA1 {
        public PBKDF2WithHmacSHA18BIT() {
            super("PBKDF2WithHmacSHA1And8bit", 1);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/digest/SHA1$Mappings.class */
    public static class Mappings extends DigestAlgorithmProvider {
        private static final String PREFIX = SHA1.class.getName();

        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("MessageDigest.SHA-1", PREFIX + "$Digest");
            provider.addAlgorithm("Alg.Alias.MessageDigest.SHA1", "SHA-1");
            provider.addAlgorithm("Alg.Alias.MessageDigest.SHA", "SHA-1");
            provider.addAlgorithm("Alg.Alias.MessageDigest." + OIWObjectIdentifiers.idSHA1, "SHA-1");
            addHMACAlgorithm(provider, "SHA1", PREFIX + "$HashMac", PREFIX + "$KeyGenerator");
            addHMACAlias(provider, "SHA1", PKCSObjectIdentifiers.id_hmacWithSHA1);
            addHMACAlias(provider, "SHA1", IANAObjectIdentifiers.hmacSHA1);
            provider.addAlgorithm("Mac.PBEWITHHMACSHA", PREFIX + "$SHA1Mac");
            provider.addAlgorithm("Mac.PBEWITHHMACSHA1", PREFIX + "$SHA1Mac");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory.PBEWITHHMACSHA", "PBEWITHHMACSHA1");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory." + OIWObjectIdentifiers.idSHA1, "PBEWITHHMACSHA1");
            provider.addAlgorithm("Alg.Alias.Mac." + OIWObjectIdentifiers.idSHA1, "PBEWITHHMACSHA");
            provider.addAlgorithm("SecretKeyFactory.PBEWITHHMACSHA1", PREFIX + "$PBEWithMacKeyFactory");
            provider.addAlgorithm("SecretKeyFactory.PBKDF2WithHmacSHA1", PREFIX + "$PBKDF2WithHmacSHA1UTF8");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory.PBKDF2WithHmacSHA1AndUTF8", "PBKDF2WithHmacSHA1");
            provider.addAlgorithm("SecretKeyFactory.PBKDF2WithHmacSHA1And8BIT", PREFIX + "$PBKDF2WithHmacSHA18BIT");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory.PBKDF2withASCII", "PBKDF2WithHmacSHA1And8BIT");
            provider.addAlgorithm("Alg.Alias.SecretKeyFactory.PBKDF2with8BIT", "PBKDF2WithHmacSHA1And8BIT");
        }
    }
}
