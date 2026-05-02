package org.apache.james.mime4j;

import java.io.IOException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/MimeIOException.class */
public class MimeIOException extends IOException {
    private static final long serialVersionUID = 5393613459533735409L;

    public MimeIOException(MimeException cause) {
        super(cause == null ? null : cause.getMessage());
        initCause(cause);
    }

    @Override // java.lang.Throwable
    public MimeException getCause() {
        return (MimeException) super.getCause();
    }
}
