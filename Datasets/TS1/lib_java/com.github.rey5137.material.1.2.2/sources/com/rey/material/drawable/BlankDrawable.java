package com.rey.material.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/BlankDrawable.class */
public class BlankDrawable extends Drawable {
    private static BlankDrawable mInstance;

    public static BlankDrawable getInstance() {
        if (mInstance == null) {
            synchronized (BlankDrawable.class) {
                if (mInstance == null) {
                    mInstance = new BlankDrawable();
                }
            }
        }
        return mInstance;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -2;
    }
}
