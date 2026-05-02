package com.mikepenz.materialdrawer.util;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import com.mikepenz.google_material_typeface_library.GoogleMaterial;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.typeface.IIcon;

@SuppressLint({"InlinedApi"})
/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/UIUtils.class */
public class UIUtils {
    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    public static ColorStateList getTextColorStateList(int text_color, int selected_text_color) {
        return new ColorStateList(new int[]{new int[]{R.attr.state_activated}, new int[0]}, new int[]{selected_text_color, text_color});
    }

    public static StateListDrawable getIconStateList(Drawable icon, Drawable selectedIcon) {
        StateListDrawable iconStateListDrawable = new StateListDrawable();
        iconStateListDrawable.addState(new int[]{R.attr.state_activated}, selectedIcon);
        iconStateListDrawable.addState(new int[0], icon);
        return iconStateListDrawable;
    }

    public static StateListDrawable getDrawerItemBackground(int selected_color) {
        ColorDrawable clrActive = new ColorDrawable(selected_color);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{R.attr.state_activated}, clrActive);
        return states;
    }

    public static StateListDrawable getSelectableBackground(Context ctx, int selected_color) {
        StateListDrawable states = getDrawerItemBackground(selected_color);
        states.addState(new int[0], getCompatDrawable(ctx, getSelectableBackground(ctx)));
        return states;
    }

    public static int getSelectableBackground(Context ctx) {
        if (Build.VERSION.SDK_INT >= 11) {
            TypedValue outValue = new TypedValue();
            ctx.getTheme().resolveAttribute(com.mikepenz.materialdrawer.R.attr.selectableItemBackground, outValue, true);
            return outValue.resourceId;
        }
        TypedValue outValue2 = new TypedValue();
        ctx.getTheme().resolveAttribute(R.attr.itemBackground, outValue2, true);
        return outValue2.resourceId;
    }

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

    public static int getScreenWidth(Context context) {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.widthPixels;
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

    public static int getOptimalDrawerWidth(Context context) {
        int possibleMinDrawerWidth = getScreenWidth(context) - getActionBarHeight(context);
        int maxDrawerWidth = context.getResources().getDimensionPixelSize(com.mikepenz.materialdrawer.R.dimen.material_drawer_width);
        return Math.min(possibleMinDrawerWidth, maxDrawerWidth);
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
            actionBarHeight = context.getResources().getDimensionPixelSize(com.mikepenz.materialdrawer.R.dimen.abc_action_bar_default_height_material);
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
        int dimenResult = context.getResources().getDimensionPixelSize(com.mikepenz.materialdrawer.R.dimen.tool_bar_top_padding);
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

    public static Drawable getPlaceHolder(Context ctx) {
        int textColor = getThemeColorFromAttrOrRes(ctx, com.mikepenz.materialdrawer.R.attr.material_drawer_primary_text, com.mikepenz.materialdrawer.R.color.material_drawer_primary_text);
        return new IconicsDrawable(ctx, GoogleMaterial.Icon.gmd_person).color(textColor).backgroundColorRes(com.mikepenz.materialdrawer.R.color.primary).iconOffsetYDp(2).paddingDp(2).sizeDp(56);
    }

    public static int decideColor(Context ctx, int color, int colorRes, int defStyle, int defColor) {
        if (color == 0 && colorRes != -1) {
            color = ctx.getResources().getColor(colorRes);
        } else if (color == 0) {
            color = getThemeColorFromAttrOrRes(ctx, defStyle, defColor);
        }
        return color;
    }

    public static Drawable decideIcon(Context ctx, Drawable icon, IIcon iicon, int iconRes, int iconColor, boolean tint) {
        if (icon == null && iicon != null) {
            icon = new IconicsDrawable(ctx, iicon).color(iconColor).actionBarSize().paddingDp(1);
        } else if (icon == null && iconRes > -1) {
            icon = getCompatDrawable(ctx, iconRes);
        }
        if (icon != null && tint && iicon == null) {
            icon = icon.mutate();
            icon.setColorFilter(iconColor, PorterDuff.Mode.SRC_IN);
        }
        return icon;
    }
}
