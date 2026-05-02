package org.apache.commons.digester.xmlrules;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/DigesterLoadingException.class */
public class DigesterLoadingException extends Exception {
    private Throwable cause;

    public DigesterLoadingException(String msg) {
        super(msg);
        this.cause = null;
    }

    public DigesterLoadingException(Throwable cause) {
        this(cause.getMessage());
        this.cause = cause;
    }

    public DigesterLoadingException(String msg, Throwable cause) {
        this(msg);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
