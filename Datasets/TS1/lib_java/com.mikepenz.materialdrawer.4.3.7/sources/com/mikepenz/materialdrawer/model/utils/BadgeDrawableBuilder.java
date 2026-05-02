package com.mikepenz.materialdrawer.model.utils;

import android.R;
import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.StateSet;
import com.mikepenz.materialdrawer.holder.BadgeStyle;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder.class */
public class BadgeDrawableBuilder {
    private BadgeStyle mStyle;

    public BadgeDrawableBuilder(BadgeStyle style) {
        this.mStyle = style;
    }

    public StateListDrawable build(Context ctx) {
        StateListDrawable stateListDrawable = new StateListDrawable();
        GradientDrawable normal = (GradientDrawable) UIUtils.getCompatDrawable(ctx, this.mStyle.getGradientDrawable());
        GradientDrawable selected = (GradientDrawable) normal.getConstantState().newDrawable().mutate();
        ColorHolder.applyToOrTransparent(this.mStyle.getColor(), ctx, normal);
        if (this.mStyle.getColorPressed() == null) {
            ColorHolder.applyToOrTransparent(this.mStyle.getColor(), ctx, selected);
        } else {
            ColorHolder.applyToOrTransparent(this.mStyle.getColorPressed(), ctx, selected);
        }
        if (this.mStyle.getCorners() != null) {
            normal.setCornerRadius(this.mStyle.getCorners().asPixel(ctx));
            selected.setCornerRadius(this.mStyle.getCorners().asPixel(ctx));
        }
        stateListDrawable.addState(new int[]{R.attr.state_pressed}, selected);
        stateListDrawable.addState(StateSet.WILD_CARD, normal);
        return stateListDrawable;
    }
}
