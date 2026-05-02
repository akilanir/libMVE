package com.octo.android.robospice.persistence.exception;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/exception/CacheSavingException.class */
public class CacheSavingException extends SpiceException {
    private static final long serialVersionUID = -633402253089445891L;

    public CacheSavingException(String detailMessage) {
        super(detailMessage);
    }

    public CacheSavingException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public CacheSavingException(Throwable throwable) {
        super(throwable);
    }
}
