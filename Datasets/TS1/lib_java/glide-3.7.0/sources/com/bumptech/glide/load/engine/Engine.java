package com.bumptech.glide.load.engine;

import android.os.Looper;
import android.os.MessageQueue;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.load.engine.cache.DiskCache;
import com.bumptech.glide.load.engine.cache.DiskCacheAdapter;
import com.bumptech.glide.load.engine.cache.MemoryCache;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.provider.DataLoadProvider;
import com.bumptech.glide.request.ResourceCallback;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.Util;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine.class */
public class Engine implements EngineJobListener, MemoryCache.ResourceRemovedListener, EngineResource.ResourceListener {
    private static final String TAG = "Engine";
    private final Map<Key, EngineJob> jobs;
    private final EngineKeyFactory keyFactory;
    private final MemoryCache cache;
    private final EngineJobFactory engineJobFactory;
    private final Map<Key, WeakReference<EngineResource<?>>> activeResources;
    private final ResourceRecycler resourceRecycler;
    private final LazyDiskCacheProvider diskCacheProvider;
    private ReferenceQueue<EngineResource<?>> resourceReferenceQueue;

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine$LoadStatus.class */
    public static class LoadStatus {
        private final EngineJob engineJob;
        private final ResourceCallback cb;

        public LoadStatus(ResourceCallback cb, EngineJob engineJob) {
            this.cb = cb;
            this.engineJob = engineJob;
        }

        public void cancel() {
            this.engineJob.removeCallback(this.cb);
        }
    }

    public Engine(MemoryCache memoryCache, DiskCache.Factory diskCacheFactory, ExecutorService diskCacheService, ExecutorService sourceService) {
        this(memoryCache, diskCacheFactory, diskCacheService, sourceService, null, null, null, null, null);
    }

    Engine(MemoryCache cache, DiskCache.Factory diskCacheFactory, ExecutorService diskCacheService, ExecutorService sourceService, Map<Key, EngineJob> jobs, EngineKeyFactory keyFactory, Map<Key, WeakReference<EngineResource<?>>> activeResources, EngineJobFactory engineJobFactory, ResourceRecycler resourceRecycler) {
        this.cache = cache;
        this.diskCacheProvider = new LazyDiskCacheProvider(diskCacheFactory);
        this.activeResources = activeResources == null ? new HashMap() : activeResources;
        this.keyFactory = keyFactory == null ? new EngineKeyFactory() : keyFactory;
        this.jobs = jobs == null ? new HashMap() : jobs;
        this.engineJobFactory = engineJobFactory == null ? new EngineJobFactory(diskCacheService, sourceService, this) : engineJobFactory;
        this.resourceRecycler = resourceRecycler == null ? new ResourceRecycler() : resourceRecycler;
        cache.setResourceRemovedListener(this);
    }

    public <T, Z, R> LoadStatus load(Key signature, int width, int height, DataFetcher<T> fetcher, DataLoadProvider<T, Z> loadProvider, Transformation<Z> transformation, ResourceTranscoder<Z, R> transcoder, Priority priority, boolean isMemoryCacheable, DiskCacheStrategy diskCacheStrategy, ResourceCallback cb) {
        Util.assertMainThread();
        long startTime = LogTime.getLogTime();
        String id = fetcher.getId();
        EngineKey key = this.keyFactory.buildKey(id, signature, width, height, loadProvider.getCacheDecoder(), loadProvider.getSourceDecoder(), transformation, loadProvider.getEncoder(), transcoder, loadProvider.getSourceEncoder());
        EngineResource<?> cached = loadFromCache(key, isMemoryCacheable);
        if (cached != null) {
            cb.onResourceReady(cached);
            if (Log.isLoggable(TAG, 2)) {
                logWithTimeAndKey("Loaded resource from cache", startTime, key);
                return null;
            }
            return null;
        }
        EngineResource<?> active = loadFromActiveResources(key, isMemoryCacheable);
        if (active != null) {
            cb.onResourceReady(active);
            if (Log.isLoggable(TAG, 2)) {
                logWithTimeAndKey("Loaded resource from active resources", startTime, key);
                return null;
            }
            return null;
        }
        EngineJob current = this.jobs.get(key);
        if (current != null) {
            current.addCallback(cb);
            if (Log.isLoggable(TAG, 2)) {
                logWithTimeAndKey("Added to existing load", startTime, key);
            }
            return new LoadStatus(cb, current);
        }
        EngineJob engineJob = this.engineJobFactory.build(key, isMemoryCacheable);
        DecodeJob<T, Z, R> decodeJob = new DecodeJob<>(key, width, height, fetcher, loadProvider, transformation, transcoder, this.diskCacheProvider, diskCacheStrategy, priority);
        EngineRunnable runnable = new EngineRunnable(engineJob, decodeJob, priority);
        this.jobs.put(key, engineJob);
        engineJob.addCallback(cb);
        engineJob.start(runnable);
        if (Log.isLoggable(TAG, 2)) {
            logWithTimeAndKey("Started new load", startTime, key);
        }
        return new LoadStatus(cb, engineJob);
    }

    private static void logWithTimeAndKey(String log, long startTime, Key key) {
        Log.v(TAG, log + " in " + LogTime.getElapsedMillis(startTime) + "ms, key: " + key);
    }

