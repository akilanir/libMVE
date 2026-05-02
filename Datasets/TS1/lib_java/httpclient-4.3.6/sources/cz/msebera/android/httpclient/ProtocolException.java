package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/ProtocolException.class */
public class ProtocolException extends HttpException {
    private static final long serialVersionUID = -2143571074341228994L;

    public ProtocolException() {
    }

    public ProtocolException(String message) {
        super(message);
    }

    public ProtocolException(String message, Throwable cause) {
        super(message, cause);
    }
}
