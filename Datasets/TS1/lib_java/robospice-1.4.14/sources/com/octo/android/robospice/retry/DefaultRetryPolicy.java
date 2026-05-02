package com.octo.android.robospice.retry;

import com.octo.android.robospice.persistence.exception.SpiceException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/retry/DefaultRetryPolicy.class */
public class DefaultRetryPolicy implements RetryPolicy {
    public static final int DEFAULT_RETRY_COUNT = 3;
    public static final long DEFAULT_DELAY_BEFORE_RETRY = 2500;
    public static final float DEFAULT_BACKOFF_MULT = 1.0f;
    private int retryCount;
    private long delayBeforeRetry;
    private float backOffMultiplier;

    public DefaultRetryPolicy(int retryCount, long delayBeforeRetry, float backOffMultiplier) {
        this.retryCount = 3;
        this.delayBeforeRetry = DEFAULT_DELAY_BEFORE_RETRY;
        this.backOffMultiplier = 1.0f;
        this.retryCount = retryCount;
        this.delayBeforeRetry = delayBeforeRetry;
        this.backOffMultiplier = backOffMultiplier;
    }

    public DefaultRetryPolicy() {
        this(3, DEFAULT_DELAY_BEFORE_RETRY, 1.0f);
    }

    @Override // com.octo.android.robospice.retry.RetryPolicy
    public int getRetryCount() {
        return this.retryCount;
    }

    @Override // com.octo.android.robospice.retry.RetryPolicy
    public void retry(SpiceException e) {
        this.retryCount--;
        this.delayBeforeRetry = (long) (this.delayBeforeRetry * this.backOffMultiplier);
    }

    @Override // com.octo.android.robospice.retry.RetryPolicy
    public long getDelayBeforeRetry() {
        return this.delayBeforeRetry;
    }
}
