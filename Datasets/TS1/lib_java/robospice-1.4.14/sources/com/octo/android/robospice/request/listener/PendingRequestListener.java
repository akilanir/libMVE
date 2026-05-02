package com.octo.android.robospice.request.listener;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/PendingRequestListener.class */
public interface PendingRequestListener<RESULT> extends RequestListener<RESULT> {
    void onRequestNotFound();
}
