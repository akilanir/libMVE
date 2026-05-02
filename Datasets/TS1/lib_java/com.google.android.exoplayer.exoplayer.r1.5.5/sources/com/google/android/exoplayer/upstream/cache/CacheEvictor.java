package com.google.android.exoplayer.upstream.cache;

import com.google.android.exoplayer.upstream.cache.Cache;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/upstream/cache/CacheEvictor.class */
public interface CacheEvictor extends Cache.Listener {
    void onStartFile(Cache cache, String str, long j, long j2);
}
