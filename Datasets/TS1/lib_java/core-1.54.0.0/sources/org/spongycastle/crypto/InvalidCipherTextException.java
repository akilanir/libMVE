package org.spongycastle.crypto;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/InvalidCipherTextException.class */
public class InvalidCipherTextException extends CryptoException {
    public InvalidCipherTextException() {
    }

    public InvalidCipherTextException(String message) {
        super(message);
    }

    public InvalidCipherTextException(String message, Throwable cause) {
        super(message, cause);
    }
}
