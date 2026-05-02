package com.squareup.picasso;

import android.graphics.Bitmap;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/Transformation.class */
public interface Transformation {
    Bitmap transform(Bitmap bitmap);

    String key();
}
