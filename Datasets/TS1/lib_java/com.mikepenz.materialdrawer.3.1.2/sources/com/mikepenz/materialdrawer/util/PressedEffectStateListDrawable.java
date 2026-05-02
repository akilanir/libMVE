package com.mikepenz.materialdrawer.util;

import android.R;
import android.annotation.SuppressLint;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;

@SuppressLint({"InlinedApi"})
/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/PressedEffectStateListDrawable.class */
public class PressedEffectStateListDrawable extends StateListDrawable {
    private int color;
    private int selectionColor;

    public PressedEffectStateListDrawable(Drawable drawable, int color, int selectionColor) {
        Drawable drawable2 = drawable.mutate();
        addState(new int[]{R.attr.state_activated}, drawable2);
        addState(new int[0], drawable2);
        this.color = color;
        this.selectionColor = selectionColor;
    }

    @Override // android.graphics.drawable.StateListDrawable, android.graphics.drawable.DrawableContainer, android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] states) {
        boolean isStatePressedInArray = false;
        for (int state : states) {
            if (state == 16843518) {
                isStatePressedInArray = true;
            }
        }
        if (isStatePressedInArray) {
            super.setColorFilter(this.selectionColor, PorterDuff.Mode.SRC_IN);
        } else {
            super.setColorFilter(this.color, PorterDuff.Mode.SRC_IN);
        }
        return super.onStateChange(states);
    }

    @Override // android.graphics.drawable.StateListDrawable, android.graphics.drawable.DrawableContainer, android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }
}
