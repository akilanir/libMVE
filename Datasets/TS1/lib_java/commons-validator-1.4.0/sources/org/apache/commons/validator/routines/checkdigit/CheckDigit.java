package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/CheckDigit.class */
public interface CheckDigit {
    String calculate(String str) throws CheckDigitException;

    boolean isValid(String str);
}
