package com.android.volley;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/DefaultRetryPolicy.class */
public class DefaultRetryPolicy implements RetryPolicy {
    private int mCurrentTimeoutMs;
    private int mCurrentRetryCount;
    private final int mMaxNumRetries;
    private final float mBackoffMultiplier;
    public static final int DEFAULT_TIMEOUT_MS = 2500;
    public static final int DEFAULT_MAX_RETRIES = 0;
    public static final float DEFAULT_BACKOFF_MULT = 1.0f;

    public DefaultRetryPolicy() {
        this(DEFAULT_TIMEOUT_MS, 0, 1.0f);
    }

    public DefaultRetryPolicy(int initialTimeoutMs, int maxNumRetries, float backoffMultiplier) {
        this.mCurrentTimeoutMs = initialTimeoutMs;
        this.mMaxNumRetries = maxNumRetries;
        this.mBackoffMultiplier = backoffMultiplier;
    }

    @Override // com.android.volley.RetryPolicy
    public int getCurrentTimeout() {
        return this.mCurrentTimeoutMs;
    }

    @Override // com.android.volley.RetryPolicy
    public int getCurrentRetryCount() {
        return this.mCurrentRetryCount;
    }

    public float getBackoffMultiplier() {
        return this.mBackoffMultiplier;
    }

    @Override // com.android.volley.RetryPolicy
    public void retry(VolleyError error) throws VolleyError {
        this.mCurrentRetryCount++;
        this.mCurrentTimeoutMs = (int) (this.mCurrentTimeoutMs + (this.mCurrentTimeoutMs * this.mBackoffMultiplier));
        if (!hasAttemptRemaining()) {
            throw error;
        }
    }

    protected boolean hasAttemptRemaining() {
        return this.mCurrentRetryCount <= this.mMaxNumRetries;
    }
}
