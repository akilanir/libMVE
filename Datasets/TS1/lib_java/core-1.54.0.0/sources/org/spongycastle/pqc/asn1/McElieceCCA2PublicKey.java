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

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/asn1/McElieceCCA2PublicKey.class */
public class McElieceCCA2PublicKey extends ASN1Object {
    private ASN1ObjectIdentifier oid;
    private int n;
    private int t;
    private byte[] matrixG;

    public McElieceCCA2PublicKey(ASN1ObjectIdentifier oid, int n, int t, GF2Matrix g) {
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.matrixG = g.getEncoded();
    }

    private McElieceCCA2PublicKey(ASN1Sequence seq) {
        this.oid = (ASN1ObjectIdentifier) seq.getObjectAt(0);
        BigInteger bigN = ((ASN1Integer) seq.getObjectAt(1)).getValue();
        this.n = bigN.intValue();
        BigInteger bigT = ((ASN1Integer) seq.getObjectAt(2)).getValue();
        this.t = bigT.intValue();
        this.matrixG = ((ASN1OctetString) seq.getObjectAt(3)).getOctets();
    }

    public ASN1ObjectIdentifier getOID() {
        return this.oid;
    }

    public int getN() {
        return this.n;
    }

    public int getT() {
        return this.t;
    }

    public GF2Matrix getG() {
        return new GF2Matrix(this.matrixG);
    }

    @Override // org.spongycastle.asn1.ASN1Object, org.spongycastle.asn1.ASN1Encodable
    public ASN1Primitive toASN1Primitive() {
        ASN1EncodableVector v = new ASN1EncodableVector();
        v.add(this.oid);
        v.add(new ASN1Integer(this.n));
        v.add(new ASN1Integer(this.t));
        v.add(new DEROctetString(this.matrixG));
        return new DERSequence(v);
    }

    public static McElieceCCA2PublicKey getInstance(Object o) {
        if (o instanceof McElieceCCA2PublicKey) {
            return (McElieceCCA2PublicKey) o;
        }
        if (o != null) {
            return new McElieceCCA2PublicKey(ASN1Sequence.getInstance(o));
        }
        return null;
    }
}
