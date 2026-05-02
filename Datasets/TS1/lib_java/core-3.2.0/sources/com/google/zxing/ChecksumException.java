package com.google.zxing;

/* loaded from: core-3.2.0.jar:com/google/zxing/ChecksumException.class */
public final class ChecksumException extends ReaderException {
    private static final ChecksumException instance = new ChecksumException();

    private ChecksumException() {
    }

    private ChecksumException(Throwable cause) {
        super(cause);
    }

    public static ChecksumException getChecksumInstance() {
        if (isStackTrace) {
            return new ChecksumException();
        }
        return instance;
    }

    public static ChecksumException getChecksumInstance(Throwable cause) {
        if (isStackTrace) {
            return new ChecksumException(cause);
        }
        return instance;
    }
}
