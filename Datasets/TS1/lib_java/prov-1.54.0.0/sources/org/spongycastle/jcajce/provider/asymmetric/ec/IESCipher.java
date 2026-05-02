package org.spongycastle.jcajce.provider.asymmetric.ec;

import java.io.ByteArrayOutputStream;
import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.BadPaddingException;
import javax.crypto.CipherSpi;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.ShortBufferException;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.InvalidCipherTextException;
import org.spongycastle.crypto.KeyEncoder;
import org.spongycastle.crypto.agreement.ECDHBasicAgreement;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.engines.AESEngine;
import org.spongycastle.crypto.engines.DESedeEngine;
import org.spongycastle.crypto.engines.IESEngine;
import org.spongycastle.crypto.engines.OldIESEngine;
import org.spongycastle.crypto.generators.ECKeyPairGenerator;
import org.spongycastle.crypto.generators.EphemeralKeyPairGenerator;
import org.spongycastle.crypto.generators.KDF2BytesGenerator;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.crypto.modes.CBCBlockCipher;
import org.spongycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.ECDomainParameters;
import org.spongycastle.crypto.params.ECKeyGenerationParameters;
import org.spongycastle.crypto.params.ECPublicKeyParameters;
import org.spongycastle.crypto.params.IESWithCipherParameters;
import org.spongycastle.crypto.params.ParametersWithIV;
import org.spongycastle.crypto.parsers.ECIESPublicKeyParser;
import org.spongycastle.jcajce.provider.asymmetric.util.ECUtil;
import org.spongycastle.jcajce.provider.asymmetric.util.IESUtil;
import org.spongycastle.jcajce.util.BCJcaJceHelper;
import org.spongycastle.jcajce.util.JcaJceHelper;
import org.spongycastle.jce.interfaces.ECKey;
import org.spongycastle.jce.interfaces.IESKey;
import org.spongycastle.jce.spec.IESParameterSpec;
import org.spongycastle.util.Strings;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher.class */
public class IESCipher extends CipherSpi {
    private final JcaJceHelper helper;
    private int ivLength;
    private IESEngine engine;
    private int state;
    private ByteArrayOutputStream buffer;
    private AlgorithmParameters engineParam;
    private IESParameterSpec engineSpec;
    private AsymmetricKeyParameter key;
    private SecureRandom random;
    private boolean dhaesMode;
    private AsymmetricKeyParameter otherKeyParameter;

    public IESCipher(IESEngine engine) {
        this.helper = new BCJcaJceHelper();
        this.state = -1;
        this.buffer = new ByteArrayOutputStream();
        this.engineParam = null;
        this.engineSpec = null;
        this.dhaesMode = false;
        this.otherKeyParameter = null;
        this.engine = engine;
        this.ivLength = 0;
    }

    public IESCipher(IESEngine engine, int ivLength) {
        this.helper = new BCJcaJceHelper();
        this.state = -1;
        this.buffer = new ByteArrayOutputStream();
        this.engineParam = null;
        this.engineSpec = null;
        this.dhaesMode = false;
        this.otherKeyParameter = null;
        this.engine = engine;
        this.ivLength = ivLength;
    }

    @Override // javax.crypto.CipherSpi
    public int engineGetBlockSize() {
        if (this.engine.getCipher() != null) {
            return this.engine.getCipher().getBlockSize();
        }
        return 0;
    }

    @Override // javax.crypto.CipherSpi
    public int engineGetKeySize(Key key) {
        if (key instanceof ECKey) {
            return ((ECKey) key).getParameters().getCurve().getFieldSize();
        }
        throw new IllegalArgumentException("not an EC key");
    }

    @Override // javax.crypto.CipherSpi
    public byte[] engineGetIV() {
        return null;
    }

    @Override // javax.crypto.CipherSpi
    public AlgorithmParameters engineGetParameters() {
        if (this.engineParam == null && this.engineSpec != null) {
            try {
                this.engineParam = this.helper.createAlgorithmParameters("IES");
                this.engineParam.init(this.engineSpec);
            } catch (Exception e) {
                throw new RuntimeException(e.toString());
            }
        }
        return this.engineParam;
    }

    @Override // javax.crypto.CipherSpi
    public void engineSetMode(String mode) throws NoSuchAlgorithmException {
        String modeName = Strings.toUpperCase(mode);
        if (modeName.equals("NONE")) {
            this.dhaesMode = false;
        } else {
            if (modeName.equals("DHAES")) {
                this.dhaesMode = true;
                return;
            }
            throw new IllegalArgumentException("can't support mode " + mode);
        }
    }

