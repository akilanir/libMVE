package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/HttpRequestRetryHandler.class */
public interface HttpRequestRetryHandler {
    boolean retryRequest(IOException iOException, int i, HttpContext httpContext);
}
