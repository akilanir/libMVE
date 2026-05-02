package com.koushikdutta.async.util;

import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/util/LruCache.class */
public class LruCache<K, V> {
    private final LinkedHashMap<K, V> map;
    private long size;
    private long maxSize;
    private int putCount;
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private int missCount;

    public LruCache(long maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.maxSize = maxSize;
        this.map = new LinkedHashMap<>(0, 0.75f, true);
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

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0041, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void trimToSize(long r8) {
        /*
            r7 = this;
        L0:
            r0 = r7
            r1 = r0
            r12 = r1
            monitor-enter(r0)
            r0 = r7
            long r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            r1 = 0
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 < 0) goto L21
            r0 = r7
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> Lab
            if (r0 == 0) goto L42
            r0 = r7
            long r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            r1 = 0
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 == 0) goto L42
        L21:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lab
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lab
            r3 = r2
            r3.<init>()     // Catch: java.lang.Throwable -> Lab
            r3 = r7
            java.lang.Class r3 = r3.getClass()     // Catch: java.lang.Throwable -> Lab
            java.lang.String r3 = r3.getName()     // Catch: java.lang.Throwable -> Lab
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lab
            java.lang.String r3 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lab
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lab
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Lab
            throw r0     // Catch: java.lang.Throwable -> Lab
        L42:
            r0 = r7
            long r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            r1 = r8
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 <= 0) goto L55
            r0 = r7
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> Lab
            if (r0 == 0) goto L5b
        L55:
            r0 = r12
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            goto Lbf
        L5b:
            r0 = r7
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> Lab
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> Lab
            java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> Lab
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> Lab
            r13 = r0
            r0 = r13
            java.lang.Object r0 = r0.getKey()     // Catch: java.lang.Throwable -> Lab
            r10 = r0
            r0 = r13
            java.lang.Object r0 = r0.getValue()     // Catch: java.lang.Throwable -> Lab
            r11 = r0
            r0 = r7
            java.util.LinkedHashMap<K, V> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            r1 = r10
            java.lang.Object r0 = r0.remove(r1)     // Catch: java.lang.Throwable -> Lab
            r0 = r7
            r1 = r0
            long r1 = r1.size     // Catch: java.lang.Throwable -> Lab
            r2 = r7
            r3 = r10
            r4 = r11
            long r2 = r2.safeSizeOf(r3, r4)     // Catch: java.lang.Throwable -> Lab
            long r1 = r1 - r2
            r0.size = r1     // Catch: java.lang.Throwable -> Lab
            r0 = r7
            r1 = r0
            int r1 = r1.evictionCount     // Catch: java.lang.Throwable -> Lab
            r2 = 1
            int r1 = r1 + r2
            r0.evictionCount = r1     // Catch: java.lang.Throwable -> Lab
            r0 = r12
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            goto Lb3
        Lab:
            r14 = move-exception
            r0 = r12
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            r0 = r14
            throw r0
        Lb3:
            r0 = r7
            r1 = 1
            r2 = r10
            r3 = r11
            r4 = 0
            r0.entryRemoved(r1, r2, r3, r4)
            goto L0
        Lbf:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.koushikdutta.async.util.LruCache.trimToSize(long):void");
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

    private long safeSizeOf(K key, V value) {
        long result = sizeOf(key, value);
        if (result < 0) {
            throw new IllegalStateException("Negative size: " + key + "=" + value);
        }
        return result;
    }

    protected long sizeOf(K key, V value) {
        return 1L;
    }

    public final void evictAll() {
        trimToSize(-1L);
    }

    public final synchronized long size() {
        return this.size;
    }

    public void setMaxSize(long maxSize) {
        this.maxSize = maxSize;
    }

    public final synchronized long maxSize() {
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
        return String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", Long.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(hitPercent));
    }
}
