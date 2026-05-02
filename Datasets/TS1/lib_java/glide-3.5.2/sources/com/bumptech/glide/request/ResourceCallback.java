package com.bumptech.glide.request;

import com.bumptech.glide.load.engine.Resource;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/ResourceCallback.class */
public interface ResourceCallback {
    void onResourceReady(Resource<?> resource);

    void onException(Exception exc);
}
