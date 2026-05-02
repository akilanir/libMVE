package com.bumptech.glide.load.resource.transcode;

import android.graphics.Bitmap;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.resource.bitmap.GlideBitmapDrawable;
import com.bumptech.glide.load.resource.drawable.GlideDrawable;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.load.resource.gifbitmap.GifBitmapWrapper;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/transcode/GifBitmapWrapperDrawableTranscoder.class */
public class GifBitmapWrapperDrawableTranscoder implements ResourceTranscoder<GifBitmapWrapper, GlideDrawable> {
    private final ResourceTranscoder<Bitmap, GlideBitmapDrawable> bitmapDrawableResourceTranscoder;

    public GifBitmapWrapperDrawableTranscoder(ResourceTranscoder<Bitmap, GlideBitmapDrawable> bitmapDrawableResourceTranscoder) {
        this.bitmapDrawableResourceTranscoder = bitmapDrawableResourceTranscoder;
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public Resource<GlideDrawable> transcode(Resource<GifBitmapWrapper> toTranscode) {
        Resource<GifDrawable> gifResource;
        GifBitmapWrapper gifBitmap = toTranscode.get();
        Resource<Bitmap> bitmapResource = gifBitmap.getBitmapResource();
        if (bitmapResource != null) {
            gifResource = this.bitmapDrawableResourceTranscoder.transcode(bitmapResource);
        } else {
            gifResource = gifBitmap.getGifResource();
        }
        return gifResource;
    }

    @Override // com.bumptech.glide.load.resource.transcode.ResourceTranscoder
    public String getId() {
        return "GifBitmapWrapperDrawableTranscoder.com.bumptech.glide.load.resource.transcode";
    }
}
