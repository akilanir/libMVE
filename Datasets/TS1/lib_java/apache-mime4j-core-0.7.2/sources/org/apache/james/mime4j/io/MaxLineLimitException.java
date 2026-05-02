package org.apache.james.mime4j.io;

import java.io.IOException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/io/MaxLineLimitException.class */
public class MaxLineLimitException extends IOException {
    private static final long serialVersionUID = 1855987166990764426L;

    public MaxLineLimitException(String message) {
        super(message);
    }
}
