package com.bumptech.glide.request.animation;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import com.bumptech.glide.request.animation.ViewAnimation;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/DrawableCrossFadeFactory.class */
public class DrawableCrossFadeFactory<T extends Drawable> implements GlideAnimationFactory<T> {
    private static final int DEFAULT_DURATION_MS = 300;
    private final ViewAnimationFactory<T> animationFactory;
    private final int duration;
    private DrawableCrossFadeViewAnimation<T> firstResourceAnimation;
    private DrawableCrossFadeViewAnimation<T> secondResourceAnimation;

    public DrawableCrossFadeFactory() {
        this(DEFAULT_DURATION_MS);
    }

    public DrawableCrossFadeFactory(int duration) {
        this(new ViewAnimationFactory(new DefaultAnimationFactory(duration)), duration);
    }

    public DrawableCrossFadeFactory(Context context, int defaultAnimationId, int duration) {
        this(new ViewAnimationFactory(context, defaultAnimationId), duration);
    }

    public DrawableCrossFadeFactory(Animation defaultAnimation, int duration) {
        this(new ViewAnimationFactory(defaultAnimation), duration);
    }

    DrawableCrossFadeFactory(ViewAnimationFactory<T> animationFactory, int duration) {
        this.animationFactory = animationFactory;
        this.duration = duration;
    }

    @Override // com.bumptech.glide.request.animation.GlideAnimationFactory
    public GlideAnimation<T> build(boolean isFromMemoryCache, boolean isFirstResource) {
        if (isFromMemoryCache) {
            return NoAnimation.get();
        }
        if (isFirstResource) {
            return getFirstResourceAnimation();
        }
        return getSecondResourceAnimation();
    }

    private GlideAnimation<T> getFirstResourceAnimation() {
        if (this.firstResourceAnimation == null) {
            GlideAnimation<T> defaultAnimation = this.animationFactory.build(false, true);
            this.firstResourceAnimation = new DrawableCrossFadeViewAnimation<>(defaultAnimation, this.duration);
        }
        return this.firstResourceAnimation;
    }

    private GlideAnimation<T> getSecondResourceAnimation() {
        if (this.secondResourceAnimation == null) {
            GlideAnimation<T> defaultAnimation = this.animationFactory.build(false, false);
            this.secondResourceAnimation = new DrawableCrossFadeViewAnimation<>(defaultAnimation, this.duration);
        }
        return this.secondResourceAnimation;
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/DrawableCrossFadeFactory$DefaultAnimationFactory.class */
    private static class DefaultAnimationFactory implements ViewAnimation.AnimationFactory {
        private final int duration;

        DefaultAnimationFactory(int duration) {
            this.duration = duration;
        }

        @Override // com.bumptech.glide.request.animation.ViewAnimation.AnimationFactory
        public Animation build() {
            AlphaAnimation animation = new AlphaAnimation(0.0f, 1.0f);
            animation.setDuration(this.duration);
            return animation;
        }
    }
}
