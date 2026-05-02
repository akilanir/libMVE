package com.bumptech.glide.load.resource.transcode;

import com.bumptech.glide.load.engine.Resource;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/transcode/ResourceTranscoder.class */
public interface ResourceTranscoder<Z, R> {
    Resource<R> transcode(Resource<Z> resource);

    String getId();
}
