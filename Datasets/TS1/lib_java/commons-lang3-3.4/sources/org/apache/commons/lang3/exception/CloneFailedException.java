package org.apache.commons.lang3.exception;

/* loaded from: commons-lang3-3.4.jar:org/apache/commons/lang3/exception/CloneFailedException.class */
public class CloneFailedException extends RuntimeException {
    private static final long serialVersionUID = 20091223;

    public CloneFailedException(String message) {
        super(message);
    }

    public CloneFailedException(Throwable cause) {
        super(cause);
    }

    public CloneFailedException(String message, Throwable cause) {
        super(message, cause);
    }
}
