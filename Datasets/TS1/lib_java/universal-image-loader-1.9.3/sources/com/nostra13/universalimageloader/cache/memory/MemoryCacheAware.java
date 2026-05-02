package com.nostra13.universalimageloader.cache.memory;

import java.util.Collection;

@Deprecated
/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/memory/MemoryCacheAware.class */
public interface MemoryCacheAware<K, V> {
    boolean put(K k, V v);

    V get(K k);

    V remove(K k);

    Collection<K> keys();

    void clear();
}
