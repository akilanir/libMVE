package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/LruPoolStrategy.class */
interface LruPoolStrategy {
    void put(Bitmap bitmap);

    Bitmap get(int i, int i2, Bitmap.Config config);

    Bitmap removeLast();

    String logBitmap(Bitmap bitmap);

    String logBitmap(int i, int i2, Bitmap.Config config);

    int getSize(Bitmap bitmap);
}
