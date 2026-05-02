package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapResource;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/gif/GifDrawableTransformation.class */
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
        if (!bitmapResource.equals(transformed)) {
            bitmapResource.recycle();
        }
        Bitmap transformedFrame = transformed.get();
        drawable.setFrameTransformation(this.wrapped, transformedFrame);
        return resource;
    }

    @Override // com.bumptech.glide.load.Transformation
    public String getId() {
        return this.wrapped.getId();
    }
}
