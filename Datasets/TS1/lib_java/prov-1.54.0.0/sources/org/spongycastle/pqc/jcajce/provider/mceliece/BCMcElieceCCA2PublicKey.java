package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.io.IOException;
import java.security.PublicKey;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.DERNull;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.asn1.x509.SubjectPublicKeyInfo;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.pqc.asn1.McElieceCCA2PublicKey;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2Parameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2PublicKeyParameters;
import org.spongycastle.pqc.jcajce.spec.McElieceCCA2PublicKeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey.class */
public class BCMcElieceCCA2PublicKey implements CipherParameters, PublicKey {
    private static final long serialVersionUID = 1;
    private String oid;
    private int n;
    private int t;
    private GF2Matrix g;
    private McElieceCCA2Parameters McElieceCCA2Params;

    public BCMcElieceCCA2PublicKey(String oid, int n, int t, GF2Matrix g) {
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.g = g;
    }

    public BCMcElieceCCA2PublicKey(McElieceCCA2PublicKeySpec keySpec) {
        this(keySpec.getOIDString(), keySpec.getN(), keySpec.getT(), keySpec.getMatrixG());
    }

    public BCMcElieceCCA2PublicKey(McElieceCCA2PublicKeyParameters params) {
        this(params.getOIDString(), params.getN(), params.getT(), params.getMatrixG());
        this.McElieceCCA2Params = params.getParameters();
    }

    @Override // java.security.Key
    public String getAlgorithm() {
        return "McEliece";
    }

    public int getN() {
        return this.n;
    }

    public int getK() {
        return this.g.getNumRows();
    }

    public int getT() {
        return this.t;
    }

    public GF2Matrix getG() {
        return this.g;
    }

    public String toString() {
        String result = "McEliecePublicKey:\n length of the code         : " + this.n + "\n";
        return (result + " error correction capability: " + this.t + "\n") + " generator matrix           : " + this.g.toString();
    }

    public boolean equals(Object other) {
        if (other == null || !(other instanceof BCMcElieceCCA2PublicKey)) {
            return false;
        }
        BCMcElieceCCA2PublicKey otherKey = (BCMcElieceCCA2PublicKey) other;
        return this.n == otherKey.n && this.t == otherKey.t && this.g.equals(otherKey.g);
    }

    public int hashCode() {
        return this.n + this.t + this.g.hashCode();
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
        McElieceCCA2PublicKey key = new McElieceCCA2PublicKey(new ASN1ObjectIdentifier(this.oid), this.n, this.t, this.g);
        AlgorithmIdentifier algorithmIdentifier = new AlgorithmIdentifier(getOID(), DERNull.INSTANCE);
        try {
            SubjectPublicKeyInfo subjectPublicKeyInfo = new SubjectPublicKeyInfo(algorithmIdentifier, key);
            return subjectPublicKeyInfo.getEncoded();
        } catch (IOException e) {
            return null;
        }
    }

    @Override // java.security.Key
    public String getFormat() {
        return null;
    }

    public McElieceCCA2Parameters getMcElieceCCA2Parameters() {
        return this.McElieceCCA2Params;
    }
}
