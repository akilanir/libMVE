package android.support.design.widget;

import android.R;
import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.view.animation.Interpolator;

@TargetApi(21)
/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/FloatingActionButtonLollipop.class */
class FloatingActionButtonLollipop extends FloatingActionButtonIcs {
    private final Interpolator mInterpolator;
    private InsetDrawable mInsetDrawable;

    FloatingActionButtonLollipop(VisibilityAwareImageButton view, ShadowViewDelegate shadowViewDelegate) {
        super(view, shadowViewDelegate);
        this.mInterpolator = view.isInEditMode() ? null : android.view.animation.AnimationUtils.loadInterpolator(this.mView.getContext(), R.interpolator.fast_out_slow_in);
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void setBackgroundDrawable(ColorStateList backgroundTint, PorterDuff.Mode backgroundTintMode, int rippleColor, int borderWidth) {
        Drawable rippleContent;
        this.mShapeDrawable = DrawableCompat.wrap(createShapeDrawable());
        DrawableCompat.setTintList(this.mShapeDrawable, backgroundTint);
        if (backgroundTintMode != null) {
            DrawableCompat.setTintMode(this.mShapeDrawable, backgroundTintMode);
        }
        if (borderWidth > 0) {
            this.mBorderDrawable = createBorderDrawable(borderWidth, backgroundTint);
            rippleContent = new LayerDrawable(new Drawable[]{this.mBorderDrawable, this.mShapeDrawable});
        } else {
            this.mBorderDrawable = null;
            rippleContent = this.mShapeDrawable;
        }
        this.mRippleDrawable = new RippleDrawable(ColorStateList.valueOf(rippleColor), rippleContent, null);
        this.mContentBackground = this.mRippleDrawable;
        this.mShadowViewDelegate.setBackgroundDrawable(this.mRippleDrawable);
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void setRippleColor(int rippleColor) {
        if (this.mRippleDrawable instanceof RippleDrawable) {
            ((RippleDrawable) this.mRippleDrawable).setColor(ColorStateList.valueOf(rippleColor));
        } else {
            super.setRippleColor(rippleColor);
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    public void onElevationChanged(float elevation) {
        this.mView.setElevation(elevation);
        if (this.mShadowViewDelegate.isCompatPaddingEnabled()) {
            updatePadding();
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void onTranslationZChanged(float translationZ) {
        android.animation.StateListAnimator stateListAnimator = new android.animation.StateListAnimator();
        stateListAnimator.addState(PRESSED_ENABLED_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", translationZ)));
        stateListAnimator.addState(FOCUSED_ENABLED_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", translationZ)));
        stateListAnimator.addState(EMPTY_STATE_SET, setupAnimator(ObjectAnimator.ofFloat(this.mView, "translationZ", 0.0f)));
        this.mView.setStateListAnimator(stateListAnimator);
        if (this.mShadowViewDelegate.isCompatPaddingEnabled()) {
            updatePadding();
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    public float getElevation() {
        return this.mView.getElevation();
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void onCompatShadowChanged() {
        updatePadding();
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void onPaddingUpdated(Rect padding) {
        if (this.mShadowViewDelegate.isCompatPaddingEnabled()) {
            this.mInsetDrawable = new InsetDrawable(this.mRippleDrawable, padding.left, padding.top, padding.right, padding.bottom);
            this.mShadowViewDelegate.setBackgroundDrawable(this.mInsetDrawable);
        } else {
            this.mShadowViewDelegate.setBackgroundDrawable(this.mRippleDrawable);
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void onDrawableStateChanged(int[] state) {
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void jumpDrawableToCurrentState() {
    }

    @Override // android.support.design.widget.FloatingActionButtonIcs, android.support.design.widget.FloatingActionButtonImpl
    boolean requirePreDrawListener() {
        return false;
    }

    private Animator setupAnimator(Animator animator) {
        animator.setInterpolator(this.mInterpolator);
        return animator;
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    CircularBorderDrawable newCircularDrawable() {
        return new CircularBorderDrawableLollipop();
    }

    @Override // android.support.design.widget.FloatingActionButtonEclairMr1, android.support.design.widget.FloatingActionButtonImpl
    void getPadding(Rect rect) {
        if (this.mShadowViewDelegate.isCompatPaddingEnabled()) {
            float radius = this.mShadowViewDelegate.getRadius();
            float maxShadowSize = getElevation() + this.mPressedTranslationZ;
            int hPadding = (int) Math.ceil(ShadowDrawableWrapper.calculateHorizontalPadding(maxShadowSize, radius, false));
            int vPadding = (int) Math.ceil(ShadowDrawableWrapper.calculateVerticalPadding(maxShadowSize, radius, false));
            rect.set(hPadding, vPadding, hPadding, vPadding);
            return;
        }
        rect.set(0, 0, 0, 0);
    }
}
