package org.spongycastle.jcajce.provider.asymmetric.ec;

import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.asn1.x9.X9IntegerConverter;
import org.spongycastle.crypto.BasicAgreement;
import org.spongycastle.crypto.DerivationFunction;
import org.spongycastle.crypto.agreement.ECDHBasicAgreement;
import org.spongycastle.crypto.agreement.ECDHCBasicAgreement;
import org.spongycastle.crypto.agreement.ECMQVBasicAgreement;
import org.spongycastle.crypto.agreement.kdf.ConcatenationKDFGenerator;
import org.spongycastle.crypto.digests.SHA1Digest;
import org.spongycastle.crypto.digests.SHA224Digest;
import org.spongycastle.crypto.digests.SHA256Digest;
import org.spongycastle.crypto.digests.SHA384Digest;
import org.spongycastle.crypto.digests.SHA512Digest;
import org.spongycastle.crypto.generators.KDF2BytesGenerator;
import org.spongycastle.crypto.params.ECDomainParameters;
import org.spongycastle.crypto.params.ECPrivateKeyParameters;
import org.spongycastle.crypto.params.ECPublicKeyParameters;
import org.spongycastle.crypto.params.MQVPrivateParameters;
import org.spongycastle.crypto.params.MQVPublicParameters;
import org.spongycastle.jcajce.provider.asymmetric.util.BaseAgreementSpi;
import org.spongycastle.jcajce.provider.asymmetric.util.ECUtil;
import org.spongycastle.jcajce.spec.MQVParameterSpec;
import org.spongycastle.jcajce.spec.UserKeyingMaterialSpec;
import org.spongycastle.jce.interfaces.ECPrivateKey;
import org.spongycastle.jce.interfaces.ECPublicKey;
import org.spongycastle.jce.interfaces.MQVPrivateKey;
import org.spongycastle.jce.interfaces.MQVPublicKey;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi.class */
public class KeyAgreementSpi extends BaseAgreementSpi {
    private static final X9IntegerConverter converter = new X9IntegerConverter();
    private String kaAlgorithm;
    private ECDomainParameters parameters;
    private BasicAgreement agreement;
    private MQVParameterSpec mqvParameters;

    protected KeyAgreementSpi(String kaAlgorithm, BasicAgreement agreement, DerivationFunction kdf) {
        super(kaAlgorithm, kdf);
        this.kaAlgorithm = kaAlgorithm;
        this.agreement = agreement;
    }

    @Override // org.spongycastle.jcajce.provider.asymmetric.util.BaseAgreementSpi
    protected byte[] bigIntToBytes(BigInteger r) {
        return converter.integerToBytes(r, converter.getByteLength(this.parameters.getCurve()));
    }

    @Override // javax.crypto.KeyAgreementSpi
    protected Key engineDoPhase(Key key, boolean lastPhase) throws InvalidKeyException, IllegalStateException {
        MQVPublicParameters generatePublicKeyParameter;
        if (this.parameters == null) {
            throw new IllegalStateException(this.kaAlgorithm + " not initialised.");
        }
        if (!lastPhase) {
            throw new IllegalStateException(this.kaAlgorithm + " can only be between two parties.");
        }
        if (this.agreement instanceof ECMQVBasicAgreement) {
            if (!(key instanceof MQVPublicKey)) {
                ECPublicKeyParameters staticKey = ECUtil.generatePublicKeyParameter((PublicKey) key);
                ECPublicKeyParameters ephemKey = ECUtil.generatePublicKeyParameter(this.mqvParameters.getOtherPartyEphemeralKey());
                generatePublicKeyParameter = new MQVPublicParameters(staticKey, ephemKey);
            } else {
                MQVPublicKey mqvPubKey = (MQVPublicKey) key;
                ECPublicKeyParameters staticKey2 = ECUtil.generatePublicKeyParameter(mqvPubKey.getStaticKey());
                ECPublicKeyParameters ephemKey2 = ECUtil.generatePublicKeyParameter(mqvPubKey.getEphemeralKey());
                generatePublicKeyParameter = new MQVPublicParameters(staticKey2, ephemKey2);
            }
        } else {
            if (!(key instanceof PublicKey)) {
                throw new InvalidKeyException(this.kaAlgorithm + " key agreement requires " + getSimpleName(ECPublicKey.class) + " for doPhase");
            }
            generatePublicKeyParameter = ECUtil.generatePublicKeyParameter((PublicKey) key);
        }
        this.result = this.agreement.calculateAgreement(generatePublicKeyParameter);
        return null;
    }

