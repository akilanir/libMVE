package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/CacheMap.class */
final class CacheMap extends LinkedHashMap<String, HttpCacheEntry> {
    private static final long serialVersionUID = -7750025207539768511L;
    private final int maxEntries;

    CacheMap(int maxEntries) {
        super(20, 0.75f, true);
        this.maxEntries = maxEntries;
    }

    @Override // java.util.LinkedHashMap
    protected boolean removeEldestEntry(Map.Entry<String, HttpCacheEntry> eldest) {
        return size() > this.maxEntries;
    }
}
