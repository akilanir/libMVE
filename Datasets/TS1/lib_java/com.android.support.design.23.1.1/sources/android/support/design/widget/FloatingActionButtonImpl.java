package android.support.design.widget;

import android.R;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.drawable.GradientDrawable;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewTreeObserver;

/* loaded from: com.android.support.design.23.1.1.jar:android/support/design/widget/FloatingActionButtonImpl.class */
abstract class FloatingActionButtonImpl {
    static final int SHOW_HIDE_ANIM_DURATION = 200;
    static final int[] PRESSED_ENABLED_STATE_SET = {R.attr.state_pressed, R.attr.state_enabled};
    static final int[] FOCUSED_ENABLED_STATE_SET = {R.attr.state_focused, R.attr.state_enabled};
    static final int[] EMPTY_STATE_SET = new int[0];
    final View mView;
    final ShadowViewDelegate mShadowViewDelegate;
    private ViewTreeObserver.OnPreDrawListener mPreDrawListener;

    /* loaded from: com.android.support.design.23.1.1.jar:android/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener.class */
    interface InternalVisibilityChangedListener {
        void onShown();

        void onHidden();
    }

    abstract void setBackgroundDrawable(ColorStateList colorStateList, PorterDuff.Mode mode, int i, int i2);

    abstract void setBackgroundTintList(ColorStateList colorStateList);

    abstract void setBackgroundTintMode(PorterDuff.Mode mode);

    abstract void setRippleColor(int i);

    abstract void setElevation(float f);

    abstract void setPressedTranslationZ(float f);

    abstract void onDrawableStateChanged(int[] iArr);

    abstract void jumpDrawableToCurrentState();

    abstract void hide(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener);

    abstract void show(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener);

    FloatingActionButtonImpl(View view, ShadowViewDelegate shadowViewDelegate) {
        this.mView = view;
        this.mShadowViewDelegate = shadowViewDelegate;
    }

    void onAttachedToWindow() {
        if (requirePreDrawListener()) {
            ensurePreDrawListener();
            this.mView.getViewTreeObserver().addOnPreDrawListener(this.mPreDrawListener);
        }
    }

    void onDetachedFromWindow() {
        if (this.mPreDrawListener != null) {
            this.mView.getViewTreeObserver().removeOnPreDrawListener(this.mPreDrawListener);
            this.mPreDrawListener = null;
        }
    }

    boolean requirePreDrawListener() {
        return false;
    }

    CircularBorderDrawable createBorderDrawable(int borderWidth, ColorStateList backgroundTint) {
        Resources resources = this.mView.getResources();
        CircularBorderDrawable borderDrawable = newCircularDrawable();
        borderDrawable.setGradientColors(resources.getColor(android.support.design.R.color.design_fab_stroke_top_outer_color), resources.getColor(android.support.design.R.color.design_fab_stroke_top_inner_color), resources.getColor(android.support.design.R.color.design_fab_stroke_end_inner_color), resources.getColor(android.support.design.R.color.design_fab_stroke_end_outer_color));
        borderDrawable.setBorderWidth(borderWidth);
        borderDrawable.setBorderTint(backgroundTint);
        return borderDrawable;
    }

    CircularBorderDrawable newCircularDrawable() {
        return new CircularBorderDrawable();
    }

    GradientDrawable createShapeDrawable() {
        GradientDrawable d = new GradientDrawable();
        d.setShape(1);
        d.setColor(-1);
        return d;
    }

    void onPreDraw() {
    }

    private void ensurePreDrawListener() {
        if (this.mPreDrawListener == null) {
            this.mPreDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: android.support.design.widget.FloatingActionButtonImpl.1
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    FloatingActionButtonImpl.this.onPreDraw();
                    return true;
                }
            };
        }
    }
}
