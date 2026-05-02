package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.EngineRunnable;
import com.bumptech.glide.request.ResourceCallback;
import com.bumptech.glide.util.Util;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/EngineJob.class */
class EngineJob implements EngineRunnable.EngineRunnableManager {
    private static final EngineResourceFactory DEFAULT_FACTORY = new EngineResourceFactory();
    private static final Handler MAIN_THREAD_HANDLER = new Handler(Looper.getMainLooper(), new MainThreadCallback());
    private static final int MSG_COMPLETE = 1;
    private static final int MSG_EXCEPTION = 2;
    private final List<ResourceCallback> cbs;
    private final EngineResourceFactory engineResourceFactory;
    private final EngineJobListener listener;
    private final Key key;
    private final ExecutorService diskCacheService;
    private final ExecutorService sourceService;
    private final boolean isCacheable;
    private boolean isCancelled;
    private Resource<?> resource;
    private boolean hasResource;
    private Exception exception;
    private boolean hasException;
    private Set<ResourceCallback> ignoredCallbacks;
    private EngineRunnable engineRunnable;
    private EngineResource<?> engineResource;
    private volatile Future<?> future;

    public EngineJob(Key key, ExecutorService diskCacheService, ExecutorService sourceService, boolean isCacheable, EngineJobListener listener) {
        this(key, diskCacheService, sourceService, isCacheable, listener, DEFAULT_FACTORY);
    }

    public EngineJob(Key key, ExecutorService diskCacheService, ExecutorService sourceService, boolean isCacheable, EngineJobListener listener, EngineResourceFactory engineResourceFactory) {
        this.cbs = new ArrayList();
        this.key = key;
        this.diskCacheService = diskCacheService;
        this.sourceService = sourceService;
        this.isCacheable = isCacheable;
        this.listener = listener;
        this.engineResourceFactory = engineResourceFactory;
    }

    public void start(EngineRunnable engineRunnable) {
        this.engineRunnable = engineRunnable;
        this.future = this.diskCacheService.submit(engineRunnable);
    }

    @Override // com.bumptech.glide.load.engine.EngineRunnable.EngineRunnableManager
    public void submitForSource(EngineRunnable runnable) {
        this.future = this.sourceService.submit(runnable);
    }

    public void addCallback(ResourceCallback cb) {
        Util.assertMainThread();
        if (this.hasResource) {
            cb.onResourceReady(this.engineResource);
        } else if (this.hasException) {
            cb.onException(this.exception);
        } else {
            this.cbs.add(cb);
        }
    }

    public void removeCallback(ResourceCallback cb) {
        Util.assertMainThread();
        if (this.hasResource || this.hasException) {
            addIgnoredCallback(cb);
            return;
        }
        this.cbs.remove(cb);
        if (this.cbs.isEmpty()) {
            cancel();
        }
    }

    private void addIgnoredCallback(ResourceCallback cb) {
        if (this.ignoredCallbacks == null) {
            this.ignoredCallbacks = new HashSet();
        }
        this.ignoredCallbacks.add(cb);
    }

    private boolean isInIgnoredCallbacks(ResourceCallback cb) {
        return this.ignoredCallbacks != null && this.ignoredCallbacks.contains(cb);
    }

    void cancel() {
        if (this.hasException || this.hasResource || this.isCancelled) {
            return;
        }
        this.engineRunnable.cancel();
        Future currentFuture = this.future;
        if (currentFuture != null) {
            currentFuture.cancel(true);
        }
        this.isCancelled = true;
        this.listener.onEngineJobCancelled(this, this.key);
    }

    boolean isCancelled() {
        return this.isCancelled;
    }

    @Override // com.bumptech.glide.request.ResourceCallback
    public void onResourceReady(Resource<?> resource) {
        this.resource = resource;
        MAIN_THREAD_HANDLER.obtainMessage(1, this).sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleResultOnMainThread() {
        if (this.isCancelled) {
            this.resource.recycle();
            return;
        }
        if (this.cbs.isEmpty()) {
            throw new IllegalStateException("Received a resource without any callbacks to notify");
        }
        this.engineResource = this.engineResourceFactory.build(this.resource, this.isCacheable);
        this.hasResource = true;
        this.engineResource.acquire();
        this.listener.onEngineJobComplete(this.key, this.engineResource);
        for (ResourceCallback cb : this.cbs) {
            if (!isInIgnoredCallbacks(cb)) {
                this.engineResource.acquire();
                cb.onResourceReady(this.engineResource);
            }
        }
        this.engineResource.release();
    }

    @Override // com.bumptech.glide.request.ResourceCallback
    public void onException(Exception e) {
        this.exception = e;
        MAIN_THREAD_HANDLER.obtainMessage(2, this).sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleExceptionOnMainThread() {
        if (this.isCancelled) {
            return;
        }
        if (this.cbs.isEmpty()) {
            throw new IllegalStateException("Received an exception without any callbacks to notify");
        }
        this.hasException = true;
        this.listener.onEngineJobComplete(this.key, null);
        for (ResourceCallback cb : this.cbs) {
            if (!isInIgnoredCallbacks(cb)) {
                cb.onException(this.exception);
            }
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/EngineJob$EngineResourceFactory.class */
    static class EngineResourceFactory {
        EngineResourceFactory() {
        }

        public <R> EngineResource<R> build(Resource<R> resource, boolean isMemoryCacheable) {
            return new EngineResource<>(resource, isMemoryCacheable);
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/EngineJob$MainThreadCallback.class */
    private static class MainThreadCallback implements Handler.Callback {
        private MainThreadCallback() {
        }

        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            if (1 == message.what || 2 == message.what) {
                EngineJob job = (EngineJob) message.obj;
                if (1 == message.what) {
                    job.handleResultOnMainThread();
                    return true;
                }
                job.handleExceptionOnMainThread();
                return true;
            }
            return false;
        }
    }
}
