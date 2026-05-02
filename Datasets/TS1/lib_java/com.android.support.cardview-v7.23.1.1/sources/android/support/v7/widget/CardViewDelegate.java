package android.support.v7.widget;

import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.cardview-v7.23.1.1.jar:android/support/v7/widget/CardViewDelegate.class */
interface CardViewDelegate {
    void setBackgroundDrawable(Drawable drawable);

    Drawable getBackground();

    boolean getUseCompatPadding();

    boolean getPreventCornerOverlap();

    float getRadius();

    void setShadowPadding(int i, int i2, int i3, int i4);
}
