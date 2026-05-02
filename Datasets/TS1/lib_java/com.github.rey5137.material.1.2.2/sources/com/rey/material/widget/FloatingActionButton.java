package com.rey.material.widget;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.LineMorphingDrawable;
import com.rey.material.drawable.OvalShadowDrawable;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/FloatingActionButton.class */
public class FloatingActionButton extends View implements ThemeManager.OnThemeChangedListener {
    private OvalShadowDrawable mBackground;
    private Drawable mIcon;
    private Drawable mPrevIcon;
    private int mAnimDuration;
    private Interpolator mInterpolator;
    private SwitchIconAnimator mSwitchIconAnimator;
    private int mIconSize;
    private RippleManager mRippleManager;
    protected int mStyleId;
    protected int mCurrentStyle;

    public static FloatingActionButton make(Context context, int resId) {
        return new FloatingActionButton(context, null, resId);
    }

    public FloatingActionButton(Context context) {
        super(context);
        this.mAnimDuration = -1;
        this.mIconSize = -1;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, null, 0, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mAnimDuration = -1;
        this.mIconSize = -1;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, 0, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mAnimDuration = -1;
        this.mIconSize = -1;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mAnimDuration = -1;
        this.mIconSize = -1;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        setClickable(true);
        this.mSwitchIconAnimator = new SwitchIconAnimator();
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        int resId;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyleAttr, defStyleRes);
        int radius = -1;
        int elevation = -1;
        ColorStateList bgColor = null;
        int bgAnimDuration = -1;
        int iconSrc = 0;
        int iconLineMorphing = 0;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.FloatingActionButton_fab_radius) {
                radius = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_elevation) {
                elevation = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_backgroundColor) {
                bgColor = a.getColorStateList(attr);
            } else if (attr == R.styleable.FloatingActionButton_fab_backgroundAnimDuration) {
                bgAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_iconSrc) {
                iconSrc = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_iconLineMorphing) {
                iconLineMorphing = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_iconSize) {
                this.mIconSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_animDuration) {
                this.mAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.FloatingActionButton_fab_interpolator && (resId = a.getResourceId(R.styleable.FloatingActionButton_fab_interpolator, 0)) != 0) {
                this.mInterpolator = AnimationUtils.loadInterpolator(context, resId);
            }
        }
        a.recycle();
        if (this.mIconSize < 0) {
            this.mIconSize = ThemeUtil.dpToPx(context, 24);
        }
        if (this.mAnimDuration < 0) {
            this.mAnimDuration = context.getResources().getInteger(android.R.integer.config_mediumAnimTime);
        }
        if (this.mInterpolator == null) {
            this.mInterpolator = new DecelerateInterpolator();
        }
        if (this.mBackground == null) {
            if (radius < 0) {
                radius = ThemeUtil.dpToPx(context, 28);
            }
            if (elevation < 0) {
                elevation = ThemeUtil.dpToPx(context, 4);
            }
            if (bgColor == null) {
                bgColor = ColorStateList.valueOf(ThemeUtil.colorAccent(context, 0));
            }
            if (bgAnimDuration < 0) {
                bgAnimDuration = 0;
            }
            this.mBackground = new OvalShadowDrawable(radius, bgColor, elevation, elevation, bgAnimDuration);
            this.mBackground.setInEditMode(isInEditMode());
            this.mBackground.setBounds(0, 0, getWidth(), getHeight());
            this.mBackground.setCallback(this);
        } else {
            if (radius >= 0) {
                this.mBackground.setRadius(radius);
            }
            if (bgColor != null) {
                this.mBackground.setColor(bgColor);
            }
            if (elevation >= 0) {
                this.mBackground.setShadow(elevation, elevation);
            }
            if (bgAnimDuration >= 0) {
                this.mBackground.setAnimationDuration(bgAnimDuration);
            }
        }
        if (iconLineMorphing != 0) {
            setIcon(new LineMorphingDrawable.Builder(context, iconLineMorphing).build(), false);
        } else if (iconSrc != 0) {
            setIcon(context.getResources().getDrawable(iconSrc), false);
        }
        getRippleManager().onCreate(this, context, attrs, defStyleAttr, defStyleRes);
        Drawable background = getBackground();
        if (background != null && (background instanceof RippleDrawable)) {
            RippleDrawable drawable = (RippleDrawable) background;
            drawable.setBackgroundDrawable(null);
            drawable.setMask(1, 0, 0, 0, 0, (int) this.mBackground.getPaddingLeft(), (int) this.mBackground.getPaddingTop(), (int) this.mBackground.getPaddingRight(), (int) this.mBackground.getPaddingBottom());
        }
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            onThemeChanged(null);
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        RippleManager.cancelRipple(this);
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    public int getRadius() {
        return this.mBackground.getRadius();
    }

    public void setRadius(int radius) {
        if (this.mBackground.setRadius(radius)) {
            requestLayout();
        }
    }

    @Override // android.view.View
    @TargetApi(BuildConfig.VERSION_CODE)
    public float getElevation() {
        if (Build.VERSION.SDK_INT >= 21) {
            return super.getElevation();
        }
        return this.mBackground.getShadowSize();
    }

    @Override // android.view.View
    @TargetApi(BuildConfig.VERSION_CODE)
    public void setElevation(float elevation) {
        if (Build.VERSION.SDK_INT >= 21) {
            super.setElevation(elevation);
        } else if (this.mBackground.setShadow(elevation, elevation)) {
            requestLayout();
        }
    }

    public int getLineMorphingState() {
        if (this.mIcon != null && (this.mIcon instanceof LineMorphingDrawable)) {
            return ((LineMorphingDrawable) this.mIcon).getLineState();
        }
        return -1;
    }

    public void setLineMorphingState(int state, boolean animation) {
        if (this.mIcon != null && (this.mIcon instanceof LineMorphingDrawable)) {
            ((LineMorphingDrawable) this.mIcon).switchLineState(state, animation);
        }
    }

    public ColorStateList getBackgroundColor() {
        return this.mBackground.getColor();
    }

    public Drawable getIcon() {
        return this.mIcon;
    }

    public void setIcon(Drawable icon, boolean animation) {
        if (icon == null) {
            return;
        }
        if (animation) {
            this.mSwitchIconAnimator.startAnimation(icon);
            invalidate();
            return;
        }
        if (this.mIcon != null) {
            this.mIcon.setCallback(null);
            unscheduleDrawable(this.mIcon);
        }
        this.mIcon = icon;
        float half = this.mIconSize / 2.0f;
        this.mIcon.setBounds((int) (this.mBackground.getCenterX() - half), (int) (this.mBackground.getCenterY() - half), (int) (this.mBackground.getCenterX() + half), (int) (this.mBackground.getCenterY() + half));
        this.mIcon.setCallback(this);
        invalidate();
    }

    public void setBackgroundColor(ColorStateList color) {
        this.mBackground.setColor(color);
        invalidate();
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.mBackground.setColor(color);
        invalidate();
    }

    public void show(Activity activity, int x, int y, int gravity) {
        if (getParent() == null) {
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(this.mBackground.getIntrinsicWidth(), this.mBackground.getIntrinsicHeight());
            updateParams(x, y, gravity, params);
            activity.getWindow().addContentView(this, params);
            return;
        }
        updateLocation(x, y, gravity);
    }

    public void show(ViewGroup parent, int x, int y, int gravity) {
        if (getParent() == null) {
            ViewGroup.LayoutParams params = parent.generateLayoutParams((AttributeSet) null);
            params.width = this.mBackground.getIntrinsicWidth();
            params.height = this.mBackground.getIntrinsicHeight();
            updateParams(x, y, gravity, params);
            parent.addView(this, params);
            return;
        }
        updateLocation(x, y, gravity);
    }

    public void updateLocation(int x, int y, int gravity) {
        if (getParent() != null) {
            updateParams(x, y, gravity, getLayoutParams());
        } else {
            Log.v(FloatingActionButton.class.getSimpleName(), "updateLocation() is called without parent");
        }
    }

    private void updateParams(int x, int y, int gravity, ViewGroup.LayoutParams params) {
        int horizontalGravity = gravity & 7;
        switch (horizontalGravity) {
            case 1:
                setLeftMargin(params, (int) (x - this.mBackground.getCenterX()));
                break;
            case 2:
            case 4:
            default:
                setLeftMargin(params, (int) (x - this.mBackground.getPaddingLeft()));
                break;
            case 3:
                setLeftMargin(params, (int) (x - this.mBackground.getPaddingLeft()));
                break;
            case 5:
                setLeftMargin(params, (int) ((x - this.mBackground.getPaddingLeft()) - (this.mBackground.getRadius() * 2)));
                break;
        }
        int verticalGravity = gravity & 112;
        switch (verticalGravity) {
            case 16:
                setTopMargin(params, (int) (y - this.mBackground.getCenterY()));
                break;
            case 48:
                setTopMargin(params, (int) (y - this.mBackground.getPaddingTop()));
                break;
            case 80:
                setTopMargin(params, (int) ((y - this.mBackground.getPaddingTop()) - (this.mBackground.getRadius() * 2)));
                break;
            default:
                setTopMargin(params, (int) (y - this.mBackground.getPaddingTop()));
                break;
        }
        setLayoutParams(params);
    }

    private void setLeftMargin(ViewGroup.LayoutParams params, int value) {
        if (params instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) params).leftMargin = value;
        } else if (params instanceof RelativeLayout.LayoutParams) {
            ((RelativeLayout.LayoutParams) params).leftMargin = value;
        } else {
            Log.v(FloatingActionButton.class.getSimpleName(), "cannot recognize LayoutParams: " + params);
        }
    }

    private void setTopMargin(ViewGroup.LayoutParams params, int value) {
        if (params instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) params).topMargin = value;
        } else if (params instanceof RelativeLayout.LayoutParams) {
            ((RelativeLayout.LayoutParams) params).topMargin = value;
        } else {
            Log.v(FloatingActionButton.class.getSimpleName(), "cannot recognize LayoutParams: " + params);
        }
    }

    public void dismiss() {
        if (getParent() != null) {
            ((ViewGroup) getParent()).removeView(this);
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || this.mBackground == who || this.mIcon == who || this.mPrevIcon == who;
    }

    @Override // android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mBackground != null) {
            this.mBackground.setState(getDrawableState());
        }
        if (this.mIcon != null) {
            this.mIcon.setState(getDrawableState());
        }
        if (this.mPrevIcon != null) {
            this.mPrevIcon.setState(getDrawableState());
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(this.mBackground.getIntrinsicWidth(), this.mBackground.getIntrinsicHeight());
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.mBackground.setBounds(0, 0, w, h);
        if (this.mIcon != null) {
            float half = this.mIconSize / 2.0f;
            this.mIcon.setBounds((int) (this.mBackground.getCenterX() - half), (int) (this.mBackground.getCenterY() - half), (int) (this.mBackground.getCenterX() + half), (int) (this.mBackground.getCenterY() + half));
        }
        if (this.mPrevIcon != null) {
            float half2 = this.mIconSize / 2.0f;
            this.mPrevIcon.setBounds((int) (this.mBackground.getCenterX() - half2), (int) (this.mBackground.getCenterY() - half2), (int) (this.mBackground.getCenterX() + half2), (int) (this.mBackground.getCenterY() + half2));
        }
    }

    @Override // android.view.View
    public void draw(@NonNull Canvas canvas) {
        this.mBackground.draw(canvas);
        super.draw(canvas);
        if (this.mPrevIcon != null) {
            this.mPrevIcon.draw(canvas);
        }
        if (this.mIcon != null) {
            this.mIcon.draw(canvas);
        }
    }

    protected RippleManager getRippleManager() {
        if (this.mRippleManager == null) {
            synchronized (RippleManager.class) {
                if (this.mRippleManager == null) {
                    this.mRippleManager = new RippleManager();
                }
            }
        }
        return this.mRippleManager;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        RippleManager rippleManager = getRippleManager();
        if (l == rippleManager) {
            super.setOnClickListener(l);
        } else {
            rippleManager.setOnClickListener(l);
            setOnClickListener(rippleManager);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        int action = event.getActionMasked();
        if (action == 0 && !this.mBackground.isPointerOver(event.getX(), event.getY())) {
            return false;
        }
        boolean result = super.onTouchEvent(event);
        return getRippleManager().onTouchEvent(this, event) || result;
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.state = getLineMorphingState();
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        if (ss.state >= 0) {
            setLineMorphingState(ss.state, false);
        }
        requestLayout();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/FloatingActionButton$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int state;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.rey.material.widget.FloatingActionButton.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.state = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.state);
        }

        public String toString() {
            return "FloatingActionButton.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " state=" + this.state + "}";
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/FloatingActionButton$SwitchIconAnimator.class */
    class SwitchIconAnimator implements Runnable {
        boolean mRunning = false;
        long mStartTime;

        SwitchIconAnimator() {
        }

        public void resetAnimation() {
            this.mStartTime = SystemClock.uptimeMillis();
            FloatingActionButton.this.mIcon.setAlpha(0);
            FloatingActionButton.this.mPrevIcon.setAlpha(255);
        }

        public boolean startAnimation(Drawable icon) {
            if (FloatingActionButton.this.mIcon == icon) {
                return false;
            }
            FloatingActionButton.this.mPrevIcon = FloatingActionButton.this.mIcon;
            FloatingActionButton.this.mIcon = icon;
            float half = FloatingActionButton.this.mIconSize / 2.0f;
            FloatingActionButton.this.mIcon.setBounds((int) (FloatingActionButton.this.mBackground.getCenterX() - half), (int) (FloatingActionButton.this.mBackground.getCenterY() - half), (int) (FloatingActionButton.this.mBackground.getCenterX() + half), (int) (FloatingActionButton.this.mBackground.getCenterY() + half));
            FloatingActionButton.this.mIcon.setCallback(FloatingActionButton.this);
            if (FloatingActionButton.this.getHandler() == null) {
                FloatingActionButton.this.mPrevIcon.setCallback(null);
                FloatingActionButton.this.unscheduleDrawable(FloatingActionButton.this.mPrevIcon);
                FloatingActionButton.this.mPrevIcon = null;
            } else {
                resetAnimation();
                this.mRunning = true;
                FloatingActionButton.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
            }
            FloatingActionButton.this.invalidate();
            return true;
        }

        public void stopAnimation() {
            this.mRunning = false;
            FloatingActionButton.this.mPrevIcon.setCallback(null);
            FloatingActionButton.this.unscheduleDrawable(FloatingActionButton.this.mPrevIcon);
            FloatingActionButton.this.mPrevIcon = null;
            FloatingActionButton.this.mIcon.setAlpha(255);
            if (FloatingActionButton.this.getHandler() != null) {
                FloatingActionButton.this.getHandler().removeCallbacks(this);
            }
            FloatingActionButton.this.invalidate();
        }

        @Override // java.lang.Runnable
        public void run() {
            long curTime = SystemClock.uptimeMillis();
            float progress = Math.min(1.0f, (curTime - this.mStartTime) / FloatingActionButton.this.mAnimDuration);
            float value = FloatingActionButton.this.mInterpolator.getInterpolation(progress);
            FloatingActionButton.this.mIcon.setAlpha(Math.round(255.0f * value));
            FloatingActionButton.this.mPrevIcon.setAlpha(Math.round(255.0f * (1.0f - value)));
            if (progress == 1.0f) {
                stopAnimation();
            }
            if (this.mRunning) {
                if (FloatingActionButton.this.getHandler() != null) {
                    FloatingActionButton.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                } else {
                    stopAnimation();
                }
            }
            FloatingActionButton.this.invalidate();
        }
    }
}
