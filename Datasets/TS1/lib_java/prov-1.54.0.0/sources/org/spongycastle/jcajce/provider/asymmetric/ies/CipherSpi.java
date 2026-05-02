package org.spongycastle.jcajce.provider.asymmetric.ies;

import java.io.ByteArrayOutputStream;
import java.security.AlgorithmParameters;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.interfaces.DHPrivateKey;
import javax.crypto.interfaces.DHPublicKey;
import org.spongycastle.crypto.InvalidCipherTextException;
import org.spongycastle.crypto.agreement.DHBasicAgreement;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.engines.IESEngine;
import org.spongycastle.crypto.engines.OldIESEngine;
import org.spongycastle.crypto.generators.KDF2BytesGenerator;
import org.spongycastle.crypto.macs.HMac;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.IESParameters;
import org.spongycastle.jcajce.provider.asymmetric.util.DHUtil;
import org.spongycastle.jcajce.provider.asymmetric.util.ECUtil;
import org.spongycastle.jcajce.util.BCJcaJceHelper;
import org.spongycastle.jcajce.util.JcaJceHelper;
import org.spongycastle.jce.X509KeyUsage;
import org.spongycastle.jce.interfaces.ECPrivateKey;
import org.spongycastle.jce.interfaces.IESKey;
import org.spongycastle.jce.spec.IESParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi.class */
public class CipherSpi extends javax.crypto.CipherSpi {
    private IESEngine cipher;
    private final JcaJceHelper helper = new BCJcaJceHelper();
    private int state = -1;
    private ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    private AlgorithmParameters engineParam = null;
    private IESParameterSpec engineParams = null;
    private Class[] availableSpecs = {IESParameterSpec.class};

    public CipherSpi(IESEngine engine) {
        this.cipher = engine;
    }

    @Override // javax.crypto.CipherSpi
    protected int engineGetBlockSize() {
        return 0;
    }

    @Override // javax.crypto.CipherSpi
    protected byte[] engineGetIV() {
        return null;
    }

    @Override // javax.crypto.CipherSpi
    protected int engineGetKeySize(Key key) {
        if (!(key instanceof IESKey)) {
            throw new IllegalArgumentException("must be passed IE key");
        }
        IESKey ieKey = (IESKey) key;
        if (ieKey.getPrivate() instanceof DHPrivateKey) {
            DHPrivateKey k = (DHPrivateKey) ieKey.getPrivate();
            return k.getX().bitLength();
        }
        if (ieKey.getPrivate() instanceof ECPrivateKey) {
            ECPrivateKey k2 = (ECPrivateKey) ieKey.getPrivate();
            return k2.getD().bitLength();
        }
        throw new IllegalArgumentException("not an IE key!");
    }

    @Override // javax.crypto.CipherSpi
    protected int engineGetOutputSize(int inputLen) {
        if (this.state == 1 || this.state == 3) {
            return this.buffer.size() + inputLen + 20;
        }
        if (this.state == 2 || this.state == 4) {
            return (this.buffer.size() + inputLen) - 20;
        }
        throw new IllegalStateException("cipher not initialised");
    }

    @Override // javax.crypto.CipherSpi
    protected AlgorithmParameters engineGetParameters() {
        if (this.engineParam == null && this.engineParams != null) {
            try {
                this.engineParam = this.helper.createAlgorithmParameters("IES");
                this.engineParam.init(this.engineParams);
            } catch (Exception e) {
                throw new RuntimeException(e.toString());
            }
        }
        return this.engineParam;
    }

    @Override // javax.crypto.CipherSpi
    protected void engineSetMode(String mode) {
        throw new IllegalArgumentException("can't support mode " + mode);
    }

