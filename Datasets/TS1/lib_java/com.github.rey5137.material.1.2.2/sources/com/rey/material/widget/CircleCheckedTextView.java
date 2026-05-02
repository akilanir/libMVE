package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.animation.Interpolator;
import com.rey.material.BuildConfig;
import com.rey.material.drawable.CircleDrawable;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/CircleCheckedTextView.class */
public class CircleCheckedTextView extends android.widget.CheckedTextView {
    private CircleDrawable mBackground;
    private OnCheckedChangeListener mCheckedChangeListener;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener.class */
    public interface OnCheckedChangeListener {
        void onCheckedChanged(CircleCheckedTextView circleCheckedTextView, boolean z);
    }

    public CircleCheckedTextView(Context context) {
        super(context);
        init(context, null, 0, 0);
    }

    public CircleCheckedTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs, 0, 0);
    }

    public CircleCheckedTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public CircleCheckedTextView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        setGravity(17);
        setPadding(0, 0, 0, 0);
        this.mBackground = new CircleDrawable();
        this.mBackground.setInEditMode(isInEditMode());
        this.mBackground.setAnimEnable(false);
        ViewUtil.setBackground(this, this.mBackground);
        this.mBackground.setAnimEnable(true);
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener listener) {
        this.mCheckedChangeListener = listener;
    }

    @Override // android.widget.TextView
    public void setTextAppearance(int resId) {
        ViewUtil.applyTextAppearance(this, resId);
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int resId) {
        ViewUtil.applyTextAppearance(this, resId);
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.mBackground.setColor(color);
    }

    public void setAnimDuration(int duration) {
        this.mBackground.setAnimDuration(duration);
    }

    public void setInterpolator(Interpolator in, Interpolator out) {
        this.mBackground.setInterpolator(in, out);
    }

    @Override // android.widget.CheckedTextView, android.widget.Checkable
    public void setChecked(boolean checked) {
        boolean oldCheck = isChecked();
        if (oldCheck != checked) {
            super.setChecked(checked);
            if (this.mCheckedChangeListener != null) {
                this.mCheckedChangeListener.onCheckedChanged(this, checked);
            }
        }
    }

    public void setCheckedImmediately(boolean checked) {
        this.mBackground.setAnimEnable(false);
        setChecked(checked);
        this.mBackground.setAnimEnable(true);
    }
}
