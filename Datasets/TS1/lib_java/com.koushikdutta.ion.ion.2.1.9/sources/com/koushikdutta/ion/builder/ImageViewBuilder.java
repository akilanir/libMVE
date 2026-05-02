package com.koushikdutta.ion.builder;

import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import com.koushikdutta.ion.BitmapDrawableFactory;
import com.koushikdutta.ion.builder.ImageViewBuilder;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/ImageViewBuilder.class */
public interface ImageViewBuilder<I extends ImageViewBuilder<?>> {
    I placeholder(Drawable drawable);

    I placeholder(int i);

    I error(Drawable drawable);

    I error(int i);

    I animateIn(Animation animation);

    I animateIn(int i);

    I animateLoad(Animation animation);

    I animateLoad(int i);

    I fadeIn(boolean z);

    I animateGif(AnimateGifMode animateGifMode);

    I deepZoom();

    I crossfade(boolean z);

    I bitmapDrawableFactory(BitmapDrawableFactory bitmapDrawableFactory);
}
