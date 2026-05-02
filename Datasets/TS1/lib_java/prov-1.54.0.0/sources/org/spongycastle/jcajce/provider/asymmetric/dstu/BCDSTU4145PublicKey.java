package org.spongycastle.jcajce.provider.asymmetric.dstu;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigInteger;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.EllipticCurve;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1OctetString;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.DERBitString;
import org.spongycastle.asn1.DEROctetString;
import org.spongycastle.asn1.ua.DSTU4145BinaryField;
import org.spongycastle.asn1.ua.DSTU4145ECBinary;
import org.spongycastle.asn1.ua.DSTU4145NamedCurves;
import org.spongycastle.asn1.ua.DSTU4145Params;
import org.spongycastle.asn1.ua.DSTU4145PointEncoder;
import org.spongycastle.asn1.ua.UAObjectIdentifiers;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.asn1.x509.SubjectPublicKeyInfo;
import org.spongycastle.asn1.x9.X962Parameters;
import org.spongycastle.asn1.x9.X9ECParameters;
import org.spongycastle.crypto.params.ECDomainParameters;
import org.spongycastle.crypto.params.ECPublicKeyParameters;
import org.spongycastle.jcajce.provider.asymmetric.util.EC5Util;
import org.spongycastle.jcajce.provider.asymmetric.util.KeyUtil;
import org.spongycastle.jce.interfaces.ECPointEncoder;
import org.spongycastle.jce.provider.BouncyCastleProvider;
import org.spongycastle.jce.spec.ECNamedCurveParameterSpec;
import org.spongycastle.jce.spec.ECNamedCurveSpec;
import org.spongycastle.math.ec.ECCurve;
import org.spongycastle.math.ec.ECPoint;
import org.spongycastle.util.Strings;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dstu/BCDSTU4145PublicKey.class */
public class BCDSTU4145PublicKey implements ECPublicKey, org.spongycastle.jce.interfaces.ECPublicKey, ECPointEncoder {
    static final long serialVersionUID = 7026240464295649314L;
    private String algorithm;
    private boolean withCompression;
    private transient ECPoint q;
    private transient ECParameterSpec ecSpec;
    private transient DSTU4145Params dstuParams;

    public BCDSTU4145PublicKey(BCDSTU4145PublicKey key) {
        this.algorithm = "DSTU4145";
        this.q = key.q;
        this.ecSpec = key.ecSpec;
        this.withCompression = key.withCompression;
        this.dstuParams = key.dstuParams;
    }

    public BCDSTU4145PublicKey(ECPublicKeySpec spec) {
        this.algorithm = "DSTU4145";
        this.ecSpec = spec.getParams();
        this.q = EC5Util.convertPoint(this.ecSpec, spec.getW(), false);
    }

    public BCDSTU4145PublicKey(org.spongycastle.jce.spec.ECPublicKeySpec spec) {
        this.algorithm = "DSTU4145";
        this.q = spec.getQ();
        if (spec.getParams() != null) {
            ECCurve curve = spec.getParams().getCurve();
            EllipticCurve ellipticCurve = EC5Util.convertCurve(curve, spec.getParams().getSeed());
            this.ecSpec = EC5Util.convertSpec(ellipticCurve, spec.getParams());
        } else {
            if (this.q.getCurve() == null) {
                org.spongycastle.jce.spec.ECParameterSpec s = BouncyCastleProvider.CONFIGURATION.getEcImplicitlyCa();
                this.q = s.getCurve().createPoint(this.q.getAffineXCoord().toBigInteger(), this.q.getAffineYCoord().toBigInteger());
            }
            this.ecSpec = null;
        }
    }

    public BCDSTU4145PublicKey(String algorithm, ECPublicKeyParameters params, ECParameterSpec spec) {
        this.algorithm = "DSTU4145";
        ECDomainParameters dp = params.getParameters();
        this.algorithm = algorithm;
        this.q = params.getQ();
        if (spec == null) {
            EllipticCurve ellipticCurve = EC5Util.convertCurve(dp.getCurve(), dp.getSeed());
            this.ecSpec = createSpec(ellipticCurve, dp);
        } else {
            this.ecSpec = spec;
        }
    }

