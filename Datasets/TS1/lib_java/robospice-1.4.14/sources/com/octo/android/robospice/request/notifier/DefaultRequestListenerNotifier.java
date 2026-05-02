package com.octo.android.robospice.request.notifier;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.octo.android.robospice.exception.RequestCancelledException;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.listener.PendingRequestListener;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import java.util.Set;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier.class */
public class DefaultRequestListenerNotifier implements RequestListenerNotifier {
    private final Handler handlerResponse = new Handler(Looper.getMainLooper());

    private void post(Runnable r, Object token) {
        this.handlerResponse.postAtTime(r, token, SystemClock.uptimeMillis());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestNotFound(CachedSpiceRequest<T> request, Set<RequestListener<?>> listRequestListener) {
        post(new NotFoundRunnable(listRequestListener), request.getRequestCacheKey());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestAdded(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestAggregated(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestProgress(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners, RequestProgress progress) {
        post(new ProgressRunnable(listeners, progress), request.getRequestCacheKey());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestSuccess(CachedSpiceRequest<T> request, T result, Set<RequestListener<?>> listeners) {
        post(new ResultRunnable(listeners, result), request.getRequestCacheKey());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestFailure(CachedSpiceRequest<T> request, SpiceException e, Set<RequestListener<?>> listeners) {
        post(new ResultRunnable(listeners, e), request.getRequestCacheKey());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void notifyListenersOfRequestCancellation(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
        post(new ResultRunnable(listeners, (SpiceException) new RequestCancelledException("Request has been cancelled explicitely.")), request.getRequestCacheKey());
    }

    @Override // com.octo.android.robospice.request.notifier.RequestListenerNotifier
    public <T> void clearNotificationsForRequest(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
        this.handlerResponse.removeCallbacksAndMessages(request.getRequestCacheKey());
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$NotFoundRunnable.class */
    private static class NotFoundRunnable implements Runnable {
        private final Set<RequestListener<?>> listeners;

        public NotFoundRunnable(Set<RequestListener<?>> listeners) {
            this.listeners = listeners;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.listeners == null) {
                return;
            }
            Ln.v("Notifying " + this.listeners.size() + " listeners of request not found", new Object[0]);
            synchronized (this.listeners) {
                for (RequestListener<?> listener : this.listeners) {
                    if (listener != null && (listener instanceof PendingRequestListener)) {
                        Ln.v("Notifying %s", new Object[]{listener.getClass().getSimpleName()});
                        ((PendingRequestListener) listener).onRequestNotFound();
                    }
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ProgressRunnable.class */
    private static class ProgressRunnable implements Runnable {
        private final RequestProgress progress;
        private final Set<RequestListener<?>> listeners;

        public ProgressRunnable(Set<RequestListener<?>> listeners, RequestProgress progress) {
            this.progress = progress;
            this.listeners = listeners;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.listeners == null) {
                return;
            }
            Ln.v("Notifying " + this.listeners.size() + " listeners of progress " + this.progress, new Object[0]);
            synchronized (this.listeners) {
                for (RequestListener<?> listener : this.listeners) {
                    if (listener != null && (listener instanceof RequestProgressListener)) {
                        Ln.v("Notifying %s", new Object[]{listener.getClass().getSimpleName()});
                        ((RequestProgressListener) listener).onRequestProgressUpdate(this.progress);
                    }
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier$ResultRunnable.class */
    private static class ResultRunnable<T> implements Runnable {
        private SpiceException spiceException;
        private T result;
        private final Set<RequestListener<?>> listeners;

        public ResultRunnable(Set<RequestListener<?>> listeners, T result) {
            this.result = result;
            this.listeners = listeners;
        }

        public ResultRunnable(Set<RequestListener<?>> listeners, SpiceException spiceException) {
            this.spiceException = spiceException;
            this.listeners = listeners;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.listeners == null) {
                return;
            }
            Ln.v("Notifying " + this.listeners.size() + " listeners of request " + (this.spiceException == null ? "success" : "failure"), new Object[0]);
            synchronized (this.listeners) {
                for (RequestListener<?> requestListener : this.listeners) {
                    if (requestListener != null) {
                        Ln.v("Notifying %s", new Object[]{requestListener.getClass().getSimpleName()});
                        if (this.spiceException == null) {
                            requestListener.onRequestSuccess(this.result);
                        } else {
                            requestListener.onRequestFailure(this.spiceException);
                        }
                    }
                }
            }
        }
    }
}
