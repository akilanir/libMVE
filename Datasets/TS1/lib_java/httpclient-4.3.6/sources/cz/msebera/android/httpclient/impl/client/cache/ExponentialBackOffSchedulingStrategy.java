package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/ExponentialBackOffSchedulingStrategy.class */
public class ExponentialBackOffSchedulingStrategy implements SchedulingStrategy {
    public static final long DEFAULT_BACK_OFF_RATE = 10;
    public static final long DEFAULT_INITIAL_EXPIRY_IN_MILLIS = TimeUnit.SECONDS.toMillis(6);
    public static final long DEFAULT_MAX_EXPIRY_IN_MILLIS = TimeUnit.SECONDS.toMillis(86400);
    private final long backOffRate;
    private final long initialExpiryInMillis;
    private final long maxExpiryInMillis;
    private final ScheduledExecutorService executor;

    public ExponentialBackOffSchedulingStrategy(CacheConfig cacheConfig) {
        this(cacheConfig, 10L, DEFAULT_INITIAL_EXPIRY_IN_MILLIS, DEFAULT_MAX_EXPIRY_IN_MILLIS);
    }

    public ExponentialBackOffSchedulingStrategy(CacheConfig cacheConfig, long backOffRate, long initialExpiryInMillis, long maxExpiryInMillis) {
        this(createThreadPoolFromCacheConfig(cacheConfig), backOffRate, initialExpiryInMillis, maxExpiryInMillis);
    }

    private static ScheduledThreadPoolExecutor createThreadPoolFromCacheConfig(CacheConfig cacheConfig) {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(cacheConfig.getAsynchronousWorkersMax());
        scheduledThreadPoolExecutor.setExecuteExistingDelayedTasksAfterShutdownPolicy(false);
        return scheduledThreadPoolExecutor;
    }

    ExponentialBackOffSchedulingStrategy(ScheduledExecutorService executor, long backOffRate, long initialExpiryInMillis, long maxExpiryInMillis) {
        this.executor = (ScheduledExecutorService) checkNotNull("executor", executor);
        this.backOffRate = checkNotNegative("backOffRate", backOffRate);
        this.initialExpiryInMillis = checkNotNegative("initialExpiryInMillis", initialExpiryInMillis);
        this.maxExpiryInMillis = checkNotNegative("maxExpiryInMillis", maxExpiryInMillis);
    }

    @Override // cz.msebera.android.httpclient.impl.client.cache.SchedulingStrategy
    public void schedule(AsynchronousValidationRequest revalidationRequest) {
        checkNotNull("revalidationRequest", revalidationRequest);
        int consecutiveFailedAttempts = revalidationRequest.getConsecutiveFailedAttempts();
        long delayInMillis = calculateDelayInMillis(consecutiveFailedAttempts);
        this.executor.schedule(revalidationRequest, delayInMillis, TimeUnit.MILLISECONDS);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.executor.shutdown();
    }

    public long getBackOffRate() {
        return this.backOffRate;
    }

    public long getInitialExpiryInMillis() {
        return this.initialExpiryInMillis;
    }

    public long getMaxExpiryInMillis() {
        return this.maxExpiryInMillis;
    }

    protected long calculateDelayInMillis(int consecutiveFailedAttempts) {
        if (consecutiveFailedAttempts > 0) {
            long delayInSeconds = (long) (this.initialExpiryInMillis * Math.pow(this.backOffRate, consecutiveFailedAttempts - 1));
            return Math.min(delayInSeconds, this.maxExpiryInMillis);
        }
        return 0L;
    }

    protected static <T> T checkNotNull(String parameterName, T value) {
        if (value == null) {
            throw new IllegalArgumentException(parameterName + " may not be null");
        }
        return value;
    }

    protected static long checkNotNegative(String parameterName, long value) {
        if (value < 0) {
            throw new IllegalArgumentException(parameterName + " may not be negative");
        }
        return value;
    }
}
