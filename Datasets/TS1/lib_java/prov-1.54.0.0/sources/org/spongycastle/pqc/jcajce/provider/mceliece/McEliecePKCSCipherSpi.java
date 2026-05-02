package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
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
import org.spongycastle.pqc.crypto.mceliece.McElieceKeyParameters;
import org.spongycastle.pqc.crypto.mceliece.McEliecePKCSCipher;
import org.spongycastle.pqc.jcajce.provider.util.AsymmetricBlockCipher;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi.class */
public class McEliecePKCSCipherSpi extends AsymmetricBlockCipher implements PKCSObjectIdentifiers, X509ObjectIdentifiers {
    private Digest digest;
    private McEliecePKCSCipher cipher;

    public McEliecePKCSCipherSpi(Digest digest, McEliecePKCSCipher cipher) {
        this.digest = digest;
        this.cipher = cipher;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricBlockCipher
    protected void initCipherEncrypt(Key key, AlgorithmParameterSpec params, SecureRandom sr) throws InvalidKeyException, InvalidAlgorithmParameterException {
        ParametersWithRandom parametersWithRandom = new ParametersWithRandom(McElieceKeysToParams.generatePublicKeyParameter((PublicKey) key), sr);
        this.digest.reset();
        this.cipher.init(true, parametersWithRandom);
        this.maxPlainTextSize = this.cipher.maxPlainTextSize;
        this.cipherTextSize = this.cipher.cipherTextSize;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricBlockCipher
    protected void initCipherDecrypt(Key key, AlgorithmParameterSpec params) throws InvalidKeyException, InvalidAlgorithmParameterException {
        AsymmetricKeyParameter generatePrivateKeyParameter = McElieceKeysToParams.generatePrivateKeyParameter((PrivateKey) key);
        this.digest.reset();
        this.cipher.init(false, generatePrivateKeyParameter);
        this.maxPlainTextSize = this.cipher.maxPlainTextSize;
        this.cipherTextSize = this.cipher.cipherTextSize;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricBlockCipher
    protected byte[] messageEncrypt(byte[] input) throws IllegalBlockSizeException, BadPaddingException {
        byte[] output = null;
        try {
            output = this.cipher.messageEncrypt(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricBlockCipher
    protected byte[] messageDecrypt(byte[] input) throws IllegalBlockSizeException, BadPaddingException {
        byte[] output = null;
        try {
            output = this.cipher.messageDecrypt(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public String getName() {
        return "McEliecePKCS";
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public int getKeySize(Key key) throws InvalidKeyException {
        McElieceKeyParameters mcElieceKeyParameters;
        if (key instanceof PublicKey) {
            mcElieceKeyParameters = (McElieceKeyParameters) McElieceKeysToParams.generatePublicKeyParameter((PublicKey) key);
        } else {
            mcElieceKeyParameters = McElieceKeysToParams.generatePrivateKeyParameter((PrivateKey) key);
        }
        return this.cipher.getKeySize(mcElieceKeyParameters);
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS.class */
    public static class McEliecePKCS extends McEliecePKCSCipherSpi {
        public McEliecePKCS() {
            super(new SHA1Digest(), new McEliecePKCSCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS224.class */
    public static class McEliecePKCS224 extends McEliecePKCSCipherSpi {
        public McEliecePKCS224() {
            super(new SHA224Digest(), new McEliecePKCSCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS256.class */
    public static class McEliecePKCS256 extends McEliecePKCSCipherSpi {
        public McEliecePKCS256() {
            super(new SHA256Digest(), new McEliecePKCSCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS384.class */
    public static class McEliecePKCS384 extends McEliecePKCSCipherSpi {
        public McEliecePKCS384() {
            super(new SHA384Digest(), new McEliecePKCSCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McEliecePKCSCipherSpi$McEliecePKCS512.class */
    public static class McEliecePKCS512 extends McEliecePKCSCipherSpi {
        public McEliecePKCS512() {
            super(new SHA512Digest(), new McEliecePKCSCipher());
        }
    }
}
