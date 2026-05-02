package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.ConnectionBackoffStrategy;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/NullBackoffStrategy.class */
public class NullBackoffStrategy implements ConnectionBackoffStrategy {
    @Override // cz.msebera.android.httpclient.client.ConnectionBackoffStrategy
    public boolean shouldBackoff(Throwable t) {
        return false;
    }

    @Override // cz.msebera.android.httpclient.client.ConnectionBackoffStrategy
    public boolean shouldBackoff(HttpResponse resp) {
        return false;
    }
}
