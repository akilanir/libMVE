package com.octo.android.robospice.request.listener;

import com.octo.android.robospice.persistence.exception.SpiceException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/RequestListener.class */
public interface RequestListener<RESULT> {
    void onRequestFailure(SpiceException spiceException);

    void onRequestSuccess(RESULT result);
}
