package android.support.design.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.AnimationUtils;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.Snackbar;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Animation;
import android.widget.ImageView;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
/* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButton.class */
public class FloatingActionButton extends ImageView {
    private static final int SIZE_MINI = 1;
    private static final int SIZE_NORMAL = 0;
    private ColorStateList mBackgroundTint;
    private PorterDuff.Mode mBackgroundTintMode;
    private int mBorderWidth;
    private int mRippleColor;
    private int mSize;
    private int mContentPadding;
    private final Rect mShadowPadding;
    private final FloatingActionButtonImpl mImpl;

    public FloatingActionButton(Context context) {
        this(context, null);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShadowPadding = new Rect();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyleAttr, R.style.Widget_Design_FloatingActionButton);
        Drawable background = a.getDrawable(R.styleable.FloatingActionButton_android_background);
        this.mBackgroundTint = a.getColorStateList(R.styleable.FloatingActionButton_backgroundTint);
        this.mBackgroundTintMode = parseTintMode(a.getInt(R.styleable.FloatingActionButton_backgroundTintMode, -1), null);
        this.mRippleColor = a.getColor(R.styleable.FloatingActionButton_rippleColor, 0);
        this.mSize = a.getInt(R.styleable.FloatingActionButton_fabSize, 0);
        this.mBorderWidth = a.getDimensionPixelSize(R.styleable.FloatingActionButton_borderWidth, 0);
        float elevation = a.getDimension(R.styleable.FloatingActionButton_elevation, 0.0f);
        float pressedTranslationZ = a.getDimension(R.styleable.FloatingActionButton_pressedTranslationZ, 0.0f);
        a.recycle();
        ShadowViewDelegate delegate = new ShadowViewDelegate() { // from class: android.support.design.widget.FloatingActionButton.1
            @Override // android.support.design.widget.ShadowViewDelegate
            public float getRadius() {
                return FloatingActionButton.this.getSizeDimension() / 2.0f;
            }

            @Override // android.support.design.widget.ShadowViewDelegate
            public void setShadowPadding(int left, int top, int right, int bottom) {
                FloatingActionButton.this.mShadowPadding.set(left, top, right, bottom);
                FloatingActionButton.this.setPadding(left + FloatingActionButton.this.mContentPadding, top + FloatingActionButton.this.mContentPadding, right + FloatingActionButton.this.mContentPadding, bottom + FloatingActionButton.this.mContentPadding);
            }

            @Override // android.support.design.widget.ShadowViewDelegate
            public void setBackgroundDrawable(Drawable background2) {
                FloatingActionButton.super.setBackgroundDrawable(background2);
            }
        };
        if (Build.VERSION.SDK_INT >= 21) {
            this.mImpl = new FloatingActionButtonLollipop(this, delegate);
        } else {
            this.mImpl = new FloatingActionButtonEclairMr1(this, delegate);
        }
        int maxContentSize = (int) getResources().getDimension(R.dimen.fab_content_size);
        this.mContentPadding = (getSizeDimension() - maxContentSize) / 2;
        this.mImpl.setBackgroundDrawable(background, this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        this.mImpl.setElevation(elevation);
        this.mImpl.setPressedTranslationZ(pressedTranslationZ);
        setClickable(true);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int preferredSize = getSizeDimension();
        int w = resolveAdjustedSize(preferredSize, widthMeasureSpec);
        int h = resolveAdjustedSize(preferredSize, heightMeasureSpec);
        int d = Math.min(w, h);
        setMeasuredDimension(d + this.mShadowPadding.left + this.mShadowPadding.right, d + this.mShadowPadding.top + this.mShadowPadding.bottom);
    }

    public void setRippleColor(int color) {
        if (this.mRippleColor != color) {
            this.mRippleColor = color;
            this.mImpl.setRippleColor(color);
        }
    }

    @Override // android.view.View
    @Nullable
    public ColorStateList getBackgroundTintList() {
        return this.mBackgroundTint;
    }

    @Override // android.view.View
    public void setBackgroundTintList(@Nullable ColorStateList tint) {
        this.mImpl.setBackgroundTintList(tint);
    }

    @Override // android.view.View
    @Nullable
    public PorterDuff.Mode getBackgroundTintMode() {
        return this.mBackgroundTintMode;
    }

