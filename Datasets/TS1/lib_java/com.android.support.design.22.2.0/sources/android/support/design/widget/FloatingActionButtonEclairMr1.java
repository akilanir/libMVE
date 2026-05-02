package android.support.design.widget;

import android.R;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;

/* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButtonEclairMr1.class */
class FloatingActionButtonEclairMr1 extends FloatingActionButtonImpl {
    private Drawable mShapeDrawable;
    private Drawable mRippleDrawable;
    private Drawable mBorderDrawable;
    private float mElevation;
    private float mPressedTranslationZ;
    private int mAnimationDuration;
    private StateListAnimator mStateListAnimator;
    ShadowDrawableWrapper mShadowDrawable;

    FloatingActionButtonEclairMr1(View view, ShadowViewDelegate shadowViewDelegate) {
        super(view, shadowViewDelegate);
        this.mAnimationDuration = view.getResources().getInteger(R.integer.config_shortAnimTime);
        this.mStateListAnimator = new StateListAnimator();
        this.mStateListAnimator.setTarget(view);
        this.mStateListAnimator.addState(PRESSED_ENABLED_STATE_SET, setupAnimation(new ElevateToTranslationZAnimation()));
        this.mStateListAnimator.addState(FOCUSED_ENABLED_STATE_SET, setupAnimation(new ElevateToTranslationZAnimation()));
        this.mStateListAnimator.addState(EMPTY_STATE_SET, setupAnimation(new ResetElevationAnimation()));
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setBackgroundDrawable(Drawable originalBackground, ColorStateList backgroundTint, PorterDuff.Mode backgroundTintMode, int rippleColor, int borderWidth) {
        Drawable[] layers;
        this.mShapeDrawable = DrawableCompat.wrap(originalBackground);
        DrawableCompat.setTintList(this.mShapeDrawable, backgroundTint);
        if (backgroundTintMode != null) {
            DrawableCompat.setTintMode(this.mShapeDrawable, backgroundTintMode);
        }
        GradientDrawable touchFeedbackShape = new GradientDrawable();
        touchFeedbackShape.setShape(1);
        touchFeedbackShape.setColor(-1);
        touchFeedbackShape.setCornerRadius(this.mShadowViewDelegate.getRadius());
        this.mRippleDrawable = DrawableCompat.wrap(touchFeedbackShape);
        DrawableCompat.setTintList(this.mRippleDrawable, createColorStateList(rippleColor));
        DrawableCompat.setTintMode(this.mRippleDrawable, PorterDuff.Mode.MULTIPLY);
        if (borderWidth > 0) {
            this.mBorderDrawable = createBorderDrawable(borderWidth, backgroundTint);
            layers = new Drawable[]{this.mBorderDrawable, this.mShapeDrawable, this.mRippleDrawable};
        } else {
            this.mBorderDrawable = null;
            layers = new Drawable[]{this.mShapeDrawable, this.mRippleDrawable};
        }
        this.mShadowDrawable = new ShadowDrawableWrapper(this.mView.getResources(), new LayerDrawable(layers), this.mShadowViewDelegate.getRadius(), this.mElevation, this.mElevation + this.mPressedTranslationZ);
        this.mShadowDrawable.setAddPaddingForCorners(false);
        this.mShadowViewDelegate.setBackgroundDrawable(this.mShadowDrawable);
        updatePadding();
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setBackgroundTintList(ColorStateList tint) {
        DrawableCompat.setTintList(this.mShapeDrawable, tint);
        if (this.mBorderDrawable != null) {
            DrawableCompat.setTintList(this.mBorderDrawable, tint);
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setBackgroundTintMode(PorterDuff.Mode tintMode) {
        DrawableCompat.setTintMode(this.mShapeDrawable, tintMode);
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setRippleColor(int rippleColor) {
        DrawableCompat.setTint(this.mRippleDrawable, rippleColor);
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setElevation(float elevation) {
        if (this.mElevation != elevation && this.mShadowDrawable != null) {
            this.mShadowDrawable.setShadowSize(elevation, elevation + this.mPressedTranslationZ);
            this.mElevation = elevation;
            updatePadding();
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void setPressedTranslationZ(float translationZ) {
        if (this.mPressedTranslationZ != translationZ && this.mShadowDrawable != null) {
            this.mPressedTranslationZ = translationZ;
            this.mShadowDrawable.setMaxShadowSize(this.mElevation + translationZ);
            updatePadding();
        }
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void onDrawableStateChanged(int[] state) {
        this.mStateListAnimator.setState(state);
    }

    @Override // android.support.design.widget.FloatingActionButtonImpl
    void jumpDrawableToCurrentState() {
        this.mStateListAnimator.jumpToCurrentState();
    }

    private void updatePadding() {
        Rect rect = new Rect();
        this.mShadowDrawable.getPadding(rect);
        this.mShadowViewDelegate.setShadowPadding(rect.left, rect.top, rect.right, rect.bottom);
    }

    private Animation setupAnimation(Animation animation) {
        animation.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
        animation.setDuration(this.mAnimationDuration);
        return animation;
    }

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButtonEclairMr1$BaseShadowAnimation.class */
    private abstract class BaseShadowAnimation extends Animation {
        private float mShadowSizeStart;
        private float mShadowSizeDiff;

        protected abstract float getTargetShadowSize();

        private BaseShadowAnimation() {
        }

        @Override // android.view.animation.Animation
        public void reset() {
            super.reset();
            this.mShadowSizeStart = FloatingActionButtonEclairMr1.this.mShadowDrawable.getShadowSize();
            this.mShadowSizeDiff = getTargetShadowSize() - this.mShadowSizeStart;
        }

        @Override // android.view.animation.Animation
        protected void applyTransformation(float interpolatedTime, Transformation t) {
            FloatingActionButtonEclairMr1.this.mShadowDrawable.setShadowSize(this.mShadowSizeStart + (this.mShadowSizeDiff * interpolatedTime));
        }
    }

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButtonEclairMr1$ResetElevationAnimation.class */
    private class ResetElevationAnimation extends BaseShadowAnimation {
        private ResetElevationAnimation() {
            super();
        }

        @Override // android.support.design.widget.FloatingActionButtonEclairMr1.BaseShadowAnimation
        protected float getTargetShadowSize() {
            return FloatingActionButtonEclairMr1.this.mElevation;
        }
    }

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButtonEclairMr1$ElevateToTranslationZAnimation.class */
    private class ElevateToTranslationZAnimation extends BaseShadowAnimation {
        private ElevateToTranslationZAnimation() {
            super();
        }

        @Override // android.support.design.widget.FloatingActionButtonEclairMr1.BaseShadowAnimation
        protected float getTargetShadowSize() {
            return FloatingActionButtonEclairMr1.this.mElevation + FloatingActionButtonEclairMr1.this.mPressedTranslationZ;
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private static ColorStateList createColorStateList(int selectedColor) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = FOCUSED_ENABLED_STATE_SET;
        colors[0] = selectedColor;
        int i = 0 + 1;
        r0[i] = PRESSED_ENABLED_STATE_SET;
        colors[i] = selectedColor;
        int i2 = i + 1;
        r0[i2] = new int[0];
        colors[i2] = 0;
        int i3 = i2 + 1;
        return new ColorStateList(r0, colors);
    }
}
