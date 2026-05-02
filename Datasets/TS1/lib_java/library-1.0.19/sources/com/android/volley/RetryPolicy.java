package com.android.volley;

/* loaded from: library-1.0.19.jar:com/android/volley/RetryPolicy.class */
public interface RetryPolicy {
    int getCurrentTimeout();

    int getCurrentRetryCount();

    void retry(VolleyError volleyError) throws VolleyError;
}
