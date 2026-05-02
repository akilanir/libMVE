package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLSession;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ManagedClientConnection.class */
public interface ManagedClientConnection extends HttpClientConnection, HttpRoutedConnection, ManagedHttpClientConnection, ConnectionReleaseTrigger {
    @Override // cz.msebera.android.httpclient.conn.HttpRoutedConnection
    boolean isSecure();

    @Override // cz.msebera.android.httpclient.conn.HttpRoutedConnection
    HttpRoute getRoute();

    @Override // cz.msebera.android.httpclient.conn.HttpRoutedConnection, cz.msebera.android.httpclient.conn.ManagedHttpClientConnection
    SSLSession getSSLSession();

    void open(HttpRoute httpRoute, HttpContext httpContext, HttpParams httpParams) throws IOException;

    void tunnelTarget(boolean z, HttpParams httpParams) throws IOException;

    void tunnelProxy(HttpHost httpHost, boolean z, HttpParams httpParams) throws IOException;

    void layerProtocol(HttpContext httpContext, HttpParams httpParams) throws IOException;

    void markReusable();

    void unmarkReusable();

    boolean isMarkedReusable();

    void setState(Object obj);

    Object getState();

    void setIdleDuration(long j, TimeUnit timeUnit);
}
