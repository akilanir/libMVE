package org.spongycastle.jcajce.provider.asymmetric.dsa;

import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.SignatureException;
import java.security.SignatureSpi;
import java.security.interfaces.DSAKey;
import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.asn1.ASN1Integer;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.DERSequence;
import org.spongycastle.asn1.pkcs.PKCSObjectIdentifiers;
import org.spongycastle.asn1.x509.SubjectPublicKeyInfo;
import org.spongycastle.asn1.x509.X509ObjectIdentifiers;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.DSA;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.digests.NullDigest;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.digests.SHA224Digest;
import org.spongycastle.crypto.digests.SHA256Digest;
import org.spongycastle.crypto.digests.SHA384Digest;
import org.spongycastle.crypto.digests.SHA512Digest;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;
import org.spongycastle.crypto.params.ParametersWithRandom;
import org.spongycastle.crypto.signers.HMacDSAKCalculator;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner.class */
public class DSASigner extends SignatureSpi implements PKCSObjectIdentifiers, X509ObjectIdentifiers {
    private Digest digest;
    private DSA signer;
    private SecureRandom random;

    protected DSASigner(Digest digest, DSA signer) {
        this.digest = digest;
        this.signer = signer;
    }

    @Override // java.security.SignatureSpi
    protected void engineInitVerify(PublicKey publicKey) throws InvalidKeyException {
        AsymmetricKeyParameter generatePublicKeyParameter;
        if (publicKey instanceof DSAKey) {
            generatePublicKeyParameter = DSAUtil.generatePublicKeyParameter(publicKey);
        } else {
            try {
                byte[] bytes = publicKey.getEncoded();
                PublicKey publicKey2 = new BCDSAPublicKey(SubjectPublicKeyInfo.getInstance(bytes));
                if (publicKey2 instanceof DSAKey) {
                    generatePublicKeyParameter = DSAUtil.generatePublicKeyParameter(publicKey2);
                } else {
                    throw new InvalidKeyException("can't recognise key type in DSA based signer");
                }
            } catch (Exception e) {
                throw new InvalidKeyException("can't recognise key type in DSA based signer");
            }
        }
        this.digest.reset();
        this.signer.init(false, generatePublicKeyParameter);
    }

    @Override // java.security.SignatureSpi
    protected void engineInitSign(PrivateKey privateKey, SecureRandom random) throws InvalidKeyException {
        this.random = random;
        engineInitSign(privateKey);
    }

    @Override // java.security.SignatureSpi
    protected void engineInitSign(PrivateKey privateKey) throws InvalidKeyException {
        CipherParameters param = DSAUtil.generatePrivateKeyParameter(privateKey);
        if (this.random != null) {
            param = new ParametersWithRandom(param, this.random);
        }
        this.digest.reset();
        this.signer.init(true, param);
    }

    @Override // java.security.SignatureSpi
    protected void engineUpdate(byte b) throws SignatureException {
        this.digest.update(b);
    }

    @Override // java.security.SignatureSpi
    protected void engineUpdate(byte[] b, int off, int len) throws SignatureException {
        this.digest.update(b, off, len);
    }

    @Override // java.security.SignatureSpi
    protected byte[] engineSign() throws SignatureException {
        byte[] hash = new byte[this.digest.getDigestSize()];
        this.digest.doFinal(hash, 0);
        try {
            BigInteger[] sig = this.signer.generateSignature(hash);
            return derEncode(sig[0], sig[1]);
        } catch (Exception e) {
            throw new SignatureException(e.toString());
        }
    }

    @Override // java.security.SignatureSpi
    protected boolean engineVerify(byte[] sigBytes) throws SignatureException {
        byte[] hash = new byte[this.digest.getDigestSize()];
        this.digest.doFinal(hash, 0);
        try {
            BigInteger[] sig = derDecode(sigBytes);
            return this.signer.verifySignature(hash, sig[0], sig[1]);
        } catch (Exception e) {
            throw new SignatureException("error decoding signature bytes.");
        }
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

    private byte[] derEncode(BigInteger r, BigInteger s) throws IOException {
        ASN1Integer[] rs = {new ASN1Integer(r), new ASN1Integer(s)};
        return new DERSequence(rs).getEncoded("DER");
    }

    private BigInteger[] derDecode(byte[] encoding) throws IOException {
        ASN1Sequence s = ASN1Primitive.fromByteArray(encoding);
        return new BigInteger[]{s.getObjectAt(0).getValue(), s.getObjectAt(1).getValue()};
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$stdDSA.class */
    public static class stdDSA extends DSASigner {
        public stdDSA() {
            super(new SHA1Digest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$detDSA.class */
    public static class detDSA extends DSASigner {
        public detDSA() {
            super(new SHA1Digest(), new org.spongycastle.crypto.signers.DSASigner(new HMacDSAKCalculator(new SHA1Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$dsa224.class */
    public static class dsa224 extends DSASigner {
        public dsa224() {
            super(new SHA224Digest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$detDSA224.class */
    public static class detDSA224 extends DSASigner {
        public detDSA224() {
            super(new SHA224Digest(), new org.spongycastle.crypto.signers.DSASigner(new HMacDSAKCalculator(new SHA224Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$dsa256.class */
    public static class dsa256 extends DSASigner {
        public dsa256() {
            super(new SHA256Digest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$detDSA256.class */
    public static class detDSA256 extends DSASigner {
        public detDSA256() {
            super(new SHA256Digest(), new org.spongycastle.crypto.signers.DSASigner(new HMacDSAKCalculator(new SHA256Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$dsa384.class */
    public static class dsa384 extends DSASigner {
        public dsa384() {
            super(new SHA384Digest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$detDSA384.class */
    public static class detDSA384 extends DSASigner {
        public detDSA384() {
            super(new SHA384Digest(), new org.spongycastle.crypto.signers.DSASigner(new HMacDSAKCalculator(new SHA384Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$dsa512.class */
    public static class dsa512 extends DSASigner {
        public dsa512() {
            super(new SHA512Digest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$detDSA512.class */
    public static class detDSA512 extends DSASigner {
        public detDSA512() {
            super(new SHA512Digest(), new org.spongycastle.crypto.signers.DSASigner(new HMacDSAKCalculator(new SHA512Digest())));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/DSASigner$noneDSA.class */
    public static class noneDSA extends DSASigner {
        public noneDSA() {
            super(new NullDigest(), new org.spongycastle.crypto.signers.DSASigner());
        }
    }
}
