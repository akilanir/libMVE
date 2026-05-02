package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;
import org.spongycastle.pqc.math.linearalgebra.GF2mField;
import org.spongycastle.pqc.math.linearalgebra.Permutation;
import org.spongycastle.pqc.math.linearalgebra.PolynomialGF2mSmallM;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec.class */
public class McElieceCCA2PrivateKeySpec implements KeySpec {
    private String oid;
    private int n;
    private int k;
    private GF2mField field;
    private PolynomialGF2mSmallM goppaPoly;
    private Permutation p;
    private GF2Matrix h;
    private PolynomialGF2mSmallM[] qInv;

    public McElieceCCA2PrivateKeySpec(String oid, int n, int k, GF2mField field, PolynomialGF2mSmallM gp, Permutation p, GF2Matrix h, PolynomialGF2mSmallM[] qInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.field = field;
        this.goppaPoly = gp;
        this.p = p;
        this.h = h;
        this.qInv = qInv;
    }

    public McElieceCCA2PrivateKeySpec(String oid, int n, int k, byte[] encFieldPoly, byte[] encGoppaPoly, byte[] encP, byte[] encH, byte[][] encQInv) {
        this.oid = oid;
        this.n = n;
        this.k = k;
        this.field = new GF2mField(encFieldPoly);
        this.goppaPoly = new PolynomialGF2mSmallM(this.field, encGoppaPoly);
        this.p = new Permutation(encP);
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

    public Permutation getP() {
        return this.p;
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
