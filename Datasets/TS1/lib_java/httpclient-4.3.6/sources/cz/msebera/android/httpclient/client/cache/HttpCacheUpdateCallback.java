package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/HttpCacheUpdateCallback.class */
public interface HttpCacheUpdateCallback {
    HttpCacheEntry update(HttpCacheEntry httpCacheEntry) throws IOException;
}
