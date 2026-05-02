package org.spongycastle.pqc.crypto.mceliece;

import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/mceliece/McElieceCCA2PublicKeyParameters.class */
public class McElieceCCA2PublicKeyParameters extends McElieceCCA2KeyParameters {
    private String oid;
    private int n;
    private int t;
    private GF2Matrix matrixG;

    public McElieceCCA2PublicKeyParameters(String oid, int n, int t, GF2Matrix matrix, McElieceCCA2Parameters params) {
        super(false, params);
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.matrixG = new GF2Matrix(matrix);
    }

    public McElieceCCA2PublicKeyParameters(String oid, int n, int t, byte[] encMatrix, McElieceCCA2Parameters params) {
        super(false, params);
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

    public int getK() {
        return this.matrixG.getNumRows();
    }

    public String getOIDString() {
        return this.oid;
    }
}
