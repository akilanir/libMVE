package com.bumptech.glide.request;

import com.bumptech.glide.request.target.Target;
import java.util.concurrent.Future;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/FutureTarget.class */
public interface FutureTarget<R> extends Future<R>, Target<R> {
    void clear();
}
