package com.bumptech.glide.request.animation;

import com.bumptech.glide.request.animation.ViewPropertyAnimation;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/animation/ViewPropertyAnimationFactory.class */
public class ViewPropertyAnimationFactory<R> implements GlideAnimationFactory<R> {
    private final ViewPropertyAnimation.Animator animator;
    private ViewPropertyAnimation<R> animation;

    public ViewPropertyAnimationFactory(ViewPropertyAnimation.Animator animator) {
        this.animator = animator;
    }

    @Override // com.bumptech.glide.request.animation.GlideAnimationFactory
    public GlideAnimation<R> build(boolean isFromMemoryCache, boolean isFirstResource) {
        if (isFromMemoryCache || !isFirstResource) {
            return NoAnimation.get();
        }
        if (this.animation == null) {
            this.animation = new ViewPropertyAnimation<>(this.animator);
        }
        return this.animation;
    }
}
