package com.nostra13.universalimageloader.cache.memory;

import android.graphics.Bitmap;
import java.util.Collection;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/memory/MemoryCache.class */
public interface MemoryCache {
    boolean put(String str, Bitmap bitmap);

    Bitmap get(String str);

    Bitmap remove(String str);

    Collection<String> keys();

    void clear();
}
