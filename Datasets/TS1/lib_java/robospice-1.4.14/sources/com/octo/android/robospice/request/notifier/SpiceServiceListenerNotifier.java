package com.octo.android.robospice.request.notifier;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier.class */
public class SpiceServiceListenerNotifier {
    private final List<SpiceServiceListener> spiceServiceListenerList = Collections.synchronizedList(new ArrayList());
    private Handler messageQueue;

    public void addSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.spiceServiceListenerList.add(spiceServiceListener);
        if (this.messageQueue == null) {
            Ln.d("Message Queue starting", new Object[0]);
            this.messageQueue = new Handler(Looper.getMainLooper());
        }
    }

    public void removeSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.spiceServiceListenerList.remove(spiceServiceListener);
    }

    int getRequestToObserverMapCount() {
        return this.spiceServiceListenerList.size();
    }

    protected void createMessageQueue() {
        this.messageQueue = new Handler(Looper.getMainLooper());
    }

    public void notifyObserversOfRequestNotFound(CachedSpiceRequest<?> request) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        post(new RequestNotFoundNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestAdded(CachedSpiceRequest<?> request, Set<RequestListener<?>> requestListeners) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        requestProcessingContext.setRequestListeners(requestListeners);
        post(new RequestAddedNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestAggregated(CachedSpiceRequest<?> request, Set<RequestListener<?>> requestListeners) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        requestProcessingContext.setRequestListeners(requestListeners);
        post(new RequestAggregatedNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestFailure(CachedSpiceRequest<?> request) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        post(new RequestFailedNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public <T> void notifyObserversOfRequestSuccess(CachedSpiceRequest<T> request) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        post(new RequestSucceededNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestCancellation(CachedSpiceRequest<?> request) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        post(new RequestCancelledNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestProgress(CachedSpiceRequest<?> request, RequestProgress requestProgress) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        requestProcessingContext.setRequestProgress(requestProgress);
        post(new RequestProgressNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    public void notifyObserversOfRequestProcessed(CachedSpiceRequest<?> request, Set<RequestListener<?>> requestListeners) {
        SpiceServiceListener.RequestProcessingContext requestProcessingContext = new SpiceServiceListener.RequestProcessingContext();
        requestProcessingContext.setExecutionThread(Thread.currentThread());
        requestProcessingContext.setRequestListeners(requestListeners);
        post(new RequestProcessedNotifier(request, this.spiceServiceListenerList, requestProcessingContext));
    }

    protected void post(Runnable runnable) {
        Ln.d("Message queue is " + this.messageQueue, new Object[0]);
        if (this.messageQueue == null) {
            return;
        }
        this.messageQueue.postAtTime(runnable, SystemClock.uptimeMillis());
    }

    protected void onStopped() {
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAddedNotifier.class */
    private static class RequestAddedNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestAddedNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            Ln.d("Processing request added: %s", new Object[]{this.request});
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestAdded(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier.class */
    private static class RequestAggregatedNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestAggregatedNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            Ln.d("Processing request added: %s", new Object[]{this.request});
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestAggregated(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestNotFoundNotifier.class */
    private static class RequestNotFoundNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestNotFoundNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            Ln.d("Processing request not found: %s", new Object[]{this.request});
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestNotFound(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestFailedNotifier.class */
    private static class RequestFailedNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestFailedNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestFailed(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestSucceededNotifier.class */
    private static class RequestSucceededNotifier<T> implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<T> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestSucceededNotifier(CachedSpiceRequest<T> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestSucceeded(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestCancelledNotifier.class */
    private static class RequestCancelledNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestCancelledNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            Ln.d("Processing request cancelled: %s", new Object[]{this.request});
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestCancelled(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProgressNotifier.class */
    private static class RequestProgressNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestProgressNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestProgressUpdated(this.request, this.requestProcessingContext);
                }
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier.class */
    private static class RequestProcessedNotifier implements Runnable {
        private List<SpiceServiceListener> spiceServiceListenerList;
        private CachedSpiceRequest<?> request;
        private SpiceServiceListener.RequestProcessingContext requestProcessingContext;

        public RequestProcessedNotifier(CachedSpiceRequest<?> request, List<SpiceServiceListener> spiceServiceListenerList, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            this.spiceServiceListenerList = spiceServiceListenerList;
            this.request = request;
            this.requestProcessingContext = requestProcessingContext;
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this.spiceServiceListenerList) {
                for (SpiceServiceListener listener : this.spiceServiceListenerList) {
                    listener.onRequestProcessed(this.request, this.requestProcessingContext);
                }
            }
        }
    }
}
