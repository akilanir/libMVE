package com.octo.android.robospice.request;

import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.request.listener.RequestCancellationListener;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/RequestProcessor.class */
public class RequestProcessor {
    private final Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> mapRequestToRequestListener = Collections.synchronizedMap(new LinkedHashMap());
    private final RequestProgressManager requestProgressManager;
    private final RequestRunner requestRunner;
    private final CacheManager cacheManager;
    private boolean isStopped;

    public RequestProcessor(CacheManager cacheManager, RequestProgressManager requestProgressManager, RequestRunner requestRunner) {
        this.cacheManager = cacheManager;
        this.requestProgressManager = requestProgressManager;
        requestProgressManager.setMapRequestToRequestListener(this.mapRequestToRequestListener);
        this.requestRunner = requestRunner;
    }

    public void addRequest(final CachedSpiceRequest<?> request, Set<RequestListener<?>> listRequestListener) {
        Set<RequestListener<?>> listRequestListenerForThisRequest;
        if (this.isStopped) {
            Ln.d("Dropping request : " + request + " as processor is stopped.", new Object[0]);
            return;
        }
        Ln.d("Adding request to queue " + hashCode() + ": " + request + " size is " + this.mapRequestToRequestListener.size(), new Object[0]);
        if (request.isCancelled()) {
            synchronized (this.mapRequestToRequestListener) {
                for (CachedSpiceRequest<?> cachedSpiceRequest : this.mapRequestToRequestListener.keySet()) {
                    if (request.equals(cachedSpiceRequest)) {
                        cachedSpiceRequest.cancel();
                        this.requestProgressManager.notifyListenersOfRequestCancellation(request);
                        return;
                    }
                }
            }
        }
        boolean aggregated = false;
        synchronized (this.mapRequestToRequestListener) {
            listRequestListenerForThisRequest = this.mapRequestToRequestListener.get(request);
            if (listRequestListenerForThisRequest == null) {
                if (request.isProcessable()) {
                    Ln.d("Adding entry for type %s and cacheKey %s.", new Object[]{request.getResultType(), request.getRequestCacheKey()});
                    listRequestListenerForThisRequest = Collections.synchronizedSet(new HashSet());
                    this.mapRequestToRequestListener.put(request, listRequestListenerForThisRequest);
                }
            } else {
                Ln.d("Request for type %s and cacheKey %s already exists.", new Object[]{request.getResultType(), request.getRequestCacheKey()});
                aggregated = true;
            }
        }
        if (listRequestListener != null && listRequestListenerForThisRequest != null) {
            listRequestListenerForThisRequest.addAll(listRequestListener);
        }
        if (aggregated) {
            this.requestProgressManager.notifyListenersOfRequestAggregated(request, listRequestListener);
            return;
        }
        if (request.isProcessable()) {
            this.requestProgressManager.notifyListenersOfRequestAdded(request, listRequestListener);
            RequestCancellationListener requestCancellationListener = new RequestCancellationListener() { // from class: com.octo.android.robospice.request.RequestProcessor.1
                @Override // com.octo.android.robospice.request.listener.RequestCancellationListener
                public void onRequestCancelled() {
                    RequestProcessor.this.requestProgressManager.notifyListenersOfRequestCancellation(request);
                    RequestProcessor.this.mapRequestToRequestListener.remove(request);
                }
            };
            request.setRequestCancellationListener(requestCancellationListener);
            if (request.isCancelled()) {
                this.requestProgressManager.notifyListenersOfRequestCancellation(request);
                this.mapRequestToRequestListener.remove(request);
                return;
            } else {
                this.requestRunner.executeRequest(request);
                return;
            }
        }
        if (listRequestListenerForThisRequest == null) {
            this.requestProgressManager.notifyListenersOfRequestNotFound(request, listRequestListener);
        }
        this.requestProgressManager.notifyOfRequestProcessed(request, listRequestListener);
    }

    public void dontNotifyRequestListenersForRequest(CachedSpiceRequest<?> request, Collection<RequestListener<?>> listRequestListener) {
        this.requestProgressManager.dontNotifyRequestListenersForRequest(request, listRequestListener);
    }

    public boolean removeDataFromCache(Class<?> clazz, Object cacheKey) {
        return this.cacheManager.removeDataFromCache(clazz, cacheKey);
    }

    public void removeAllDataFromCache(Class<?> clazz) {
        this.cacheManager.removeAllDataFromCache(clazz);
    }

    public void removeAllDataFromCache() {
        this.cacheManager.removeAllDataFromCache();
    }

    public boolean isFailOnCacheError() {
        return this.requestRunner.isFailOnCacheError();
    }

    public void setFailOnCacheError(boolean failOnCacheError) {
        this.requestRunner.setFailOnCacheError(failOnCacheError);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append('[');
        stringBuilder.append(getClass().getName());
        stringBuilder.append(" : ");
        stringBuilder.append(" request count= ");
        stringBuilder.append(this.mapRequestToRequestListener.keySet().size());
        stringBuilder.append(", listeners per requests = [");
        for (Map.Entry<CachedSpiceRequest<?>, Set<RequestListener<?>>> entry : this.mapRequestToRequestListener.entrySet()) {
            stringBuilder.append(entry.getKey().getClass().getName());
            stringBuilder.append(":");
            stringBuilder.append(entry.getKey());
            stringBuilder.append(" --> ");
            if (entry.getValue() == null) {
                stringBuilder.append(entry.getValue());
            } else {
                stringBuilder.append(entry.getValue().size());
            }
        }
        stringBuilder.append(']');
        stringBuilder.append(']');
        return stringBuilder.toString();
    }

    public void addSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.requestProgressManager.addSpiceServiceListener(spiceServiceListener);
    }

    public void removeSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.requestProgressManager.removeSpiceServiceListener(spiceServiceListener);
    }

    public void shouldStop() {
        this.isStopped = true;
        this.requestRunner.shouldStop();
    }

    public boolean isStopped() {
        return this.isStopped;
    }
}
