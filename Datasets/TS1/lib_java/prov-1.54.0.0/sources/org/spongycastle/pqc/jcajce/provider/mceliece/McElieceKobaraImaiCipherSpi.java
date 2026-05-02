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
import org.spongycastle.pqc.crypto.mceliece.McElieceKobaraImaiCipher;
import org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi.class */
public class McElieceKobaraImaiCipherSpi extends AsymmetricHybridCipher implements PKCSObjectIdentifiers, X509ObjectIdentifiers {
    private Digest digest;
    private McElieceKobaraImaiCipher cipher;
    private ByteArrayOutputStream buf;

    public McElieceKobaraImaiCipherSpi() {
        this.buf = new ByteArrayOutputStream();
        this.buf = new ByteArrayOutputStream();
    }

    protected McElieceKobaraImaiCipherSpi(Digest digest, McElieceKobaraImaiCipher cipher) {
        this.buf = new ByteArrayOutputStream();
        this.digest = digest;
        this.cipher = cipher;
        this.buf = new ByteArrayOutputStream();
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher, org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public byte[] update(byte[] input, int inOff, int inLen) {
        this.buf.write(input, inOff, inLen);
        return new byte[0];
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher, org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public byte[] doFinal(byte[] input, int inOff, int inLen) throws BadPaddingException {
        update(input, inOff, inLen);
        if (this.opMode == 1) {
            try {
                return this.cipher.messageEncrypt(pad());
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        if (this.opMode == 2) {
            byte[] inputOfDecr = this.buf.toByteArray();
            this.buf.reset();
            try {
                return unpad(this.cipher.messageDecrypt(inputOfDecr));
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
        this.buf.reset();
        ParametersWithRandom parametersWithRandom = new ParametersWithRandom(McElieceCCA2KeysToParams.generatePublicKeyParameter((PublicKey) key), sr);
        this.digest.reset();
        this.cipher.init(true, parametersWithRandom);
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.AsymmetricHybridCipher
    protected void initCipherDecrypt(Key key, AlgorithmParameterSpec params) throws InvalidKeyException, InvalidAlgorithmParameterException {
        this.buf.reset();
        AsymmetricKeyParameter generatePrivateKeyParameter = McElieceCCA2KeysToParams.generatePrivateKeyParameter((PrivateKey) key);
        this.digest.reset();
        this.cipher.init(false, generatePrivateKeyParameter);
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public String getName() {
        return "McElieceKobaraImaiCipher";
    }

    @Override // org.spongycastle.pqc.jcajce.provider.util.CipherSpiExt
    public int getKeySize(Key key) throws InvalidKeyException {
        if (key instanceof PublicKey) {
            McElieceCCA2KeyParameters mcElieceCCA2KeyParameters = McElieceCCA2KeysToParams.generatePublicKeyParameter((PublicKey) key);
            return this.cipher.getKeySize(mcElieceCCA2KeyParameters);
        }
        if (key instanceof PrivateKey) {
            McElieceCCA2KeyParameters mcElieceCCA2KeyParameters2 = McElieceCCA2KeysToParams.generatePrivateKeyParameter((PrivateKey) key);
            return this.cipher.getKeySize(mcElieceCCA2KeyParameters2);
        }
        throw new InvalidKeyException();
    }

    private byte[] pad() {
        this.buf.write(1);
        byte[] result = this.buf.toByteArray();
        this.buf.reset();
        return result;
    }

    private byte[] unpad(byte[] pmBytes) throws BadPaddingException {
        int index = pmBytes.length - 1;
        while (index >= 0 && pmBytes[index] == 0) {
            index--;
        }
        if (pmBytes[index] != 1) {
            throw new BadPaddingException("invalid ciphertext");
        }
        byte[] mBytes = new byte[index];
        System.arraycopy(pmBytes, 0, mBytes, 0, index);
        return mBytes;
    }

    public byte[] messageEncrypt() throws IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException {
        byte[] output = null;
        try {
            output = this.cipher.messageEncrypt(pad());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    public byte[] messageDecrypt() throws IllegalBlockSizeException, BadPaddingException, NoSuchAlgorithmException {
        byte[] output = null;
        byte[] inputOfDecr = this.buf.toByteArray();
        this.buf.reset();
        try {
            output = unpad(this.cipher.messageDecrypt(inputOfDecr));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi$McElieceKobaraImai.class */
    public static class McElieceKobaraImai extends McElieceKobaraImaiCipherSpi {
        public McElieceKobaraImai() {
            super(new SHA1Digest(), new McElieceKobaraImaiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi$McElieceKobaraImai224.class */
    public static class McElieceKobaraImai224 extends McElieceKobaraImaiCipherSpi {
        public McElieceKobaraImai224() {
            super(new SHA224Digest(), new McElieceKobaraImaiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi$McElieceKobaraImai256.class */
    public static class McElieceKobaraImai256 extends McElieceKobaraImaiCipherSpi {
        public McElieceKobaraImai256() {
            super(new SHA256Digest(), new McElieceKobaraImaiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi$McElieceKobaraImai384.class */
    public static class McElieceKobaraImai384 extends McElieceKobaraImaiCipherSpi {
        public McElieceKobaraImai384() {
            super(new SHA384Digest(), new McElieceKobaraImaiCipher());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKobaraImaiCipherSpi$McElieceKobaraImai512.class */
    public static class McElieceKobaraImai512 extends McElieceKobaraImaiCipherSpi {
        public McElieceKobaraImai512() {
            super(new SHA512Digest(), new McElieceKobaraImaiCipher());
        }
    }
}
