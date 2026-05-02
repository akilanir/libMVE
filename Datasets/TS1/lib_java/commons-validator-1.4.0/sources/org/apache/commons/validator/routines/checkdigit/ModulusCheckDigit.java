package org.apache.commons.validator.routines.checkdigit;

import java.io.Serializable;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/ModulusCheckDigit.class */
public abstract class ModulusCheckDigit implements CheckDigit, Serializable {
    private static final long serialVersionUID = 2948962251251528941L;
    private final int modulus;

    protected abstract int weightedValue(int i, int i2, int i3) throws CheckDigitException;

    public ModulusCheckDigit(int modulus) {
        this.modulus = modulus;
    }

    public int getModulus() {
        return this.modulus;
    }

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public boolean isValid(String code) {
        if (code == null || code.length() == 0) {
            return false;
        }
        try {
            int modulusResult = calculateModulus(code, true);
            return modulusResult == 0;
        } catch (CheckDigitException e) {
            return false;
        }
    }

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public String calculate(String code) throws CheckDigitException {
        if (code == null || code.length() == 0) {
            throw new CheckDigitException("Code is missing");
        }
        int modulusResult = calculateModulus(code, false);
        int charValue = (this.modulus - modulusResult) % this.modulus;
        return toCheckDigit(charValue);
    }

    protected int calculateModulus(String code, boolean includesCheckDigit) throws CheckDigitException {
        int total = 0;
        for (int i = 0; i < code.length(); i++) {
            int lth = code.length() + (includesCheckDigit ? 0 : 1);
            int leftPos = i + 1;
            int rightPos = lth - i;
            int charValue = toInt(code.charAt(i), leftPos, rightPos);
            total += weightedValue(charValue, leftPos, rightPos);
        }
        if (total == 0) {
            throw new CheckDigitException("Invalid code, sum is zero");
        }
        return total % this.modulus;
    }

    protected int toInt(char character, int leftPos, int rightPos) throws CheckDigitException {
        if (Character.isDigit(character)) {
            return Character.getNumericValue(character);
        }
        throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(leftPos).append("] = '").append(character).append("'").toString());
    }

    protected String toCheckDigit(int charValue) throws CheckDigitException {
        if (charValue >= 0 && charValue <= 9) {
            return Integer.toString(charValue);
        }
        throw new CheckDigitException(new StringBuffer().append("Invalid Check Digit Value =").append(charValue).toString());
    }

    public static int sumDigits(int number) {
        int total = 0;
        int i = number;
        while (true) {
            int todo = i;
            if (todo > 0) {
                total += todo % 10;
                i = todo / 10;
            } else {
                return total;
            }
        }
    }
}
