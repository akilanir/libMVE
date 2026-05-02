package com.bumptech.glide.load.model;

import com.bumptech.glide.load.data.DataFetcher;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/ModelLoader.class */
public interface ModelLoader<T, Y> {
    DataFetcher<Y> getResourceFetcher(T t, int i, int i2);
}
