package android.support.design.widget;

import android.R;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: com.android.support.design.23.0.1.jar:android/support/design/widget/FloatingActionButtonImpl.class */
abstract class FloatingActionButtonImpl {
    static final int SHOW_HIDE_ANIM_DURATION = 200;
    static final int[] PRESSED_ENABLED_STATE_SET = {R.attr.state_pressed, R.attr.state_enabled};
    static final int[] FOCUSED_ENABLED_STATE_SET = {R.attr.state_focused, R.attr.state_enabled};
    static final int[] EMPTY_STATE_SET = new int[0];
    final View mView;
    final ShadowViewDelegate mShadowViewDelegate;

    abstract void setBackgroundDrawable(Drawable drawable, ColorStateList colorStateList, PorterDuff.Mode mode, int i, int i2);

    abstract void setBackgroundTintList(ColorStateList colorStateList);

    abstract void setBackgroundTintMode(PorterDuff.Mode mode);

    abstract void setRippleColor(int i);

    abstract void setElevation(float f);

    abstract void setPressedTranslationZ(float f);

    abstract void onDrawableStateChanged(int[] iArr);

    abstract void jumpDrawableToCurrentState();

    abstract void hide();

    abstract void show();

    FloatingActionButtonImpl(View view, ShadowViewDelegate shadowViewDelegate) {
        this.mView = view;
        this.mShadowViewDelegate = shadowViewDelegate;
    }

    Drawable createBorderDrawable(int borderWidth, ColorStateList backgroundTint) {
        Resources resources = this.mView.getResources();
        CircularBorderDrawable borderDrawable = newCircularDrawable();
        borderDrawable.setGradientColors(resources.getColor(android.support.design.R.color.design_fab_stroke_top_outer_color), resources.getColor(android.support.design.R.color.design_fab_stroke_top_inner_color), resources.getColor(android.support.design.R.color.design_fab_stroke_end_inner_color), resources.getColor(android.support.design.R.color.design_fab_stroke_end_outer_color));
        borderDrawable.setBorderWidth(borderWidth);
        borderDrawable.setTintColor(backgroundTint.getDefaultColor());
        return borderDrawable;
    }

    CircularBorderDrawable newCircularDrawable() {
        return new CircularBorderDrawable();
    }
}
