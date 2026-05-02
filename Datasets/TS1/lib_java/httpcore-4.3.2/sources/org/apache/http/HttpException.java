package org.apache.http;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/HttpException.class */
public class HttpException extends Exception {
    private static final long serialVersionUID = -5437299376222011036L;

    public HttpException() {
    }

    public HttpException(String message) {
        super(message);
    }

    public HttpException(String message, Throwable cause) {
        super(message);
        initCause(cause);
    }
}
