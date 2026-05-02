package org.apache.commons.validator.routines.checkdigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/checkdigit/CheckDigitException.class */
public class CheckDigitException extends Exception {
    private static final long serialVersionUID = -3519894732624685477L;

    public CheckDigitException() {
    }

    public CheckDigitException(String msg) {
        super(msg);
    }

    public CheckDigitException(String msg, Throwable cause) {
        super(msg, cause);
    }
}
