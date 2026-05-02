package com.mikepenz.iconics.utils;

import android.content.Context;
import android.util.TypedValue;

/* loaded from: com.mikepenz.iconics.1.2.0.jar:com/mikepenz/iconics/utils/Utils.class */
public class Utils {
    private Utils() {
    }

    public static int convertDpToPx(Context context, float dp) {
        return (int) TypedValue.applyDimension(1, dp, context.getResources().getDisplayMetrics());
    }

    public static boolean isEnabled(int[] stateSet) {
        for (int state : stateSet) {
            if (state == 16842910) {
                return true;
            }
        }
        return false;
    }
}
