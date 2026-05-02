package com.davemorrissey.labs.subscaleview.decoder;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.net.Uri;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.5.0.jar:com/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder.class */
public interface ImageRegionDecoder {
    Point init(Context context, Uri uri) throws Exception;

    Bitmap decodeRegion(Rect rect, int i);

    boolean isReady();

    void recycle();
}
