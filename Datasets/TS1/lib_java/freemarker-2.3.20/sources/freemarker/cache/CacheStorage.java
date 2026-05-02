package freemarker.cache;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/CacheStorage.class */
public interface CacheStorage {
    Object get(Object obj);

    void put(Object obj, Object obj2);

    void remove(Object obj);

    void clear();
}
