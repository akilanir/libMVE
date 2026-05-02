package com.octo.android.robospice.request.listener;

import com.octo.android.robospice.request.CachedSpiceRequest;
import java.util.Set;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/SpiceServiceServiceListener.class */
public interface SpiceServiceServiceListener {
    void onRequestProcessed(CachedSpiceRequest<?> cachedSpiceRequest, Set<RequestListener<?>> set);
}
