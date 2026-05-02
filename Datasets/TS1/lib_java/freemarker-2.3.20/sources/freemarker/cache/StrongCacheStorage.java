package freemarker.cache;

import freemarker.core._ConcurrentMapFactory;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/StrongCacheStorage.class */
public class StrongCacheStorage implements ConcurrentCacheStorage {
    private final Map map = _ConcurrentMapFactory.newMaybeConcurrentHashMap();

    @Override // freemarker.cache.ConcurrentCacheStorage
    public boolean isConcurrent() {
        return _ConcurrentMapFactory.isConcurrent(this.map);
    }

    @Override // freemarker.cache.CacheStorage
    public Object get(Object key) {
        return this.map.get(key);
    }

    @Override // freemarker.cache.CacheStorage
    public void put(Object key, Object value) {
        this.map.put(key, value);
    }

    @Override // freemarker.cache.CacheStorage
    public void remove(Object key) {
        this.map.remove(key);
    }

    @Override // freemarker.cache.CacheStorage
    public void clear() {
        this.map.clear();
    }
}
