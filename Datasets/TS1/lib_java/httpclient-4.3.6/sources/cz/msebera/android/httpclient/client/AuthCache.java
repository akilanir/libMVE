package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.auth.AuthScheme;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/AuthCache.class */
public interface AuthCache {
    void put(HttpHost httpHost, AuthScheme authScheme);

    AuthScheme get(HttpHost httpHost);

    void remove(HttpHost httpHost);

    void clear();
}
