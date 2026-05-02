package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/EAN13CheckDigit.class */
public final class EAN13CheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = 1726347093230424107L;
    public static final CheckDigit EAN13_CHECK_DIGIT = new EAN13CheckDigit();
    private static final int[] POSITION_WEIGHT = {3, 1};

    public EAN13CheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        int weight = POSITION_WEIGHT[rightPos % 2];
        return charValue * weight;
    }
}
