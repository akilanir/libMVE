package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/ISINCheckDigit.class */
public final class ISINCheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = -1239211208101323599L;
    public static final CheckDigit ISIN_CHECK_DIGIT = new ISINCheckDigit();
    private static final int[] POSITION_WEIGHT = {2, 1};

    public ISINCheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int calculateModulus(String code, boolean includesCheckDigit) throws CheckDigitException {
        StringBuffer transformed = new StringBuffer(code.length() * 2);
        for (int i = 0; i < code.length(); i++) {
            int charValue = Character.getNumericValue(code.charAt(i));
            if (charValue < 0 || charValue > 35) {
                throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(i + 1).append("] = '").append(charValue).append("'").toString());
            }
            transformed.append(charValue);
        }
        return super.calculateModulus(transformed.toString(), includesCheckDigit);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        int weight = POSITION_WEIGHT[rightPos % 2];
        int weightedValue = charValue * weight;
        return ModulusCheckDigit.sumDigits(weightedValue);
    }
}
