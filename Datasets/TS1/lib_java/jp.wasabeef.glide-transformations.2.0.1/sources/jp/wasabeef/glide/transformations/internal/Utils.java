package jp.wasabeef.glide.transformations.internal;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/internal/Utils.class */
public final class Utils {
    private Utils() {
    }

    public static Drawable getMaskDrawable(Context context, int maskId) {
        Drawable drawable;
        if (Build.VERSION.SDK_INT >= 21) {
            drawable = context.getDrawable(maskId);
        } else {
            drawable = context.getResources().getDrawable(maskId);
        }
        if (drawable == null) {
            throw new IllegalArgumentException("maskId is invalid");
        }
        return drawable;
    }
}
