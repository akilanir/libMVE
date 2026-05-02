package com.google.android.exoplayer.upstream.cache;

import java.io.File;
import java.util.NavigableSet;
import java.util.Set;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/cache/Cache.class */
public interface Cache {

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/cache/Cache$Listener.class */
    public interface Listener {
        void onSpanAdded(Cache cache, CacheSpan cacheSpan);

        void onSpanRemoved(Cache cache, CacheSpan cacheSpan);

        void onSpanTouched(Cache cache, CacheSpan cacheSpan, CacheSpan cacheSpan2);
    }

    NavigableSet<CacheSpan> addListener(String str, Listener listener);

    void removeListener(String str, Listener listener);

    NavigableSet<CacheSpan> getCachedSpans(String str);

    Set<String> getKeys();

    long getCacheSpace();

    CacheSpan startReadWrite(String str, long j) throws InterruptedException;

    CacheSpan startReadWriteNonBlocking(String str, long j);

    File startFile(String str, long j, long j2);

    void commitFile(File file);

    void releaseHoleSpan(CacheSpan cacheSpan);

    void removeSpan(CacheSpan cacheSpan);

    boolean isCached(String str, long j, long j2);
}
