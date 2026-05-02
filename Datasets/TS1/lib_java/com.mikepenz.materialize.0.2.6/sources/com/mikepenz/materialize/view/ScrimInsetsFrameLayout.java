package com.mikepenz.materialize.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.mikepenz.materialize.R;

/* loaded from: com.mikepenz.materialize.0.2.6.jar:com/mikepenz/materialize/view/ScrimInsetsFrameLayout.class */
public class ScrimInsetsFrameLayout extends FrameLayout implements IScrimInsetsLayout {
    private Drawable mInsetForeground;
    private Rect mInsets;
    private Rect mTempRect;
    private OnInsetsCallback mOnInsetsCallback;
    private boolean mTintStatusBar;
    private boolean mTintNavigationBar;
    private boolean mSystemUIVisible;

    public ScrimInsetsFrameLayout(Context context) {
        super(context);
        this.mTempRect = new Rect();
        this.mTintStatusBar = true;
        this.mTintNavigationBar = true;
        this.mSystemUIVisible = true;
        init(context, null, 0);
    }

    public ScrimInsetsFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTempRect = new Rect();
        this.mTintStatusBar = true;
        this.mTintNavigationBar = true;
        this.mSystemUIVisible = true;
        init(context, attrs, 0);
    }

    public ScrimInsetsFrameLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mTempRect = new Rect();
        this.mTintStatusBar = true;
        this.mTintNavigationBar = true;
        this.mSystemUIVisible = true;
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
            if (!this.mSystemUIVisible) {
                this.mInsets.top = 0;
                this.mInsets.right = 0;
                this.mInsets.bottom = 0;
                this.mInsets.left = 0;
            }
            if (this.mTintStatusBar) {
                this.mTempRect.set(0, 0, width, this.mInsets.top);
                this.mInsetForeground.setBounds(this.mTempRect);
                this.mInsetForeground.draw(canvas);
            }
            if (this.mTintNavigationBar) {
                this.mTempRect.set(0, height - this.mInsets.bottom, width, height);
                this.mInsetForeground.setBounds(this.mTempRect);
                this.mInsetForeground.draw(canvas);
            }
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

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public ViewGroup getView() {
        return this;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public Drawable getInsetForeground() {
        return this.mInsetForeground;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setInsetForeground(Drawable mInsetForeground) {
        this.mInsetForeground = mInsetForeground;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setInsetForeground(int mInsetForegroundColor) {
        this.mInsetForeground = new ColorDrawable(mInsetForegroundColor);
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public boolean isTintStatusBar() {
        return this.mTintStatusBar;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setTintStatusBar(boolean mTintStatusBar) {
        this.mTintStatusBar = mTintStatusBar;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public boolean isTintNavigationBar() {
        return this.mTintNavigationBar;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setTintNavigationBar(boolean mTintNavigationBar) {
        this.mTintNavigationBar = mTintNavigationBar;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public boolean isSystemUIVisible() {
        return this.mSystemUIVisible;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setSystemUIVisible(boolean systemUIVisible) {
        this.mSystemUIVisible = systemUIVisible;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public void setOnInsetsCallback(OnInsetsCallback onInsetsCallback) {
        this.mOnInsetsCallback = onInsetsCallback;
    }

    @Override // com.mikepenz.materialize.view.IScrimInsetsLayout
    public OnInsetsCallback getOnInsetsCallback() {
        return this.mOnInsetsCallback;
    }
}
