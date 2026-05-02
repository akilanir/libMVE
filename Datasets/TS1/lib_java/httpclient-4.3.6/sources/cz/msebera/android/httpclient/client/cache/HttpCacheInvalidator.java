package cz.msebera.android.httpclient.client.cache;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/HttpCacheInvalidator.class */
public interface HttpCacheInvalidator {
    void flushInvalidatedCacheEntries(HttpHost httpHost, HttpRequest httpRequest);

    void flushInvalidatedCacheEntries(HttpHost httpHost, HttpRequest httpRequest, HttpResponse httpResponse);
}
