package org.apache.james.mime4j;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/MimeException.class */
public class MimeException extends Exception {
    private static final long serialVersionUID = 8352821278714188542L;

    public MimeException(String message) {
        super(message);
    }

    public MimeException(Throwable cause) {
        super(cause);
    }

    public MimeException(String message, Throwable cause) {
        super(message, cause);
    }
}
