package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/memory/impl/LruMemoryCache.class */
public class LruMemoryCache implements MemoryCache {
    private final LinkedHashMap<String, Bitmap> map;
    private final int maxSize;
    private int size;

    public LruMemoryCache(int maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.maxSize = maxSize;
        this.map = new LinkedHashMap<>(0, 0.75f, true);
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCacheAware
    public final Bitmap get(String key) {
        Bitmap bitmap;
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            bitmap = this.map.get(key);
        }
        return bitmap;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCacheAware
    public final boolean put(String key, Bitmap value) {
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.size += sizeOf(key, value);
            Bitmap previous = this.map.put(key, value);
            if (previous != null) {
                this.size -= sizeOf(key, previous);
            }
        }
        trimToSize(this.maxSize);
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x003d, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00b6, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void trimToSize(int r7) {
        /*
            r6 = this;
        L0:
            r0 = r6
            r1 = r0
            r10 = r1
            monitor-enter(r0)
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            if (r0 < 0) goto L1d
            r0 = r6
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> Lab
            if (r0 == 0) goto L3e
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            if (r0 == 0) goto L3e
        L1d:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lab
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lab
            r3 = r2
            r3.<init>()     // Catch: java.lang.Throwable -> Lab
            r3 = r6
            java.lang.Class r3 = r3.getClass()     // Catch: java.lang.Throwable -> Lab
            java.lang.String r3 = r3.getName()     // Catch: java.lang.Throwable -> Lab
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lab
            java.lang.String r3 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lab
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lab
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Lab
            throw r0     // Catch: java.lang.Throwable -> Lab
        L3e:
            r0 = r6
            int r0 = r0.size     // Catch: java.lang.Throwable -> Lab
            r1 = r7
            if (r0 <= r1) goto L50
            r0 = r6
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> Lab
            if (r0 == 0) goto L56
        L50:
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            goto Lb6
        L56:
            r0 = r6
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> Lab
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> Lab
            java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> Lab
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> Lab
            r11 = r0
            r0 = r11
            if (r0 != 0) goto L77
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            goto Lb6
        L77:
            r0 = r11
            java.lang.Object r0 = r0.getKey()     // Catch: java.lang.Throwable -> Lab
            java.lang.String r0 = (java.lang.String) r0     // Catch: java.lang.Throwable -> Lab
            r8 = r0
            r0 = r11
            java.lang.Object r0 = r0.getValue()     // Catch: java.lang.Throwable -> Lab
            android.graphics.Bitmap r0 = (android.graphics.Bitmap) r0     // Catch: java.lang.Throwable -> Lab
            r9 = r0
            r0 = r6
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> Lab
            r1 = r8
            java.lang.Object r0 = r0.remove(r1)     // Catch: java.lang.Throwable -> Lab
            r0 = r6
            r1 = r0
            int r1 = r1.size     // Catch: java.lang.Throwable -> Lab
            r2 = r6
            r3 = r8
            r4 = r9
            int r2 = r2.sizeOf(r3, r4)     // Catch: java.lang.Throwable -> Lab
            int r1 = r1 - r2
            r0.size = r1     // Catch: java.lang.Throwable -> Lab
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            goto Lb3
        Lab:
            r12 = move-exception
            r0 = r10
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            r0 = r12
            throw r0
        Lb3:
            goto L0
        Lb6:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.nostra13.universalimageloader.cache.memory.impl.LruMemoryCache.trimToSize(int):void");
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCacheAware
    public final Bitmap remove(String key) {
        Bitmap previous;
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            previous = this.map.remove(key);
            if (previous != null) {
                this.size -= sizeOf(key, previous);
            }
        }
        return previous;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCacheAware
    public Collection<String> keys() {
        HashSet hashSet;
        synchronized (this) {
            hashSet = new HashSet(this.map.keySet());
        }
        return hashSet;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCacheAware
    public void clear() {
        trimToSize(-1);
    }

    private int sizeOf(String key, Bitmap value) {
        return value.getRowBytes() * value.getHeight();
    }

    public final synchronized String toString() {
        return String.format("LruCache[maxSize=%d]", Integer.valueOf(this.maxSize));
    }
}
