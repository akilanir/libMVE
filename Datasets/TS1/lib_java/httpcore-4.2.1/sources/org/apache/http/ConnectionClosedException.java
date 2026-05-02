package org.apache.http;

import java.io.IOException;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/ConnectionClosedException.class */
public class ConnectionClosedException extends IOException {
    private static final long serialVersionUID = 617550366255636674L;

    public ConnectionClosedException(String message) {
        super(message);
    }
}
