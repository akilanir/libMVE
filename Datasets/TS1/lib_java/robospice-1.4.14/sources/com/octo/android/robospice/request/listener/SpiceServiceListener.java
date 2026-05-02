package com.octo.android.robospice.request.listener;

import com.octo.android.robospice.request.CachedSpiceRequest;
import java.util.Set;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/SpiceServiceListener.class */
public interface SpiceServiceListener {
    void onRequestSucceeded(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestFailed(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestCancelled(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestProgressUpdated(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestAdded(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestAggregated(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestNotFound(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onRequestProcessed(CachedSpiceRequest<?> cachedSpiceRequest, RequestProcessingContext requestProcessingContext);

    void onServiceStopped();

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext.class */
    public static class RequestProcessingContext {
        private Thread executionThread;
        private RequestProgress requestProgress;
        private Set<RequestListener<?>> requestListeners;

        public void setExecutionThread(Thread executionThread) {
            this.executionThread = executionThread;
        }

        public Thread getExecutionThread() {
            return this.executionThread;
        }

        public void setRequestProgress(RequestProgress requestProgress) {
            this.requestProgress = requestProgress;
        }

        public RequestProgress getRequestProgress() {
            return this.requestProgress;
        }

        public void setRequestListeners(Set<RequestListener<?>> requestListeners) {
            this.requestListeners = requestListeners;
        }

        public Set<RequestListener<?>> getRequestListeners() {
            return this.requestListeners;
        }
    }
}
