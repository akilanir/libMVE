package com.mikepenz.fastadapter.utils;

import android.R;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.support.annotation.ColorInt;
import android.support.v4.content.ContextCompat;
import android.util.TypedValue;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/utils/FastAdapterUIUtils.class */
public class FastAdapterUIUtils {
    public static StateListDrawable getSelectableBackground(Context ctx, @ColorInt int selected_color, boolean animate) {
        StateListDrawable states = new StateListDrawable();
        ColorDrawable clrActive = new ColorDrawable(selected_color);
        states.addState(new int[]{R.attr.state_selected}, clrActive);
        states.addState(new int[0], ContextCompat.getDrawable(ctx, getSelectableBackground(ctx)));
        if (animate && Build.VERSION.SDK_INT >= 11) {
            int duration = ctx.getResources().getInteger(R.integer.config_shortAnimTime);
            states.setEnterFadeDuration(duration);
            states.setExitFadeDuration(duration);
        }
        return states;
    }

    public static StateListDrawable getSelectablePressedBackground(Context ctx, @ColorInt int selected_color, int pressed_alpha, boolean animate) {
        StateListDrawable states = getSelectableBackground(ctx, selected_color, animate);
        ColorDrawable clrPressed = new ColorDrawable(adjustAlpha(selected_color, pressed_alpha));
        states.addState(new int[]{R.attr.state_pressed}, clrPressed);
        return states;
    }

    public static int adjustAlpha(@ColorInt int color, int alpha) {
        return (alpha << 24) | (color & 16777215);
    }

    public static int getSelectableBackground(Context ctx) {
        if (Build.VERSION.SDK_INT >= 11) {
            TypedValue outValue = new TypedValue();
            ctx.getTheme().resolveAttribute(com.mikepenz.fastadapter.R.attr.selectableItemBackground, outValue, true);
            return outValue.resourceId;
        }
        TypedValue outValue2 = new TypedValue();
        ctx.getTheme().resolveAttribute(R.attr.itemBackground, outValue2, true);
        return outValue2.resourceId;
    }
}
