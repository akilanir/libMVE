package org.spongycastle.jce.exception;

import java.io.IOException;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/exception/ExtIOException.class */
public class ExtIOException extends IOException implements ExtException {
    private Throwable cause;

    public ExtIOException(String message, Throwable cause) {
        super(message);
        this.cause = cause;
    }

    @Override // java.lang.Throwable, org.spongycastle.jce.exception.ExtException
    public Throwable getCause() {
        return this.cause;
    }
}
