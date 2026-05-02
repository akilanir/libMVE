package org.spongycastle.crypto.io;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/io/InvalidCipherTextIOException.class */
public class InvalidCipherTextIOException extends CipherIOException {
    private static final long serialVersionUID = 1;

    public InvalidCipherTextIOException(String message, Throwable cause) {
        super(message, cause);
    }
}
