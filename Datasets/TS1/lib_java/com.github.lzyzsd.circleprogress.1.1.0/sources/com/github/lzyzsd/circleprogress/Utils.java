package com.github.lzyzsd.circleprogress;

import android.content.res.Resources;

/* loaded from: com.github.lzyzsd.circleprogress.1.1.0.jar:com/github/lzyzsd/circleprogress/Utils.class */
public class Utils {
    public static float dp2px(Resources resources, float dp) {
        float scale = resources.getDisplayMetrics().density;
        return (dp * scale) + 0.5f;
    }

    public static float sp2px(Resources resources, float sp) {
        float scale = resources.getDisplayMetrics().scaledDensity;
        return sp * scale;
    }
}
