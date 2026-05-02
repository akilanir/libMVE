package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/SedolCheckDigit.class */
public final class SedolCheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = -8976881621148878443L;
    public static final CheckDigit SEDOL_CHECK_DIGIT = new SedolCheckDigit();
    private static final int[] POSITION_WEIGHT = {1, 3, 1, 7, 3, 9, 1};

    public SedolCheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int calculateModulus(String code, boolean includesCheckDigit) throws CheckDigitException {
        if (code.length() > 7) {
            throw new CheckDigitException(new StringBuffer().append("Invalid Code Length = ").append(code.length()).toString());
        }
        return super.calculateModulus(code, includesCheckDigit);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        return charValue * POSITION_WEIGHT[leftPos - 1];
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int toInt(char character, int leftPos, int rightPos) throws CheckDigitException {
        int charValue = Character.getNumericValue(character);
        if (charValue < 0 || charValue > 35) {
            throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(leftPos).append("] = '").append(charValue).append("'").toString());
        }
        return charValue;
    }
}
