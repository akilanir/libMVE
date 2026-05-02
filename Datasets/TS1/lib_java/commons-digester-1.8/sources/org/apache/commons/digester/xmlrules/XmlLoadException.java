package org.apache.commons.digester.xmlrules;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/xmlrules/XmlLoadException.class */
public class XmlLoadException extends RuntimeException {
    private Throwable cause;

    public XmlLoadException(Throwable cause) {
        this(cause.getMessage());
        this.cause = cause;
    }

    public XmlLoadException(String msg) {
        super(msg);
        this.cause = null;
    }

    public XmlLoadException(String msg, Throwable cause) {
        this(msg);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
