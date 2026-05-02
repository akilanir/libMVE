package com.octo.android.robospice.retry;

import com.octo.android.robospice.persistence.exception.SpiceException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/retry/RetryPolicy.class */
public interface RetryPolicy {
    int getRetryCount();

    void retry(SpiceException spiceException);

    long getDelayBeforeRetry();
}
