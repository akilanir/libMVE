package com.squareup.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/LruCache.class */
public class LruCache implements Cache {
    final LinkedHashMap<String, Bitmap> map;
    private final int maxSize;
    private int size;
    private int putCount;
    private int evictionCount;
    private int hitCount;
    private int missCount;

    public LruCache(Context context) {
        this(Utils.calculateMemoryCacheSize(context));
    }

    public LruCache(int maxSize) {
        if (maxSize <= 0) {
            throw new IllegalArgumentException("Max size must be positive.");
        }
        this.maxSize = maxSize;
        this.map = new LinkedHashMap<>(0, 0.75f, true);
    }

    @Override // com.squareup.picasso.Cache
    public Bitmap get(String key) {
        if (key == null) {
            throw new NullPointerException("key == null");
        }
        synchronized (this) {
            Bitmap mapValue = this.map.get(key);
            if (mapValue != null) {
                this.hitCount++;
                return mapValue;
            }
            this.missCount++;
            return null;
        }
    }

    @Override // com.squareup.picasso.Cache
    public void set(String key, Bitmap bitmap) {
        if (key == null || bitmap == null) {
            throw new NullPointerException("key == null || bitmap == null");
        }
        synchronized (this) {
            this.putCount++;
            this.size += Utils.getBitmapBytes(bitmap);
            Bitmap previous = this.map.put(key, bitmap);
            if (previous != null) {
                this.size -= Utils.getBitmapBytes(previous);
            }
        }
        trimToSize(this.maxSize);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x003d, code lost:
    
        throw new java.lang.IllegalStateException(getClass().getName() + ".sizeOf() is reporting inconsistent results!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void trimToSize(int r6) {
        /*
            r5 = this;
        L0:
            r0 = r5
            r1 = r0
            r9 = r1
            monitor-enter(r0)
            r0 = r5
            int r0 = r0.size     // Catch: java.lang.Throwable -> La8
            if (r0 < 0) goto L1d
            r0 = r5
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> La8
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> La8
            if (r0 == 0) goto L3e
            r0 = r5
            int r0 = r0.size     // Catch: java.lang.Throwable -> La8
            if (r0 == 0) goto L3e
        L1d:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> La8
            r1 = r0
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> La8
            r3 = r2
            r3.<init>()     // Catch: java.lang.Throwable -> La8
            r3 = r5
            java.lang.Class r3 = r3.getClass()     // Catch: java.lang.Throwable -> La8
            java.lang.String r3 = r3.getName()     // Catch: java.lang.Throwable -> La8
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> La8
            java.lang.String r3 = ".sizeOf() is reporting inconsistent results!"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> La8
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> La8
            r1.<init>(r2)     // Catch: java.lang.Throwable -> La8
            throw r0     // Catch: java.lang.Throwable -> La8
        L3e:
            r0 = r5
            int r0 = r0.size     // Catch: java.lang.Throwable -> La8
            r1 = r6
            if (r0 <= r1) goto L50
            r0 = r5
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> La8
            boolean r0 = r0.isEmpty()     // Catch: java.lang.Throwable -> La8
            if (r0 == 0) goto L56
        L50:
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La8
            goto Lb3
        L56:
            r0 = r5
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> La8
            java.util.Set r0 = r0.entrySet()     // Catch: java.lang.Throwable -> La8
            java.util.Iterator r0 = r0.iterator()     // Catch: java.lang.Throwable -> La8
            java.lang.Object r0 = r0.next()     // Catch: java.lang.Throwable -> La8
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0     // Catch: java.lang.Throwable -> La8
            r10 = r0
            r0 = r10
            java.lang.Object r0 = r0.getKey()     // Catch: java.lang.Throwable -> La8
            java.lang.String r0 = (java.lang.String) r0     // Catch: java.lang.Throwable -> La8
            r7 = r0
            r0 = r10
            java.lang.Object r0 = r0.getValue()     // Catch: java.lang.Throwable -> La8
            android.graphics.Bitmap r0 = (android.graphics.Bitmap) r0     // Catch: java.lang.Throwable -> La8
            r8 = r0
            r0 = r5
            java.util.LinkedHashMap<java.lang.String, android.graphics.Bitmap> r0 = r0.map     // Catch: java.lang.Throwable -> La8
            r1 = r7
            java.lang.Object r0 = r0.remove(r1)     // Catch: java.lang.Throwable -> La8
            r0 = r5
            r1 = r0
            int r1 = r1.size     // Catch: java.lang.Throwable -> La8
            r2 = r8
            int r2 = com.squareup.picasso.Utils.getBitmapBytes(r2)     // Catch: java.lang.Throwable -> La8
            int r1 = r1 - r2
            r0.size = r1     // Catch: java.lang.Throwable -> La8
            r0 = r5
            r1 = r0
            int r1 = r1.evictionCount     // Catch: java.lang.Throwable -> La8
            r2 = 1
            int r1 = r1 + r2
            r0.evictionCount = r1     // Catch: java.lang.Throwable -> La8
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La8
            goto Lb0
        La8:
            r11 = move-exception
            r0 = r9
            monitor-exit(r0)     // Catch: java.lang.Throwable -> La8
            r0 = r11
            throw r0
        Lb0:
            goto L0
        Lb3:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.picasso.LruCache.trimToSize(int):void");
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    @Override // com.squareup.picasso.Cache
    public final synchronized int size() {
        return this.size;
    }

    @Override // com.squareup.picasso.Cache
    public final synchronized int maxSize() {
        return this.maxSize;
    }

    @Override // com.squareup.picasso.Cache
    public final synchronized void clear() {
        evictAll();
    }

    @Override // com.squareup.picasso.Cache
    public final synchronized void clearKeyUri(String uri) {
        boolean sizeChanged = false;
        int uriLength = uri.length();
        Iterator<Map.Entry<String, Bitmap>> i = this.map.entrySet().iterator();
        while (i.hasNext()) {
            Map.Entry<String, Bitmap> entry = i.next();
            String key = entry.getKey();
            Bitmap value = entry.getValue();
            int newlineIndex = key.indexOf(10);
            if (newlineIndex == uriLength && key.substring(0, newlineIndex).equals(uri)) {
                i.remove();
                this.size -= Utils.getBitmapBytes(value);
                sizeChanged = true;
            }
        }
        if (sizeChanged) {
            trimToSize(this.maxSize);
        }
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }
}
