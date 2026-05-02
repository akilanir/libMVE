package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.widget.ImageView;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/target/DrawableImageViewTarget.class */
public class DrawableImageViewTarget extends ImageViewTarget<Drawable> {
    public DrawableImageViewTarget(ImageView view) {
        super(view);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.bumptech.glide.request.target.ImageViewTarget
    public void setResource(Drawable resource) {
        ((ImageView) this.view).setImageDrawable(resource);
    }
}
