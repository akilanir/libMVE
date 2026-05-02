package org.spongycastle.pqc.jcajce.spec;

import java.security.InvalidParameterException;
import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.pqc.math.linearalgebra.PolynomialRingGF2;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/ECCKeyGenParameterSpec.class */
public class ECCKeyGenParameterSpec implements AlgorithmParameterSpec {
    public static final int DEFAULT_M = 11;
    public static final int DEFAULT_T = 50;
    private int m;
    private int t;
    private int n;
    private int fieldPoly;

    public ECCKeyGenParameterSpec() {
        this(11, 50);
    }

    public ECCKeyGenParameterSpec(int keysize) throws InvalidParameterException {
        if (keysize < 1) {
            throw new InvalidParameterException("key size must be positive");
        }
        this.m = 0;
        this.n = 1;
        while (this.n < keysize) {
            this.n <<= 1;
            this.m++;
        }
        this.t = this.n >>> 1;
        this.t /= this.m;
        this.fieldPoly = PolynomialRingGF2.getIrreduciblePolynomial(this.m);
    }

    public ECCKeyGenParameterSpec(int m, int t) throws InvalidParameterException {
        if (m < 1) {
            throw new InvalidParameterException("m must be positive");
        }
        if (m > 32) {
            throw new InvalidParameterException("m is too large");
        }
        this.m = m;
        this.n = 1 << m;
        if (t < 0) {
            throw new InvalidParameterException("t must be positive");
        }
        if (t > this.n) {
            throw new InvalidParameterException("t must be less than n = 2^m");
        }
        this.t = t;
        this.fieldPoly = PolynomialRingGF2.getIrreduciblePolynomial(m);
    }

    public ECCKeyGenParameterSpec(int m, int t, int poly) throws InvalidParameterException {
        this.m = m;
        if (m < 1) {
            throw new InvalidParameterException("m must be positive");
        }
        if (m > 32) {
            throw new InvalidParameterException(" m is too large");
        }
        this.n = 1 << m;
        this.t = t;
        if (t < 0) {
            throw new InvalidParameterException("t must be positive");
        }
        if (t > this.n) {
            throw new InvalidParameterException("t must be less than n = 2^m");
        }
        if (PolynomialRingGF2.degree(poly) == m && PolynomialRingGF2.isIrreducible(poly)) {
            this.fieldPoly = poly;
            return;
        }
        throw new InvalidParameterException("polynomial is not a field polynomial for GF(2^m)");
    }

    public int getM() {
        return this.m;
    }

    public int getN() {
        return this.n;
    }

    public int getT() {
        return this.t;
    }

    public int getFieldPoly() {
        return this.fieldPoly;
    }
}
