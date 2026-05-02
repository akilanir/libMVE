package org.apache.james.mime4j.io;

import org.apache.james.mime4j.MimeException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/MaxHeaderLimitException.class */
public class MaxHeaderLimitException extends MimeException {
    private static final long serialVersionUID = 2154269045186186769L;

    public MaxHeaderLimitException(String message) {
        super(message);
    }
}
