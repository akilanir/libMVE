package com.drew.lang;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import java.io.Serializable;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/lang/Rational.class */
public class Rational extends Number implements Serializable {
    private static final long serialVersionUID = 510688928138848770L;
    private final long _numerator;
    private final long _denominator;

    public Rational(long numerator, long denominator) {
        this._numerator = numerator;
        this._denominator = denominator;
    }

    @Override // java.lang.Number
    public double doubleValue() {
        if (this._numerator == 0) {
            return 0.0d;
        }
        return this._numerator / this._denominator;
    }

    @Override // java.lang.Number
    public float floatValue() {
        if (this._numerator == 0) {
            return 0.0f;
        }
        return this._numerator / this._denominator;
    }

    @Override // java.lang.Number
    public final byte byteValue() {
        return (byte) doubleValue();
    }

    @Override // java.lang.Number
    public final int intValue() {
        return (int) doubleValue();
    }

    @Override // java.lang.Number
    public final long longValue() {
        return (long) doubleValue();
    }

    @Override // java.lang.Number
    public final short shortValue() {
        return (short) doubleValue();
    }

    public final long getDenominator() {
        return this._denominator;
    }

    public final long getNumerator() {
        return this._numerator;
    }

    @NotNull
    public Rational getReciprocal() {
        return new Rational(this._denominator, this._numerator);
    }

    public boolean isInteger() {
        return this._denominator == 1 || (this._denominator != 0 && this._numerator % this._denominator == 0) || (this._denominator == 0 && this._numerator == 0);
    }

    @NotNull
    public String toString() {
        return this._numerator + "/" + this._denominator;
    }

    @NotNull
    public String toSimpleString(boolean allowDecimal) {
        if (this._denominator == 0 && this._numerator != 0) {
            return toString();
        }
        if (isInteger()) {
            return Integer.toString(intValue());
        }
        if (this._numerator != 1 && this._denominator % this._numerator == 0) {
            long newDenominator = this._denominator / this._numerator;
            return new Rational(1L, newDenominator).toSimpleString(allowDecimal);
        }
        Rational simplifiedInstance = getSimplifiedInstance();
        if (allowDecimal) {
            String doubleString = Double.toString(simplifiedInstance.doubleValue());
            if (doubleString.length() < 5) {
                return doubleString;
            }
        }
        return simplifiedInstance.toString();
    }

    private boolean tooComplexForSimplification() {
        double maxPossibleCalculations = ((Math.min(this._denominator, this._numerator) - 1) / 5.0d) + 2.0d;
        return maxPossibleCalculations > 1000.0d;
    }

    public boolean equals(@Nullable Object obj) {
        if (obj == null || !(obj instanceof Rational)) {
            return false;
        }
        Rational that = (Rational) obj;
        return doubleValue() == that.doubleValue();
    }

    public int hashCode() {
        return (23 * ((int) this._denominator)) + ((int) this._numerator);
    }

    @NotNull
    public Rational getSimplifiedInstance() {
        if (tooComplexForSimplification()) {
            return this;
        }
        for (int factor = 2; factor <= Math.min(this._denominator, this._numerator); factor++) {
            if ((factor % 2 != 0 || factor <= 2) && ((factor % 5 != 0 || factor <= 5) && this._denominator % factor == 0 && this._numerator % factor == 0)) {
                return new Rational(this._numerator / factor, this._denominator / factor);
            }
        }
        return this;
    }
}
