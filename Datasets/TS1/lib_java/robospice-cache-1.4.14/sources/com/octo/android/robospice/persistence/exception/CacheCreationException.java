package com.octo.android.robospice.persistence.exception;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/exception/CacheCreationException.class */
public class CacheCreationException extends SpiceException {
    private static final long serialVersionUID = 4623215328644622276L;

    public CacheCreationException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public CacheCreationException(String detailMessage) {
        super(detailMessage);
    }

    public CacheCreationException(Throwable throwable) {
        super(throwable);
    }
}
