package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ClientConnectionManager.class */
public interface ClientConnectionManager {
    SchemeRegistry getSchemeRegistry();

    ClientConnectionRequest requestConnection(HttpRoute httpRoute, Object obj);

    void releaseConnection(ManagedClientConnection managedClientConnection, long j, TimeUnit timeUnit);

    void closeIdleConnections(long j, TimeUnit timeUnit);

    void closeExpiredConnections();

    void shutdown();
}
