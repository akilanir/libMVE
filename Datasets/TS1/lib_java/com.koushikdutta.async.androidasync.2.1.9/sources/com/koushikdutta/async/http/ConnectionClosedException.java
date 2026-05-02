package com.koushikdutta.async.http;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/ConnectionClosedException.class */
public class ConnectionClosedException extends Exception {
    public ConnectionClosedException(String message) {
        super(message);
    }

    public ConnectionClosedException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }
}