    @Override // javax.crypto.CipherSpi
    protected void engineSetPadding(String padding) throws NoSuchPaddingException {
        throw new NoSuchPaddingException(padding + " unavailable with RSA.");
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, AlgorithmParameterSpec params, SecureRandom random) throws InvalidKeyException, InvalidAlgorithmParameterException {
        AsymmetricKeyParameter generatePublicKeyParameter;
        AsymmetricKeyParameter generatePrivateKeyParameter;
        if (!(key instanceof IESKey)) {
            throw new InvalidKeyException("must be passed IES key");
        }
        if (params == null && (opmode == 1 || opmode == 3)) {
            byte[] d = new byte[16];
            byte[] e = new byte[16];
            if (random == null) {
                random = new SecureRandom();
            }
            random.nextBytes(d);
            random.nextBytes(e);
            params = new IESParameterSpec(d, e, X509KeyUsage.digitalSignature);
        } else if (!(params instanceof IESParameterSpec)) {
            throw new InvalidAlgorithmParameterException("must be passed IES parameters");
        }
        IESKey ieKey = (IESKey) key;
        if (ieKey.getPublic() instanceof DHPublicKey) {
            generatePublicKeyParameter = DHUtil.generatePublicKeyParameter(ieKey.getPublic());
            generatePrivateKeyParameter = DHUtil.generatePrivateKeyParameter(ieKey.getPrivate());
        } else {
            generatePublicKeyParameter = ECUtil.generatePublicKeyParameter(ieKey.getPublic());
            generatePrivateKeyParameter = ECUtil.generatePrivateKeyParameter(ieKey.getPrivate());
        }
        this.engineParams = (IESParameterSpec) params;
        IESParameters p = new IESParameters(this.engineParams.getDerivationV(), this.engineParams.getEncodingV(), this.engineParams.getMacKeySize());
        this.state = opmode;
        this.buffer.reset();
        switch (opmode) {
            case 1:
            case 3:
                this.cipher.init(true, generatePrivateKeyParameter, generatePublicKeyParameter, p);
                return;
            case 2:
            case 4:
                this.cipher.init(false, generatePrivateKeyParameter, generatePublicKeyParameter, p);
                return;
            default:
                System.out.println("eeek!");
                return;
        }
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, AlgorithmParameters params, SecureRandom random) throws InvalidKeyException, InvalidAlgorithmParameterException {
        AlgorithmParameterSpec paramSpec = null;
        if (params != null) {
            for (int i = 0; i != this.availableSpecs.length; i++) {
                try {
                    paramSpec = params.getParameterSpec(this.availableSpecs[i]);
                    break;
                } catch (Exception e) {
                }
            }
            if (paramSpec == null) {
                throw new InvalidAlgorithmParameterException("can't handle parameter " + params.toString());
            }
        }
        this.engineParam = params;
        engineInit(opmode, key, paramSpec, random);
    }

    @Override // javax.crypto.CipherSpi
    protected void engineInit(int opmode, Key key, SecureRandom random) throws InvalidKeyException {
        if (opmode == 1 || opmode == 3) {
            try {
                engineInit(opmode, key, (AlgorithmParameterSpec) null, random);
                return;
            } catch (InvalidAlgorithmParameterException e) {
            }
        }
        throw new IllegalArgumentException("can't handle null parameter spec in IES");
    }

    @Override // javax.crypto.CipherSpi
    protected byte[] engineUpdate(byte[] input, int inputOffset, int inputLen) {
        this.buffer.write(input, inputOffset, inputLen);
        return null;
    }

    @Override // javax.crypto.CipherSpi
    protected int engineUpdate(byte[] input, int inputOffset, int inputLen, byte[] output, int outputOffset) {
        this.buffer.write(input, inputOffset, inputLen);
        return 0;
    }

    @Override // javax.crypto.CipherSpi
    protected byte[] engineDoFinal(byte[] input, int inputOffset, int inputLen) throws IllegalBlockSizeException, BadPaddingException {
        if (inputLen != 0) {
            this.buffer.write(input, inputOffset, inputLen);
        }
        try {
            byte[] buf = this.buffer.toByteArray();
            this.buffer.reset();
            return this.cipher.processBlock(buf, 0, buf.length);
        } catch (InvalidCipherTextException e) {
            throw new BadPaddingException(e.getMessage());
        }
    }

    @Override // javax.crypto.CipherSpi
    protected int engineDoFinal(byte[] input, int inputOffset, int inputLen, byte[] output, int outputOffset) throws IllegalBlockSizeException, BadPaddingException {
        if (inputLen != 0) {
            this.buffer.write(input, inputOffset, inputLen);
        }
        try {
            byte[] buf = this.buffer.toByteArray();
            this.buffer.reset();
            byte[] buf2 = this.cipher.processBlock(buf, 0, buf.length);
            System.arraycopy(buf2, 0, output, outputOffset, buf2.length);
            return buf2.length;
        } catch (InvalidCipherTextException e) {
            throw new BadPaddingException(e.getMessage());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi$IES.class */
    public static class IES extends CipherSpi {
        public IES() {
            super(new IESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ies/CipherSpi$OldIES.class */
    public static class OldIES extends CipherSpi {
        public OldIES() {
            super(new OldIESEngine(new DHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()), new HMac(new SHA1Digest())));
        }
    }
}
