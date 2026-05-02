package cz.msebera.android.httpclient;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpException.class */
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
