package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/ServiceUnavailableRetryStrategy.class */
public interface ServiceUnavailableRetryStrategy {
    boolean retryRequest(HttpResponse httpResponse, int i, HttpContext httpContext);

    long getRetryInterval();
}
