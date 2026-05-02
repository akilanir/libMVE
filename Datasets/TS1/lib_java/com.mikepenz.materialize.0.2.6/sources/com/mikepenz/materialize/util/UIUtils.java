package com.mikepenz.materialize.util;

import android.R;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

@SuppressLint({"InlinedApi"})
/* loaded from: com.mikepenz.materialize.0.2.6.jar:com/mikepenz/materialize/util/UIUtils.class */
public class UIUtils {
    public static int getThemeColor(Context ctx, int attr) {
        TypedValue tv = new TypedValue();
        if (ctx.getTheme().resolveAttribute(attr, tv, true)) {
            return tv.data;
        }
        return 0;
    }

    public static int getThemeColorFromAttrOrRes(Context ctx, int attr, int res) {
        int color = getThemeColor(ctx, attr);
        if (color == 0) {
            color = ctx.getResources().getColor(res);
        }
        return color;
    }

    @SuppressLint({"NewApi"})
    public static void setBackground(View v, Drawable d) {
        if (Build.VERSION.SDK_INT < 16) {
            v.setBackgroundDrawable(d);
        } else {
            v.setBackground(d);
        }
    }

    public static void setBackground(View v, int drawableRes) {
        setBackground(v, getCompatDrawable(v.getContext(), drawableRes));
    }

    public static Drawable getCompatDrawable(Context c, int drawableRes) {
        Drawable d = null;
        try {
            if (Build.VERSION.SDK_INT < 21) {
                d = c.getResources().getDrawable(drawableRes);
            } else {
                d = c.getResources().getDrawable(drawableRes, c.getTheme());
            }
        } catch (Exception e) {
        }
        return d;
    }

    public static int getThemeAttributeDimensionSize(Context context, int attr) {
        TypedArray a = null;
        try {
            a = context.getTheme().obtainStyledAttributes(new int[]{attr});
            int dimensionPixelSize = a.getDimensionPixelSize(0, 0);
            if (a != null) {
                a.recycle();
            }
            return dimensionPixelSize;
        } catch (Throwable th) {
            if (a != null) {
                a.recycle();
            }
            throw th;
        }
    }

    public static int getNavigationBarHeight(Context context) {
        Resources resources = context.getResources();
        int id = resources.getIdentifier(context.getResources().getConfiguration().orientation == 1 ? "navigation_bar_height" : "navigation_bar_height_landscape", "dimen", "android");
        if (id > 0) {
            return resources.getDimensionPixelSize(id);
        }
        return 0;
    }

    public static int getActionBarHeight(Context context) {
        int actionBarHeight = getThemeAttributeDimensionSize(context, R.attr.actionBarSize);
        if (actionBarHeight == 0) {
            actionBarHeight = context.getResources().getDimensionPixelSize(com.mikepenz.materialize.R.dimen.abc_action_bar_default_height_material);
        }
        return actionBarHeight;
    }

    public static int getStatusBarHeight(Context context) {
        return getStatusBarHeight(context, false);
    }

    public static int getStatusBarHeight(Context context, boolean force) {
        int result = 0;
        int resourceId = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (resourceId > 0) {
            result = context.getResources().getDimensionPixelSize(resourceId);
        }
        int dimenResult = context.getResources().getDimensionPixelSize(com.mikepenz.materialize.R.dimen.tool_bar_top_padding);
        if (dimenResult != 0 || force) {
            return result == 0 ? dimenResult : result;
        }
        return 0;
    }

    public static float convertDpToPixel(float dp, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float px = dp * (metrics.densityDpi / 160.0f);
        return px;
    }

    public static float convertPixelsToDp(float px, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float dp = px / (metrics.densityDpi / 160.0f);
        return dp;
    }

    public static void setTranslucentStatusFlag(Activity activity, boolean on) {
        if (Build.VERSION.SDK_INT >= 19) {
            setFlag(activity, 67108864, on);
        }
    }

    public static void setTranslucentNavigationFlag(Activity activity, boolean on) {
        if (Build.VERSION.SDK_INT >= 19) {
            setFlag(activity, 134217728, on);
        }
    }

    public static void setFlag(Activity activity, int bits, boolean on) {
        Window win = activity.getWindow();
        WindowManager.LayoutParams winParams = win.getAttributes();
        if (on) {
            winParams.flags |= bits;
        } else {
            winParams.flags &= bits ^ (-1);
        }
        win.setAttributes(winParams);
    }
}
