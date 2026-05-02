package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.io.ByteArrayOutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.spongycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.spongycastle.asn1.x509.X509ObjectIdentifiers;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.digests.SHA224Digest;
import org.spongycastle.crypto.digests.SHA256Digest;
import org.spongycastle.crypto.digests.SHA384Digest;
import org.spongycastle.crypto.digests.SHA512Digest;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.ParametersWithRandom;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2KeyParameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceFujisakiCipher;
import org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi.class */
public class McElieceFujisakiCipherSpi extends AsymmetricHybridCipher implements PKCSObjectIdentifiers, X509ObjectIdentifiers {
    private Digest digest;
    private McElieceFujisakiCipher cipher;
    private ByteArrayOutputStream buf = new ByteArrayOutputStream();

    protected McElieceFujisakiCipherSpi(Digest digest, McElieceFujisakiCipher cipher) {
        this.digest = digest;
        this.cipher = cipher;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher, org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public byte[] update(byte[] input, int inOff, int inLen) {
        this.buf.write(input, inOff, inLen);
        return new byte[0];
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher, org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public byte[] doFinal(byte[] input, int inOff, int inLen) throws BadPaddingException {
        update(input, inOff, inLen);
        byte[] data = this.buf.toByteArray();
        this.buf.reset();
        if (this.opMode == 1) {
            try {
                return this.cipher.messageEncrypt(data);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if (this.opMode == 2) {
            try {
                return this.cipher.messageDecrypt(data);
            } catch (Exception e2) {
                e2.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher
    protected int encryptOutputSize(int inLen) {
        return 0;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher
    protected int decryptOutputSize(int inLen) {
        return 0;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher
    protected void initCipherEncrypt(Key key, AlgorithmParameterSpec params, SecureRandom sr) throws InvalidKeyException, InvalidAlgorithmParameterException {
        ParametersWithRandom parametersWithRandom = new ParametersWithRandom(McElieceCCA2KeysToParams.generatePublicKeyParameter((PublicKey) key), sr);
        this.digest.reset();
        this.cipher.init(true, parametersWithRandom);
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher
    protected void initCipherDecrypt(Key key, AlgorithmParameterSpec params) throws InvalidKeyException, InvalidAlgorithmParameterException {
        AsymmetricKeyParameter generatePrivateKeyParameter = McElieceCCA2KeysToParams.generatePrivateKeyParameter((PrivateKey) key);
        this.digest.reset();
        this.cipher.init(false, generatePrivateKeyParameter);
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public String getName() {
        return "McElieceFujisakiCipher";
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public int getKeySize(Key key) throws InvalidKeyException {
        McElieceCCA2KeyParameters mcElieceCCA2KeyParameters;
        if (key instanceof PublicKey) {
            mcElieceCCA2KeyParameters = (McElieceCCA2KeyParameters) McElieceCCA2KeysToParams.generatePublicKeyParameter((PublicKey) key);
        } else {
            mcElieceCCA2KeyParameters = McElieceCCA2KeysToParams.generatePrivateKeyParameter((PrivateKey) key);
        }
        return this.cipher.getKeySize(mcElieceCCA2KeyParameters);
    }

    public byte[] messageEncrypt(byte[] input) throws IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException {
        byte[] output = null;
        try {
            output = this.cipher.messageEncrypt(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    public byte[] messageDecrypt(byte[] input) throws IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException {
        byte[] output = null;
        try {
            output = this.cipher.messageDecrypt(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi$McElieceFujisaki.class */
    public static class McElieceFujisaki extends McElieceFujisakiCipherSpi {
        public McElieceFujisaki() {
            super(new SHA1Digest(), new McElieceFujisakiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi$McElieceFujisaki224.class */
    public static class McElieceFujisaki224 extends McElieceFujisakiCipherSpi {
        public McElieceFujisaki224() {
            super(new SHA224Digest(), new McElieceFujisakiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi$McElieceFujisaki256.class */
    public static class McElieceFujisaki256 extends McElieceFujisakiCipherSpi {
        public McElieceFujisaki256() {
            super(new SHA256Digest(), new McElieceFujisakiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi$McElieceFujisaki384.class */
    public static class McElieceFujisaki384 extends McElieceFujisakiCipherSpi {
        public McElieceFujisaki384() {
            super(new SHA384Digest(), new McElieceFujisakiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceFujisakiCipherSpi$McElieceFujisaki512.class */
    public static class McElieceFujisaki512 extends McElieceFujisakiCipherSpi {
        public McElieceFujisaki512() {
            super(new SHA512Digest(), new McElieceFujisakiCipher());
        }
    }
}
