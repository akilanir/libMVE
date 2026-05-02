package com.koushikdutta.ion.bitmap;

import com.koushikdutta.async.util.LruCache;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/bitmap/LruBitmapCache.class */
class LruBitmapCache extends LruCache<String, BitmapInfo> {
    private SoftReferenceHashtable<String, BitmapInfo> soft;

    public void putSoft(String key, BitmapInfo value) {
        this.soft.put(key, value);
    }

    public LruBitmapCache(int maxSize) {
        super(maxSize);
        this.soft = new SoftReferenceHashtable<>();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long sizeOf(String key, BitmapInfo info) {
        return info.sizeOf();
    }

    public BitmapInfo getBitmapInfo(String key) {
        BitmapInfo ret = (BitmapInfo) get(key);
        if (ret != null) {
            return ret;
        }
        BitmapInfo ret2 = this.soft.remove(key);
        if (ret2 != null) {
            put(key, ret2);
        }
        return ret2;
    }

    public BitmapInfo removeBitmapInfo(String key) {
        BitmapInfo i1 = this.soft.remove(key);
        BitmapInfo i2 = (BitmapInfo) remove(key);
        if (i2 != null) {
            return i2;
        }
        return i1;
    }

    public void evictAllBitmapInfo() {
        evictAll();
        this.soft.clear();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void entryRemoved(boolean evicted, String key, BitmapInfo oldValue, BitmapInfo newValue) {
        super.entryRemoved(evicted, key, oldValue, newValue);
        if (evicted) {
            this.soft.put(key, oldValue);
        }
    }
}
