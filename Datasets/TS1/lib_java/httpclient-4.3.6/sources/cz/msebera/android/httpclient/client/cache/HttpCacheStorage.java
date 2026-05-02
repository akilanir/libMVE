package cz.msebera.android.httpclient.client.cache;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/cache/HttpCacheStorage.class */
public interface HttpCacheStorage {
    void putEntry(String str, HttpCacheEntry httpCacheEntry) throws IOException;

    HttpCacheEntry getEntry(String str) throws IOException;

    void removeEntry(String str) throws IOException;

    void updateEntry(String str, HttpCacheUpdateCallback httpCacheUpdateCallback) throws IOException, HttpCacheUpdateException;
}
