package com.yalantis.ucrop.util;

import android.R;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/util/SelectedStateListDrawable.class */
public class SelectedStateListDrawable extends StateListDrawable {
    private int mSelectionColor;

    public SelectedStateListDrawable(Drawable drawable, int selectionColor) {
        this.mSelectionColor = selectionColor;
        addState(new int[]{R.attr.state_selected}, drawable);
        addState(new int[0], drawable);
    }

    @Override // android.graphics.drawable.StateListDrawable, android.graphics.drawable.DrawableContainer, android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] states) {
        boolean isStatePressedInArray = false;
        for (int state : states) {
            if (state == 16842913) {
                isStatePressedInArray = true;
            }
        }
        if (isStatePressedInArray) {
            super.setColorFilter(this.mSelectionColor, PorterDuff.Mode.SRC_ATOP);
        } else {
            super.clearColorFilter();
        }
        return super.onStateChange(states);
    }

    @Override // android.graphics.drawable.StateListDrawable, android.graphics.drawable.DrawableContainer, android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }
}
