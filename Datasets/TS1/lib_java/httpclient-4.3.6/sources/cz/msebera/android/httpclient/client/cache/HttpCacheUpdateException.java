package cz.msebera.android.httpclient.client.cache;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/HttpCacheUpdateException.class */
public class HttpCacheUpdateException extends Exception {
    private static final long serialVersionUID = 823573584868632876L;

    public HttpCacheUpdateException(String message) {
        super(message);
    }

    public HttpCacheUpdateException(String message, Throwable cause) {
        super(message);
        initCause(cause);
    }
}
