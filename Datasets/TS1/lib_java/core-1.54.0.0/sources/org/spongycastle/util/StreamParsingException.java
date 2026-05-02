package org.spongycastle.util;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/StreamParsingException.class */
public class StreamParsingException extends Exception {
    Throwable _e;

    public StreamParsingException(String message, Throwable e) {
        super(message);
        this._e = e;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this._e;
    }
}
