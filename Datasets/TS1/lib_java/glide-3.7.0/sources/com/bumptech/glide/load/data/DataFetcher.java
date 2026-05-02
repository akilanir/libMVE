package com.bumptech.glide.load.data;

import com.bumptech.glide.Priority;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/data/DataFetcher.class */
public interface DataFetcher<T> {
    T loadData(Priority priority) throws Exception;

    void cleanup();

    String getId();

    void cancel();
}
