package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.request.Request;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/target/BaseTarget.class */
public abstract class BaseTarget<Z> implements Target<Z> {
    private Request request;

    @Override // com.bumptech.glide.request.target.Target
    public void setRequest(Request request) {
        this.request = request;
    }

    @Override // com.bumptech.glide.request.target.Target
    public Request getRequest() {
        return this.request;
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onLoadCleared(Drawable placeholder) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onLoadStarted(Drawable placeholder) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onLoadFailed(Exception e, Drawable errorDrawable) {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onStart() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onStop() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onDestroy() {
    }
}
