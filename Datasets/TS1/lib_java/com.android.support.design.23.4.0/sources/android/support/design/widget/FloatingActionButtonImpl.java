package android.support.design.widget;

import android.R;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.support.annotation.Nullable;
import android.view.ViewTreeObserver;

/* loaded from: com.android.support.design.23.4.0.jar:android/support/design/widget/FloatingActionButtonImpl.class */
abstract class FloatingActionButtonImpl {
    Drawable mShapeDrawable;
    Drawable mRippleDrawable;
    CircularBorderDrawable mBorderDrawable;
    Drawable mContentBackground;
    float mElevation;
    float mPressedTranslationZ;
    static final int SHOW_HIDE_ANIM_DURATION = 200;
    static final int[] PRESSED_ENABLED_STATE_SET = {R.attr.state_pressed, R.attr.state_enabled};
    static final int[] FOCUSED_ENABLED_STATE_SET = {R.attr.state_focused, R.attr.state_enabled};
    static final int[] EMPTY_STATE_SET = new int[0];
    final VisibilityAwareImageButton mView;
    final ShadowViewDelegate mShadowViewDelegate;
    private final Rect mTmpRect = new Rect();
    private ViewTreeObserver.OnPreDrawListener mPreDrawListener;

    /* loaded from: com.android.support.design.23.4.0.jar:android/support/design/widget/FloatingActionButtonImpl$InternalVisibilityChangedListener.class */
    interface InternalVisibilityChangedListener {
        void onShown();

        void onHidden();
    }

    abstract void setBackgroundDrawable(ColorStateList colorStateList, PorterDuff.Mode mode, int i, int i2);

    abstract void setBackgroundTintList(ColorStateList colorStateList);

    abstract void setBackgroundTintMode(PorterDuff.Mode mode);

    abstract void setRippleColor(int i);

    abstract float getElevation();

    abstract void onElevationChanged(float f);

    abstract void onTranslationZChanged(float f);

    abstract void onDrawableStateChanged(int[] iArr);

    abstract void jumpDrawableToCurrentState();

    abstract void hide(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener, boolean z);

    abstract void show(@Nullable InternalVisibilityChangedListener internalVisibilityChangedListener, boolean z);

    abstract void onCompatShadowChanged();

    abstract void getPadding(Rect rect);

    FloatingActionButtonImpl(VisibilityAwareImageButton view, ShadowViewDelegate shadowViewDelegate) {
        this.mView = view;
        this.mShadowViewDelegate = shadowViewDelegate;
    }

    final void setElevation(float elevation) {
        if (this.mElevation != elevation) {
            this.mElevation = elevation;
            onElevationChanged(elevation);
        }
    }

    final void setPressedTranslationZ(float translationZ) {
        if (this.mPressedTranslationZ != translationZ) {
            this.mPressedTranslationZ = translationZ;
            onTranslationZChanged(translationZ);
        }
    }

    final Drawable getContentBackground() {
        return this.mContentBackground;
    }

    final void updatePadding() {
        Rect rect = this.mTmpRect;
        getPadding(rect);
        onPaddingUpdated(rect);
        this.mShadowViewDelegate.setShadowPadding(rect.left, rect.top, rect.right, rect.bottom);
    }

    void onPaddingUpdated(Rect padding) {
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

    GradientDrawable createShapeDrawable() {
        GradientDrawable d = new GradientDrawable();
        d.setShape(1);
        d.setColor(-1);
        return d;
    }
}
