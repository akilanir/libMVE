package com.mikepenz.materialdrawer.util;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.materialdrawer.icons.MaterialDrawerFont;
import com.mikepenz.materialize.util.UIUtils;

@SuppressLint({"InlinedApi"})
/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/DrawerUIUtils.class */
public class DrawerUIUtils {
    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    public static ColorStateList getTextColorStateList(int text_color, int selected_text_color) {
        return new ColorStateList(new int[]{new int[]{R.attr.state_selected}, new int[0]}, new int[]{selected_text_color, text_color});
    }

    public static StateListDrawable getIconStateList(Drawable icon, Drawable selectedIcon) {
        StateListDrawable iconStateListDrawable = new StateListDrawable();
        iconStateListDrawable.addState(new int[]{R.attr.state_selected}, selectedIcon);
        iconStateListDrawable.addState(new int[0], icon);
        return iconStateListDrawable;
    }

    public static StateListDrawable getDrawerItemBackground(int selected_color) {
        ColorDrawable clrActive = new ColorDrawable(selected_color);
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{R.attr.state_selected}, clrActive);
        return states;
    }

    public static StateListDrawable getSelectableBackground(Context ctx, int selected_color) {
        StateListDrawable states = getDrawerItemBackground(selected_color);
        states.addState(new int[0], UIUtils.getCompatDrawable(ctx, getSelectableBackground(ctx)));
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

    public static int getScreenWidth(Context context) {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.widthPixels;
    }

    public static int getOptimalDrawerWidth(Context context) {
        int possibleMinDrawerWidth = getScreenWidth(context) - UIUtils.getActionBarHeight(context);
        int maxDrawerWidth = context.getResources().getDimensionPixelSize(com.mikepenz.materialdrawer.R.dimen.material_drawer_width);
        return Math.min(possibleMinDrawerWidth, maxDrawerWidth);
    }

    public static Drawable getPlaceHolder(Context ctx) {
        return new IconicsDrawable(ctx, MaterialDrawerFont.Icon.mdf_person).colorRes(com.mikepenz.materialdrawer.R.color.accent).backgroundColorRes(com.mikepenz.materialdrawer.R.color.primary).sizeDp(56).paddingDp(16);
    }

    public static void setDrawerVerticalPadding(View v) {
        int verticalPadding = v.getContext().getResources().getDimensionPixelSize(com.mikepenz.materialdrawer.R.dimen.material_drawer_vertical_padding);
        v.setPadding(verticalPadding, 0, verticalPadding, 0);
    }
}
