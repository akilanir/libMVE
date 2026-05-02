package com.bumptech.glide.load;

import java.io.OutputStream;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/Encoder.class */
public interface Encoder<T> {
    boolean encode(T t, OutputStream outputStream);

    String getId();
}
