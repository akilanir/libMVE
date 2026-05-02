package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/HttpResponseException.class */
public class HttpResponseException extends ClientProtocolException {
    private static final long serialVersionUID = -7186627969477257933L;
    private final int statusCode;

    public HttpResponseException(int statusCode, String s) {
        super(s);
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return this.statusCode;
    }
}
