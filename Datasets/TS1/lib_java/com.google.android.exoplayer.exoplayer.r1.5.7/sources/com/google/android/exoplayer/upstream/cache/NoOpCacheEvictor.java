package com.google.android.exoplayer.upstream.cache;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/cache/NoOpCacheEvictor.class */
public final class NoOpCacheEvictor implements CacheEvictor {
    @Override // com.google.android.exoplayer.upstream.cache.CacheEvictor
    public void onStartFile(Cache cache, String key, long position, long length) {
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache.Listener
    public void onSpanAdded(Cache cache, CacheSpan span) {
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache.Listener
    public void onSpanRemoved(Cache cache, CacheSpan span) {
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache.Listener
    public void onSpanTouched(Cache cache, CacheSpan oldSpan, CacheSpan newSpan) {
    }
}