    @Override // javax.crypto.CipherSpi
    public int engineGetOutputSize(int inputLen) {
        int len2;
        int len3;
        if (this.key == null) {
            throw new IllegalStateException("cipher not initialised");
        }
        int len1 = this.engine.getMac().getMacSize();
        if (this.otherKeyParameter == null) {
            len2 = 1 + ((2 * (this.key.getParameters().getCurve().getFieldSize() + 7)) / 8);
        } else {
            len2 = 0;
        }
        if (this.engine.getCipher() == null) {
            len3 = inputLen;
        } else if (this.state == 1 || this.state == 3) {
            len3 = this.engine.getCipher().getOutputSize(inputLen);
        } else if (this.state == 2 || this.state == 4) {
            len3 = this.engine.getCipher().getOutputSize((inputLen - len1) - len2);
        } else {
            throw new IllegalStateException("cipher not initialised");
        }
        if (this.state == 1 || this.state == 3) {
            return this.buffer.size() + len1 + len2 + len3;
        }
        if (this.state == 2 || this.state == 4) {
            return ((this.buffer.size() - len1) - len2) + len3;
        }
        throw new IllegalStateException("cipher not initialised");
    }

    @Override // javax.crypto.CipherSpi
    public void engineSetPadding(String padding) throws NoSuchPaddingException {
        String paddingName = Strings.toUpperCase(padding);
        if (!paddingName.equals("NOPADDING") && !paddingName.equals("PKCS5PADDING") && !paddingName.equals("PKCS7PADDING")) {
            throw new NoSuchPaddingException("padding not available with IESCipher");
        }
    }

    @Override // javax.crypto.CipherSpi
    public void engineInit(int opmode, Key key, AlgorithmParameters params, SecureRandom random) throws InvalidKeyException, InvalidAlgorithmParameterException {
        AlgorithmParameterSpec paramSpec = null;
        if (params != null) {
            try {
                paramSpec = params.getParameterSpec(IESParameterSpec.class);
            } catch (Exception e) {
                throw new InvalidAlgorithmParameterException("cannot recognise parameters: " + e.toString());
            }
        }
        this.engineParam = params;
        engineInit(opmode, key, paramSpec, random);
    }

    @Override // javax.crypto.CipherSpi
    public void engineInit(int opmode, Key key, AlgorithmParameterSpec engineSpec, SecureRandom random) throws InvalidAlgorithmParameterException, InvalidKeyException {
        this.otherKeyParameter = null;
        if (engineSpec == null) {
            this.engineSpec = IESUtil.guessParameterSpec(this.engine.getCipher());
        } else if (engineSpec instanceof IESParameterSpec) {
            this.engineSpec = (IESParameterSpec) engineSpec;
        } else {
            throw new InvalidAlgorithmParameterException("must be passed IES parameters");
        }
        byte[] nonce = this.engineSpec.getNonce();
        if (nonce != null) {
            if (this.ivLength == 0) {
                throw new InvalidAlgorithmParameterException("NONCE present in IES Parameters when none required");
            }
            if (nonce.length != this.ivLength) {
                throw new InvalidAlgorithmParameterException("NONCE in IES Parameters needs to be " + this.ivLength + " bytes long");
            }
        }
        if (opmode == 1 || opmode == 3) {
            if (key instanceof PublicKey) {
                this.key = ECUtil.generatePublicKeyParameter((PublicKey) key);
            } else if (key instanceof IESKey) {
                IESKey ieKey = (IESKey) key;
                this.key = ECUtil.generatePublicKeyParameter(ieKey.getPublic());
                this.otherKeyParameter = ECUtil.generatePrivateKeyParameter(ieKey.getPrivate());
            } else {
                throw new InvalidKeyException("must be passed recipient's public EC key for encryption");
            }
        } else if (opmode == 2 || opmode == 4) {
            if (key instanceof PrivateKey) {
                this.key = ECUtil.generatePrivateKeyParameter((PrivateKey) key);
            } else if (key instanceof IESKey) {
                IESKey ieKey2 = (IESKey) key;
                this.otherKeyParameter = ECUtil.generatePublicKeyParameter(ieKey2.getPublic());
                this.key = ECUtil.generatePrivateKeyParameter(ieKey2.getPrivate());
            } else {
                throw new InvalidKeyException("must be passed recipient's private EC key for decryption");
            }
        } else {
            throw new InvalidKeyException("must be passed EC key");
        }
        this.random = random;
        this.state = opmode;
        this.buffer.reset();
    }

    @Override // javax.crypto.CipherSpi
    public void engineInit(int opmode, Key key, SecureRandom random) throws InvalidKeyException {
        try {
            engineInit(opmode, key, (AlgorithmParameterSpec) null, random);
        } catch (InvalidAlgorithmParameterException e) {
            throw new IllegalArgumentException("can't handle supplied parameter spec");
        }
    }

    @Override // javax.crypto.CipherSpi
    public byte[] engineUpdate(byte[] input, int inputOffset, int inputLen) {
        this.buffer.write(input, inputOffset, inputLen);
        return null;
    }

    @Override // javax.crypto.CipherSpi
    public int engineUpdate(byte[] input, int inputOffset, int inputLen, byte[] output, int outputOffset) {
        this.buffer.write(input, inputOffset, inputLen);
        return 0;
    }

