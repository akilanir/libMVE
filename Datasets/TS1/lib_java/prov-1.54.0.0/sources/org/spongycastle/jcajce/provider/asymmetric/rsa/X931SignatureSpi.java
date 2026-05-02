package org.spongycastle.jcajce.provider.asymmetric.rsa;

import java.security.InvalidKeyException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SignatureException;
import java.security.SignatureSpi;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.crypto.AsymmetricBlockCipher;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.digests.RIPEMD128Digest;
import org.spongycastle.crypto.digests.RIPEMD160Digest;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.digests.SHA224Digest;
import org.spongycastle.crypto.digests.SHA256Digest;
import org.spongycastle.crypto.digests.SHA384Digest;
import org.spongycastle.crypto.digests.SHA512Digest;
import org.spongycastle.crypto.digests.SHA512tDigest;
import org.spongycastle.crypto.digests.WhirlpoolDigest;
import org.spongycastle.crypto.engines.RSABlindedEngine;
import org.spongycastle.crypto.signers.X931Signer;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi.class */
public class X931SignatureSpi extends SignatureSpi {
    private X931Signer signer;

    protected X931SignatureSpi(Digest digest, AsymmetricBlockCipher cipher) {
        this.signer = new X931Signer(cipher, digest);
    }

    @Override // java.security.SignatureSpi
    protected void engineInitVerify(PublicKey publicKey) throws InvalidKeyException {
        this.signer.init(false, RSAUtil.generatePublicKeyParameter((RSAPublicKey) publicKey));
    }

    @Override // java.security.SignatureSpi
    protected void engineInitSign(PrivateKey privateKey) throws InvalidKeyException {
        this.signer.init(true, RSAUtil.generatePrivateKeyParameter((RSAPrivateKey) privateKey));
    }

    @Override // java.security.SignatureSpi
    protected void engineUpdate(byte b) throws SignatureException {
        this.signer.update(b);
    }

    @Override // java.security.SignatureSpi
    protected void engineUpdate(byte[] b, int off, int len) throws SignatureException {
        this.signer.update(b, off, len);
    }

    @Override // java.security.SignatureSpi
    protected byte[] engineSign() throws SignatureException {
        try {
            byte[] sig = this.signer.generateSignature();
            return sig;
        } catch (Exception e) {
            throw new SignatureException(e.toString());
        }
    }

    @Override // java.security.SignatureSpi
    protected boolean engineVerify(byte[] sigBytes) throws SignatureException {
        boolean yes = this.signer.verifySignature(sigBytes);
        return yes;
    }

    @Override // java.security.SignatureSpi
    protected void engineSetParameter(AlgorithmParameterSpec params) {
        throw new UnsupportedOperationException("engineSetParameter unsupported");
    }

    @Override // java.security.SignatureSpi
    protected void engineSetParameter(String param, Object value) {
        throw new UnsupportedOperationException("engineSetParameter unsupported");
    }

    @Override // java.security.SignatureSpi
    protected Object engineGetParameter(String param) {
        throw new UnsupportedOperationException("engineSetParameter unsupported");
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$RIPEMD128WithRSAEncryption.class */
    public static class RIPEMD128WithRSAEncryption extends X931SignatureSpi {
        public RIPEMD128WithRSAEncryption() {
            super(new RIPEMD128Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$RIPEMD160WithRSAEncryption.class */
    public static class RIPEMD160WithRSAEncryption extends X931SignatureSpi {
        public RIPEMD160WithRSAEncryption() {
            super(new RIPEMD160Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA1WithRSAEncryption.class */
    public static class SHA1WithRSAEncryption extends X931SignatureSpi {
        public SHA1WithRSAEncryption() {
            super(new SHA1Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA224WithRSAEncryption.class */
    public static class SHA224WithRSAEncryption extends X931SignatureSpi {
        public SHA224WithRSAEncryption() {
            super(new SHA224Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA256WithRSAEncryption.class */
    public static class SHA256WithRSAEncryption extends X931SignatureSpi {
        public SHA256WithRSAEncryption() {
            super(new SHA256Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA384WithRSAEncryption.class */
    public static class SHA384WithRSAEncryption extends X931SignatureSpi {
        public SHA384WithRSAEncryption() {
            super(new SHA384Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA512WithRSAEncryption.class */
    public static class SHA512WithRSAEncryption extends X931SignatureSpi {
        public SHA512WithRSAEncryption() {
            super(new SHA512Digest(), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA512_224WithRSAEncryption.class */
    public static class SHA512_224WithRSAEncryption extends X931SignatureSpi {
        public SHA512_224WithRSAEncryption() {
            super(new SHA512tDigest(224), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$SHA512_256WithRSAEncryption.class */
    public static class SHA512_256WithRSAEncryption extends X931SignatureSpi {
        public SHA512_256WithRSAEncryption() {
            super(new SHA512tDigest(256), new RSABlindedEngine());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/rsa/X931SignatureSpi$WhirlpoolWithRSAEncryption.class */
    public static class WhirlpoolWithRSAEncryption extends X931SignatureSpi {
        public WhirlpoolWithRSAEncryption() {
            super(new WhirlpoolDigest(), new RSABlindedEngine());
        }
    }
}
