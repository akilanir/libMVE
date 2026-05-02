package com.github.paolorotolo.appintro;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* loaded from: com.github.paolorotolo.appintro.3.2.0.jar:com/github/paolorotolo/appintro/ResourceUtils.class */
class ResourceUtils {
    ResourceUtils() {
    }

    @Nullable
    static Drawable getDrawable(@NonNull Context context, @DrawableRes int drawableId) {
        if (Build.VERSION.SDK_INT >= 21) {
            return context.getDrawable(drawableId);
        }
        return context.getResources().getDrawable(drawableId);
    }
}
