package org.spongycastle.pqc.math.ntru.polynomial;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/math/ntru/polynomial/TernaryPolynomial.class */
public interface TernaryPolynomial extends Polynomial {
    @Override // org.spongycastle.pqc.math.ntru.polynomial.Polynomial
    IntegerPolynomial mult(IntegerPolynomial integerPolynomial);

    int[] getOnes();

    int[] getNegOnes();

    int size();

    void clear();
}
