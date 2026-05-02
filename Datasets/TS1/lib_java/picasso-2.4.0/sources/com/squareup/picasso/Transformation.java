package com.squareup.picasso;

import android.graphics.Bitmap;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/Transformation.class */
public interface Transformation {
    Bitmap transform(Bitmap bitmap);

    String key();
}
