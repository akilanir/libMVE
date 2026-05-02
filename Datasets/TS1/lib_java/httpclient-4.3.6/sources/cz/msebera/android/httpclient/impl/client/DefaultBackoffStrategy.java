package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.ConnectionBackoffStrategy;
import java.net.ConnectException;
import java.net.SocketTimeoutException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DefaultBackoffStrategy.class */
public class DefaultBackoffStrategy implements ConnectionBackoffStrategy {
    @Override // cz.msebera.android.httpclient.client.ConnectionBackoffStrategy
    public boolean shouldBackoff(Throwable t) {
        return (t instanceof SocketTimeoutException) || (t instanceof ConnectException);
    }

    @Override // cz.msebera.android.httpclient.client.ConnectionBackoffStrategy
    public boolean shouldBackoff(HttpResponse resp) {
        return resp.getStatusLine().getStatusCode() == 503;
    }
}
