package com.octo.android.robospice.request;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/RequestRunner.class */
public interface RequestRunner {
    void executeRequest(CachedSpiceRequest<?> cachedSpiceRequest);

    boolean isFailOnCacheError();

    void setFailOnCacheError(boolean z);

    void shouldStop();
}
