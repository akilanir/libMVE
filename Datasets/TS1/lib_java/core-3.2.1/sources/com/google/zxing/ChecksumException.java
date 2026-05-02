package com.google.zxing;

/* loaded from: core-3.2.1.jar:com/google/zxing/ChecksumException.class */
public final class ChecksumException extends ReaderException {
    private static final ChecksumException INSTANCE = new ChecksumException();

    static {
        INSTANCE.setStackTrace(NO_TRACE);
    }

    private ChecksumException() {
    }

    private ChecksumException(Throwable cause) {
        super(cause);
    }

    public static ChecksumException getChecksumInstance() {
        return isStackTrace ? new ChecksumException() : INSTANCE;
    }

    public static ChecksumException getChecksumInstance(Throwable cause) {
        return isStackTrace ? new ChecksumException(cause) : INSTANCE;
    }
}
