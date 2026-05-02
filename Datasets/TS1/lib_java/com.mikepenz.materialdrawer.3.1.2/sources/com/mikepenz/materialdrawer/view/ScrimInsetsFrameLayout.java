package com.mikepenz.materialdrawer.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.mikepenz.materialdrawer.R;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout.class */
public class ScrimInsetsFrameLayout extends FrameLayout {
    private Drawable mInsetForeground;
    private Rect mInsets;
    private Rect mTempRect;
    private OnInsetsCallback mOnInsetsCallback;
    private boolean mEnabled;

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback.class */
    public interface OnInsetsCallback {
        void onInsetsChanged(Rect rect);
    }

    public ScrimInsetsFrameLayout(Context context) {
        super(context);
        this.mTempRect = new Rect();
        this.mEnabled = true;
        init(context, null, 0);
    }

    public ScrimInsetsFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTempRect = new Rect();
        this.mEnabled = true;
        init(context, attrs, 0);
    }

    public ScrimInsetsFrameLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mTempRect = new Rect();
        this.mEnabled = true;
        init(context, attrs, defStyle);
    }

    private void init(Context context, AttributeSet attrs, int defStyle) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ScrimInsetsView, defStyle, 0);
        if (a == null) {
            return;
        }
        this.mInsetForeground = a.getDrawable(R.styleable.ScrimInsetsView_siv_insetForeground);
        a.recycle();
        setWillNotDraw(true);
    }

    @Override // android.view.View
    protected boolean fitSystemWindows(Rect insets) {
        this.mInsets = new Rect(insets);
        setWillNotDraw(this.mInsetForeground == null);
        ViewCompat.postInvalidateOnAnimation(this);
        if (this.mOnInsetsCallback != null) {
            this.mOnInsetsCallback.onInsetsChanged(insets);
            return true;
        }
        return true;
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        int width = getWidth();
        int height = getHeight();
        if (this.mInsets != null && this.mInsetForeground != null) {
            int sc = canvas.save();
            canvas.translate(getScrollX(), getScrollY());
            this.mTempRect.set(0, 0, width, this.mInsets.top);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(0, height - this.mInsets.bottom, width, height);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(0, this.mInsets.top, this.mInsets.left, height - this.mInsets.bottom);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            this.mTempRect.set(width - this.mInsets.right, this.mInsets.top, width, height - this.mInsets.bottom);
            this.mInsetForeground.setBounds(this.mTempRect);
            this.mInsetForeground.draw(canvas);
            canvas.restoreToCount(sc);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mInsetForeground != null) {
            this.mInsetForeground.setCallback(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mInsetForeground != null) {
            this.mInsetForeground.setCallback(null);
        }
    }

    @Override // android.view.View
    public boolean isEnabled() {
        return this.mEnabled;
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        this.mEnabled = enabled;
        invalidate();
    }

    public Drawable getInsetForeground() {
        return this.mInsetForeground;
    }

    public void setInsetForeground(Drawable mInsetForeground) {
        this.mInsetForeground = mInsetForeground;
    }

    public void setInsetForeground(int mInsetForegroundColor) {
        this.mInsetForeground = new ColorDrawable(mInsetForegroundColor);
    }

    public void setOnInsetsCallback(OnInsetsCallback onInsetsCallback) {
        this.mOnInsetsCallback = onInsetsCallback;
    }
}
