package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthenticationException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/NTLMEngineException.class */
public class NTLMEngineException extends AuthenticationException {
    private static final long serialVersionUID = 6027981323731768824L;

    public NTLMEngineException() {
    }

    public NTLMEngineException(String message) {
        super(message);
    }

    public NTLMEngineException(String message, Throwable cause) {
        super(message, cause);
    }
}
