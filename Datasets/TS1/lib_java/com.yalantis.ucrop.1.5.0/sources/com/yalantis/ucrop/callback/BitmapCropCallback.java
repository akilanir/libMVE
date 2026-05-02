package com.yalantis.ucrop.callback;

import android.support.annotation.NonNull;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/callback/BitmapCropCallback.class */
public interface BitmapCropCallback {
    void onBitmapCropped();

    void onCropFailure(@NonNull Exception exc);
}
