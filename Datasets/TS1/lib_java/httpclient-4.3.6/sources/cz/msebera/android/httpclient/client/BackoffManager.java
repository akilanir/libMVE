package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.conn.routing.HttpRoute;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/BackoffManager.class */
public interface BackoffManager {
    void backOff(HttpRoute httpRoute);

    void probe(HttpRoute httpRoute);
}
