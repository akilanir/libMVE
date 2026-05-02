package com.koushikdutta.ion.builder;

import android.widget.ImageView;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.ion.future.ImageViewFuture;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/LoadImageViewFutureBuilder.class */
public interface LoadImageViewFutureBuilder {
    ImageViewFuture load(String str);

    Future<ImageView> load(String str, String str2);
}
