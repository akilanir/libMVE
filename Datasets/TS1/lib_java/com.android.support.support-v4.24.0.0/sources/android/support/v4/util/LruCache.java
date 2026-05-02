package android.support.v4.util;

import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: com.android.support.support-v4.24.0.0.jar:android/support/v4/util/LruCache.class */
public class LruCache<K, V> {
    private final LinkedHashMap<K, V> map;
    private int size;
    private int maxSize;
    private int putCount;
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private int missCount;

    public LruCache(int maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.maxSize = maxSize;
        this.map = new LinkedHashMap<>(0, 0.75f, true);
    }

    public void resize(int maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        synchronized (this) {
            this.maxSize = maxSize;
        }
        trimToSize(maxSize);
    }

    public final V get(K k) {
        V v;
        if (k == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            V v2 = this.map.get(k);
            if (v2 != null) {
                this.hitCount++;
                return v2;
            }
            this.missCount++;
            V create = create(k);
            if (create == null) {
                return null;
            }
            synchronized (this) {
                this.createCount++;
                v = (V) this.map.put(k, create);
                if (v != null) {
                    this.map.put(k, v);
                } else {
                    this.size += safeSizeOf(k, create);
                }
            }
            if (v != null) {
                entryRemoved(false, k, create, v);
                return v;
            }
            trimToSize(this.maxSize);
            return create;
        }
    }

    public final V put(K key, V value) {
        V previous;
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.putCount++;
            this.size += safeSizeOf(key, value);
            previous = this.map.put(key, value);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, value);
        }
        trimToSize(this.maxSize);
        return previous;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x003d, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void trimToSize(int r7) {
        /*
            r6 = this;
        L0:
            r0 = r6
            r1 = r0
            r10 = r1
            monitor-enter(r0)
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> La4
            if (r0 < 0) goto L1d
            r0 = r6
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> La4
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> La4
            if (r0 == 0) goto L3e
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> La4
            if (r0 == 0) goto L3e
        L1d:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> La4
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> La4
            r3 = r2
            r3.<init>()     // Catch: java.lang.Throwable -> La4
            r3 = r6
            java.lang.Class r3 = r3.getClass()     // Catch: java.lang.Throwable -> La4
            java.lang.String r3 = r3.getName()     // Catch: java.lang.Throwable -> La4
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> La4
            java.lang.String r3 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> La4
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> La4
            r1.<init>(r2)     // Catch: java.lang.Throwable -> La4
            throw r0     // Catch: java.lang.Throwable -> La4
        L3e:
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> La4
            r1 = r7
            if (r0 <= r1) goto L50
            r0 = r6
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> La4
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> La4
            if (r0 == 0) goto L56
        L50:
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La4
            goto Lb7
        L56:
            r0 = r6
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> La4
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> La4
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> La4
            java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> La4
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> La4
            r11 = r0
            r0 = r11
            java.lang.Object r0 = r0.getKey()     // Catch: java.lang.Throwable -> La4
            r8 = r0
            r0 = r11
            java.lang.Object r0 = r0.getValue()     // Catch: java.lang.Throwable -> La4
            r9 = r0
            r0 = r6
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> La4
            r1 = r8
            java.lang.Object r0 = r0.remove(r1)     // Catch: java.lang.Throwable -> La4
            r0 = r6
            r1 = r0
            int r1 = r1.size     // Catch: java.lang.Throwable -> La4
            r2 = r6
            r3 = r8
            r4 = r9
            int r2 = r2.safeSizeOf(r3, r4)     // Catch: java.lang.Throwable -> La4
            int r1 = r1 - r2
            r0.size = r1     // Catch: java.lang.Throwable -> La4
            r0 = r6
            r1 = r0
            int r1 = r1.evictionCount     // Catch: java.lang.Throwable -> La4
            r2 = 1
            int r1 = r1 + r2
            r0.evictionCount = r1     // Catch: java.lang.Throwable -> La4
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La4
            goto Lac
        La4:
            r12 = move-exception
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La4
            r0 = r12
            throw r0
        Lac:
            r0 = r6
            r1 = 1
            r2 = r8
            r3 = r9
            r4 = 0
            r0.entryRemoved(r1, r2, r3, r4)
            goto L0
        Lb7:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.util.LruCache.trimToSize(int):void");
    }

    public final V remove(K key) {
        V previous;
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            previous = this.map.remove(key);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, null);
        }
        return previous;
    }

    protected void entryRemoved(boolean evicted, K key, V oldValue, V newValue) {
    }

    protected V create(K key) {
        return null;
    }

    private int safeSizeOf(K key, V value) {
        int result = sizeOf(key, value);
        if (result < 0) {
            throw new IllegalStateException("Negative size: " + key + "=" + value);
        }
        return result;
    }

    protected int sizeOf(K key, V value) {
        return 1;
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    public final synchronized int size() {
        return this.size;
    }

    public final synchronized int maxSize() {
        return this.maxSize;
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int createCount() {
        return this.createCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }

    public final synchronized Map<K, V> snapshot() {
        return new LinkedHashMap(this.map);
    }

    public final synchronized String toString() {
        int accesses = this.hitCount + this.missCount;
        int hitPercent = accesses != 0 ? (100 * this.hitCount) / accesses : 0;
        return String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", Integer.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(hitPercent));
    }
}
