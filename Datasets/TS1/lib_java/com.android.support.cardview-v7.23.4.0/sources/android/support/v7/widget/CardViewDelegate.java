package android.support.v7.widget;

import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: com.android.support.cardview-v7.23.4.0.jar:android/support/v7/widget/CardViewDelegate.class */
interface CardViewDelegate {
    void setCardBackground(Drawable drawable);

    Drawable getCardBackground();

    boolean getUseCompatPadding();

    boolean getPreventCornerOverlap();

    void setShadowPadding(int i, int i2, int i3, int i4);

    void setMinWidthHeightInternal(int i, int i2);

    View getCardView();
}
