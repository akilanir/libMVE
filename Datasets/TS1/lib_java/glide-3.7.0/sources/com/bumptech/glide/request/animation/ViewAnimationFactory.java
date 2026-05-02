package com.bumptech.glide.request.animation;

import android.content.Context;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.bumptech.glide.request.animation.ViewAnimation;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/ViewAnimationFactory.class */
public class ViewAnimationFactory<R> implements GlideAnimationFactory<R> {
    private final ViewAnimation.AnimationFactory animationFactory;
    private GlideAnimation<R> glideAnimation;

    public ViewAnimationFactory(Animation animation) {
        this(new ConcreteAnimationFactory(animation));
    }

    public ViewAnimationFactory(Context context, int animationId) {
        this(new ResourceAnimationFactory(context, animationId));
    }

    ViewAnimationFactory(ViewAnimation.AnimationFactory animationFactory) {
        this.animationFactory = animationFactory;
    }

    @Override // com.bumptech.glide.request.animation.GlideAnimationFactory
    public GlideAnimation<R> build(boolean isFromMemoryCache, boolean isFirstResource) {
        if (isFromMemoryCache || !isFirstResource) {
            return NoAnimation.get();
        }
        if (this.glideAnimation == null) {
            this.glideAnimation = new ViewAnimation(this.animationFactory);
        }
        return this.glideAnimation;
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/ViewAnimationFactory$ConcreteAnimationFactory.class */
    private static class ConcreteAnimationFactory implements ViewAnimation.AnimationFactory {
        private final Animation animation;

        public ConcreteAnimationFactory(Animation animation) {
            this.animation = animation;
        }

        @Override // com.bumptech.glide.request.animation.ViewAnimation.AnimationFactory
        public Animation build() {
            return this.animation;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/animation/ViewAnimationFactory$ResourceAnimationFactory.class */
    private static class ResourceAnimationFactory implements ViewAnimation.AnimationFactory {
        private final Context context;
        private final int animationId;

        public ResourceAnimationFactory(Context context, int animationId) {
            this.context = context.getApplicationContext();
            this.animationId = animationId;
        }

        @Override // com.bumptech.glide.request.animation.ViewAnimation.AnimationFactory
        public Animation build() {
            return AnimationUtils.loadAnimation(this.context, this.animationId);
        }
    }
}
