package com.google.zxing;

/* loaded from: core-3.2.1.jar:com/google/zxing/FormatException.class */
public final class FormatException extends ReaderException {
    private static final FormatException INSTANCE = new FormatException();

    static {
        INSTANCE.setStackTrace(NO_TRACE);
    }

    private FormatException() {
    }

    private FormatException(Throwable cause) {
        super(cause);
    }

    public static FormatException getFormatInstance() {
        return isStackTrace ? new FormatException() : INSTANCE;
    }

    public static FormatException getFormatInstance(Throwable cause) {
        return isStackTrace ? new FormatException(cause) : INSTANCE;
    }
}
