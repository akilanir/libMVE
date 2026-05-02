package com.bumptech.glide.load.engine;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/Resource.class */
public interface Resource<Z> {
    Z get();

    int getSize();

    void recycle();
}
