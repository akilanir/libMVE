package com.rey.material.widget;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.rey.material.BuildConfig;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.PaddingDrawable;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/CompoundButton.class */
public class CompoundButton extends android.widget.CompoundButton implements ThemeManager.OnThemeChangedListener {
    private RippleManager mRippleManager;
    private volatile PaddingDrawable mPaddingDrawable;
    private boolean mIsRtl;
    protected int mStyleId;
    protected int mCurrentStyle;

    public CompoundButton(Context context) {
        super(context);
        this.mIsRtl = false;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, null, 0, 0);
    }

    public CompoundButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mIsRtl = false;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, 0, 0);
    }

    public CompoundButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mIsRtl = false;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public CompoundButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mIsRtl = false;
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        if (Build.VERSION.SDK_INT >= 17) {
            applyPadding(context, attrs, defStyleAttr, defStyleRes);
        }
        setClickable(true);
        ViewUtil.applyFont(this, attrs, defStyleAttr, defStyleRes);
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
        getRippleManager().onCreate(this, context, attrs, defStyleAttr, defStyleRes);
    }

    @TargetApi(17)
    private void applyPadding(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray a = context.obtainStyledAttributes(attrs, new int[]{R.attr.padding, R.attr.paddingLeft, R.attr.paddingTop, R.attr.paddingRight, R.attr.paddingBottom, R.attr.paddingStart, R.attr.paddingEnd}, defStyleAttr, defStyleRes);
        int padding = -1;
        int leftPadding = -1;
        int topPadding = -1;
        int rightPadding = -1;
        int bottomPadding = -1;
        int startPadding = Integer.MIN_VALUE;
        int endPadding = Integer.MIN_VALUE;
        boolean startPaddingDefined = false;
        boolean endPaddingDefined = false;
        boolean leftPaddingDefined = false;
        boolean rightPaddingDefined = false;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == 0) {
                padding = a.getDimensionPixelSize(attr, -1);
                leftPaddingDefined = true;
                rightPaddingDefined = true;
            } else if (attr == 1) {
                leftPadding = a.getDimensionPixelSize(attr, -1);
                leftPaddingDefined = true;
            } else if (attr == 2) {
                topPadding = a.getDimensionPixelSize(attr, -1);
            } else if (attr == 3) {
                rightPadding = a.getDimensionPixelSize(attr, -1);
                rightPaddingDefined = true;
            } else if (attr == 4) {
                bottomPadding = a.getDimensionPixelSize(attr, -1);
            } else if (attr == 5) {
                if (Build.VERSION.SDK_INT >= 17) {
                    startPadding = a.getDimensionPixelSize(attr, ThemeManager.THEME_UNDEFINED);
                    startPaddingDefined = startPadding != Integer.MIN_VALUE;
                }
            } else if (attr == 6 && Build.VERSION.SDK_INT >= 17) {
                endPadding = a.getDimensionPixelSize(attr, ThemeManager.THEME_UNDEFINED);
                endPaddingDefined = endPadding != Integer.MIN_VALUE;
            }
        }
        a.recycle();
        if (padding >= 0) {
            setPadding(padding, padding, padding, padding);
            return;
        }
        if (leftPaddingDefined || rightPaddingDefined) {
            setPadding(leftPaddingDefined ? leftPadding : getPaddingLeft(), topPadding >= 0 ? topPadding : getPaddingTop(), rightPaddingDefined ? rightPadding : getPaddingRight(), bottomPadding >= 0 ? bottomPadding : getPaddingBottom());
        }
        if (startPaddingDefined || endPaddingDefined) {
            setPaddingRelative(startPaddingDefined ? startPadding : getPaddingStart(), topPadding >= 0 ? topPadding : getPaddingTop(), endPaddingDefined ? endPadding : getPaddingEnd(), bottomPadding >= 0 ? bottomPadding : getPaddingBottom());
        }
    }

    private PaddingDrawable getPaddingDrawable() {
        if (this.mPaddingDrawable == null) {
            synchronized (this) {
                if (this.mPaddingDrawable == null) {
                    this.mPaddingDrawable = new PaddingDrawable(null);
                }
            }
        }
        return this.mPaddingDrawable;
    }

    @Override // android.widget.TextView
    public void setTextAppearance(int resId) {
        ViewUtil.applyTextAppearance(this, resId);
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int resId) {
        ViewUtil.applyTextAppearance(this, resId);
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    @Override // android.widget.TextView, android.view.View
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

    @Override // android.widget.TextView, android.view.View
    @TargetApi(17)
    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            if (Build.VERSION.SDK_INT >= 17) {
                setPaddingRelative(getPaddingStart(), getPaddingTop(), getPaddingEnd(), getPaddingBottom());
            } else {
                setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
            }
            setCompoundDrawablePadding(getCompoundDrawablePadding());
            invalidate();
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        Drawable background = getBackground();
        if ((background instanceof RippleDrawable) && !(drawable instanceof RippleDrawable)) {
            ((RippleDrawable) background).setBackgroundDrawable(drawable);
        } else {
            super.setBackgroundDrawable(drawable);
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

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        boolean result = super.onTouchEvent(event);
        return getRippleManager().onTouchEvent(this, event) || result;
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(Drawable d) {
        super.setButtonDrawable((Drawable) null);
        getPaddingDrawable().setWrappedDrawable(d);
        super.setButtonDrawable(getPaddingDrawable());
    }

    @Override // android.widget.CompoundButton
    public Drawable getButtonDrawable() {
        return getPaddingDrawable().getWrappedDrawable();
    }

    @Override // android.widget.TextView, android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
        PaddingDrawable drawable = getPaddingDrawable();
        if (this.mIsRtl) {
            drawable.setPadding(drawable.getPaddingLeft(), top, right, bottom);
        } else {
            drawable.setPadding(left, top, drawable.getPaddingRight(), bottom);
        }
        super.setPadding(left, top, right, bottom);
    }

    @Override // android.widget.TextView, android.view.View
    public void setPaddingRelative(int start, int top, int end, int bottom) {
        PaddingDrawable drawable = getPaddingDrawable();
        if (this.mIsRtl) {
            drawable.setPadding(drawable.getPaddingLeft(), top, start, bottom);
        } else {
            drawable.setPadding(start, top, drawable.getPaddingRight(), bottom);
        }
        super.setPaddingRelative(start, top, end, bottom);
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablePadding(int pad) {
        PaddingDrawable drawable = getPaddingDrawable();
        if (this.mIsRtl) {
            drawable.setPadding(pad, drawable.getPaddingTop(), drawable.getPaddingRight(), drawable.getPaddingBottom());
        } else {
            drawable.setPadding(drawable.getPaddingLeft(), drawable.getPaddingTop(), pad, drawable.getPaddingBottom());
        }
        super.setCompoundDrawablePadding(pad);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public int getCompoundPaddingLeft() {
        if (this.mIsRtl) {
            return getPaddingLeft();
        }
        PaddingDrawable drawable = getPaddingDrawable();
        return drawable.getIntrinsicWidth();
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public int getCompoundPaddingRight() {
        if (!this.mIsRtl) {
            return getPaddingRight();
        }
        PaddingDrawable drawable = getPaddingDrawable();
        return drawable.getIntrinsicWidth();
    }
}
