package org.spongycastle.pqc.asn1;

import java.math.BigInteger;
import org.spongycastle.asn1.ASN1EncodableVector;
import org.spongycastle.asn1.ASN1Integer;
import org.spongycastle.asn1.ASN1Object;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1OctetString;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.DEROctetString;
import org.spongycastle.asn1.DERSequence;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;
import org.spongycastle.pqc.math.linearalgebra.GF2mField;
import org.spongycastle.pqc.math.linearalgebra.Permutation;
import org.spongycastle.pqc.math.linearalgebra.PolynomialGF2mSmallM;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/asn1/McElieceCCA2PrivateKey.class */
public class McElieceCCA2PrivateKey extends ASN1Object {
    private ASN1ObjectIdentifier oid;
    private int n;
    private int k;
    private byte[] encField;
    private byte[] encGp;
    private byte[] encP;
    private byte[] encH;
    private byte[][] encqInv;

    /* JADX WARN: Type inference failed for: r1v13, types: [byte[], byte[][]] */
    public McElieceCCA2PrivateKey(ASN1ObjectIdentifier oid, int n, int k, GF2mField field, PolynomialGF2mSmallM goppaPoly, Permutation p, GF2Matrix h, PolynomialGF2mSmallM[] qInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.encField = field.getEncoded();
        this.encGp = goppaPoly.getEncoded();
        this.encP = p.getEncoded();
        this.encH = h.getEncoded();
        this.encqInv = new byte[qInv.length];
        for (int i = 0; i != qInv.length; i++) {
            this.encqInv[i] = qInv[i].getEncoded();
        }
    }

    /* JADX WARN: Type inference failed for: r1v28, types: [byte[], byte[][]] */
    private McElieceCCA2PrivateKey(ASN1Sequence seq) {
        this.oid = (ASN1ObjectIdentifier) seq.getObjectAt(0);
        BigInteger bigN = ((ASN1Integer) seq.getObjectAt(1)).getValue();
        this.n = bigN.intValue();
        BigInteger bigK = ((ASN1Integer) seq.getObjectAt(2)).getValue();
        this.k = bigK.intValue();
        this.encField = ((ASN1OctetString) seq.getObjectAt(3)).getOctets();
        this.encGp = ((ASN1OctetString) seq.getObjectAt(4)).getOctets();
        this.encP = ((ASN1OctetString) seq.getObjectAt(5)).getOctets();
        this.encH = ((ASN1OctetString) seq.getObjectAt(6)).getOctets();
        ASN1Sequence asnQInv = (ASN1Sequence) seq.getObjectAt(7);
        this.encqInv = new byte[asnQInv.size()];
        for (int i = 0; i < asnQInv.size(); i++) {
            this.encqInv[i] = ((ASN1OctetString) asnQInv.getObjectAt(i)).getOctets();
        }
    }

    public ASN1ObjectIdentifier getOID() {
        return this.oid;
    }

    public int getN() {
        return this.n;
    }

    public int getK() {
        return this.k;
    }

    public GF2mField getField() {
        return new GF2mField(this.encField);
    }

    public PolynomialGF2mSmallM getGoppaPoly() {
        return new PolynomialGF2mSmallM(getField(), this.encGp);
    }

    public Permutation getP() {
        return new Permutation(this.encP);
    }

    public GF2Matrix getH() {
        return new GF2Matrix(this.encH);
    }

    public PolynomialGF2mSmallM[] getQInv() {
        PolynomialGF2mSmallM[] qInv = new PolynomialGF2mSmallM[this.encqInv.length];
        GF2mField field = getField();
        for (int i = 0; i < this.encqInv.length; i++) {
            qInv[i] = new PolynomialGF2mSmallM(field, this.encqInv[i]);
        }
        return qInv;
    }

    @Override // org.spongycastle.asn1.ASN1Object, org.spongycastle.asn1.ASN1Encodable
    public ASN1Primitive toASN1Primitive() {
        ASN1EncodableVector v = new ASN1EncodableVector();
        v.add(this.oid);
        v.add(new ASN1Integer(this.n));
        v.add(new ASN1Integer(this.k));
        v.add(new DEROctetString(this.encField));
        v.add(new DEROctetString(this.encGp));
        v.add(new DEROctetString(this.encP));
        v.add(new DEROctetString(this.encH));
        ASN1EncodableVector asnQInv = new ASN1EncodableVector();
        for (int i = 0; i < this.encqInv.length; i++) {
            asnQInv.add(new DEROctetString(this.encqInv[i]));
        }
        v.add(new DERSequence(asnQInv));
        return new DERSequence(v);
    }

    public static McElieceCCA2PrivateKey getInstance(Object o) {
        if (o instanceof McElieceCCA2PrivateKey) {
            return (McElieceCCA2PrivateKey) o;
        }
        if (o != null) {
            return new McElieceCCA2PrivateKey(ASN1Sequence.getInstance(o));
        }
        return null;
    }
}
