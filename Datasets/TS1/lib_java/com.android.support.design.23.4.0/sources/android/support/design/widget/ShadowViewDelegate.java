package android.support.design.widget;

import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.design.23.4.0.jar:android/support/design/widget/ShadowViewDelegate.class */
interface ShadowViewDelegate {
    float getRadius();

    void setShadowPadding(int i, int i2, int i3, int i4);

    void setBackgroundDrawable(Drawable drawable);

    boolean isCompatPaddingEnabled();
}
