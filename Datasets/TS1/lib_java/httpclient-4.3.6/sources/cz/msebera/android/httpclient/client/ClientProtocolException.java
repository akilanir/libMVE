package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/ClientProtocolException.class */
public class ClientProtocolException extends IOException {
    private static final long serialVersionUID = -5596590843227115865L;

    public ClientProtocolException() {
    }

    public ClientProtocolException(String s) {
        super(s);
    }

    public ClientProtocolException(Throwable cause) {
        initCause(cause);
    }

    public ClientProtocolException(String message, Throwable cause) {
        super(message);
        initCause(cause);
    }
}
