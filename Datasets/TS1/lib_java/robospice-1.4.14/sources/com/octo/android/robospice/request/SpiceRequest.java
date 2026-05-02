package com.octo.android.robospice.request;

import android.content.Context;
import com.octo.android.robospice.request.listener.RequestCancellationListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import com.octo.android.robospice.request.listener.RequestStatus;
import com.octo.android.robospice.retry.DefaultRetryPolicy;
import com.octo.android.robospice.retry.RetryPolicy;
import java.lang.reflect.Modifier;
import java.util.concurrent.Future;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/SpiceRequest.class */
public abstract class SpiceRequest<RESULT> implements Comparable<SpiceRequest<RESULT>> {
    public static final int PRIORITY_HIGH = 0;
    public static final int PRIORITY_NORMAL = 50;
    public static final int PRIORITY_LOW = 100;
    private final Class<RESULT> resultType;
    private Future<?> future;
    private RequestProgressListener requestProgressListener;
    private RequestCancellationListener requestCancellationListener;
    private boolean isCanceled = false;
    private boolean isAggregatable = true;
    private int priority = 50;
    private RequestProgress progress = new RequestProgress(RequestStatus.PENDING);
    private RetryPolicy retryPolicy = new DefaultRetryPolicy();

    public abstract RESULT loadDataFromNetwork() throws Exception;

    public SpiceRequest(Class<RESULT> clazz) {
        checkInnerClassDeclarationToPreventMemoryLeak();
        this.resultType = clazz;
    }

    public RetryPolicy getRetryPolicy() {
        return this.retryPolicy;
    }

    public void setRetryPolicy(RetryPolicy retryPolicy) {
        this.retryPolicy = retryPolicy;
    }

    public void setPriority(int priority) {
        if (priority < 0) {
            throw new IllegalArgumentException("Priority must be positive.");
        }
        this.priority = priority;
    }

    public int getPriority() {
        return this.priority;
    }

    private void checkInnerClassDeclarationToPreventMemoryLeak() {
        if (getClass().isMemberClass() && Context.class.isAssignableFrom(getClass().getDeclaringClass()) && !Modifier.isStatic(getClass().getModifiers())) {
            throw new IllegalArgumentException("Requests must be either non-inner classes or a static inner member class of Context : " + getClass());
        }
    }

    public Class<RESULT> getResultType() {
        return this.resultType;
    }

    public void cancel() {
        this.isCanceled = true;
        if (this.future != null) {
            this.future.cancel(true);
        }
        if (this.requestCancellationListener != null) {
            this.requestCancellationListener.onRequestCancelled();
        }
    }

    void setStatus(RequestStatus status) {
        this.progress = new RequestProgress(status);
        publishProgress();
    }

    RequestProgress getProgress() {
        return this.progress;
    }

    public boolean isCancelled() {
        return this.isCanceled;
    }

    public boolean isAggregatable() {
        return this.isAggregatable;
    }

    public void setAggregatable(boolean isAggregatable) {
        this.isAggregatable = isAggregatable;
    }

    protected void setFuture(Future<?> future) {
        this.future = future;
    }

    protected void setRequestProgressListener(RequestProgressListener requestProgressListener) {
        this.requestProgressListener = requestProgressListener;
    }

    protected void publishProgress() {
        if (this.requestProgressListener != null) {
            this.requestProgressListener.onRequestProgressUpdate(this.progress);
        }
    }

    protected void publishProgress(float progress) {
        this.progress.setStatus(RequestStatus.LOADING_FROM_NETWORK);
        this.progress.setProgress(progress);
        publishProgress();
    }

    public void setRequestCancellationListener(RequestCancellationListener requestCancellationListener) {
        this.requestCancellationListener = requestCancellationListener;
    }

    @Override // java.lang.Comparable
    public int compareTo(SpiceRequest<RESULT> other) {
        if (this == other) {
            return 0;
        }
        return this.priority - other.priority;
    }
}
