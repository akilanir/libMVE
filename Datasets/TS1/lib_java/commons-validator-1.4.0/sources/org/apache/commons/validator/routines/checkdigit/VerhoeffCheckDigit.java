package org.apache.commons.validator.routines.checkdigit;

import java.io.Serializable;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit.class */
public final class VerhoeffCheckDigit implements CheckDigit, Serializable {
    private static final long serialVersionUID = 4138993995483695178L;
    public static final CheckDigit VERHOEFF_CHECK_DIGIT = new VerhoeffCheckDigit();
    private static final int[][] D_TABLE = {new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, new int[]{1, 2, 3, 4, 0, 6, 7, 8, 9, 5}, new int[]{2, 3, 4, 0, 1, 7, 8, 9, 5, 6}, new int[]{3, 4, 0, 1, 2, 8, 9, 5, 6, 7}, new int[]{4, 0, 1, 2, 3, 9, 5, 6, 7, 8}, new int[]{5, 9, 8, 7, 6, 0, 4, 3, 2, 1}, new int[]{6, 5, 9, 8, 7, 1, 0, 4, 3, 2}, new int[]{7, 6, 5, 9, 8, 2, 1, 0, 4, 3}, new int[]{8, 7, 6, 5, 9, 3, 2, 1, 0, 4}, new int[]{9, 8, 7, 6, 5, 4, 3, 2, 1, 0}};
    private static final int[][] P_TABLE = {new int[]{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, new int[]{1, 5, 7, 6, 2, 8, 3, 0, 9, 4}, new int[]{5, 8, 0, 3, 7, 9, 6, 1, 4, 2}, new int[]{8, 9, 1, 6, 0, 4, 3, 5, 2, 7}, new int[]{9, 4, 5, 3, 1, 2, 6, 8, 7, 0}, new int[]{4, 2, 8, 6, 5, 7, 3, 9, 0, 1}, new int[]{2, 7, 9, 3, 8, 0, 6, 4, 1, 5}, new int[]{7, 0, 4, 6, 9, 1, 3, 2, 5, 8}};
    private static final int[] INV_TABLE = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public boolean isValid(String code) {
        if (code == null || code.length() == 0) {
            return false;
        }
        try {
            return calculateChecksum(code, true) == 0;
        } catch (CheckDigitException e) {
            return false;
        }
    }

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public String calculate(String code) throws CheckDigitException {
        if (code == null || code.length() == 0) {
            throw new CheckDigitException("Code is missing");
        }
        int checksum = calculateChecksum(code, false);
        return Integer.toString(INV_TABLE[checksum]);
    }

    private int calculateChecksum(String code, boolean includesCheckDigit) throws CheckDigitException {
        int checksum = 0;
        for (int i = 0; i < code.length(); i++) {
            int idx = code.length() - (i + 1);
            int num = Character.getNumericValue(code.charAt(idx));
            if (num < 0 || num > 9) {
                throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(i).append("] = '").append((int) code.charAt(idx)).append("'").toString());
            }
            int pos = includesCheckDigit ? i : i + 1;
            checksum = D_TABLE[checksum][P_TABLE[pos % 8][num]];
        }
        return checksum;
    }
}