    private EngineResource<?> loadFromActiveResources(Key key, boolean isMemoryCacheable) {
        if (!isMemoryCacheable) {
            return null;
        }
        EngineResource<?> active = null;
        WeakReference<EngineResource<?>> activeRef = this.activeResources.get(key);
        if (activeRef != null) {
            active = activeRef.get();
            if (active != null) {
                active.acquire();
            } else {
                this.activeResources.remove(key);
            }
        }
        return active;
    }

    private EngineResource<?> loadFromCache(Key key, boolean isMemoryCacheable) {
        if (!isMemoryCacheable) {
            return null;
        }
        EngineResource<?> cached = getEngineResourceFromCache(key);
        if (cached != null) {
            cached.acquire();
            this.activeResources.put(key, new ResourceWeakReference(key, cached, getReferenceQueue()));
        }
        return cached;
    }

    private EngineResource<?> getEngineResourceFromCache(Key key) {
        EngineResource result;
        Resource<?> cached = this.cache.remove(key);
        if (cached == null) {
            result = null;
        } else if (cached instanceof EngineResource) {
            result = (EngineResource) cached;
        } else {
            result = new EngineResource(cached, true);
        }
        return result;
    }

    public void release(Resource resource) {
        Util.assertMainThread();
        if (resource instanceof EngineResource) {
            ((EngineResource) resource).release();
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    @Override // com.bumptech.glide.load.engine.EngineJobListener
    public void onEngineJobComplete(Key key, EngineResource<?> resource) {
        Util.assertMainThread();
        if (resource != null) {
            resource.setResourceListener(key, this);
            if (resource.isCacheable()) {
                this.activeResources.put(key, new ResourceWeakReference(key, resource, getReferenceQueue()));
            }
        }
        this.jobs.remove(key);
    }

    @Override // com.bumptech.glide.load.engine.EngineJobListener
    public void onEngineJobCancelled(EngineJob engineJob, Key key) {
        Util.assertMainThread();
        EngineJob current = this.jobs.get(key);
        if (engineJob.equals(current)) {
            this.jobs.remove(key);
        }
    }

    @Override // com.bumptech.glide.load.engine.cache.MemoryCache.ResourceRemovedListener
    public void onResourceRemoved(Resource<?> resource) {
        Util.assertMainThread();
        this.resourceRecycler.recycle(resource);
    }

    @Override // com.bumptech.glide.load.engine.EngineResource.ResourceListener
    public void onResourceReleased(Key cacheKey, EngineResource resource) {
        Util.assertMainThread();
        this.activeResources.remove(cacheKey);
        if (resource.isCacheable()) {
            this.cache.put(cacheKey, resource);
        } else {
            this.resourceRecycler.recycle(resource);
        }
    }

    public void clearDiskCache() {
        this.diskCacheProvider.getDiskCache().clear();
    }

    private ReferenceQueue<EngineResource<?>> getReferenceQueue() {
        if (this.resourceReferenceQueue == null) {
            this.resourceReferenceQueue = new ReferenceQueue<>();
            MessageQueue queue = Looper.myQueue();
            queue.addIdleHandler(new RefQueueIdleHandler(this.activeResources, this.resourceReferenceQueue));
        }
        return this.resourceReferenceQueue;
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider.class */
    private static class LazyDiskCacheProvider implements DecodeJob.DiskCacheProvider {
        private final DiskCache.Factory factory;
        private volatile DiskCache diskCache;

        public LazyDiskCacheProvider(DiskCache.Factory factory) {
            this.factory = factory;
        }

        @Override // com.bumptech.glide.load.engine.DecodeJob.DiskCacheProvider
        public DiskCache getDiskCache() {
            if (this.diskCache == null) {
                synchronized (this) {
                    if (this.diskCache == null) {
                        this.diskCache = this.factory.build();
                    }
                    if (this.diskCache == null) {
                        this.diskCache = new DiskCacheAdapter();
                    }
                }
            }
            return this.diskCache;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine$ResourceWeakReference.class */
    private static class ResourceWeakReference extends WeakReference<EngineResource<?>> {
        private final Key key;

        public ResourceWeakReference(Key key, EngineResource<?> r, ReferenceQueue<? super EngineResource<?>> q) {
            super(r, q);
            this.key = key;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine$RefQueueIdleHandler.class */
    private static class RefQueueIdleHandler implements MessageQueue.IdleHandler {
        private final Map<Key, WeakReference<EngineResource<?>>> activeResources;
        private final ReferenceQueue<EngineResource<?>> queue;

        public RefQueueIdleHandler(Map<Key, WeakReference<EngineResource<?>>> activeResources, ReferenceQueue<EngineResource<?>> queue) {
            this.activeResources = activeResources;
            this.queue = queue;
        }

        @Override // android.os.MessageQueue.IdleHandler
        public boolean queueIdle() {
            ResourceWeakReference ref = (ResourceWeakReference) this.queue.poll();
            if (ref != null) {
                this.activeResources.remove(ref.key);
                return true;
            }
            return true;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Engine$EngineJobFactory.class */
    static class EngineJobFactory {
        private final ExecutorService diskCacheService;
        private final ExecutorService sourceService;
        private final EngineJobListener listener;

        public EngineJobFactory(ExecutorService diskCacheService, ExecutorService sourceService, EngineJobListener listener) {
            this.diskCacheService = diskCacheService;
            this.sourceService = sourceService;
            this.listener = listener;
        }

        public EngineJob build(Key key, boolean isMemoryCacheable) {
            return new EngineJob(key, this.diskCacheService, this.sourceService, isMemoryCacheable, this.listener);
        }
    }
}
