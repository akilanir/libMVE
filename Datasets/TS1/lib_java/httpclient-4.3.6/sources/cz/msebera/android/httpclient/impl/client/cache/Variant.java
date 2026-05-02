package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/Variant.class */
class Variant {
    private final String variantKey;
    private final String cacheKey;
    private final HttpCacheEntry entry;

    public Variant(String variantKey, String cacheKey, HttpCacheEntry entry) {
        this.variantKey = variantKey;
        this.cacheKey = cacheKey;
        this.entry = entry;
    }

    public String getVariantKey() {
        return this.variantKey;
    }

    public String getCacheKey() {
        return this.cacheKey;
    }

    public HttpCacheEntry getEntry() {
        return this.entry;
    }
}
