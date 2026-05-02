package org.msgpack;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/MessageTypeException.class */
public class MessageTypeException extends RuntimeException {
    public MessageTypeException() {
    }

    public MessageTypeException(String message) {
        super(message);
    }

    public MessageTypeException(String message, Throwable cause) {
        super(message, cause);
    }

    public MessageTypeException(Throwable cause) {
        super(cause);
    }
}
