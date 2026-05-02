package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec.class */
public class McElieceCCA2PublicKeySpec implements KeySpec {
    private String oid;
    private int n;
    private int t;
    private GF2Matrix matrixG;

    public McElieceCCA2PublicKeySpec(String oid, int n, int t, GF2Matrix matrix) {
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.matrixG = new GF2Matrix(matrix);
    }

    public McElieceCCA2PublicKeySpec(String oid, int n, int t, byte[] encMatrix) {
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.matrixG = new GF2Matrix(encMatrix);
    }

    public int getN() {
        return this.n;
    }

    public int getT() {
        return this.t;
    }

    public GF2Matrix getMatrixG() {
        return this.matrixG;
    }

    public String getOIDString() {
        return this.oid;
    }
}
