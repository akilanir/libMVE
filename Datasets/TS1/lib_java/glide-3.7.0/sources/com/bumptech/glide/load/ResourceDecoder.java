package com.bumptech.glide.load;

import com.bumptech.glide.load.engine.Resource;
import java.io.IOException;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/ResourceDecoder.class */
public interface ResourceDecoder<T, Z> {
    Resource<Z> decode(T t, int i, int i2) throws IOException;

    String getId();
}
