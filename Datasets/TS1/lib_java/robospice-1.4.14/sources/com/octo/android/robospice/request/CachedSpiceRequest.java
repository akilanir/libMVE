package com.octo.android.robospice.request;

import com.octo.android.robospice.request.listener.RequestCancellationListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import com.octo.android.robospice.request.listener.RequestStatus;
import com.octo.android.robospice.retry.RetryPolicy;
import java.util.concurrent.Future;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/CachedSpiceRequest.class */
public class CachedSpiceRequest<RESULT> extends SpiceRequest<RESULT> {
    private Object requestCacheKey;
    private final long cacheDuration;
    private final SpiceRequest<RESULT> spiceRequest;
    private boolean isProcessable;
    private boolean isAcceptingDirtyCache;
    private boolean isOffline;

    public CachedSpiceRequest(SpiceRequest<RESULT> spiceRequest, Object requestCacheKey, long cacheDuration) {
        super(spiceRequest.getResultType());
        this.isProcessable = true;
        this.requestCacheKey = requestCacheKey;
        this.cacheDuration = cacheDuration;
        this.spiceRequest = spiceRequest;
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public RetryPolicy getRetryPolicy() {
        return this.spiceRequest.getRetryPolicy();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public void setRetryPolicy(RetryPolicy retryPolicy) {
        this.spiceRequest.setRetryPolicy(retryPolicy);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public RESULT loadDataFromNetwork() throws Exception {
        return this.spiceRequest.loadDataFromNetwork();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public Class<RESULT> getResultType() {
        return this.spiceRequest.getResultType();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public boolean isAggregatable() {
        return this.spiceRequest.isAggregatable();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public void setAggregatable(boolean isAggregatable) {
        this.spiceRequest.setAggregatable(isAggregatable);
    }

    public boolean isProcessable() {
        return this.isProcessable;
    }

    public void setProcessable(boolean isProcessable) {
        this.isProcessable = isProcessable;
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    protected void setFuture(Future<?> future) {
        this.spiceRequest.setFuture(future);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public void cancel() {
        this.spiceRequest.cancel();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public boolean isCancelled() {
        return this.spiceRequest.isCancelled();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    protected void setRequestProgressListener(RequestProgressListener requestProgressListener) {
        this.spiceRequest.setRequestProgressListener(requestProgressListener);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public void setRequestCancellationListener(RequestCancellationListener requestCancellationListener) {
        this.spiceRequest.setRequestCancellationListener(requestCancellationListener);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    protected void publishProgress(float progress) {
        this.spiceRequest.publishProgress(progress);
    }

    public Object getRequestCacheKey() {
        return this.requestCacheKey;
    }

    public long getCacheDuration() {
        return this.cacheDuration;
    }

    public SpiceRequest<RESULT> getSpiceRequest() {
        return this.spiceRequest;
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    void setStatus(RequestStatus status) {
        this.spiceRequest.setStatus(status);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    RequestProgress getProgress() {
        return this.spiceRequest.getProgress();
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public void setPriority(int priority) {
        this.spiceRequest.setPriority(priority);
    }

    @Override // com.octo.android.robospice.request.SpiceRequest
    public int getPriority() {
        return this.spiceRequest.getPriority();
    }

    public boolean isAcceptingDirtyCache() {
        return this.isAcceptingDirtyCache;
    }

    public void setAcceptingDirtyCache(boolean isAcceptingDirtyCache) {
        this.isAcceptingDirtyCache = isAcceptingDirtyCache;
    }

    public boolean isOffline() {
        return this.isOffline;
    }

    public void setOffline(boolean isOffline) {
        this.isOffline = isOffline;
    }

    public String toString() {
        return "CachedSpiceRequest [requestCacheKey=" + this.requestCacheKey + ", cacheDuration=" + this.cacheDuration + ", spiceRequest=" + this.spiceRequest + "]";
    }

    public int hashCode() {
        int result = (31 * 1) + (this.spiceRequest.getResultType() == null ? 0 : this.spiceRequest.getResultType().hashCode());
        return (31 * result) + (this.requestCacheKey == null ? 0 : this.requestCacheKey.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof CachedSpiceRequest)) {
            return false;
        }
        CachedSpiceRequest<?> other = (CachedSpiceRequest) obj;
        if ((this.spiceRequest.getResultType() == null && other.spiceRequest.getResultType() != null) || !this.spiceRequest.getResultType().equals(other.spiceRequest.getResultType()) || this.spiceRequest.isAggregatable() != other.spiceRequest.isAggregatable() || this.requestCacheKey == null || !this.requestCacheKey.equals(other.requestCacheKey)) {
            return false;
        }
        return true;
    }

    @Override // com.octo.android.robospice.request.SpiceRequest, java.lang.Comparable
    public int compareTo(SpiceRequest<RESULT> other) {
        if (this == other) {
            return 0;
        }
        if (other == null) {
            return -1;
        }
        return this.spiceRequest.compareTo((SpiceRequest) other);
    }
}
