package com.nostra13.universalimageloader.core.display;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/display/BitmapDisplayer.class */
public interface BitmapDisplayer {
    void display(Bitmap bitmap, ImageAware imageAware, LoadedFrom loadedFrom);
}
