package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import org.spongycastle.pqc.math.linearalgebra.GF2Matrix;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/McEliecePublicKeySpec.class */
public class McEliecePublicKeySpec implements KeySpec {
    private String oid;
    private int n;
    private int t;
    private GF2Matrix g;

    public McEliecePublicKeySpec(String oid, int n, int t, GF2Matrix g) {
        this.oid = oid;
        this.n = n;
        this.t = t;
        this.g = new GF2Matrix(g);
    }

    public McEliecePublicKeySpec(String oid, int t, int n, byte[] encG) {
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
}
