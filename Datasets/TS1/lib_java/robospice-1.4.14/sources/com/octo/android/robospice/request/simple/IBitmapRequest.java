package com.octo.android.robospice.request.simple;

import android.graphics.Bitmap;
import java.io.File;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/simple/IBitmapRequest.class */
public interface IBitmapRequest {
    Bitmap loadDataFromNetwork() throws Exception;

    File getCacheFile();
}
