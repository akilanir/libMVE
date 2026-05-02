package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.manager.LifecycleListener;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.animation.GlideAnimation;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/Target.class */
public interface Target<R> extends LifecycleListener {
    public static final int SIZE_ORIGINAL = Integer.MIN_VALUE;

    void onLoadStarted(Drawable drawable);

    void onLoadFailed(Exception exc, Drawable drawable);

    void onResourceReady(R r, GlideAnimation<? super R> glideAnimation);

    void onLoadCleared(Drawable drawable);

    void getSize(SizeReadyCallback sizeReadyCallback);

    void setRequest(Request request);

    Request getRequest();
}
