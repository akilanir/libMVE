package com.bumptech.glide.request;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/RequestCoordinator.class */
public interface RequestCoordinator {
    boolean canSetImage(Request request);

    boolean canNotifyStatusChanged(Request request);

    boolean isAnyResourceSet();

    void onRequestSuccess(Request request);
}
