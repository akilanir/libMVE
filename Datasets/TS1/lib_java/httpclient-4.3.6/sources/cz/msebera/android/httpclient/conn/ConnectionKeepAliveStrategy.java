package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ConnectionKeepAliveStrategy.class */
public interface ConnectionKeepAliveStrategy {
    long getKeepAliveDuration(HttpResponse httpResponse, HttpContext httpContext);
}
