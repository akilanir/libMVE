package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit.class */
public final class CUSIPCheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = 666941918490152456L;
    public static final CheckDigit CUSIP_CHECK_DIGIT = new CUSIPCheckDigit();
    private static final int[] POSITION_WEIGHT = {2, 1};

    public CUSIPCheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int toInt(char character, int leftPos, int rightPos) throws CheckDigitException {
        int charValue = Character.getNumericValue(character);
        if (charValue < 0 || charValue > 35) {
            throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(leftPos).append("] = '").append(charValue).append("'").toString());
        }
        return charValue;
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        int weight = POSITION_WEIGHT[rightPos % 2];
        int weightedValue = charValue * weight;
        return ModulusCheckDigit.sumDigits(weightedValue);
    }
}
