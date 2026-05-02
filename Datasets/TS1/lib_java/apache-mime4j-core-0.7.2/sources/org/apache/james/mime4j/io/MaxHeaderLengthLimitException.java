package org.apache.james.mime4j.io;

import org.apache.james.mime4j.MimeException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/MaxHeaderLengthLimitException.class */
public class MaxHeaderLengthLimitException extends MimeException {
    private static final long serialVersionUID = 8924290744274769913L;

    public MaxHeaderLengthLimitException(String message) {
        super(message);
    }
}
