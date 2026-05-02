package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.io.IOException;
import java.security.PrivateKey;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.DERNull;
import org.spongycastle.asn1.pkcs.PrivateKeyInfo;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.pqc.asn1.McElieceCCA2PrivateKey;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2Parameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2PrivateKeyParameters;
import org.spongycastle.pqc.jcajce.spec.McElieceCCA2PrivateKeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;
import org.spongycastle.pqc.math.linearalgebra.GF2mField;
import org.spongycastle.pqc.math.linearalgebra.Permutation;
import org.spongycastle.pqc.math.linearalgebra.PolynomialGF2mSmallM;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey.class */
public class BCMcElieceCCA2PrivateKey implements CipherParameters, PrivateKey {
    private static final long serialVersionUID = 1;
    private String oid;
    private int n;
    private int k;
    private GF2mField field;
    private PolynomialGF2mSmallM goppaPoly;
    private Permutation p;
    private GF2Matrix h;
    private PolynomialGF2mSmallM[] qInv;
    private McElieceCCA2Parameters mcElieceCCA2Params;

    public BCMcElieceCCA2PrivateKey(String oid, int n, int k, GF2mField field, PolynomialGF2mSmallM gp, Permutation p, GF2Matrix h, PolynomialGF2mSmallM[] qInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.field = field;
        this.goppaPoly = gp;
        this.p = p;
        this.h = h;
        this.qInv = qInv;
    }

    public BCMcElieceCCA2PrivateKey(McElieceCCA2PrivateKeySpec keySpec) {
        this(keySpec.getOIDString(), keySpec.getN(), keySpec.getK(), keySpec.getField(), keySpec.getGoppaPoly(), keySpec.getP(), keySpec.getH(), keySpec.getQInv());
    }

    public BCMcElieceCCA2PrivateKey(McElieceCCA2PrivateKeyParameters params) {
        this(params.getOIDString(), params.getN(), params.getK(), params.getField(), params.getGoppaPoly(), params.getP(), params.getH(), params.getQInv());
        this.mcElieceCCA2Params = params.getParameters();
    }

    @Override // java.security.Key
    public String getAlgorithm() {
        return "McEliece";
    }

    public int getN() {
        return this.n;
    }

    public int getK() {
        return this.k;
    }

    public int getT() {
        return this.goppaPoly.getDegree();
    }

    public GF2mField getField() {
        return this.field;
    }

    public PolynomialGF2mSmallM getGoppaPoly() {
        return this.goppaPoly;
    }

    public Permutation getP() {
        return this.p;
    }

    public GF2Matrix getH() {
        return this.h;
    }

    public PolynomialGF2mSmallM[] getQInv() {
        return this.qInv;
    }

    public String toString() {
        String result = " extension degree of the field      : " + this.n + "\n";
        return (result + " dimension of the code              : " + this.k + "\n") + " irreducible Goppa polynomial       : " + this.goppaPoly + "\n";
    }

    public boolean equals(Object other) {
        if (other == null || !(other instanceof BCMcElieceCCA2PrivateKey)) {
            return false;
        }
        BCMcElieceCCA2PrivateKey otherKey = (BCMcElieceCCA2PrivateKey) other;
        return this.n == otherKey.n && this.k == otherKey.k && this.field.equals(otherKey.field) && this.goppaPoly.equals(otherKey.goppaPoly) && this.p.equals(otherKey.p) && this.h.equals(otherKey.h);
    }

    public int hashCode() {
        return this.k + this.n + this.field.hashCode() + this.goppaPoly.hashCode() + this.p.hashCode() + this.h.hashCode();
    }

    public String getOIDString() {
        return this.oid;
    }

    protected ASN1ObjectIdentifier getOID() {
        return new ASN1ObjectIdentifier(McElieceCCA2KeyFactorySpi.OID);
    }

    protected ASN1Primitive getAlgParams() {
        return null;
    }

    @Override // java.security.Key
    public byte[] getEncoded() {
        McElieceCCA2PrivateKey privateKey = new McElieceCCA2PrivateKey(new ASN1ObjectIdentifier(this.oid), this.n, this.k, this.field, this.goppaPoly, this.p, this.h, this.qInv);
        try {
            AlgorithmIdentifier algorithmIdentifier = new AlgorithmIdentifier(getOID(), DERNull.INSTANCE);
            PrivateKeyInfo pki = new PrivateKeyInfo(algorithmIdentifier, privateKey);
            try {
                byte[] encoded = pki.getEncoded();
                return encoded;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        } catch (IOException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    @Override // java.security.Key
    public String getFormat() {
        return null;
    }

    public McElieceCCA2Parameters getMcElieceCCA2Parameters() {
        return this.mcElieceCCA2Params;
    }
}
