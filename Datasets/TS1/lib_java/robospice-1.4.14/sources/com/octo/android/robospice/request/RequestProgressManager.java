package com.octo.android.robospice.request;

import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import com.octo.android.robospice.request.listener.RequestStatus;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import com.octo.android.robospice.request.notifier.RequestListenerNotifier;
import com.octo.android.robospice.request.notifier.SpiceServiceListenerNotifier;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/RequestProgressManager.class */
public class RequestProgressManager {
    private Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> mapRequestToRequestListener;
    private final RequestProcessorListener requestProcessorListener;
    private final RequestListenerNotifier requestListenerNotifier;
    private final SpiceServiceListenerNotifier spiceServiceListenerNotifier;

    public RequestProgressManager(RequestProcessorListener requestProcessorListener, RequestListenerNotifier requestListenerNotifier, SpiceServiceListenerNotifier spiceServiceListenerNotifier) {
        this.requestProcessorListener = requestProcessorListener;
        this.requestListenerNotifier = requestListenerNotifier;
        this.spiceServiceListenerNotifier = spiceServiceListenerNotifier;
    }

    public void setMapRequestToRequestListener(Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> mapRequestToRequestListener) {
        this.mapRequestToRequestListener = mapRequestToRequestListener;
    }

    public void notifyListenersOfRequestNotFound(CachedSpiceRequest<?> request, Set<RequestListener<?>> listeners) {
        Ln.d("Request was *NOT* found when adding request listeners to existing requests.", new Object[0]);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestNotFound(request);
        this.requestListenerNotifier.notifyListenersOfRequestNotFound(request, listeners);
    }

    public <T> void notifyListenersOfRequestAdded(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
        Ln.d("Request was added to queue.", new Object[0]);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestAdded(request, listeners);
        this.requestListenerNotifier.notifyListenersOfRequestAdded(request, listeners);
        notifyListenersOfRequestProgress((CachedSpiceRequest<?>) request, listeners, request.getProgress());
    }

    public <T> void notifyListenersOfRequestAggregated(CachedSpiceRequest<T> request, Set<RequestListener<?>> listeners) {
        Ln.d("Request was aggregated in queue.", new Object[0]);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestAggregated(request, listeners);
        this.requestListenerNotifier.notifyListenersOfRequestAggregated(request, listeners);
        notifyListenersOfRequestProgress((CachedSpiceRequest<?>) request, listeners, request.getProgress());
    }

    protected <T> void notifyListenersOfRequestProgress(CachedSpiceRequest<?> request, Set<RequestListener<?>> listeners, RequestStatus status) {
        notifyListenersOfRequestProgress(request, listeners, new RequestProgress(status));
        checkAllRequestComplete();
    }

    public <T> void notifyListenersOfRequestProgress(CachedSpiceRequest<?> request, Set<RequestListener<?>> listeners, RequestProgress progress) {
        Ln.d("Sending progress %s", new Object[]{progress.getStatus()});
        this.spiceServiceListenerNotifier.notifyObserversOfRequestProgress(request, progress);
        this.requestListenerNotifier.notifyListenersOfRequestProgress(request, listeners, progress);
        checkAllRequestComplete();
    }

    protected void checkAllRequestComplete() {
        if (this.mapRequestToRequestListener.isEmpty()) {
            Ln.d("Sending all request complete.", new Object[0]);
            this.requestProcessorListener.allRequestComplete();
        }
    }

    public <T> void notifyListenersOfRequestSuccessButDontCompleteRequest(CachedSpiceRequest<T> request, T result) {
        Set<RequestListener<?>> listeners = this.mapRequestToRequestListener.get(request);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestSuccess(request);
        this.requestListenerNotifier.notifyListenersOfRequestSuccess(request, result, listeners);
    }

    public <T> void notifyListenersOfRequestSuccess(CachedSpiceRequest<T> request, T result) {
        Set<RequestListener<?>> listeners = this.mapRequestToRequestListener.get(request);
        notifyListenersOfRequestProgress((CachedSpiceRequest<?>) request, listeners, RequestStatus.COMPLETE);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestSuccess(request);
        this.requestListenerNotifier.notifyListenersOfRequestSuccess(request, result, listeners);
        notifyOfRequestProcessed(request, listeners);
    }

    public <T> void notifyListenersOfRequestFailure(CachedSpiceRequest<T> request, SpiceException e) {
        Set<RequestListener<?>> listeners = this.mapRequestToRequestListener.get(request);
        notifyListenersOfRequestProgress((CachedSpiceRequest<?>) request, listeners, RequestStatus.COMPLETE);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestFailure(request);
        this.requestListenerNotifier.notifyListenersOfRequestFailure(request, e, listeners);
        notifyOfRequestProcessed(request, listeners);
    }

    public void notifyListenersOfRequestCancellation(CachedSpiceRequest<?> request) {
        Ln.d("Not calling network request : " + request + " as it is cancelled. ", new Object[0]);
        Set<RequestListener<?>> listeners = this.mapRequestToRequestListener.get(request);
        notifyListenersOfRequestProgress(request, listeners, RequestStatus.COMPLETE);
        this.spiceServiceListenerNotifier.notifyObserversOfRequestCancellation(request);
        this.requestListenerNotifier.notifyListenersOfRequestCancellation(request, listeners);
        notifyOfRequestProcessed(request, listeners);
    }

    public void dontNotifyRequestListenersForRequest(CachedSpiceRequest<?> request, Collection<RequestListener<?>> listRequestListener) {
        Set<RequestListener<?>> setRequestListener = this.mapRequestToRequestListener.get(request);
        this.requestListenerNotifier.clearNotificationsForRequest(request, setRequestListener);
        if (setRequestListener != null && listRequestListener != null) {
            Ln.d("Removing listeners of request : " + request.toString() + " : " + setRequestListener.size(), new Object[0]);
            setRequestListener.removeAll(listRequestListener);
        }
    }

    public void addSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.spiceServiceListenerNotifier.addSpiceServiceListener(spiceServiceListener);
    }

    public void removeSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.spiceServiceListenerNotifier.removeSpiceServiceListener(spiceServiceListener);
    }

    public void notifyOfRequestProcessed(CachedSpiceRequest<?> request, Set<RequestListener<?>> listeners) {
        Ln.v("Removing %s  size is %d", new Object[]{request, Integer.valueOf(this.mapRequestToRequestListener.size())});
        this.mapRequestToRequestListener.remove(request);
        checkAllRequestComplete();
        this.spiceServiceListenerNotifier.notifyObserversOfRequestProcessed(request, listeners);
    }

    public int getPendingRequestCount() {
        return this.mapRequestToRequestListener.keySet().size();
    }

    public <T> RequestProgressListener createProgressListener(final CachedSpiceRequest<T> request) {
        RequestProgressListener requestProgressListener = new RequestProgressListener() { // from class: com.octo.android.robospice.request.RequestProgressManager.1
            @Override // com.octo.android.robospice.request.listener.RequestProgressListener
            public void onRequestProgressUpdate(RequestProgress progress) {
                Set<RequestListener<?>> listeners = (Set) RequestProgressManager.this.mapRequestToRequestListener.get(request);
                RequestProgressManager.this.notifyListenersOfRequestProgress(request, listeners, progress);
            }
        };
        return requestProgressListener;
    }
}
