package com.nostra13.universalimageloader.core.imageaware;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/imageaware/ImageAware.class */
public interface ImageAware {
    int getWidth();

    int getHeight();

    ViewScaleType getScaleType();

    View getWrappedView();

    boolean isCollected();

    int getId();

    boolean setImageDrawable(Drawable drawable);

    boolean setImageBitmap(Bitmap bitmap);
}
