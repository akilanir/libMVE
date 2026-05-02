package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/ConnectionReuseStrategy.class */
public interface ConnectionReuseStrategy {
    boolean keepAlive(HttpResponse httpResponse, HttpContext httpContext);
}
