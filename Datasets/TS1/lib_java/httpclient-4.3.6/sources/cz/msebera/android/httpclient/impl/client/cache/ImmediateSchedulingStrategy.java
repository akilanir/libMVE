package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/ImmediateSchedulingStrategy.class */
public class ImmediateSchedulingStrategy implements SchedulingStrategy {
    private final ExecutorService executor;

    public ImmediateSchedulingStrategy(CacheConfig cacheConfig) {
        this(new ThreadPoolExecutor(cacheConfig.getAsynchronousWorkersCore(), cacheConfig.getAsynchronousWorkersMax(), cacheConfig.getAsynchronousWorkerIdleLifetimeSecs(), TimeUnit.SECONDS, new ArrayBlockingQueue(cacheConfig.getRevalidationQueueSize())));
    }

    ImmediateSchedulingStrategy(ExecutorService executor) {
        this.executor = executor;
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.SchedulingStrategy
    public void schedule(AsynchronousValidationRequest revalidationRequest) {
        if (revalidationRequest == null) {
            throw new IllegalArgumentException("AsynchronousValidationRequest may not be null");
        }
        this.executor.execute(revalidationRequest);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.executor.shutdown();
    }

    void awaitTermination(long timeout, TimeUnit unit) throws InterruptedException {
        this.executor.awaitTermination(timeout, unit);
    }
}
