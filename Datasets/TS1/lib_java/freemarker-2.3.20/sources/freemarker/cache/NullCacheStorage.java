package freemarker.cache;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/NullCacheStorage.class */
public class NullCacheStorage implements ConcurrentCacheStorage {
    @Override // freemarker.cache.ConcurrentCacheStorage
    public boolean isConcurrent() {
        return true;
    }

    @Override // freemarker.cache.CacheStorage
    public Object get(Object key) {
        return null;
    }

    @Override // freemarker.cache.CacheStorage
    public void put(Object key, Object value) {
    }

    @Override // freemarker.cache.CacheStorage
    public void remove(Object key) {
    }

    @Override // freemarker.cache.CacheStorage
    public void clear() {
    }
}
