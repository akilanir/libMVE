package com.yalantis.ucrop.callback;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/callback/BitmapLoadCallback.class */
public interface BitmapLoadCallback {
    void onBitmapLoaded(@NonNull Bitmap bitmap);

    void onFailure(@NonNull Exception exc);
}
