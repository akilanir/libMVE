package com.google.android.exoplayer.upstream.cache;

import android.os.ConditionVariable;
import com.google.android.exoplayer.upstream.cache.Cache;
import com.google.android.exoplayer.util.Assertions;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/cache/SimpleCache.class */
public final class SimpleCache implements Cache {
    private final File cacheDir;
    private final CacheEvictor evictor;
    private long totalSpace = 0;
    private final HashMap<String, CacheSpan> lockedSpans = new HashMap<>();
    private final HashMap<String, TreeSet<CacheSpan>> cachedSpans = new HashMap<>();
    private final HashMap<String, ArrayList<Cache.Listener>> listeners = new HashMap<>();

    /* JADX WARN: Type inference failed for: r0v8, types: [com.google.android.exoplayer.upstream.cache.SimpleCache$1] */
    public SimpleCache(File cacheDir, CacheEvictor evictor) {
        this.cacheDir = cacheDir;
        this.evictor = evictor;
        final ConditionVariable conditionVariable = new ConditionVariable();
        new Thread() { // from class: com.google.android.exoplayer.upstream.cache.SimpleCache.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                synchronized (SimpleCache.this) {
                    conditionVariable.open();
                    SimpleCache.this.initialize();
                }
            }
        }.start();
        conditionVariable.block();
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized NavigableSet<CacheSpan> addListener(String key, Cache.Listener listener) {
        ArrayList<Cache.Listener> listenersForKey = this.listeners.get(key);
        if (listenersForKey == null) {
            listenersForKey = new ArrayList<>();
            this.listeners.put(key, listenersForKey);
        }
        listenersForKey.add(listener);
        return getCachedSpans(key);
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized void removeListener(String key, Cache.Listener listener) {
        ArrayList<Cache.Listener> listenersForKey = this.listeners.get(key);
        if (listenersForKey != null) {
            listenersForKey.remove(listener);
            if (listenersForKey.isEmpty()) {
                this.listeners.remove(key);
            }
        }
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized NavigableSet<CacheSpan> getCachedSpans(String key) {
        TreeSet<CacheSpan> spansForKey = this.cachedSpans.get(key);
        if (spansForKey == null) {
            return null;
        }
        return new TreeSet((SortedSet) spansForKey);
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized Set<String> getKeys() {
        return new HashSet(this.cachedSpans.keySet());
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized long getCacheSpace() {
        return this.totalSpace;
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized CacheSpan startReadWrite(String key, long position) throws InterruptedException {
        CacheSpan lookupSpan = CacheSpan.createLookup(key, position);
        while (true) {
            CacheSpan span = startReadWriteNonBlocking(lookupSpan);
            if (span != null) {
                return span;
            }
            wait();
        }
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized CacheSpan startReadWriteNonBlocking(String key, long position) {
        return startReadWriteNonBlocking(CacheSpan.createLookup(key, position));
    }

    private synchronized CacheSpan startReadWriteNonBlocking(CacheSpan lookupSpan) {
        CacheSpan spanningRegion = getSpan(lookupSpan);
        if (spanningRegion.isCached) {
            TreeSet<CacheSpan> spansForKey = this.cachedSpans.get(spanningRegion.key);
            Assertions.checkState(spansForKey.remove(spanningRegion));
            CacheSpan spanningRegion2 = spanningRegion.touch();
            spansForKey.add(spanningRegion2);
            notifySpanTouched(spanningRegion, spanningRegion2);
            return spanningRegion2;
        }
        if (!this.lockedSpans.containsKey(lookupSpan.key)) {
            this.lockedSpans.put(lookupSpan.key, spanningRegion);
            return spanningRegion;
        }
        return null;
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized File startFile(String key, long position, long length) {
        Assertions.checkState(this.lockedSpans.containsKey(key));
        if (!this.cacheDir.exists()) {
            removeStaleSpans();
            this.cacheDir.mkdirs();
        }
        this.evictor.onStartFile(this, key, position, length);
        return CacheSpan.getCacheFileName(this.cacheDir, key, position, System.currentTimeMillis());
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized void commitFile(File file) {
        CacheSpan span = CacheSpan.createCacheEntry(file);
        Assertions.checkState(span != null);
        Assertions.checkState(this.lockedSpans.containsKey(span.key));
        if (!file.exists()) {
            return;
        }
        long length = file.length();
        if (length == 0) {
            file.delete();
        } else {
            addSpan(span);
            notifyAll();
        }
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized void releaseHoleSpan(CacheSpan holeSpan) {
        Assertions.checkState(holeSpan == this.lockedSpans.remove(holeSpan.key));
        notifyAll();
    }

    private CacheSpan getSpan(CacheSpan lookupSpan) {
        String key = lookupSpan.key;
        long offset = lookupSpan.position;
        TreeSet<CacheSpan> entries = this.cachedSpans.get(key);
        if (entries == null) {
            return CacheSpan.createOpenHole(key, lookupSpan.position);
        }
        CacheSpan floorSpan = entries.floor(lookupSpan);
        if (floorSpan != null && floorSpan.position <= offset && offset < floorSpan.position + floorSpan.length) {
            if (floorSpan.file.exists()) {
                return floorSpan;
            }
            removeStaleSpans();
            return getSpan(lookupSpan);
        }
        CacheSpan ceilEntry = entries.ceiling(lookupSpan);
        return ceilEntry == null ? CacheSpan.createOpenHole(key, lookupSpan.position) : CacheSpan.createClosedHole(key, lookupSpan.position, ceilEntry.position - lookupSpan.position);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initialize() {
        if (!this.cacheDir.exists()) {
            this.cacheDir.mkdirs();
        }
        File[] files = this.cacheDir.listFiles();
        if (files == null) {
            return;
        }
        for (File file : files) {
            if (file.length() == 0) {
                file.delete();
            } else {
                File file2 = CacheSpan.upgradeIfNeeded(file);
                CacheSpan span = CacheSpan.createCacheEntry(file2);
                if (span == null) {
                    file2.delete();
                } else {
                    addSpan(span);
                }
            }
        }
    }

    private void addSpan(CacheSpan span) {
        TreeSet<CacheSpan> spansForKey = this.cachedSpans.get(span.key);
        if (spansForKey == null) {
            spansForKey = new TreeSet<>();
            this.cachedSpans.put(span.key, spansForKey);
        }
        spansForKey.add(span);
        this.totalSpace += span.length;
        notifySpanAdded(span);
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized void removeSpan(CacheSpan span) {
        TreeSet<CacheSpan> spansForKey = this.cachedSpans.get(span.key);
        this.totalSpace -= span.length;
        Assertions.checkState(spansForKey.remove(span));
        span.file.delete();
        if (spansForKey.isEmpty()) {
            this.cachedSpans.remove(span.key);
        }
        notifySpanRemoved(span);
    }

    private void removeStaleSpans() {
        Iterator<Map.Entry<String, TreeSet<CacheSpan>>> iterator = this.cachedSpans.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, TreeSet<CacheSpan>> next = iterator.next();
            Iterator<CacheSpan> spanIterator = next.getValue().iterator();
            boolean isEmpty = true;
            while (spanIterator.hasNext()) {
                CacheSpan span = spanIterator.next();
                if (!span.file.exists()) {
                    spanIterator.remove();
                    if (span.isCached) {
                        this.totalSpace -= span.length;
                    }
                    notifySpanRemoved(span);
                } else {
                    isEmpty = false;
                }
            }
            if (isEmpty) {
                iterator.remove();
            }
        }
    }

    private void notifySpanRemoved(CacheSpan span) {
        ArrayList<Cache.Listener> keyListeners = this.listeners.get(span.key);
        if (keyListeners != null) {
            for (int i = keyListeners.size() - 1; i >= 0; i--) {
                keyListeners.get(i).onSpanRemoved(this, span);
            }
        }
        this.evictor.onSpanRemoved(this, span);
    }

    private void notifySpanAdded(CacheSpan span) {
        ArrayList<Cache.Listener> keyListeners = this.listeners.get(span.key);
        if (keyListeners != null) {
            for (int i = keyListeners.size() - 1; i >= 0; i--) {
                keyListeners.get(i).onSpanAdded(this, span);
            }
        }
        this.evictor.onSpanAdded(this, span);
    }

    private void notifySpanTouched(CacheSpan oldSpan, CacheSpan newSpan) {
        ArrayList<Cache.Listener> keyListeners = this.listeners.get(oldSpan.key);
        if (keyListeners != null) {
            for (int i = keyListeners.size() - 1; i >= 0; i--) {
                keyListeners.get(i).onSpanTouched(this, oldSpan, newSpan);
            }
        }
        this.evictor.onSpanTouched(this, oldSpan, newSpan);
    }

    @Override // com.google.android.exoplayer.upstream.cache.Cache
    public synchronized boolean isCached(String key, long position, long length) {
        TreeSet<CacheSpan> entries = this.cachedSpans.get(key);
        if (entries == null) {
            return false;
        }
        CacheSpan lookupSpan = CacheSpan.createLookup(key, position);
        CacheSpan floorSpan = entries.floor(lookupSpan);
        if (floorSpan == null || floorSpan.position + floorSpan.length <= position) {
            return false;
        }
        long queryEndPosition = position + length;
        long currentEndPosition = floorSpan.position + floorSpan.length;
        if (currentEndPosition >= queryEndPosition) {
            return true;
        }
        for (CacheSpan next : entries.tailSet(floorSpan, false)) {
            if (next.position > currentEndPosition) {
                return false;
            }
            currentEndPosition = Math.max(currentEndPosition, next.position + next.length);
            if (currentEndPosition >= queryEndPosition) {
                return true;
            }
        }
        return false;
    }
}
