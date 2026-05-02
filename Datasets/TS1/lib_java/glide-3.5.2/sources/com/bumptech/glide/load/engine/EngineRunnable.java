package com.bumptech.glide.load.engine;

import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.engine.executor.Prioritized;
import com.bumptech.glide.request.ResourceCallback;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/EngineRunnable.class */
class EngineRunnable implements Runnable, Prioritized {
    private static final String TAG = "EngineRunnable";
    private final Priority priority;
    private final EngineRunnableManager manager;
    private final DecodeJob<?, ?, ?> decodeJob;
    private Stage stage = Stage.CACHE;
    private volatile boolean isCancelled;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/EngineRunnable$EngineRunnableManager.class */
    interface EngineRunnableManager extends ResourceCallback {
        void submitForSource(EngineRunnable engineRunnable);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/EngineRunnable$Stage.class */
    private enum Stage {
        CACHE,
        SOURCE
    }

    public EngineRunnable(EngineRunnableManager manager, DecodeJob<?, ?, ?> decodeJob, Priority priority) {
        this.manager = manager;
        this.decodeJob = decodeJob;
        this.priority = priority;
    }

    public void cancel() {
        this.isCancelled = true;
        this.decodeJob.cancel();
    }

    @Override // java.lang.Runnable
    public void run() {
        if (this.isCancelled) {
            return;
        }
        Exception exception = null;
        Resource<?> resource = null;
        try {
            resource = decode();
        } catch (Exception e) {
            if (Log.isLoggable(TAG, 2)) {
                Log.v(TAG, "Exception decoding", e);
            }
            exception = e;
        }
        if (this.isCancelled) {
            if (resource != null) {
                resource.recycle();
            }
        } else if (resource == null) {
            onLoadFailed(exception);
        } else {
            onLoadComplete(resource);
        }
    }

    private boolean isDecodingFromCache() {
        return this.stage == Stage.CACHE;
    }

    private void onLoadComplete(Resource resource) {
        this.manager.onResourceReady(resource);
    }

    private void onLoadFailed(Exception e) {
        if (isDecodingFromCache()) {
            this.stage = Stage.SOURCE;
            this.manager.submitForSource(this);
        } else {
            this.manager.onException(e);
        }
    }

    private Resource<?> decode() throws Exception {
        if (isDecodingFromCache()) {
            return decodeFromCache();
        }
        return decodeFromSource();
    }

    private Resource<?> decodeFromCache() throws Exception {
        Resource<?> result = null;
        try {
            result = this.decodeJob.decodeResultFromCache();
        } catch (Exception e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Exception decoding result from cache: " + e);
            }
        }
        if (result == null) {
            result = this.decodeJob.decodeSourceFromCache();
        }
        return result;
    }

    private Resource<?> decodeFromSource() throws Exception {
        return this.decodeJob.decodeFromSource();
    }

    @Override // com.bumptech.glide.load.engine.executor.Prioritized
    public int getPriority() {
        return this.priority.ordinal();
    }
}
