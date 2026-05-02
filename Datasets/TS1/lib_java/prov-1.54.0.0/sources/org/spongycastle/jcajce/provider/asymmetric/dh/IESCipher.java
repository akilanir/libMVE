package org.spongycastle.jcajce.provider.asymmetric.dh;

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
import javax.crypto.interfaces.DHKey;
import javax.crypto.interfaces.DHPrivateKey;
import javax.crypto.interfaces.DHPublicKey;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.InvalidCipherTextException;
import org.spongycastle.crypto.KeyEncoder;
import org.spongycastle.crypto.agreement.DHBasicAgreement;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.engines.AESEngine;
import org.spongycastle.crypto.engines.DESedeEngine;
import org.spongycastle.crypto.engines.IESEngine;
import org.spongycastle.crypto.engines.OldIESEngine;
import org.spongycastle.crypto.generators.DHKeyPairGenerator;
import org.spongycastle.crypto.generators.EphemeralKeyPairGenerator;
import org.spongycastle.crypto.generators.KDF2BytesGenerator;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.DHKeyGenerationParameters;
import org.spongycastle.crypto.params.DHKeyParameters;
import org.spongycastle.crypto.params.DHParameters;
import org.spongycastle.crypto.params.DHPublicKeyParameters;
import org.spongycastle.crypto.params.IESWithCipherParameters;
import org.spongycastle.crypto.parsers.DHIESPublicKeyParser;
import org.spongycastle.jcajce.provider.asymmetric.util.DHUtil;
import org.spongycastle.jcajce.provider.asymmetric.util.IESUtil;
import org.spongycastle.jcajce.util.BCJcaJceHelper;
import org.spongycastle.jcajce.util.JcaJceHelper;
import org.spongycastle.jce.interfaces.IESKey;
import org.spongycastle.jce.spec.IESParameterSpec;
import org.spongycastle.util.BigIntegers;
import org.spongycastle.util.Strings;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher.class */
public class IESCipher extends CipherSpi {
    private IESEngine engine;
    private AsymmetricKeyParameter key;
    private SecureRandom random;
    private final JcaJceHelper helper = new BCJcaJceHelper();
    private int state = -1;
    private ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    private AlgorithmParameters engineParam = null;
    private IESParameterSpec engineSpec = null;
    private boolean dhaesMode = false;
    private AsymmetricKeyParameter otherKeyParameter = null;

    public IESCipher(IESEngine engine) {
        this.engine = engine;
    }

