package org.spongycastle.pqc.crypto.mceliece;

import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/mceliece/McEliecePublicKeyParameters.class */
public class McEliecePublicKeyParameters extends McElieceKeyParameters {
    private String oid;
    private int n;
    private int t;
    private GF2Matrix g;

    public McEliecePublicKeyParameters(String oid, int n, int t, GF2Matrix g, McElieceParameters params) {
        super(false, params);
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.g = new GF2Matrix(g);
    }

    public McEliecePublicKeyParameters(String oid, int t, int n, byte[] encG, McElieceParameters params) {
        super(false, params);
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.g = new GF2Matrix(encG);
    }

    public int getN() {
        return this.n;
    }

    public int getT() {
        return this.t;
    }

    public GF2Matrix getG() {
        return this.g;
    }

    public String getOIDString() {
        return this.oid;
    }

    public int getK() {
        return this.g.getNumRows();
    }
}
