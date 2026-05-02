package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/gif/GifDrawableTransformation.class */
public class GifDrawableTransformation implements Transformation<GifDrawable> {
    private final Transformation<Bitmap> wrapped;
    private final BitmapPool bitmapPool;

    public GifDrawableTransformation(Transformation<Bitmap> wrapped, BitmapPool bitmapPool) {
        this.wrapped = wrapped;
        this.bitmapPool = bitmapPool;
    }

    @Override // com.bumptech.glide.load.Transformation
    public Resource<GifDrawable> transform(Resource<GifDrawable> resource, int outWidth, int outHeight) {
        GifDrawable drawable = resource.get();
        Bitmap firstFrame = resource.get().getFirstFrame();
        Resource<Bitmap> bitmapResource = new BitmapResource(firstFrame, this.bitmapPool);
        Resource<Bitmap> transformed = this.wrapped.transform(bitmapResource, outWidth, outHeight);
        Bitmap transformedFrame = transformed.get();
        if (!transformedFrame.equals(firstFrame)) {
            return new GifDrawableResource(new GifDrawable(drawable, transformedFrame, this.wrapped));
        }
        return resource;
    }

    @Override // com.bumptech.glide.load.Transformation
    public String getId() {
        return this.wrapped.getId();
    }
}