    public IESCipher(OldIESEngine engine) {
        this.engine = engine;
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
        if (key instanceof DHKey) {
            return ((DHKey) key).getParams().getP().bitLength();
        }
        throw new IllegalArgumentException("not a DH key");
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
            len2 = 1 + ((2 * (this.key.getParameters().getP().bitLength() + 7)) / 8);
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
        throw new IllegalStateException("IESCipher not initialised");
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
        if (engineSpec == null) {
            this.engineSpec = IESUtil.guessParameterSpec(this.engine.getCipher());
        } else if (engineSpec instanceof IESParameterSpec) {
            this.engineSpec = (IESParameterSpec) engineSpec;
        } else {
            throw new InvalidAlgorithmParameterException("must be passed IES parameters");
        }
        if (opmode == 1 || opmode == 3) {
            if (key instanceof DHPublicKey) {
                this.key = DHUtil.generatePublicKeyParameter((PublicKey) key);
            } else if (key instanceof IESKey) {
                IESKey ieKey = (IESKey) key;
                this.key = DHUtil.generatePublicKeyParameter(ieKey.getPublic());
                this.otherKeyParameter = DHUtil.generatePrivateKeyParameter(ieKey.getPrivate());
            } else {
                throw new InvalidKeyException("must be passed recipient's public DH key for encryption");
            }
        } else if (opmode == 2 || opmode == 4) {
            if (key instanceof DHPrivateKey) {
                this.key = DHUtil.generatePrivateKeyParameter((PrivateKey) key);
            } else if (key instanceof IESKey) {
                IESKey ieKey2 = (IESKey) key;
                this.otherKeyParameter = DHUtil.generatePublicKeyParameter(ieKey2.getPublic());
                this.key = DHUtil.generatePrivateKeyParameter(ieKey2.getPrivate());
            } else {
                throw new InvalidKeyException("must be passed recipient's private DH key for decryption");
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
        IESWithCipherParameters iESWithCipherParameters = new IESWithCipherParameters(this.engineSpec.getDerivationV(), this.engineSpec.getEncodingV(), this.engineSpec.getMacKeySize(), this.engineSpec.getCipherKeySize());
        DHParameters dhParams = this.key.getParameters();
        if (this.otherKeyParameter != null) {
            try {
                if (this.state == 1 || this.state == 3) {
                    this.engine.init(true, this.otherKeyParameter, this.key, iESWithCipherParameters);
                } else {
                    this.engine.init(false, this.key, this.otherKeyParameter, iESWithCipherParameters);
                }
                return this.engine.processBlock(in, 0, in.length);
            } catch (Exception e) {
                throw new BadPaddingException(e.getMessage());
            }
        }
        if (this.state == 1 || this.state == 3) {
            DHKeyPairGenerator gen = new DHKeyPairGenerator();
            gen.init(new DHKeyGenerationParameters(this.random, dhParams));
            EphemeralKeyPairGenerator kGen = new EphemeralKeyPairGenerator(gen, new KeyEncoder() { // from class: org.spongycastle.jcajce.provider.asymmetric.dh.IESCipher.1
                public byte[] getEncoded(AsymmetricKeyParameter keyParameter) {
                    byte[] Vloc = new byte[(((DHKeyParameters) keyParameter).getParameters().getP().bitLength() + 7) / 8];
                    byte[] Vtmp = BigIntegers.asUnsignedByteArray(((DHPublicKeyParameters) keyParameter).getY());
                    if (Vtmp.length > Vloc.length) {
                        throw new IllegalArgumentException("Senders's public key longer than expected.");
                    }
                    System.arraycopy(Vtmp, 0, Vloc, Vloc.length - Vtmp.length, Vtmp.length);
                    return Vloc;
                }
            });
            try {
                this.engine.init(this.key, iESWithCipherParameters, kGen);
                return this.engine.processBlock(in, 0, in.length);
            } catch (Exception e2) {
                throw new BadPaddingException(e2.getMessage());
            }
        }
        if (this.state == 2 || this.state == 4) {
            try {
                this.engine.init(this.key, iESWithCipherParameters, new DHIESPublicKeyParser(this.key.getParameters()));
                return this.engine.processBlock(in, 0, in.length);
            } catch (InvalidCipherTextException e3) {
                throw new BadPaddingException(e3.getMessage());
            }
        }
        throw new IllegalStateException("IESCipher not initialised");
    }

    @Override // javax.crypto.CipherSpi
    public int engineDoFinal(byte[] input, int inputOffset, int inputLength, byte[] output, int outputOffset) throws ShortBufferException, IllegalBlockSizeException, BadPaddingException {
        byte[] buf = engineDoFinal(input, inputOffset, inputLength);
        System.arraycopy(buf, 0, output, outputOffset, buf.length);
        return buf.length;
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IES.class */
    public static class IES extends IESCipher {
        public IES() {
            super(new IESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IESwithDESede.class */
    public static class IESwithDESede extends IESCipher {
        public IESwithDESede() {
            super(new IESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(new DESedeEngine())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$IESwithAES.class */
    public static class IESwithAES extends IESCipher {
        public IESwithAES() {
            super(new IESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(new AESEngine())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithCipher.class */
    public static class OldIESwithCipher extends IESCipher {
        public OldIESwithCipher(BlockCipher baseCipher) {
            super(new OldIESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest()), new PaddedBufferedBlockCipher(baseCipher)));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIES.class */
    public static class OldIES extends IESCipher {
        public OldIES() {
            super(new OldIESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithDESede.class */
    public static class OldIESwithDESede extends OldIESwithCipher {
        public OldIESwithDESede() {
            super(new DESedeEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithAES.class */
    public static class OldIESwithAES extends OldIESwithCipher {
        public OldIESwithAES() {
            super(new AESEngine());
        }
    }
}
