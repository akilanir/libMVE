package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.io.IOException;
import java.security.PrivateKey;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.DERNull;
import org.spongycastle.asn1.pkcs.PrivateKeyInfo;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.pqc.asn1.McEliecePrivateKey;
import org.spongycastle.pqc.crypto.mceliece.McElieceParameters;
import org.spongycastle.pqc.crypto.mceliece.McEliecePrivateKeyParameters;
import org.spongycastle.pqc.jcajce.spec.McEliecePrivateKeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;
import org.spongycastle.pqc.math.linearalgebra.GF2mField;
import org.spongycastle.pqc.math.linearalgebra.Permutation;
import org.spongycastle.pqc.math.linearalgebra.PolynomialGF2mSmallM;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/BCMcEliecePrivateKey.class */
public class BCMcEliecePrivateKey implements CipherParameters, PrivateKey {
    private static final long serialVersionUID = 1;
    private String oid;
    private int n;
    private int k;
    private GF2mField field;
    private PolynomialGF2mSmallM goppaPoly;
    private GF2Matrix sInv;
    private Permutation p1;
    private Permutation p2;
    private GF2Matrix h;
    private PolynomialGF2mSmallM[] qInv;
    private McElieceParameters mcElieceParams;

    public BCMcEliecePrivateKey(String oid, int n, int k, GF2mField field, PolynomialGF2mSmallM goppaPoly, GF2Matrix sInv, Permutation p1, Permutation p2, GF2Matrix h, PolynomialGF2mSmallM[] qInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.field = field;
        this.goppaPoly = goppaPoly;
        this.sInv = sInv;
        this.p1 = p1;
        this.p2 = p2;
        this.h = h;
        this.qInv = qInv;
    }

    public BCMcEliecePrivateKey(McEliecePrivateKeySpec keySpec) {
        this(keySpec.getOIDString(), keySpec.getN(), keySpec.getK(), keySpec.getField(), keySpec.getGoppaPoly(), keySpec.getSInv(), keySpec.getP1(), keySpec.getP2(), keySpec.getH(), keySpec.getQInv());
    }

    public BCMcEliecePrivateKey(McEliecePrivateKeyParameters params) {
        this(params.getOIDString(), params.getN(), params.getK(), params.getField(), params.getGoppaPoly(), params.getSInv(), params.getP1(), params.getP2(), params.getH(), params.getQInv());
        this.mcElieceParams = params.getParameters();
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

    public GF2mField getField() {
        return this.field;
    }

    public PolynomialGF2mSmallM getGoppaPoly() {
        return this.goppaPoly;
    }

    public GF2Matrix getSInv() {
        return this.sInv;
    }

    public Permutation getP1() {
        return this.p1;
    }

    public Permutation getP2() {
        return this.p2;
    }

    public GF2Matrix getH() {
        return this.h;
    }

    public PolynomialGF2mSmallM[] getQInv() {
        return this.qInv;
    }

    public String getOIDString() {
        return this.oid;
    }

    public String toString() {
        String result = " length of the code          : " + this.n + "\n";
        return ((((result + " dimension of the code       : " + this.k + "\n") + " irreducible Goppa polynomial: " + this.goppaPoly + "\n") + " (k x k)-matrix S^-1         : " + this.sInv + "\n") + " permutation P1              : " + this.p1 + "\n") + " permutation P2              : " + this.p2;
    }

    public boolean equals(Object other) {
        if (!(other instanceof BCMcEliecePrivateKey)) {
            return false;
        }
        BCMcEliecePrivateKey otherKey = (BCMcEliecePrivateKey) other;
        return this.n == otherKey.n && this.k == otherKey.k && this.field.equals(otherKey.field) && this.goppaPoly.equals(otherKey.goppaPoly) && this.sInv.equals(otherKey.sInv) && this.p1.equals(otherKey.p1) && this.p2.equals(otherKey.p2) && this.h.equals(otherKey.h);
    }

    public int hashCode() {
        return this.k + this.n + this.field.hashCode() + this.goppaPoly.hashCode() + this.sInv.hashCode() + this.p1.hashCode() + this.p2.hashCode() + this.h.hashCode();
    }

    protected ASN1ObjectIdentifier getOID() {
        return new ASN1ObjectIdentifier(McElieceKeyFactorySpi.OID);
    }

    protected ASN1Primitive getAlgParams() {
        return null;
    }

    @Override // java.security.Key
    public byte[] getEncoded() {
        McEliecePrivateKey privateKey = new McEliecePrivateKey(new ASN1ObjectIdentifier(this.oid), this.n, this.k, this.field, this.goppaPoly, this.sInv, this.p1, this.p2, this.h, this.qInv);
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

    public McElieceParameters getMcElieceParameters() {
        return this.mcElieceParams;
    }
}
