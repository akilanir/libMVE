package freemarker.cache;

import freemarker.core._ConcurrentMapFactory;
import freemarker.template.utility.UndeclaredThrowableException;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/SoftCacheStorage.class */
public class SoftCacheStorage implements ConcurrentCacheStorage {
    private static final Method atomicRemove = getAtomicRemoveMethod();
    private final ReferenceQueue queue;
    private final Map map;
    private final boolean concurrent;
    static Class class$java$lang$Object;

    public SoftCacheStorage() {
        this(_ConcurrentMapFactory.newMaybeConcurrentHashMap());
    }

    @Override // freemarker.cache.ConcurrentCacheStorage
    public boolean isConcurrent() {
        return this.concurrent;
    }

    public SoftCacheStorage(Map backingMap) {
        this.queue = new ReferenceQueue();
        this.map = backingMap;
        this.concurrent = _ConcurrentMapFactory.isConcurrent(this.map);
    }

    @Override // freemarker.cache.CacheStorage
    public Object get(Object key) {
        processQueue();
        Reference ref = (Reference) this.map.get(key);
        if (ref == null) {
            return null;
        }
        return ref.get();
    }

    @Override // freemarker.cache.CacheStorage
    public void put(Object key, Object value) {
        processQueue();
        this.map.put(key, new SoftValueReference(key, value, this.queue));
    }

    @Override // freemarker.cache.CacheStorage
    public void remove(Object key) {
        processQueue();
        this.map.remove(key);
    }

    @Override // freemarker.cache.CacheStorage
    public void clear() {
        this.map.clear();
        processQueue();
    }

    private void processQueue() {
        while (true) {
            SoftValueReference ref = (SoftValueReference) this.queue.poll();
            if (ref == null) {
                return;
            }
            Object key = ref.getKey();
            if (this.concurrent) {
                try {
                    atomicRemove.invoke(this.map, key, ref);
                } catch (IllegalAccessException e) {
                    throw new UndeclaredThrowableException(e);
                } catch (InvocationTargetException e2) {
                    throw new UndeclaredThrowableException(e2);
                }
            } else if (this.map.get(key) == ref) {
                this.map.remove(key);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/SoftCacheStorage$SoftValueReference.class */
    private static final class SoftValueReference extends SoftReference {
        private final Object key;

        SoftValueReference(Object key, Object value, ReferenceQueue queue) {
            super(value, queue);
            this.key = key;
        }

        Object getKey() {
            return this.key;
        }
    }

    private static Method getAtomicRemoveMethod() {
        Class<?> cls;
        Class<?> cls2;
        try {
            Class<?> cls3 = Class.forName("java.util.concurrent.ConcurrentMap");
            Class<?>[] clsArr = new Class[2];
            if (class$java$lang$Object == null) {
                cls = class$("java.lang.Object");
                class$java$lang$Object = cls;
            } else {
                cls = class$java$lang$Object;
            }
            clsArr[0] = cls;
            if (class$java$lang$Object == null) {
                cls2 = class$("java.lang.Object");
                class$java$lang$Object = cls2;
            } else {
                cls2 = class$java$lang$Object;
            }
            clsArr[1] = cls2;
            return cls3.getMethod("remove", clsArr);
        } catch (ClassNotFoundException e) {
            return null;
        } catch (NoSuchMethodException e2) {
            throw new UndeclaredThrowableException(e2);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
