package com.bumptech.glide.request;

import com.bumptech.glide.request.target.Target;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/RequestListener.class */
public interface RequestListener<T, R> {
    boolean onException(Exception exc, T t, Target<R> target, boolean z);

    boolean onResourceReady(R r, T t, Target<R> target, boolean z, boolean z2);
}
