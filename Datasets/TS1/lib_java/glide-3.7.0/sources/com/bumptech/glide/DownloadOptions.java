package com.bumptech.glide;

import com.bumptech.glide.request.FutureTarget;
import com.bumptech.glide.request.target.Target;
import java.io.File;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/DownloadOptions.class */
interface DownloadOptions {
    <Y extends Target<File>> Y downloadOnly(Y y);

    FutureTarget<File> downloadOnly(int i, int i2);
}
