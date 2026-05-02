package org.msgpack.unpacker;

import java.io.IOException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/SizeLimitException.class */
public class SizeLimitException extends IOException {
    public SizeLimitException() {
    }

    public SizeLimitException(String message) {
        super(message);
    }

    public SizeLimitException(String message, Throwable cause) {
        super(message, cause);
    }

    public SizeLimitException(Throwable cause) {
        super(cause);
    }
}
