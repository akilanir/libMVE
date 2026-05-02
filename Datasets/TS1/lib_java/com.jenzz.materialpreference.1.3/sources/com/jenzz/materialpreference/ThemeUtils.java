package com.jenzz.materialpreference;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Build;

/* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/ThemeUtils.class */
final class ThemeUtils {
    static final int FALLBACK_COLOR = Color.parseColor("#009688");

    private ThemeUtils() {
    }

    static boolean isAtLeastL() {
        return Build.VERSION.SDK_INT >= 21;
    }

    @TargetApi(21)
    static int resolveAccentColor(Context context) {
        Resources.Theme theme = context.getTheme();
        int attr = isAtLeastL() ? R.attr.colorAccent : R.attr.colorAccent;
        TypedArray typedArray = theme.obtainStyledAttributes(new int[]{attr, R.attr.mp_colorAccent});
        int accentColor = typedArray.getColor(0, FALLBACK_COLOR);
        int accentColor2 = typedArray.getColor(1, accentColor);
        typedArray.recycle();
        return accentColor2;
    }
}
