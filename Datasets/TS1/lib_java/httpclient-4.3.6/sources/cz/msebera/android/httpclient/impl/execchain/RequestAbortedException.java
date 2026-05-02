package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.io.InterruptedIOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/execchain/RequestAbortedException.class */
public class RequestAbortedException extends InterruptedIOException {
    private static final long serialVersionUID = 4973849966012490112L;

    public RequestAbortedException(String message) {
        super(message);
    }

    public RequestAbortedException(String message, Throwable cause) {
        super(message);
        if (cause != null) {
            initCause(cause);
        }
    }
}
