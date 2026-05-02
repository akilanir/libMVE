package com.nostra13.universalimageloader.core.listener;

import android.graphics.Bitmap;
import android.view.View;
import com.nostra13.universalimageloader.core.assist.FailReason;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/listener/ImageLoadingListener.class */
public interface ImageLoadingListener {
    void onLoadingStarted(String str, View view);

    void onLoadingFailed(String str, View view, FailReason failReason);

    void onLoadingComplete(String str, View view, Bitmap bitmap);

    void onLoadingCancelled(String str, View view);
}
