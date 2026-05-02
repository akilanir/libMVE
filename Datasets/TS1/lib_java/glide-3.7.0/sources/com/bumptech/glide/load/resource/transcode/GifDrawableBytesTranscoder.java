package com.bumptech.glide.load.resource.transcode;

import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bytes.BytesResource;
import com.bumptech.glide.load.resource.gif.GifDrawable;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder.class */
public class GifDrawableBytesTranscoder implements ResourceTranscoder<GifDrawable, byte[]> {
    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public Resource<byte[]> transcode(Resource<GifDrawable> toTranscode) {
        GifDrawable gifData = toTranscode.get();
        return new BytesResource(gifData.getData());
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public String getId() {
        return "GifDrawableBytesTranscoder.com.bumptech.glide.load.resource.transcode";
    }
}
