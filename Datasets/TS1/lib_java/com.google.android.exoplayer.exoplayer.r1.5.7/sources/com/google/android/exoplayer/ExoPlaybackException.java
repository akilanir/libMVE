package com.google.android.exoplayer;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/ExoPlaybackException.class */
public final class ExoPlaybackException extends Exception {
    public final boolean caughtAtTopLevel;

    public ExoPlaybackException(String message) {
        super(message);
        this.caughtAtTopLevel = false;
    }

    public ExoPlaybackException(Throwable cause) {
        super(cause);
        this.caughtAtTopLevel = false;
    }

    public ExoPlaybackException(String message, Throwable cause) {
        super(message, cause);
        this.caughtAtTopLevel = false;
    }

    ExoPlaybackException(Throwable cause, boolean caughtAtTopLevel) {
        super(cause);
        this.caughtAtTopLevel = caughtAtTopLevel;
    }
}
