package org.spongycastle.pqc.math.ntru.polynomial;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/math/ntru/polynomial/Polynomial.class */
public interface Polynomial {
    IntegerPolynomial mult(IntegerPolynomial integerPolynomial);

    IntegerPolynomial mult(IntegerPolynomial integerPolynomial, int i);

    IntegerPolynomial toIntegerPolynomial();

    BigIntPolynomial mult(BigIntPolynomial bigIntPolynomial);
}
