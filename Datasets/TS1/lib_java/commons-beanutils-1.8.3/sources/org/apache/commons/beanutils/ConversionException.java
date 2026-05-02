package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConversionException.class */
public class ConversionException extends RuntimeException {
    protected Throwable cause;

    public ConversionException(String message) {
        super(message);
        this.cause = null;
    }

    public ConversionException(String message, Throwable cause) {
        super(message);
        this.cause = null;
        this.cause = cause;
    }

    public ConversionException(Throwable cause) {
        super(cause.getMessage());
        this.cause = null;
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
