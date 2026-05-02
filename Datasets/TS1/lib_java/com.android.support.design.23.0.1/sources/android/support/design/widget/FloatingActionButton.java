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
import android.support.design.widget.Snackbar;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
/* loaded from: com.android.support.design.23.0.1.jar:android/support/design/widget/FloatingActionButton.class */
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
        int sdk = Build.VERSION.SDK_INT;
        if (sdk >= 21) {
            this.mImpl = new FloatingActionButtonLollipop(this, delegate);
        } else if (sdk >= 12) {
            this.mImpl = new FloatingActionButtonHoneycombMr1(this, delegate);
        } else {
            this.mImpl = new FloatingActionButtonEclairMr1(this, delegate);
        }
        int maxContentSize = (int) getResources().getDimension(R.dimen.design_fab_content_size);
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

    public void setRippleColor(@ColorInt int color) {
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
        if (this.mBackgroundTint != tint) {
            this.mBackgroundTint = tint;
            this.mImpl.setBackgroundTintList(tint);
        }
    }

    @Override // android.view.View
    @Nullable
    public PorterDuff.Mode getBackgroundTintMode() {
        return this.mBackgroundTintMode;
    }

    @Override // android.view.View
    public void setBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        if (this.mBackgroundTintMode != tintMode) {
            this.mBackgroundTintMode = tintMode;
            this.mImpl.setBackgroundTintMode(tintMode);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(@NonNull Drawable background) {
        if (this.mImpl != null) {
            this.mImpl.setBackgroundDrawable(background, this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        }
    }

    public void show() {
        this.mImpl.show();
    }

    public void hide() {
        this.mImpl.hide();
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
            case Snackbar.Callback.DISMISS_EVENT_MANUAL /* 3 */:
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

    /* loaded from: com.android.support.design.23.0.1.jar:android/support/design/widget/FloatingActionButton$Behavior.class */
    public static class Behavior extends CoordinatorLayout.Behavior<FloatingActionButton> {
        private static final boolean SNACKBAR_BEHAVIOR_ENABLED;
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

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public void onDependentViewRemoved(CoordinatorLayout parent, FloatingActionButton child, View dependency) {
            if ((dependency instanceof Snackbar.SnackbarLayout) && ViewCompat.getTranslationY(child) != 0.0f) {
                ViewCompat.animate(child).translationY(0.0f).scaleX(1.0f).scaleY(1.0f).alpha(1.0f).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener((ViewPropertyAnimatorListener) null);
            }
        }

        private boolean updateFabVisibility(CoordinatorLayout parent, AppBarLayout appBarLayout, FloatingActionButton child) {
            CoordinatorLayout.LayoutParams lp = (CoordinatorLayout.LayoutParams) child.getLayoutParams();
            if (lp.getAnchorId() != appBarLayout.getId()) {
                return false;
            }
            if (this.mTmpRect == null) {
                this.mTmpRect = new Rect();
            }
            Rect rect = this.mTmpRect;
            ViewGroupUtils.getDescendantRect(parent, appBarLayout, rect);
            if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                child.hide();
                return true;
            }
            child.show();
            return true;
        }

        private void updateFabTranslationForSnackbar(CoordinatorLayout parent, FloatingActionButton fab, View snackbar) {
            if (fab.getVisibility() != 0) {
                return;
            }
            float translationY = getFabTranslationYForSnackbar(parent, fab);
            ViewCompat.setTranslationY(fab, translationY);
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

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onLayoutChild(CoordinatorLayout parent, FloatingActionButton child, int layoutDirection) {
            List<View> dependencies = parent.getDependencies(child);
            int count = dependencies.size();
            for (int i = 0; i < count; i++) {
                View dependency = dependencies.get(i);
                if ((dependency instanceof AppBarLayout) && updateFabVisibility(parent, (AppBarLayout) dependency, child)) {
                    break;
                }
            }
            parent.onLayoutChild(child, layoutDirection);
            offsetIfNeeded(parent, child);
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
}
