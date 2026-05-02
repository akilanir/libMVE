package android.support.design.widget;

import android.graphics.Outline;

/* loaded from: com.android.support.design.23.3.0.jar:android/support/design/widget/CircularBorderDrawableLollipop.class */
class CircularBorderDrawableLollipop extends CircularBorderDrawable {
    CircularBorderDrawableLollipop() {
    }

    @Override // android.graphics.drawable.Drawable
    public void getOutline(Outline outline) {
        copyBounds(this.mRect);
        outline.setOval(this.mRect);
    }
}
