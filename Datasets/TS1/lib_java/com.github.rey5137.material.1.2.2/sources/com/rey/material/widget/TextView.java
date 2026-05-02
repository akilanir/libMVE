package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.rey.material.BuildConfig;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TextView.class */
public class TextView extends android.widget.TextView implements ThemeManager.OnThemeChangedListener {
    private RippleManager mRippleManager;
    protected int mStyleId;
    protected int mCurrentStyle;
    private OnSelectionChangedListener mOnSelectionChangedListener;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TextView$OnSelectionChangedListener.class */
    public interface OnSelectionChangedListener {
        void onSelectionChanged(View view, int i, int i2);
    }

    public TextView(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, null, 0, 0);
    }

    public TextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, 0, 0);
    }

    public TextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public TextView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
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

    public void setOnSelectionChangedListener(OnSelectionChangedListener listener) {
        this.mOnSelectionChangedListener = listener;
    }

    @Override // android.widget.TextView
    protected void onSelectionChanged(int selStart, int selEnd) {
        super.onSelectionChanged(selStart, selEnd);
        if (this.mOnSelectionChangedListener != null) {
            this.mOnSelectionChangedListener.onSelectionChanged(this, selStart, selEnd);
        }
    }
}
