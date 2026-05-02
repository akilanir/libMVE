package com.bumptech.glide.load.resource.gif;

import com.bumptech.glide.load.resource.drawable.DrawableResource;
import com.bumptech.glide.util.Util;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/resource/gif/GifDrawableResource.class */
public class GifDrawableResource extends DrawableResource<GifDrawable> {
    public GifDrawableResource(GifDrawable drawable) {
        super(drawable);
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public int getSize() {
        return ((GifDrawable) this.drawable).getData().length + Util.getBitmapByteSize(((GifDrawable) this.drawable).getFirstFrame());
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public void recycle() {
        ((GifDrawable) this.drawable).stop();
        ((GifDrawable) this.drawable).recycle();
    }
}
