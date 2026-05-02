package com.google.zxing;

/* loaded from: core-3.2.1.jar:com/google/zxing/ReaderException.class */
public abstract class ReaderException extends Exception {
    protected static final boolean isStackTrace;
    protected static final StackTraceElement[] NO_TRACE;

    static {
        isStackTrace = System.getProperty("surefire.test.class.path") != null;
        NO_TRACE = new StackTraceElement[0];
    }

    ReaderException() {
    }

    ReaderException(Throwable cause) {
        super(cause);
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        return null;
    }
}
