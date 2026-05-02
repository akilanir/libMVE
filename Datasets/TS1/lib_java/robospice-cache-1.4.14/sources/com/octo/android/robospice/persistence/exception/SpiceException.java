package com.octo.android.robospice.persistence.exception;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/exception/SpiceException.class */
public class SpiceException extends Exception {
    private static final long serialVersionUID = 4494147890739338461L;

    public SpiceException(String detailMessage) {
        super(detailMessage);
    }

    public SpiceException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public SpiceException(Throwable throwable) {
        super(throwable);
    }
}
