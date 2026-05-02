package com.bumptech.glide.request.animation;

import android.view.View;
import com.bumptech.glide.request.animation.GlideAnimation;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/animation/ViewPropertyAnimation.class */
public class ViewPropertyAnimation<R> implements GlideAnimation<R> {
    private final Animator animator;

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/animation/ViewPropertyAnimation$Animator.class */
    public interface Animator {
        void animate(View view);
    }

    public ViewPropertyAnimation(Animator animator) {
        this.animator = animator;
    }

    @Override // com.bumptech.glide.request.animation.GlideAnimation
    public boolean animate(R current, GlideAnimation.ViewAdapter adapter) {
        View view = adapter.getView();
        if (view != null) {
            this.animator.animate(adapter.getView());
            return false;
        }
        return false;
    }
}
