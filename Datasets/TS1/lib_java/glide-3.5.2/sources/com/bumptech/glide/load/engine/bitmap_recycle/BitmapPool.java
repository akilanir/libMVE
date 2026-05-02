package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/bitmap_recycle/BitmapPool.class */
public interface BitmapPool {
    int getMaxSize();

    void setSizeMultiplier(float f);

    boolean put(Bitmap bitmap);

    Bitmap get(int i, int i2, Bitmap.Config config);

    Bitmap getDirty(int i, int i2, Bitmap.Config config);

    void clearMemory();

    void trimMemory(int i);
}
