package com.google.zxing;

/* loaded from: core-3.2.0.jar:com/google/zxing/NotFoundException.class */
public final class NotFoundException extends ReaderException {
    private static final NotFoundException instance = new NotFoundException();

    private NotFoundException() {
    }

    public static NotFoundException getNotFoundInstance() {
        return instance;
    }
}
