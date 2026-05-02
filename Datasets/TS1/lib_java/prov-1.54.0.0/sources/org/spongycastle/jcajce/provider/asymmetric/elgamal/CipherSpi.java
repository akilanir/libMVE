package org.spongycastle.jcajce.provider.asymmetric.elgamal;

import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.InvalidParameterException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.MGF1ParameterSpec;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.interfaces.DHKey;
import javax.crypto.spec.OAEPParameterSpec;
import javax.crypto.spec.PSource;
import org.spongycastle.crypto.AsymmetricBlockCipher;
import org.spongycastle.crypto.BufferedAsymmetricBlockCipher;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.InvalidCipherTextException;
import org.spongycastle.crypto.encodings.ISO9796d1Encoding;
import org.spongycastle.crypto.encodings.OAEPEncoding;
import org.spongycastle.crypto.encodings.PKCS1Encoding;
import org.spongycastle.crypto.engines.ElGamalEngine;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.ParametersWithRandom;
import org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi;
import org.spongycastle.jcajce.provider.util.DigestFactory;
import org.spongycastle.jce.interfaces.ElGamalKey;
import org.spongycastle.jce.interfaces.ElGamalPrivateKey;
import org.spongycastle.jce.interfaces.ElGamalPublicKey;
import org.spongycastle.util.Strings;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/elgamal/CipherSpi.class */
public class CipherSpi extends BaseCipherSpi {
    private BufferedAsymmetricBlockCipher cipher;
    private AlgorithmParameterSpec paramSpec;
    private AlgorithmParameters engineParams;

    public CipherSpi(AsymmetricBlockCipher engine) {
        this.cipher = new BufferedAsymmetricBlockCipher(engine);
    }

