package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.FormatException;

/* loaded from: core-3.2.0.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedNumeric.class */
final class DecodedNumeric extends DecodedObject {
    private final int firstDigit;
    private final int secondDigit;
    static final int FNC1 = 10;

    DecodedNumeric(int newPosition, int firstDigit, int secondDigit) throws FormatException {
        super(newPosition);
        if (firstDigit < 0 || firstDigit > FNC1 || secondDigit < 0 || secondDigit > FNC1) {
            throw FormatException.getFormatInstance();
        }
        this.firstDigit = firstDigit;
        this.secondDigit = secondDigit;
    }

    int getFirstDigit() {
        return this.firstDigit;
    }

    int getSecondDigit() {
        return this.secondDigit;
    }

    int getValue() {
        return (this.firstDigit * FNC1) + this.secondDigit;
    }

    boolean isFirstDigitFNC1() {
        return this.firstDigit == FNC1;
    }

    boolean isSecondDigitFNC1() {
        return this.secondDigit == FNC1;
    }

    boolean isAnyFNC1() {
        return this.firstDigit == FNC1 || this.secondDigit == FNC1;
    }
}
