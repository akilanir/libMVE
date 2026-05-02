package org.spongycastle.util.io.pem;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/io/pem/PemGenerationException.class */
public class PemGenerationException extends IOException {
    private Throwable cause;

    public PemGenerationException(String message, Throwable cause) {
        super(message);
        this.cause = cause;
    }

    public PemGenerationException(String message) {
        super(message);
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }
}