    @Override // android.view.View
    public void setBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        this.mImpl.setBackgroundTintMode(tintMode);
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable background) {
        if (this.mImpl != null) {
            this.mImpl.setBackgroundDrawable(background, this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        }
    }

    final int getSizeDimension() {
        switch (this.mSize) {
            case 0:
            default:
                return getResources().getDimensionPixelSize(R.dimen.fab_size_normal);
            case 1:
                return getResources().getDimensionPixelSize(R.dimen.fab_size_mini);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        this.mImpl.onDrawableStateChanged(getDrawableState());
    }

    @Override // android.widget.ImageView, android.view.View
    @TargetApi(11)
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        this.mImpl.jumpDrawableToCurrentState();
    }

    private static int resolveAdjustedSize(int desiredSize, int measureSpec) {
        int result = desiredSize;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case Integer.MIN_VALUE:
                result = Math.min(desiredSize, specSize);
                break;
            case 0:
                result = desiredSize;
                break;
            case 1073741824:
                result = specSize;
                break;
        }
        return result;
    }

    static PorterDuff.Mode parseTintMode(int value, PorterDuff.Mode defaultMode) {
        switch (value) {
            case 3:
                return PorterDuff.Mode.SRC_OVER;
            case AppBarLayout.LayoutParams.SCROLL_FLAG_ENTER_ALWAYS /* 4 */:
            case 6:
            case 7:
            case AppBarLayout.LayoutParams.SCROLL_FLAG_ENTER_ALWAYS_COLLAPSED /* 8 */:
            case 10:
            case 11:
            case 12:
            case 13:
            default:
                return defaultMode;
            case 5:
                return PorterDuff.Mode.SRC_IN;
            case 9:
                return PorterDuff.Mode.SRC_ATOP;
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
        }
    }

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/FloatingActionButton$Behavior.class */
    public static class Behavior extends CoordinatorLayout.Behavior<FloatingActionButton> {
        private static final boolean SNACKBAR_BEHAVIOR_ENABLED;
        private Rect mTmpRect;
        private boolean mIsAnimatingOut;
        private float mTranslationY;

        static {
            SNACKBAR_BEHAVIOR_ENABLED = Build.VERSION.SDK_INT >= 11;
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean layoutDependsOn(CoordinatorLayout parent, FloatingActionButton child, View dependency) {
            return SNACKBAR_BEHAVIOR_ENABLED && (dependency instanceof Snackbar.SnackbarLayout);
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onDependentViewChanged(CoordinatorLayout parent, FloatingActionButton child, View dependency) {
            if (dependency instanceof Snackbar.SnackbarLayout) {
                updateFabTranslationForSnackbar(parent, child, dependency);
                return false;
            }
            if (dependency instanceof AppBarLayout) {
                AppBarLayout appBarLayout = (AppBarLayout) dependency;
                if (this.mTmpRect == null) {
                    this.mTmpRect = new Rect();
                }
                Rect rect = this.mTmpRect;
                ViewGroupUtils.getDescendantRect(parent, dependency, rect);
                if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                    if (!this.mIsAnimatingOut && child.getVisibility() == 0) {
                        animateOut(child);
                        return false;
                    }
                    return false;
                }
                if (child.getVisibility() != 0) {
                    animateIn(child);
                    return false;
                }
                return false;
            }
            return false;
        }

        private void updateFabTranslationForSnackbar(CoordinatorLayout parent, FloatingActionButton fab, View snackbar) {
            float translationY = getFabTranslationYForSnackbar(parent, fab);
            if (translationY != this.mTranslationY) {
                ViewCompat.animate(fab).cancel();
                if (Math.abs(translationY - this.mTranslationY) == snackbar.getHeight()) {
                    ViewCompat.animate(fab).translationY(translationY).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener((ViewPropertyAnimatorListener) null);
                } else {
                    ViewCompat.setTranslationY(fab, translationY);
                }
                this.mTranslationY = translationY;
            }
        }

        private float getFabTranslationYForSnackbar(CoordinatorLayout parent, FloatingActionButton fab) {
            float minOffset = 0.0f;
            List<View> dependencies = parent.getDependencies(fab);
            int z = dependencies.size();
            for (int i = 0; i < z; i++) {
                View view = dependencies.get(i);
                if ((view instanceof Snackbar.SnackbarLayout) && parent.doViewsOverlap(fab, view)) {
                    minOffset = Math.min(minOffset, ViewCompat.getTranslationY(view) - view.getHeight());
                }
            }
            return minOffset;
        }

        private void animateIn(FloatingActionButton button) {
            button.setVisibility(0);
            if (Build.VERSION.SDK_INT >= 14) {
                ViewCompat.animate(button).scaleX(1.0f).scaleY(1.0f).alpha(1.0f).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).withLayer().setListener((ViewPropertyAnimatorListener) null).start();
                return;
            }
            Animation anim = android.view.animation.AnimationUtils.loadAnimation(button.getContext(), R.anim.fab_in);
            anim.setDuration(200L);
            anim.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
            button.startAnimation(anim);
        }

        private void animateOut(final FloatingActionButton button) {
            if (Build.VERSION.SDK_INT >= 14) {
                ViewCompat.animate(button).scaleX(0.0f).scaleY(0.0f).alpha(0.0f).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).withLayer().setListener(new ViewPropertyAnimatorListener() { // from class: android.support.design.widget.FloatingActionButton.Behavior.1
                    public void onAnimationStart(View view) {
                        Behavior.this.mIsAnimatingOut = true;
                    }

                    public void onAnimationCancel(View view) {
                        Behavior.this.mIsAnimatingOut = false;
                    }

                    public void onAnimationEnd(View view) {
                        Behavior.this.mIsAnimatingOut = false;
                        view.setVisibility(8);
                    }
                }).start();
                return;
            }
            Animation anim = android.view.animation.AnimationUtils.loadAnimation(button.getContext(), R.anim.fab_out);
            anim.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
            anim.setDuration(200L);
            anim.setAnimationListener(new AnimationUtils.AnimationListenerAdapter() { // from class: android.support.design.widget.FloatingActionButton.Behavior.2
                @Override // android.support.design.widget.AnimationUtils.AnimationListenerAdapter, android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    Behavior.this.mIsAnimatingOut = true;
                }

                @Override // android.support.design.widget.AnimationUtils.AnimationListenerAdapter, android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    Behavior.this.mIsAnimatingOut = false;
                    button.setVisibility(8);
                }
            });
            button.startAnimation(anim);
        }
    }
}
