package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpResponse;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/ConnectionBackoffStrategy.class */
public interface ConnectionBackoffStrategy {
    boolean shouldBackoff(Throwable th);

    boolean shouldBackoff(HttpResponse httpResponse);
}
