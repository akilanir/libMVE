package com.mikepenz.iconics.utils;

import android.content.Context;
import android.util.TypedValue;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/utils/Utils.class */
public class Utils {
    public static int convertDpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(1, dp, context.getResources().getDisplayMetrics());
    }
}
