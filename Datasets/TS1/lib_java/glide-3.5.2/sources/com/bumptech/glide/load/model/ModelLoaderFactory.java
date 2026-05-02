package com.bumptech.glide.load.model;

import android.content.Context;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/model/ModelLoaderFactory.class */
public interface ModelLoaderFactory<T, Y> {
    ModelLoader<T, Y> build(Context context, GenericLoaderFactory genericLoaderFactory);

    void teardown();
}
