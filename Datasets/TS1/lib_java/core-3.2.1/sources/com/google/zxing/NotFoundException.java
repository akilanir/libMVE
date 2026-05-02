package com.google.zxing;

/* loaded from: core-3.2.1.jar:com/google/zxing/NotFoundException.class */
public final class NotFoundException extends ReaderException {
    private static final NotFoundException INSTANCE = new NotFoundException();

    static {
        INSTANCE.setStackTrace(NO_TRACE);
    }

    private NotFoundException() {
    }

    public static NotFoundException getNotFoundInstance() {
        return INSTANCE;
    }
}
