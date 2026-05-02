package com.koushikdutta.ion.future;

import android.widget.ImageView;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.ion.ImageViewBitmapInfo;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/future/ImageViewFuture.class */
public interface ImageViewFuture extends Future<ImageView> {
    Future<ImageViewBitmapInfo> withBitmapInfo();
}
