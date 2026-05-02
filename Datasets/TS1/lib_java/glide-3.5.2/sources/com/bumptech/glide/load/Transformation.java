package com.bumptech.glide.load;

import com.bumptech.glide.load.engine.Resource;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/Transformation.class */
public interface Transformation<T> {
    Resource<T> transform(Resource<T> resource, int i, int i2);

    String getId();
}
