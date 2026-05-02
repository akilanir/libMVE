package org.apache.commons.validator.routines.checkdigit;

import java.io.Serializable;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/IBANCheckDigit.class */
public final class IBANCheckDigit implements CheckDigit, Serializable {
    private static final long serialVersionUID = -3600191725934382801L;
    public static final CheckDigit IBAN_CHECK_DIGIT = new IBANCheckDigit();
    private static final long MAX = 999999999;
    private static final long MODULUS = 97;

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public boolean isValid(String code) {
        if (code == null || code.length() < 5) {
            return false;
        }
        try {
            int modulusResult = calculateModulus(code);
            return modulusResult == 1;
        } catch (CheckDigitException e) {
            return false;
        }
    }

    @Override // org.apache.commons.validator.routines.checkdigit.CheckDigit
    public String calculate(String code) throws CheckDigitException {
        if (code == null || code.length() < 5) {
            throw new CheckDigitException(new StringBuffer().append("Invalid Code length=").append(code == null ? 0 : code.length()).toString());
        }
        int modulusResult = calculateModulus(code);
        int charValue = 98 - modulusResult;
        String checkDigit = Integer.toString(charValue);
        return charValue > 9 ? checkDigit : new StringBuffer().append("0").append(checkDigit).toString();
    }

    private int calculateModulus(String code) throws CheckDigitException {
        String reformattedCode = new StringBuffer().append(code.substring(4)).append(code.substring(0, 4)).toString();
        long total = 0;
        for (int i = 0; i < reformattedCode.length(); i++) {
            int charValue = Character.getNumericValue(reformattedCode.charAt(i));
            if (charValue < 0 || charValue > 35) {
                throw new CheckDigitException(new StringBuffer().append("Invalid Character[").append(i).append("] = '").append(charValue).append("'").toString());
            }
            total = (charValue > 9 ? total * 100 : total * 10) + charValue;
            if (total > MAX) {
                total %= MODULUS;
            }
        }
        return (int) (total % MODULUS);
    }
}
