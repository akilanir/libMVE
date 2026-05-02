package android.support.design.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButtonImpl;
import android.support.design.widget.Snackbar;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
/* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/FloatingActionButton.class */
public class FloatingActionButton extends VisibilityAwareImageButton {
    private static final String LOG_TAG = "FloatingActionButton";
    private static final int SIZE_MINI = 1;
    private static final int SIZE_NORMAL = 0;
    private ColorStateList mBackgroundTint;
    private PorterDuff.Mode mBackgroundTintMode;
    private int mBorderWidth;
    private int mRippleColor;
    private int mSize;
    private int mImagePadding;
    private boolean mCompatPadding;
    private final Rect mShadowPadding;
    private FloatingActionButtonImpl mImpl;

    @Override // android.support.design.widget.VisibilityAwareImageButton
    public /* bridge */ /* synthetic */ void setVisibility(int i) {
        super.setVisibility(i);
    }

    /* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/FloatingActionButton$OnVisibilityChangedListener.class */
    public static abstract class OnVisibilityChangedListener {
        public void onShown(FloatingActionButton fab) {
        }

        public void onHidden(FloatingActionButton fab) {
        }
    }

    public FloatingActionButton(Context context) {
        this(context, null);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShadowPadding = new Rect();
        ThemeUtils.checkAppCompatTheme(context);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyleAttr, R.style.Widget_Design_FloatingActionButton);
        this.mBackgroundTint = a.getColorStateList(R.styleable.FloatingActionButton_backgroundTint);
        this.mBackgroundTintMode = parseTintMode(a.getInt(R.styleable.FloatingActionButton_backgroundTintMode, -1), null);
        this.mRippleColor = a.getColor(R.styleable.FloatingActionButton_rippleColor, 0);
        this.mSize = a.getInt(R.styleable.FloatingActionButton_fabSize, 0);
        this.mBorderWidth = a.getDimensionPixelSize(R.styleable.FloatingActionButton_borderWidth, 0);
        float elevation = a.getDimension(R.styleable.FloatingActionButton_elevation, 0.0f);
        float pressedTranslationZ = a.getDimension(R.styleable.FloatingActionButton_pressedTranslationZ, 0.0f);
        this.mCompatPadding = a.getBoolean(R.styleable.FloatingActionButton_useCompatPadding, false);
        a.recycle();
        int maxImageSize = (int) getResources().getDimension(R.dimen.design_fab_image_size);
        this.mImagePadding = (getSizeDimension() - maxImageSize) / 2;
        getImpl().setBackgroundDrawable(this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        getImpl().setElevation(elevation);
        getImpl().setPressedTranslationZ(pressedTranslationZ);
        getImpl().updatePadding();
    }

    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int preferredSize = getSizeDimension();
        int w = resolveAdjustedSize(preferredSize, widthMeasureSpec);
        int h = resolveAdjustedSize(preferredSize, heightMeasureSpec);
        int d = Math.min(w, h);
        setMeasuredDimension(d + this.mShadowPadding.left + this.mShadowPadding.right, d + this.mShadowPadding.top + this.mShadowPadding.bottom);
    }

    public void setRippleColor(@ColorInt int color) {
        if (this.mRippleColor != color) {
            this.mRippleColor = color;
            getImpl().setRippleColor(color);
        }
    }

    @Nullable
    public ColorStateList getBackgroundTintList() {
        return this.mBackgroundTint;
    }

    public void setBackgroundTintList(@Nullable ColorStateList tint) {
        if (this.mBackgroundTint != tint) {
            this.mBackgroundTint = tint;
            getImpl().setBackgroundTintList(tint);
        }
    }

    @Nullable
    public PorterDuff.Mode getBackgroundTintMode() {
        return this.mBackgroundTintMode;
    }

    public void setBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        if (this.mBackgroundTintMode != tintMode) {
            this.mBackgroundTintMode = tintMode;
            getImpl().setBackgroundTintMode(tintMode);
        }
    }

    public void setBackgroundDrawable(Drawable background) {
        Log.i(LOG_TAG, "Setting a custom background is not supported.");
    }

    public void setBackgroundResource(int resid) {
        Log.i(LOG_TAG, "Setting a custom background is not supported.");
    }

    public void setBackgroundColor(int color) {
        Log.i(LOG_TAG, "Setting a custom background is not supported.");
    }

    public void show() {
        show(null);
    }

    public void show(@Nullable OnVisibilityChangedListener listener) {
        show(listener, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void show(OnVisibilityChangedListener listener, boolean fromUser) {
        getImpl().show(wrapOnVisibilityChangedListener(listener), fromUser);
    }

    public void hide() {
        hide(null);
    }

    public void hide(@Nullable OnVisibilityChangedListener listener) {
        hide(listener, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hide(@Nullable OnVisibilityChangedListener listener, boolean fromUser) {
        getImpl().hide(wrapOnVisibilityChangedListener(listener), fromUser);
    }

    public void setUseCompatPadding(boolean useCompatPadding) {
        if (this.mCompatPadding != useCompatPadding) {
            this.mCompatPadding = useCompatPadding;
            getImpl().onCompatShadowChanged();
        }
    }

    public boolean getUseCompatPadding() {
        return this.mCompatPadding;
    }

    @Nullable
    private FloatingActionButtonImpl.InternalVisibilityChangedListener wrapOnVisibilityChangedListener(@Nullable final OnVisibilityChangedListener listener) {
        if (listener == null) {
            return null;
        }
        return new FloatingActionButtonImpl.InternalVisibilityChangedListener() { // from class: android.support.design.widget.FloatingActionButton.1
            @Override // android.support.design.widget.FloatingActionButtonImpl.InternalVisibilityChangedListener
            public void onShown() {
                listener.onShown(FloatingActionButton.this);
            }

            @Override // android.support.design.widget.FloatingActionButtonImpl.InternalVisibilityChangedListener
            public void onHidden() {
                listener.onHidden(FloatingActionButton.this);
            }
        };
    }

    final int getSizeDimension() {
        switch (this.mSize) {
            case 0:
            default:
                return getResources().getDimensionPixelSize(R.dimen.design_fab_size_normal);
            case 1:
                return getResources().getDimensionPixelSize(R.dimen.design_fab_size_mini);
        }
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getImpl().onAttachedToWindow();
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        getImpl().onDetachedFromWindow();
    }

    protected void drawableStateChanged() {
        super.drawableStateChanged();
        getImpl().onDrawableStateChanged(getDrawableState());
    }

    @TargetApi(11)
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        getImpl().jumpDrawableToCurrentState();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean getContentRect(@NonNull Rect rect) {
        if (ViewCompat.isLaidOut(this)) {
            rect.set(0, 0, getWidth(), getHeight());
            rect.left += this.mShadowPadding.left;
            rect.top += this.mShadowPadding.top;
            rect.right -= this.mShadowPadding.right;
            rect.bottom -= this.mShadowPadding.bottom;
            return true;
        }
        return false;
    }

    @NonNull
    public Drawable getContentBackground() {
        return getImpl().getContentBackground();
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
            case 4:
            case 6:
            case 7:
            case AppBarLayout.LayoutParams.SCROLL_FLAG_ENTER_ALWAYS_COLLAPSED /* 8 */:
            case 10:
            case 11:
            case 12:
            case 13:
            default:
                return defaultMode;
            case BottomSheetBehavior.STATE_HIDDEN /* 5 */:
                return PorterDuff.Mode.SRC_IN;
            case 9:
                return PorterDuff.Mode.SRC_ATOP;
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
        }
    }

    /* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/FloatingActionButton$Behavior.class */
    public static class Behavior extends CoordinatorLayout.Behavior<FloatingActionButton> {
        private static final boolean SNACKBAR_BEHAVIOR_ENABLED;
        private ValueAnimatorCompat mFabTranslationYAnimator;
        private float mFabTranslationY;
        private Rect mTmpRect;

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
                updateFabVisibility(parent, (AppBarLayout) dependency, child);
                return false;
            }
            return false;
        }

        private boolean updateFabVisibility(CoordinatorLayout parent, AppBarLayout appBarLayout, FloatingActionButton child) {
            CoordinatorLayout.LayoutParams lp = (CoordinatorLayout.LayoutParams) child.getLayoutParams();
            if (lp.getAnchorId() != appBarLayout.getId() || child.getUserSetVisibility() != 0) {
                return false;
            }
            if (this.mTmpRect == null) {
                this.mTmpRect = new Rect();
            }
            Rect rect = this.mTmpRect;
            ViewGroupUtils.getDescendantRect(parent, appBarLayout, rect);
            if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                child.hide(null, false);
                return true;
            }
            child.show(null, false);
            return true;
        }

        /* JADX WARN: Multi-variable type inference failed */
        private void updateFabTranslationForSnackbar(CoordinatorLayout parent, final FloatingActionButton floatingActionButton, View snackbar) {
            float targetTransY = getFabTranslationYForSnackbar(parent, floatingActionButton);
            if (this.mFabTranslationY == targetTransY) {
                return;
            }
            float currentTransY = ViewCompat.getTranslationY(floatingActionButton);
            if (this.mFabTranslationYAnimator != null && this.mFabTranslationYAnimator.isRunning()) {
                this.mFabTranslationYAnimator.cancel();
            }
            if (floatingActionButton.isShown() && Math.abs(currentTransY - targetTransY) > floatingActionButton.getHeight() * 0.667f) {
                if (this.mFabTranslationYAnimator == null) {
                    this.mFabTranslationYAnimator = ViewUtils.createAnimator();
                    this.mFabTranslationYAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                    this.mFabTranslationYAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() { // from class: android.support.design.widget.FloatingActionButton.Behavior.1
                        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorUpdateListener
                        public void onAnimationUpdate(ValueAnimatorCompat animator) {
                            ViewCompat.setTranslationY(floatingActionButton, animator.getAnimatedFloatValue());
                        }
                    });
                }
                this.mFabTranslationYAnimator.setFloatValues(currentTransY, targetTransY);
                this.mFabTranslationYAnimator.start();
            } else {
                ViewCompat.setTranslationY(floatingActionButton, targetTransY);
            }
            this.mFabTranslationY = targetTransY;
        }

        /* JADX WARN: Multi-variable type inference failed */
        private float getFabTranslationYForSnackbar(CoordinatorLayout parent, FloatingActionButton floatingActionButton) {
            float minOffset = 0.0f;
            List<View> dependencies = parent.getDependencies(floatingActionButton);
            int z = dependencies.size();
            for (int i = 0; i < z; i++) {
                View view = dependencies.get(i);
                if ((view instanceof Snackbar.SnackbarLayout) && parent.doViewsOverlap(floatingActionButton, view)) {
                    minOffset = Math.min(minOffset, ViewCompat.getTranslationY(view) - view.getHeight());
                }
            }
            return minOffset;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onLayoutChild(CoordinatorLayout parent, FloatingActionButton floatingActionButton, int layoutDirection) {
            List<View> dependencies = parent.getDependencies(floatingActionButton);
            int count = dependencies.size();
            for (int i = 0; i < count; i++) {
                View dependency = dependencies.get(i);
                if ((dependency instanceof AppBarLayout) && updateFabVisibility(parent, (AppBarLayout) dependency, floatingActionButton)) {
                    break;
                }
            }
            parent.onLayoutChild(floatingActionButton, layoutDirection);
            offsetIfNeeded(parent, floatingActionButton);
            return true;
        }

        private void offsetIfNeeded(CoordinatorLayout parent, FloatingActionButton fab) {
            Rect padding = fab.mShadowPadding;
            if (padding != null && padding.centerX() > 0 && padding.centerY() > 0) {
                CoordinatorLayout.LayoutParams lp = (CoordinatorLayout.LayoutParams) fab.getLayoutParams();
                int offsetTB = 0;
                int offsetLR = 0;
                if (fab.getRight() >= parent.getWidth() - lp.rightMargin) {
                    offsetLR = padding.right;
                } else if (fab.getLeft() <= lp.leftMargin) {
                    offsetLR = -padding.left;
                }
                if (fab.getBottom() >= parent.getBottom() - lp.bottomMargin) {
                    offsetTB = padding.bottom;
                } else if (fab.getTop() <= lp.topMargin) {
                    offsetTB = -padding.top;
                }
                fab.offsetTopAndBottom(offsetTB);
                fab.offsetLeftAndRight(offsetLR);
            }
        }
    }

    public float getCompatElevation() {
        return getImpl().getElevation();
    }

    public void setCompatElevation(float elevation) {
        getImpl().setElevation(elevation);
    }

    private FloatingActionButtonImpl getImpl() {
        if (this.mImpl == null) {
            this.mImpl = createImpl();
        }
        return this.mImpl;
    }

    private FloatingActionButtonImpl createImpl() {
        int sdk = Build.VERSION.SDK_INT;
        if (sdk >= 21) {
            return new FloatingActionButtonLollipop(this, new ShadowDelegateImpl());
        }
        if (sdk >= 14) {
            return new FloatingActionButtonIcs(this, new ShadowDelegateImpl());
        }
        return new FloatingActionButtonEclairMr1(this, new ShadowDelegateImpl());
    }

    /* loaded from: com.android.support.design.23.2.0.jar:android/support/design/widget/FloatingActionButton$ShadowDelegateImpl.class */
    private class ShadowDelegateImpl implements ShadowViewDelegate {
        private ShadowDelegateImpl() {
        }

        @Override // android.support.design.widget.ShadowViewDelegate
        public float getRadius() {
            return FloatingActionButton.this.getSizeDimension() / 2.0f;
        }

        @Override // android.support.design.widget.ShadowViewDelegate
        public void setShadowPadding(int left, int top, int right, int bottom) {
            FloatingActionButton.this.mShadowPadding.set(left, top, right, bottom);
            FloatingActionButton.this.setPadding(left + FloatingActionButton.this.mImagePadding, top + FloatingActionButton.this.mImagePadding, right + FloatingActionButton.this.mImagePadding, bottom + FloatingActionButton.this.mImagePadding);
        }

        @Override // android.support.design.widget.ShadowViewDelegate
        public void setBackgroundDrawable(Drawable background) {
            FloatingActionButton.super.setBackgroundDrawable(background);
        }

        @Override // android.support.design.widget.ShadowViewDelegate
        public boolean isCompatPaddingEnabled() {
            return FloatingActionButton.this.mCompatPadding;
        }
    }
}
