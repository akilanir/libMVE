package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.squareup.picasso.Picasso;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Target.class */
public interface Target {
    void onBitmapLoaded(Bitmap bitmap, Picasso.LoadedFrom loadedFrom);

    void onBitmapFailed(Drawable drawable);

    void onPrepareLoad(Drawable drawable);
}
