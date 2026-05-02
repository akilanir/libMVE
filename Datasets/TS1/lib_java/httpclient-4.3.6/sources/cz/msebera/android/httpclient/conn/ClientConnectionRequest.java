package cz.msebera.android.httpclient.conn;

import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ClientConnectionRequest.class */
public interface ClientConnectionRequest {
    ManagedClientConnection getConnection(long j, TimeUnit timeUnit) throws InterruptedException, ConnectionPoolTimeoutException;

    void abortRequest();
}
