package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit.class */
public final class ABANumberCheckDigit extends ModulusCheckDigit {
    private static final long serialVersionUID = -8255937433810380145L;
    public static final CheckDigit ABAN_CHECK_DIGIT = new ABANumberCheckDigit();
    private static final int[] POSITION_WEIGHT = {3, 1, 7};

    public ABANumberCheckDigit() {
        super(10);
    }

    @Override // org.apache.commons.validator.routines.checkdigit.ModulusCheckDigit
    protected int weightedValue(int charValue, int leftPos, int rightPos) {
        int weight = POSITION_WEIGHT[rightPos % 3];
        return charValue * weight;
    }
}
