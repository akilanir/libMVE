package cz.msebera.android.httpclient;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/ConnectionClosedException.class */
public class ConnectionClosedException extends IOException {
    private static final long serialVersionUID = 617550366255636674L;

    public ConnectionClosedException(String message) {
        super(message);
    }
}
