package com.bumptech.glide;

import android.view.animation.Animation;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/DrawableOptions.class */
interface DrawableOptions {
    GenericRequestBuilder<?, ?, ?, ?> crossFade();

    GenericRequestBuilder<?, ?, ?, ?> crossFade(int i);

    @Deprecated
    GenericRequestBuilder<?, ?, ?, ?> crossFade(Animation animation, int i);

    GenericRequestBuilder<?, ?, ?, ?> crossFade(int i, int i2);
}