    private void initFromSpec(OAEPParameterSpec pSpec) throws NoSuchPaddingException {
        MGF1ParameterSpec mgfParams = (MGF1ParameterSpec) pSpec.getMGFParameters();
        Digest digest = DigestFactory.getDigest(mgfParams.getDigestAlgorithm());
        if (digest == null) {
            throw new NoSuchPaddingException("no match on OAEP constructor for digest algorithm: " + mgfParams.getDigestAlgorithm());
        }
        this.cipher = new BufferedAsymmetricBlockCipher(new OAEPEncoding(new ElGamalEngine(), digest, ((PSource.PSpecified) pSpec.getPSource()).getValue()));
        this.paramSpec = pSpec;
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected int engineGetBlockSize() {
        return this.cipher.getInputBlockSize();
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected int engineGetKeySize(Key key) {
        if (key instanceof ElGamalKey) {
            ElGamalKey k = (ElGamalKey) key;
            return k.getParameters().getP().bitLength();
        }
        if (key instanceof DHKey) {
            DHKey k2 = (DHKey) key;
            return k2.getParams().getP().bitLength();
        }
        throw new IllegalArgumentException("not an ElGamal key!");
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected int engineGetOutputSize(int inputLen) {
        return this.cipher.getOutputBlockSize();
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected AlgorithmParameters engineGetParameters() {
        if (this.engineParams == null && this.paramSpec != null) {
            try {
                this.engineParams = createParametersInstance("OAEP");
                this.engineParams.init(this.paramSpec);
            } catch (Exception e) {
                throw new RuntimeException(e.toString());
            }
        }
        return this.engineParams;
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected void engineSetMode(String mode) throws NoSuchAlgorithmException {
        String md = Strings.toUpperCase(mode);
        if (md.equals("NONE") || md.equals("ECB")) {
        } else {
            throw new NoSuchAlgorithmException("can't support mode " + mode);
        }
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseCipherSpi, javax.crypto.CipherSpi
    protected void engineSetPadding(String padding) throws NoSuchPaddingException {
        String pad = Strings.toUpperCase(padding);
        if (pad.equals("NOPADDING")) {
            this.cipher = new BufferedAsymmetricBlockCipher(new ElGamalEngine());
            return;
        }
        if (pad.equals("PKCS1PADDING")) {
            this.cipher = new BufferedAsymmetricBlockCipher(new PKCS1Encoding(new ElGamalEngine()));
            return;
        }
        if (pad.equals("ISO9796-1PADDING")) {
            this.cipher = new BufferedAsymmetricBlockCipher(new ISO9796d1Encoding(new ElGamalEngine()));
            return;
        }
        if (pad.equals("OAEPPADDING")) {
            initFromSpec(OAEPParameterSpec.DEFAULT);
            return;
        }
        if (pad.equals("OAEPWITHMD5ANDMGF1PADDING")) {
            initFromSpec(new OAEPParameterSpec("MD5", "MGF1", new MGF1ParameterSpec("MD5"), PSource.PSpecified.DEFAULT));
            return;
        }
        if (pad.equals("OAEPWITHSHA1ANDMGF1PADDING")) {
            initFromSpec(OAEPParameterSpec.DEFAULT);
            return;
        }
        if (pad.equals("OAEPWITHSHA224ANDMGF1PADDING")) {
            initFromSpec(new OAEPParameterSpec("SHA-224", "MGF1", new MGF1ParameterSpec("SHA-224"), PSource.PSpecified.DEFAULT));
            return;
        }
        if (pad.equals("OAEPWITHSHA256ANDMGF1PADDING")) {
            initFromSpec(new OAEPParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, PSource.PSpecified.DEFAULT));
        } else if (pad.equals("OAEPWITHSHA384ANDMGF1PADDING")) {
            initFromSpec(new OAEPParameterSpec("SHA-384", "MGF1", MGF1ParameterSpec.SHA384, PSource.PSpecified.DEFAULT));
        } else {
            if (pad.equals("OAEPWITHSHA512ANDMGF1PADDING")) {
                initFromSpec(new OAEPParameterSpec("SHA-512", "MGF1", MGF1ParameterSpec.SHA512, PSource.PSpecified.DEFAULT));
                return;
            }
            throw new NoSuchPaddingException(padding + " unavailable with ElGamal.");
        }
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, AlgorithmParameterSpec params, SecureRandom random) throws InvalidKeyException {
        AsymmetricKeyParameter generatePrivateKeyParameter;
        if (params == null) {
            if (key instanceof ElGamalPublicKey) {
                generatePrivateKeyParameter = ElGamalUtil.generatePublicKeyParameter((PublicKey) key);
            } else if (key instanceof ElGamalPrivateKey) {
                generatePrivateKeyParameter = ElGamalUtil.generatePrivateKeyParameter((PrivateKey) key);
            } else {
                throw new InvalidKeyException("unknown key type passed to ElGamal");
            }
            if (random != null) {
                generatePrivateKeyParameter = new ParametersWithRandom(generatePrivateKeyParameter, random);
            }
            switch (opmode) {
                case 1:
                case 3:
                    this.cipher.init(true, generatePrivateKeyParameter);
                    return;
                case 2:
                case 4:
                    this.cipher.init(false, generatePrivateKeyParameter);
                    return;
                default:
                    throw new InvalidParameterException("unknown opmode " + opmode + " passed to ElGamal");
            }
        }
        throw new IllegalArgumentException("unknown parameter type.");
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, AlgorithmParameters params, SecureRandom random) throws InvalidKeyException, InvalidAlgorithmParameterException {
        throw new InvalidAlgorithmParameterException("can't handle parameters in ElGamal");
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, SecureRandom random) throws InvalidKeyException {
        engineInit(opmode, key, (AlgorithmParameterSpec) null, random);
    }

    @Override // javax.crypto.CipherSpi
    protected byte[] engineUpdate(byte[] input, int inputOffset, int inputLen) {
        this.cipher.processBytes(input, inputOffset, inputLen);
        return null;
    }

    @Override // javax.crypto.CipherSpi
    protected int engineUpdate(byte[] input, int inputOffset, int inputLen, byte[] output, int outputOffset) {
        this.cipher.processBytes(input, inputOffset, inputLen);
        return 0;
    }

    @Override // javax.crypto.CipherSpi
    protected byte[] engineDoFinal(byte[] input, int inputOffset, int inputLen) throws IllegalBlockSizeException, BadPaddingException {
        this.cipher.processBytes(input, inputOffset, inputLen);
        try {
            return this.cipher.doFinal();
        } catch (InvalidCipherTextException e) {
            throw new BadPaddingException(e.getMessage());
        }
    }

    @Override // javax.crypto.CipherSpi
    protected int engineDoFinal(byte[] input, int inputOffset, int inputLen, byte[] output, int outputOffset) throws IllegalBlockSizeException, BadPaddingException {
        this.cipher.processBytes(input, inputOffset, inputLen);
        try {
            byte[] out = this.cipher.doFinal();
            for (int i = 0; i != out.length; i++) {
                output[outputOffset + i] = out[i];
            }
            return out.length;
        } catch (InvalidCipherTextException e) {
            throw new BadPaddingException(e.getMessage());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/elgamal/CipherSpi$NoPadding.class */
    public static class NoPadding extends CipherSpi {
        public NoPadding() {
            super(new ElGamalEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/elgamal/CipherSpi$PKCS1v1_5Padding.class */
    public static class PKCS1v1_5Padding extends CipherSpi {
        public PKCS1v1_5Padding() {
            super(new PKCS1Encoding(new ElGamalEngine()));
        }
    }
}