    public BCDSTU4145PublicKey(String algorithm, ECPublicKeyParameters params, org.spongycastle.jce.spec.ECParameterSpec spec) {
        this.algorithm = "DSTU4145";
        ECDomainParameters dp = params.getParameters();
        this.algorithm = algorithm;
        this.q = params.getQ();
        if (spec == null) {
            EllipticCurve ellipticCurve = EC5Util.convertCurve(dp.getCurve(), dp.getSeed());
            this.ecSpec = createSpec(ellipticCurve, dp);
        } else {
            EllipticCurve ellipticCurve2 = EC5Util.convertCurve(spec.getCurve(), spec.getSeed());
            this.ecSpec = EC5Util.convertSpec(ellipticCurve2, spec);
        }
    }

    public BCDSTU4145PublicKey(String algorithm, ECPublicKeyParameters params) {
        this.algorithm = "DSTU4145";
        this.algorithm = algorithm;
        this.q = params.getQ();
        this.ecSpec = null;
    }

    private ECParameterSpec createSpec(EllipticCurve ellipticCurve, ECDomainParameters dp) {
        return new ECParameterSpec(ellipticCurve, new java.security.spec.ECPoint(dp.getG().getAffineXCoord().toBigInteger(), dp.getG().getAffineYCoord().toBigInteger()), dp.getN(), dp.getH().intValue());
    }

    public BCDSTU4145PublicKey(ECPublicKey key) {
        this.algorithm = "DSTU4145";
        this.algorithm = key.getAlgorithm();
        this.ecSpec = key.getParams();
        this.q = EC5Util.convertPoint(this.ecSpec, key.getW(), false);
    }

    BCDSTU4145PublicKey(SubjectPublicKeyInfo info) {
        this.algorithm = "DSTU4145";
        populateFromPubKeyInfo(info);
    }

    private void reverseBytes(byte[] bytes) {
        for (int i = 0; i < bytes.length / 2; i++) {
            byte tmp = bytes[i];
            bytes[i] = bytes[(bytes.length - 1) - i];
            bytes[(bytes.length - 1) - i] = tmp;
        }
    }

    private void populateFromPubKeyInfo(SubjectPublicKeyInfo info) {
        org.spongycastle.jce.spec.ECParameterSpec spec;
        DERBitString bits = info.getPublicKeyData();
        this.algorithm = "DSTU4145";
        try {
            ASN1OctetString key = ASN1Primitive.fromByteArray(bits.getBytes());
            byte[] keyEnc = key.getOctets();
            if (info.getAlgorithm().getAlgorithm().equals(UAObjectIdentifiers.dstu4145le)) {
                reverseBytes(keyEnc);
            }
            this.dstuParams = DSTU4145Params.getInstance(info.getAlgorithm().getParameters());
            if (this.dstuParams.isNamedCurve()) {
                ASN1ObjectIdentifier curveOid = this.dstuParams.getNamedCurve();
                ECDomainParameters ecP = DSTU4145NamedCurves.getByOID(curveOid);
                spec = new ECNamedCurveParameterSpec(curveOid.getId(), ecP.getCurve(), ecP.getG(), ecP.getN(), ecP.getH(), ecP.getSeed());
            } else {
                DSTU4145ECBinary binary = this.dstuParams.getECBinary();
                byte[] b_bytes = binary.getB();
                if (info.getAlgorithm().getAlgorithm().equals(UAObjectIdentifiers.dstu4145le)) {
                    reverseBytes(b_bytes);
                }
                DSTU4145BinaryField field = binary.getField();
                ECCurve.F2m f2m = new ECCurve.F2m(field.getM(), field.getK1(), field.getK2(), field.getK3(), binary.getA(), new BigInteger(1, b_bytes));
                byte[] g_bytes = binary.getG();
                if (info.getAlgorithm().getAlgorithm().equals(UAObjectIdentifiers.dstu4145le)) {
                    reverseBytes(g_bytes);
                }
                spec = new org.spongycastle.jce.spec.ECParameterSpec(f2m, DSTU4145PointEncoder.decodePoint(f2m, g_bytes), binary.getN());
            }
            ECCurve curve = spec.getCurve();
            EllipticCurve ellipticCurve = EC5Util.convertCurve(curve, spec.getSeed());
            this.q = DSTU4145PointEncoder.decodePoint(curve, keyEnc);
            if (this.dstuParams.isNamedCurve()) {
                this.ecSpec = new ECNamedCurveSpec(this.dstuParams.getNamedCurve().getId(), ellipticCurve, new java.security.spec.ECPoint(spec.getG().getAffineXCoord().toBigInteger(), spec.getG().getAffineYCoord().toBigInteger()), spec.getN(), spec.getH());
            } else {
                this.ecSpec = new ECParameterSpec(ellipticCurve, new java.security.spec.ECPoint(spec.getG().getAffineXCoord().toBigInteger(), spec.getG().getAffineYCoord().toBigInteger()), spec.getN(), spec.getH().intValue());
            }
        } catch (IOException e) {
            throw new IllegalArgumentException("error recovering public key");
        }
    }

