package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;
import org.spongycastle.pqc.math.linearalgebra.GF2mField;
import org.spongycastle.pqc.math.linearalgebra.Permutation;
import org.spongycastle.pqc.math.linearalgebra.PolynomialGF2mSmallM;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/McEliecePrivateKeySpec.class */
public class McEliecePrivateKeySpec implements KeySpec {
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

    public McEliecePrivateKeySpec(String oid, int n, int k, GF2mField field, PolynomialGF2mSmallM goppaPoly, GF2Matrix sInv, Permutation p1, Permutation p2, GF2Matrix h, PolynomialGF2mSmallM[] qInv) {
        this.oid = oid;
        this.k = k;
        this.n = n;
        this.field = field;
        this.goppaPoly = goppaPoly;
        this.sInv = sInv;
        this.p1 = p1;
        this.p2 = p2;
        this.h = h;
        this.qInv = qInv;
    }

    public McEliecePrivateKeySpec(String oid, int n, int k, byte[] encField, byte[] encGoppaPoly, byte[] encSInv, byte[] encP1, byte[] encP2, byte[] encH, byte[][] encQInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.field = new GF2mField(encField);
        this.goppaPoly = new PolynomialGF2mSmallM(this.field, encGoppaPoly);
        this.sInv = new GF2Matrix(encSInv);
        this.p1 = new Permutation(encP1);
        this.p2 = new Permutation(encP2);
        this.h = new GF2Matrix(encH);
        this.qInv = new PolynomialGF2mSmallM[encQInv.length];
        for (int i = 0; i < encQInv.length; i++) {
            this.qInv[i] = new PolynomialGF2mSmallM(this.field, encQInv[i]);
        }
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
}
