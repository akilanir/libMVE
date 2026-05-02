package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/RedirectException.class */
public class RedirectException extends ProtocolException {
    private static final long serialVersionUID = 4418824536372559326L;

    public RedirectException() {
    }

    public RedirectException(String message) {
        super(message);
    }

    public RedirectException(String message, Throwable cause) {
        super(message, cause);
    }
}
