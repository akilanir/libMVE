package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/LuhnCheckDigit.class */
public final class LuhnCheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = -2976900113942875999L;
    public static final CheckDigit LUHN_CHECK_DIGIT = new LuhnCheckDigit();
    private static final int[] POSITION_WEIGHT = {2, 1};

    public LuhnCheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        int weight = POSITION_WEIGHT[rightPos % 2];
        int weightedValue = charValue * weight;
        return weightedValue > 9 ? weightedValue - 9 : weightedValue;
    }
}
