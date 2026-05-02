package com.google.android.exoplayer.drm;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/UnsupportedDrmException.class */
public final class UnsupportedDrmException extends Exception {
    public static final int REASON_UNSUPPORTED_SCHEME = 1;
    public static final int REASON_INSTANTIATION_ERROR = 2;
    public final int reason;

    public UnsupportedDrmException(int reason) {
        this.reason = reason;
    }

    public UnsupportedDrmException(int reason, Exception cause) {
        super(cause);
        this.reason = reason;
    }
}
