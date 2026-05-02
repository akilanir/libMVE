package com.bumptech.glide.load.engine;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/Resource.class */
public interface Resource<Z> {
    Z get();

    int getSize();

    void recycle();
}
