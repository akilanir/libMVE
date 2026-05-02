package com.bumptech.glide.provider;

import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/provider/LoadProvider.class */
public interface LoadProvider<A, T, Z, R> extends DataLoadProvider<T, Z> {
    ModelLoader<A, T> getModelLoader();

    ResourceTranscoder<Z, R> getTranscoder();
}
