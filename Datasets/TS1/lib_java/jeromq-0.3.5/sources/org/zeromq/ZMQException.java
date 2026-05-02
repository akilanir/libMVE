package org.zeromq;

import zmq.ZError;

/* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQException.class */
public class ZMQException extends RuntimeException {
    private static final long serialVersionUID = 5957233088499712341L;
    private final int code;

    /* loaded from: jeromq-0.3.5.jar:org/zeromq/ZMQException$IOException.class */
    public static class IOException extends RuntimeException {
        private static final long serialVersionUID = 8440355423370109164L;

        public IOException(java.io.IOException cause) {
            super(cause);
        }
    }

    public ZMQException(int errno) {
        super("Errno " + errno);
        this.code = errno;
    }

    public ZMQException(String message, int errno) {
        super(message);
        this.code = errno;
    }

    public ZMQException(ZMQException cause) {
        super(cause.getMessage(), cause);
        this.code = cause.code;
    }

    public int getErrorCode() {
        return this.code;
    }

    @Override // java.lang.Throwable
    public String toString() {
        return super.toString() + " : " + ZError.toString(this.code);
    }
}
