package com.koushikdutta.ion.builder;

import android.graphics.Bitmap;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.LocallyCachedStatus;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/BitmapFutureBuilder.class */
public interface BitmapFutureBuilder {
    Future<Bitmap> asBitmap();

    BitmapInfo asCachedBitmap();

    void removeCachedBitmap();

    LocallyCachedStatus isLocallyCached();
}
