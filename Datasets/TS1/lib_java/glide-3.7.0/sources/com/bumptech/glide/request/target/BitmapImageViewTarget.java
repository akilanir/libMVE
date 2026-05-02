package com.bumptech.glide.request.target;

import android.graphics.Bitmap;
import android.widget.ImageView;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/target/BitmapImageViewTarget.class */
public class BitmapImageViewTarget extends ImageViewTarget<Bitmap> {
    public BitmapImageViewTarget(ImageView view) {
        super(view);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.bumptech.glide.request.target.ImageViewTarget
    public void setResource(Bitmap resource) {
        ((ImageView) this.view).setImageBitmap(resource);
    }
}
