package com.davemorrissey.labs.subscaleview.decoder;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;

/* loaded from: com.davemorrissey.labs.subsampling-scale-image-view.3.4.1.jar:com/davemorrissey/labs/subscaleview/decoder/ImageDecoder.class */
public interface ImageDecoder {
    Bitmap decode(Context context, Uri uri) throws Exception;
}
