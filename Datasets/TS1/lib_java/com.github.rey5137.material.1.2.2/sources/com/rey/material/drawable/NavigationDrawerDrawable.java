package com.rey.material.drawable;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import com.rey.material.R;
import com.rey.material.drawable.LineMorphingDrawable;
import com.rey.material.drawable.ToolbarRippleDrawable;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/NavigationDrawerDrawable.class */
public class NavigationDrawerDrawable extends Drawable implements Drawable.Callback {
    private ToolbarRippleDrawable mRippleDrawable;
    private LineMorphingDrawable mLineDrawable;
    public static final int STATE_DRAWER = 0;
    public static final int STATE_ARROW = 1;

    public NavigationDrawerDrawable(ToolbarRippleDrawable rippleDrawable, LineMorphingDrawable lineDrawable) {
        this.mRippleDrawable = rippleDrawable;
        this.mLineDrawable = lineDrawable;
        this.mRippleDrawable.setCallback(this);
        this.mLineDrawable.setCallback(this);
    }

    public void switchIconState(int state, boolean animation) {
        this.mLineDrawable.switchLineState(state, animation);
    }

    public int getIconState() {
        return this.mLineDrawable.getLineState();
    }

    public boolean setIconState(int state, float progress) {
        return this.mLineDrawable.setLineState(state, progress);
    }

    public float getIconAnimProgress() {
        return this.mLineDrawable.getAnimProgress();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.mRippleDrawable.draw(canvas);
        this.mLineDrawable.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mRippleDrawable.setAlpha(alpha);
        this.mLineDrawable.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mRippleDrawable.setColorFilter(cf);
        this.mLineDrawable.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int left, int top, int right, int bottom) {
        this.mRippleDrawable.setBounds(left, top, right, bottom);
        this.mLineDrawable.setBounds(left, top, right, bottom);
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        this.mRippleDrawable.setDither(dither);
        this.mLineDrawable.setDither(dither);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        scheduleSelf(what, when);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        unscheduleSelf(what);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        return this.mRippleDrawable.onStateChange(state);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/NavigationDrawerDrawable$Builder.class */
    public static class Builder {
        private ToolbarRippleDrawable mRippleDrawable;
        private LineMorphingDrawable mLineDrawable;

        public Builder() {
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.NavigationDrawerDrawable, defStyleAttr, defStyleRes);
            if (a != null) {
                int rippleId = a.getResourceId(R.styleable.NavigationDrawerDrawable_nd_ripple, 0);
                int lineId = a.getResourceId(R.styleable.NavigationDrawerDrawable_nd_icon, 0);
                if (rippleId > 0) {
                    ripple(new ToolbarRippleDrawable.Builder(context, rippleId).build());
                }
                if (lineId > 0) {
                    LineMorphingDrawable.Builder builder = new LineMorphingDrawable.Builder(context, lineId);
                    line(builder.build());
                }
                a.recycle();
            }
        }

        public NavigationDrawerDrawable build() {
            return new NavigationDrawerDrawable(this.mRippleDrawable, this.mLineDrawable);
        }

        public Builder ripple(ToolbarRippleDrawable drawable) {
            this.mRippleDrawable = drawable;
            return this;
        }

        public Builder line(LineMorphingDrawable drawable) {
            this.mLineDrawable = drawable;
            return this;
        }
    }
}
