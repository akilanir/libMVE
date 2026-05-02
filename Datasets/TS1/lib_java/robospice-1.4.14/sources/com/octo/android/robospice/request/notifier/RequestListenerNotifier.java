package com.octo.android.robospice.request.notifier;

import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import java.util.Set;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/notifier/RequestListenerNotifier.class */
public interface RequestListenerNotifier {
    <T> void notifyListenersOfRequestNotFound(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestAdded(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestAggregated(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestSuccess(CachedSpiceRequest<T> cachedSpiceRequest, T t, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestFailure(CachedSpiceRequest<T> cachedSpiceRequest, SpiceException spiceException, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestCancellation(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set);

    <T> void notifyListenersOfRequestProgress(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set, RequestProgress requestProgress);

    <T> void clearNotificationsForRequest(CachedSpiceRequest<T> cachedSpiceRequest, Set<RequestListener<?>> set);
}
