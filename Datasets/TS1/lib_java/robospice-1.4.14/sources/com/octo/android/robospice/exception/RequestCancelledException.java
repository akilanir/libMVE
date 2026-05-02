package com.octo.android.robospice.exception;

import com.octo.android.robospice.persistence.exception.SpiceException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/exception/RequestCancelledException.class */
public class RequestCancelledException extends SpiceException {
    private static final long serialVersionUID = 5790006264835400721L;

    public RequestCancelledException(String detailMessage) {
        super(detailMessage);
    }

    public RequestCancelledException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public RequestCancelledException(Throwable throwable) {
        super(throwable);
    }
}