    @Override // javax.crypto.KeyAgreementSpi
    protected void engineInit(Key key, AlgorithmParameterSpec params, SecureRandom random) throws InvalidKeyException, InvalidAlgorithmParameterException {
        if (params != null && !(params instanceof MQVParameterSpec) && !(params instanceof UserKeyingMaterialSpec)) {
            throw new InvalidAlgorithmParameterException("No algorithm parameters supported");
        }
        initFromKey(key, params);
    }

    @Override // javax.crypto.KeyAgreementSpi
    protected void engineInit(Key key, SecureRandom random) throws InvalidKeyException {
        initFromKey(key, null);
    }

    private void initFromKey(Key key, AlgorithmParameterSpec parameterSpec) throws InvalidKeyException {
        ECPrivateKeyParameters staticPrivKey;
        ECPrivateKeyParameters ephemPrivKey;
        ECPublicKeyParameters ephemPubKey;
        if (this.agreement instanceof ECMQVBasicAgreement) {
            this.mqvParameters = null;
            if (!(key instanceof MQVPrivateKey) && !(parameterSpec instanceof MQVParameterSpec)) {
                throw new InvalidKeyException(this.kaAlgorithm + " key agreement requires " + getSimpleName(MQVParameterSpec.class) + " for initialisation");
            }
            if (key instanceof MQVPrivateKey) {
                MQVPrivateKey mqvPrivKey = (MQVPrivateKey) key;
                staticPrivKey = (ECPrivateKeyParameters) ECUtil.generatePrivateKeyParameter(mqvPrivKey.getStaticPrivateKey());
                ephemPrivKey = (ECPrivateKeyParameters) ECUtil.generatePrivateKeyParameter(mqvPrivKey.getEphemeralPrivateKey());
                ephemPubKey = null;
                if (mqvPrivKey.getEphemeralPublicKey() != null) {
                    ephemPubKey = (ECPublicKeyParameters) ECUtil.generatePublicKeyParameter(mqvPrivKey.getEphemeralPublicKey());
                }
            } else {
                MQVParameterSpec mqvParameterSpec = (MQVParameterSpec) parameterSpec;
                staticPrivKey = ECUtil.generatePrivateKeyParameter((PrivateKey) key);
                ephemPrivKey = ECUtil.generatePrivateKeyParameter(mqvParameterSpec.getEphemeralPrivateKey());
                ephemPubKey = null;
                if (mqvParameterSpec.getEphemeralPublicKey() != null) {
                    ephemPubKey = ECUtil.generatePublicKeyParameter(mqvParameterSpec.getEphemeralPublicKey());
                }
                this.mqvParameters = mqvParameterSpec;
                this.ukmParameters = mqvParameterSpec.getUserKeyingMaterial();
            }
            MQVPrivateParameters localParams = new MQVPrivateParameters(staticPrivKey, ephemPrivKey, ephemPubKey);
            this.parameters = staticPrivKey.getParameters();
            this.agreement.init(localParams);
            return;
        }
        if (!(key instanceof PrivateKey)) {
            throw new InvalidKeyException(this.kaAlgorithm + " key agreement requires " + getSimpleName(ECPrivateKey.class) + " for initialisation");
        }
        ECPrivateKeyParameters privKey = ECUtil.generatePrivateKeyParameter((PrivateKey) key);
        this.parameters = privKey.getParameters();
        this.ukmParameters = parameterSpec instanceof UserKeyingMaterialSpec ? ((UserKeyingMaterialSpec) parameterSpec).getUserKeyingMaterial() : null;
        this.agreement.init(privKey);
    }

