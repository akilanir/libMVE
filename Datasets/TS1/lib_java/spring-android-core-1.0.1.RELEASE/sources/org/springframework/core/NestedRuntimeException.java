package org.springframework.core;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/NestedRuntimeException.class */
public abstract class NestedRuntimeException extends RuntimeException {
    private static final long serialVersionUID = 5439915454935047936L;

    static {
        NestedExceptionUtils.class.getName();
    }

    public NestedRuntimeException(String msg) {
        super(msg);
    }

    public NestedRuntimeException(String msg, Throwable cause) {
        super(msg, cause);
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        return NestedExceptionUtils.buildMessage(super.getMessage(), getCause());
    }

    public Throwable getRootCause() {
        Throwable rootCause = null;
        Throwable cause = getCause();
        while (true) {
            Throwable cause2 = cause;
            if (cause2 == null || cause2 == rootCause) {
                break;
            }
            rootCause = cause2;
            cause = cause2.getCause();
        }
        return rootCause;
    }

    public Throwable getMostSpecificCause() {
        Throwable rootCause = getRootCause();
        return rootCause != null ? rootCause : this;
    }

    public boolean contains(Class<?> exType) {
        if (exType == null) {
            return false;
        }
        if (exType.isInstance(this)) {
            return true;
        }
        Throwable cause = getCause();
        if (cause == this) {
            return false;
        }
        if (cause instanceof NestedRuntimeException) {
            return ((NestedRuntimeException) cause).contains(exType);
        }
        while (cause != null) {
            if (exType.isInstance(cause)) {
                return true;
            }
            if (cause.getCause() != cause) {
                cause = cause.getCause();
            } else {
                return false;
            }
        }
        return false;
    }
}
