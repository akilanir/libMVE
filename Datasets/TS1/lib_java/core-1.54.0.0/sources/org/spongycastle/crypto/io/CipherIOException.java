package org.spongycastle.crypto.io;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/io/CipherIOException.class */
public class CipherIOException extends IOException {
    private static final long serialVersionUID = 1;
    private final Throwable cause;

    public CipherIOException(String message, Throwable cause) {
        super(message);
        this.cause = cause;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