    private static String getSimpleName(Class clazz) {
        String fullName = clazz.getName();
        return fullName.substring(fullName.lastIndexOf(46) + 1);
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DH.class */
    public static class DH extends KeyAgreementSpi {
        public DH() {
            super("ECDH", new ECDHBasicAgreement(), null);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHC.class */
    public static class DHC extends KeyAgreementSpi {
        public DHC() {
            super("ECDHC", new ECDHCBasicAgreement(), null);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQV.class */
    public static class MQV extends KeyAgreementSpi {
        public MQV() {
            super("ECMQV", new ECMQVBasicAgreement(), null);
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1KDF.class */
    public static class DHwithSHA1KDF extends KeyAgreementSpi {
        public DHwithSHA1KDF() {
            super("ECDHwithSHA1KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1KDFAndSharedInfo.class */
    public static class DHwithSHA1KDFAndSharedInfo extends KeyAgreementSpi {
        public DHwithSHA1KDFAndSharedInfo() {
            super("ECDHwithSHA1KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA1KDFAndSharedInfo.class */
    public static class CDHwithSHA1KDFAndSharedInfo extends KeyAgreementSpi {
        public CDHwithSHA1KDFAndSharedInfo() {
            super("ECCDHwithSHA1KDF", new ECDHCBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA224KDFAndSharedInfo.class */
    public static class DHwithSHA224KDFAndSharedInfo extends KeyAgreementSpi {
        public DHwithSHA224KDFAndSharedInfo() {
            super("ECDHwithSHA224KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA224Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA224KDFAndSharedInfo.class */
    public static class CDHwithSHA224KDFAndSharedInfo extends KeyAgreementSpi {
        public CDHwithSHA224KDFAndSharedInfo() {
            super("ECCDHwithSHA224KDF", new ECDHCBasicAgreement(), new KDF2BytesGenerator(new SHA224Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA256KDFAndSharedInfo.class */
    public static class DHwithSHA256KDFAndSharedInfo extends KeyAgreementSpi {
        public DHwithSHA256KDFAndSharedInfo() {
            super("ECDHwithSHA256KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA256Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA256KDFAndSharedInfo.class */
    public static class CDHwithSHA256KDFAndSharedInfo extends KeyAgreementSpi {
        public CDHwithSHA256KDFAndSharedInfo() {
            super("ECCDHwithSHA256KDF", new ECDHCBasicAgreement(), new KDF2BytesGenerator(new SHA256Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA384KDFAndSharedInfo.class */
    public static class DHwithSHA384KDFAndSharedInfo extends KeyAgreementSpi {
        public DHwithSHA384KDFAndSharedInfo() {
            super("ECDHwithSHA384KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA384Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA384KDFAndSharedInfo.class */
    public static class CDHwithSHA384KDFAndSharedInfo extends KeyAgreementSpi {
        public CDHwithSHA384KDFAndSharedInfo() {
            super("ECCDHwithSHA384KDF", new ECDHCBasicAgreement(), new KDF2BytesGenerator(new SHA384Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA512KDFAndSharedInfo.class */
    public static class DHwithSHA512KDFAndSharedInfo extends KeyAgreementSpi {
        public DHwithSHA512KDFAndSharedInfo() {
            super("ECDHwithSHA512KDF", new ECDHBasicAgreement(), new KDF2BytesGenerator(new SHA512Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$CDHwithSHA512KDFAndSharedInfo.class */
    public static class CDHwithSHA512KDFAndSharedInfo extends KeyAgreementSpi {
        public CDHwithSHA512KDFAndSharedInfo() {
            super("ECCDHwithSHA512KDF", new ECDHCBasicAgreement(), new KDF2BytesGenerator(new SHA512Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA1KDFAndSharedInfo.class */
    public static class MQVwithSHA1KDFAndSharedInfo extends KeyAgreementSpi {
        public MQVwithSHA1KDFAndSharedInfo() {
            super("ECMQVwithSHA1KDF", new ECMQVBasicAgreement(), new KDF2BytesGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA224KDFAndSharedInfo.class */
    public static class MQVwithSHA224KDFAndSharedInfo extends KeyAgreementSpi {
        public MQVwithSHA224KDFAndSharedInfo() {
            super("ECMQVwithSHA224KDF", new ECMQVBasicAgreement(), new KDF2BytesGenerator(new SHA224Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA256KDFAndSharedInfo.class */
    public static class MQVwithSHA256KDFAndSharedInfo extends KeyAgreementSpi {
        public MQVwithSHA256KDFAndSharedInfo() {
            super("ECMQVwithSHA256KDF", new ECMQVBasicAgreement(), new KDF2BytesGenerator(new SHA256Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA384KDFAndSharedInfo.class */
    public static class MQVwithSHA384KDFAndSharedInfo extends KeyAgreementSpi {
        public MQVwithSHA384KDFAndSharedInfo() {
            super("ECMQVwithSHA384KDF", new ECMQVBasicAgreement(), new KDF2BytesGenerator(new SHA384Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA512KDFAndSharedInfo.class */
    public static class MQVwithSHA512KDFAndSharedInfo extends KeyAgreementSpi {
        public MQVwithSHA512KDFAndSharedInfo() {
            super("ECMQVwithSHA512KDF", new ECMQVBasicAgreement(), new KDF2BytesGenerator(new SHA512Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA1CKDF.class */
    public static class DHwithSHA1CKDF extends KeyAgreementSpi {
        public DHwithSHA1CKDF() {
            super("ECDHwithSHA1CKDF", new ECDHCBasicAgreement(), new ConcatenationKDFGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA256CKDF.class */
    public static class DHwithSHA256CKDF extends KeyAgreementSpi {
        public DHwithSHA256CKDF() {
            super("ECDHwithSHA256CKDF", new ECDHCBasicAgreement(), new ConcatenationKDFGenerator(new SHA256Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA384CKDF.class */
    public static class DHwithSHA384CKDF extends KeyAgreementSpi {
        public DHwithSHA384CKDF() {
            super("ECDHwithSHA384CKDF", new ECDHCBasicAgreement(), new ConcatenationKDFGenerator(new SHA384Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$DHwithSHA512CKDF.class */
    public static class DHwithSHA512CKDF extends KeyAgreementSpi {
        public DHwithSHA512CKDF() {
            super("ECDHwithSHA512CKDF", new ECDHCBasicAgreement(), new ConcatenationKDFGenerator(new SHA512Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA1CKDF.class */
    public static class MQVwithSHA1CKDF extends KeyAgreementSpi {
        public MQVwithSHA1CKDF() {
            super("ECMQVwithSHA1CKDF", new ECMQVBasicAgreement(), new ConcatenationKDFGenerator(new SHA1Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA224CKDF.class */
    public static class MQVwithSHA224CKDF extends KeyAgreementSpi {
        public MQVwithSHA224CKDF() {
            super("ECMQVwithSHA224CKDF", new ECMQVBasicAgreement(), new ConcatenationKDFGenerator(new SHA224Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA256CKDF.class */
    public static class MQVwithSHA256CKDF extends KeyAgreementSpi {
        public MQVwithSHA256CKDF() {
            super("ECMQVwithSHA256CKDF", new ECMQVBasicAgreement(), new ConcatenationKDFGenerator(new SHA256Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA384CKDF.class */
    public static class MQVwithSHA384CKDF extends KeyAgreementSpi {
        public MQVwithSHA384CKDF() {
            super("ECMQVwithSHA384CKDF", new ECMQVBasicAgreement(), new ConcatenationKDFGenerator(new SHA384Digest()));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA512CKDF.class */
    public static class MQVwithSHA512CKDF extends KeyAgreementSpi {
        public MQVwithSHA512CKDF() {
            super("ECMQVwithSHA512CKDF", new ECMQVBasicAgreement(), new ConcatenationKDFGenerator(new SHA512Digest()));
        }
    }
}
