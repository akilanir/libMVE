package com.octo.android.robospice.exception;

import com.octo.android.robospice.persistence.exception.SpiceException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/exception/NetworkException.class */
public class NetworkException extends SpiceException {
    private static final long serialVersionUID = 5751706264835400721L;

    public NetworkException(String detailMessage) {
        super(detailMessage);
    }

    public NetworkException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public NetworkException(Throwable throwable) {
        super(throwable);
    }
}