    @Override // javax.crypto.CipherSpi
    public byte[] engineDoFinal(byte[] input, int inputOffset, int inputLen) throws IllegalBlockSizeException, BadPaddingException {
        if (inputLen != 0) {
            this.buffer.write(input, inputOffset, inputLen);
        }
        byte[] in = this.buffer.toByteArray();
        this.buffer.reset();
        CipherParameters params = new IESWithCipherParameters(this.engineSpec.getDerivationV(), this.engineSpec.getEncodingV(), this.engineSpec.getMacKeySize(), this.engineSpec.getCipherKeySize());
        if (this.engineSpec.getNonce() != null) {
            params = new ParametersWithIV(params, this.engineSpec.getNonce());
        }
        ECDomainParameters ecParams = this.key.getParameters();
        if (this.otherKeyParameter != null) {
            try {
                if (this.state == 1 || this.state == 3) {
                    this.engine.init(true, this.otherKeyParameter, this.key, params);
                } else {
                    this.engine.init(false, this.key, this.otherKeyParameter, params);
                }
                return this.engine.processBlock(in, 0, in.length);
            } catch (Exception e) {
                throw new BadPaddingException(e.getMessage());
            }
        }
        if (this.state == 1 || this.state == 3) {
            ECKeyPairGenerator gen = new ECKeyPairGenerator();
            gen.init(new ECKeyGenerationParameters(ecParams, this.random));
            final boolean usePointCompression = this.engineSpec.getPointCompression();
            EphemeralKeyPairGenerator kGen = new EphemeralKeyPairGenerator(gen, new KeyEncoder() { // from class: org.spongycastle.jcajce.provider.asymmetric.ec.IESCipher.1
                public byte[] getEncoded(AsymmetricKeyParameter keyParameter) {
                    return ((ECPublicKeyParameters) keyParameter).getQ().getEncoded(usePointCompression);
                }
            });
            try {
                this.engine.init(this.key, params, kGen);
                return this.engine.processBlock(in, 0, in.length);
            } catch (Exception e2) {
                throw new BadPaddingException(e2.getMessage());
            }
        }
        if (this.state == 2 || this.state == 4) {
            try {
                this.engine.init(this.key, params, new ECIESPublicKeyParser(ecParams));
                return this.engine.processBlock(in, 0, in.length);
            } catch (InvalidCipherTextException e3) {
                throw new BadPaddingException(e3.getMessage());
            }
        }
        throw new IllegalStateException("cipher not initialised");
    }

    @Override // javax.crypto.CipherSpi
    public int engineDoFinal(byte[] input, int inputOffset, int inputLength, byte[] output, int outputOffset) throws ShortBufferException, IllegalBlockSizeException, BadPaddingException {
        byte[] buf = engineDoFinal(input, inputOffset, inputLength);
        System.arraycopy(buf, 0, output, outputOffset, buf.length);
        return buf.length;
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIES.class */
    public static class ECIES extends IESCipher {
        public ECIES() {
            super(new IESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithCipher.class */
    public static class ECIESwithCipher extends IESCipher {
        public ECIESwithCipher(BlockCipher cipher) {
            super(new IESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(cipher)));
        }

        public ECIESwithCipher(BlockCipher cipher, int ivLength) {
            super(new IESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(cipher)), ivLength);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithDESede.class */
    public static class ECIESwithDESede extends ECIESwithCipher {
        public ECIESwithDESede() {
            super(new DESedeEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithAES.class */
    public static class ECIESwithAES extends ECIESwithCipher {
        public ECIESwithAES() {
            super(new AESEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithDESedeCBC.class */
    public static class ECIESwithDESedeCBC extends ECIESwithCipher {
        public ECIESwithDESedeCBC() {
            super(new CBCBlockCipher(new DESedeEngine()), 8);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$ECIESwithAESCBC.class */
    public static class ECIESwithAESCBC extends ECIESwithCipher {
        public ECIESwithAESCBC() {
            super(new CBCBlockCipher(new AESEngine()), 16);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIES.class */
    public static class OldECIES extends IESCipher {
        public OldECIES() {
            super(new OldIESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher.class */
    public static class OldECIESwithCipher extends IESCipher {
        public OldECIESwithCipher(BlockCipher baseCipher) {
            super(new OldIESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(baseCipher)));
        }

        public OldECIESwithCipher(BlockCipher baseCipher, int ivLength) {
            super(new OldIESEngine(new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(baseCipher)), ivLength);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithDESede.class */
    public static class OldECIESwithDESede extends OldECIESwithCipher {
        public OldECIESwithDESede() {
            super(new DESedeEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAES.class */
    public static class OldECIESwithAES extends OldECIESwithCipher {
        public OldECIESwithAES() {
            super(new AESEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithDESedeCBC.class */
    public static class OldECIESwithDESedeCBC extends OldECIESwithCipher {
        public OldECIESwithDESedeCBC() {
            super(new CBCBlockCipher(new DESedeEngine()), 8);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAESCBC.class */
    public static class OldECIESwithAESCBC extends OldECIESwithCipher {
        public OldECIESwithAESCBC() {
            super(new CBCBlockCipher(new AESEngine()), 16);
        }
    }
}
