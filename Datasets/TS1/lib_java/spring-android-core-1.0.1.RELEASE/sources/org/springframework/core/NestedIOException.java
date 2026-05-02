package org.springframework.core;

import java.io.IOException;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/NestedIOException.class */
public class NestedIOException extends IOException {
    private static final long serialVersionUID = 1;

    static {
        NestedExceptionUtils.class.getName();
    }

    public NestedIOException(String msg) {
        super(msg);
    }

    public NestedIOException(String msg, Throwable cause) {
        super(msg);
        initCause(cause);
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        return NestedExceptionUtils.buildMessage(super.getMessage(), getCause());
    }
}
