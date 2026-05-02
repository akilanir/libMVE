package com.rey.material.util;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.TypedValue;
import com.rey.material.BuildConfig;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/util/ThemeUtil.class */
public class ThemeUtil {
    private static TypedValue value;

    public static int dpToPx(Context context, int dp) {
        return (int) (TypedValue.applyDimension(1, dp, context.getResources().getDisplayMetrics()) + 0.5f);
    }

    public static int spToPx(Context context, int sp) {
        return (int) (TypedValue.applyDimension(2, sp, context.getResources().getDisplayMetrics()) + 0.5f);
    }

    private static int getColor(Context context, int id, int defaultValue) {
        if (value == null) {
            value = new TypedValue();
        }
        try {
            Resources.Theme theme = context.getTheme();
            if (theme != null && theme.resolveAttribute(id, value, true)) {
                if (value.type >= 16 && value.type <= 31) {
                    return value.data;
                }
                if (value.type == 3) {
                    return context.getResources().getColor(value.resourceId);
                }
            }
        } catch (Exception e) {
        }
        return defaultValue;
    }

    public static int windowBackground(Context context, int defaultValue) {
        return getColor(context, R.attr.windowBackground, defaultValue);
    }

    public static int textColorPrimary(Context context, int defaultValue) {
        return getColor(context, R.attr.textColorPrimary, defaultValue);
    }

    public static int textColorSecondary(Context context, int defaultValue) {
        return getColor(context, R.attr.textColorSecondary, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorPrimary(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorPrimary, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorPrimary, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorPrimaryDark(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorPrimaryDark, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorPrimaryDark, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorAccent(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorAccent, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorAccent, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorControlNormal(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorControlNormal, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorControlNormal, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorControlActivated(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorControlActivated, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorControlActivated, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorControlHighlight(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorControlHighlight, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorControlHighlight, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorButtonNormal(Context context, int defaultValue) {
        if (Build.VERSION.SDK_INT >= 21) {
            return getColor(context, R.attr.colorButtonNormal, defaultValue);
        }
        return getColor(context, com.rey.material.R.attr.colorButtonNormal, defaultValue);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public static int colorSwitchThumbNormal(Context context, int defaultValue) {
        return getColor(context, com.rey.material.R.attr.colorSwitchThumbNormal, defaultValue);
    }

    public static int getType(TypedArray array, int index) {
        if (Build.VERSION.SDK_INT >= 21) {
            return array.getType(index);
        }
        TypedValue value2 = array.peekValue(index);
        if (value2 == null) {
            return 0;
        }
        return value2.type;
    }

    public static CharSequence getString(TypedArray array, int index, CharSequence defaultValue) {
        String result = array.getString(index);
        return result == null ? defaultValue : result;
    }
}
