package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/CircularRedirectException.class */
public class CircularRedirectException extends RedirectException {
    private static final long serialVersionUID = 6830063487001091803L;

    public CircularRedirectException() {
    }

    public CircularRedirectException(String message) {
        super(message);
    }

    public CircularRedirectException(String message, Throwable cause) {
        super(message, cause);
    }
}