    public byte[] getSbox() {
        if (null != this.dstuParams) {
            return this.dstuParams.getDKE();
        }
        return DSTU4145Params.getDefaultDKE();
    }

    @Override // java.security.Key
    public String getAlgorithm() {
        return this.algorithm;
    }

    @Override // java.security.Key
    public String getFormat() {
        return "X.509";
    }

    @Override // java.security.Key
    public byte[] getEncoded() {
        DSTU4145Params x962Parameters;
        if (this.dstuParams != null) {
            x962Parameters = this.dstuParams;
        } else if (this.ecSpec instanceof ECNamedCurveSpec) {
            x962Parameters = new DSTU4145Params(new ASN1ObjectIdentifier(((ECNamedCurveSpec) this.ecSpec).getName()));
        } else {
            ECCurve curve = EC5Util.convertCurve(this.ecSpec.getCurve());
            X9ECParameters ecP = new X9ECParameters(curve, EC5Util.convertPoint(curve, this.ecSpec.getGenerator(), this.withCompression), this.ecSpec.getOrder(), BigInteger.valueOf(this.ecSpec.getCofactor()), this.ecSpec.getCurve().getSeed());
            x962Parameters = new X962Parameters(ecP);
        }
        byte[] encKey = DSTU4145PointEncoder.encodePoint(this.q);
        try {
            SubjectPublicKeyInfo info = new SubjectPublicKeyInfo(new AlgorithmIdentifier(UAObjectIdentifiers.dstu4145be, x962Parameters), new DEROctetString(encKey));
            return KeyUtil.getEncodedSubjectPublicKeyInfo(info);
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.security.interfaces.ECKey
    public ECParameterSpec getParams() {
        return this.ecSpec;
    }

    @Override // org.spongycastle.jce.interfaces.ECKey
    public org.spongycastle.jce.spec.ECParameterSpec getParameters() {
        if (this.ecSpec == null) {
            return null;
        }
        return EC5Util.convertSpec(this.ecSpec, this.withCompression);
    }

    @Override // java.security.interfaces.ECPublicKey
    public java.security.spec.ECPoint getW() {
        return new java.security.spec.ECPoint(this.q.getAffineXCoord().toBigInteger(), this.q.getAffineYCoord().toBigInteger());
    }

    @Override // org.spongycastle.jce.interfaces.ECPublicKey
    public ECPoint getQ() {
        if (this.ecSpec == null) {
            return this.q.getDetachedPoint();
        }
        return this.q;
    }

    public ECPoint engineGetQ() {
        return this.q;
    }

    org.spongycastle.jce.spec.ECParameterSpec engineGetSpec() {
        if (this.ecSpec != null) {
            return EC5Util.convertSpec(this.ecSpec, this.withCompression);
        }
        return BouncyCastleProvider.CONFIGURATION.getEcImplicitlyCa();
    }

    public String toString() {
        StringBuffer buf = new StringBuffer();
        String nl = Strings.lineSeparator();
        buf.append("EC Public Key").append(nl);
        buf.append("            X: ").append(this.q.getAffineXCoord().toBigInteger().toString(16)).append(nl);
        buf.append("            Y: ").append(this.q.getAffineYCoord().toBigInteger().toString(16)).append(nl);
        return buf.toString();
    }

    @Override // org.spongycastle.jce.interfaces.ECPointEncoder
    public void setPointFormat(String style) {
        this.withCompression = !"UNCOMPRESSED".equalsIgnoreCase(style);
    }

    public boolean equals(Object o) {
        if (!(o instanceof BCDSTU4145PublicKey)) {
            return false;
        }
        BCDSTU4145PublicKey other = (BCDSTU4145PublicKey) o;
        return engineGetQ().equals(other.engineGetQ()) && engineGetSpec().equals(other.engineGetSpec());
    }

    public int hashCode() {
        return engineGetQ().hashCode() ^ engineGetSpec().hashCode();
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        byte[] enc = (byte[]) in.readObject();
        populateFromPubKeyInfo(SubjectPublicKeyInfo.getInstance(ASN1Primitive.fromByteArray(enc)));
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.defaultWriteObject();
        out.writeObject(getEncoded());
    }
}
