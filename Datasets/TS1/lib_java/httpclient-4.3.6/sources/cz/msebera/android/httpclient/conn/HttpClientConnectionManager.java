package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/HttpClientConnectionManager.class */
public interface HttpClientConnectionManager {
    ConnectionRequest requestConnection(HttpRoute httpRoute, Object obj);

    void releaseConnection(HttpClientConnection httpClientConnection, Object obj, long j, TimeUnit timeUnit);

    void connect(HttpClientConnection httpClientConnection, HttpRoute httpRoute, int i, HttpContext httpContext) throws IOException;

    void upgrade(HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpContext httpContext) throws IOException;

    void routeComplete(HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpContext httpContext) throws IOException;

    void closeIdleConnections(long j, TimeUnit timeUnit);

    void closeExpiredConnections();

    void shutdown();
}
