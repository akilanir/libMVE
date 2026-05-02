package com.nostra13.universalimageloader.core.assist;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/FailReason.class */
public class FailReason {
    private final FailType type;
    private final Throwable cause;

    /* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/assist/FailReason$FailType.class */
    public enum FailType {
        IO_ERROR,
        DECODING_ERROR,
        NETWORK_DENIED,
        OUT_OF_MEMORY,
        UNKNOWN
    }

    public FailReason(FailType type, Throwable cause) {
        this.type = type;
        this.cause = cause;
    }

    public FailType getType() {
        return this.type;
    }

    public Throwable getCause() {
        return this.cause;
    }
}
