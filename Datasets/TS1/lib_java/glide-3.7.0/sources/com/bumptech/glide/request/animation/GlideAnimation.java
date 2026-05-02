package com.bumptech.glide.request.animation;

import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/GlideAnimation.class */
public interface GlideAnimation<R> {

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/GlideAnimation$ViewAdapter.class */
    public interface ViewAdapter {
        View getView();

        Drawable getCurrentDrawable();

        void setDrawable(Drawable drawable);
    }

    boolean animate(R r, ViewAdapter viewAdapter);
}
