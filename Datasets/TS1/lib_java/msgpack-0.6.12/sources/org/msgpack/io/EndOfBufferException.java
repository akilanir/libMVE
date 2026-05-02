package org.msgpack.io;

import java.io.EOFException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/EndOfBufferException.class */
public class EndOfBufferException extends EOFException {
    public EndOfBufferException() {
    }

    public EndOfBufferException(String s) {
        super(s);
    }
}
