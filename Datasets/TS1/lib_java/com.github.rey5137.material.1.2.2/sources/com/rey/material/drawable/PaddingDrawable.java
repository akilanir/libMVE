package com.rey.material.drawable;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.support.v4.graphics.drawable.DrawableCompat;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/PaddingDrawable.class */
public class PaddingDrawable extends Drawable implements Drawable.Callback {
    private Drawable mDrawable;
    private int mPaddingLeft;
    private int mPaddingTop;
    private int mPaddingRight;
    private int mPaddingBottom;

    public PaddingDrawable(Drawable drawable) {
        setWrappedDrawable(drawable);
    }

    public void setPadding(int paddingLeft, int paddingTop, int paddingRight, int paddingBottom) {
        this.mPaddingLeft = paddingLeft;
        this.mPaddingTop = paddingTop;
        this.mPaddingRight = paddingRight;
        this.mPaddingBottom = paddingBottom;
    }

    public int getPaddingLeft() {
        return this.mPaddingLeft;
    }

    public int getPaddingTop() {
        return this.mPaddingTop;
    }

    public int getPaddingRight() {
        return this.mPaddingRight;
    }

    public int getPaddingBottom() {
        return this.mPaddingBottom;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mDrawable != null) {
            this.mDrawable.draw(canvas);
        }
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        if (this.mDrawable != null) {
            this.mDrawable.setBounds(bounds.left + this.mPaddingLeft, bounds.top + this.mPaddingTop, bounds.right - this.mPaddingRight, bounds.bottom - this.mPaddingBottom);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setChangingConfigurations(int configs) {
        if (this.mDrawable != null) {
            this.mDrawable.setChangingConfigurations(configs);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getChangingConfigurations() {
        if (this.mDrawable != null) {
            return this.mDrawable.getChangingConfigurations();
        }
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void setDither(boolean dither) {
        if (this.mDrawable != null) {
            this.mDrawable.setDither(dither);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setFilterBitmap(boolean filter) {
        if (this.mDrawable != null) {
            this.mDrawable.setFilterBitmap(filter);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (this.mDrawable != null) {
            this.mDrawable.setAlpha(alpha);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        if (this.mDrawable != null) {
            this.mDrawable.setColorFilter(cf);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.mDrawable != null && this.mDrawable.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setState(int[] stateSet) {
        return this.mDrawable != null && this.mDrawable.setState(stateSet);
    }

    @Override // android.graphics.drawable.Drawable
    public int[] getState() {
        if (this.mDrawable != null) {
            return this.mDrawable.getState();
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public void jumpToCurrentState() {
        if (this.mDrawable != null) {
            DrawableCompat.jumpToCurrentState(this.mDrawable);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable getCurrent() {
        if (this.mDrawable != null) {
            return this.mDrawable.getCurrent();
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setVisible(boolean visible, boolean restart) {
        return super.setVisible(visible, restart) || (this.mDrawable != null && this.mDrawable.setVisible(visible, restart));
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        if (this.mDrawable != null) {
            return this.mDrawable.getOpacity();
        }
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public Region getTransparentRegion() {
        if (this.mDrawable != null) {
            return this.mDrawable.getTransparentRegion();
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return (this.mDrawable != null ? this.mDrawable.getIntrinsicWidth() : 0) + this.mPaddingLeft + this.mPaddingRight;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return (this.mDrawable != null ? this.mDrawable.getIntrinsicHeight() : 0) + this.mPaddingTop + this.mPaddingBottom;
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumWidth() {
        return (this.mDrawable != null ? this.mDrawable.getMinimumWidth() : 0) + this.mPaddingLeft + this.mPaddingRight;
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumHeight() {
        return (this.mDrawable != null ? this.mDrawable.getMinimumHeight() : 0) + this.mPaddingTop + this.mPaddingBottom;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean getPadding(Rect padding) {
        boolean hasPadding = this.mDrawable != null && this.mDrawable.getPadding(padding);
        if (hasPadding) {
            padding.left += this.mPaddingLeft;
            padding.top += this.mPaddingTop;
            padding.right += this.mPaddingRight;
            padding.bottom += this.mPaddingBottom;
        } else {
            padding.set(this.mPaddingLeft, this.mPaddingTop, this.mPaddingRight, this.mPaddingBottom);
            hasPadding = (this.mPaddingLeft == 0 && this.mPaddingTop == 0 && this.mPaddingRight == 0 && this.mPaddingBottom == 0) ? false : true;
        }
        return hasPadding;
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
    protected boolean onLevelChange(int level) {
        return this.mDrawable != null && this.mDrawable.setLevel(level);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAutoMirrored(boolean mirrored) {
        if (this.mDrawable != null) {
            DrawableCompat.setAutoMirrored(this.mDrawable, mirrored);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isAutoMirrored() {
        return this.mDrawable != null && DrawableCompat.isAutoMirrored(this.mDrawable);
    }

    @Override // android.graphics.drawable.Drawable
    public void setTint(int tint) {
        if (this.mDrawable != null) {
            DrawableCompat.setTint(this.mDrawable, tint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintList(ColorStateList tint) {
        if (this.mDrawable != null) {
            DrawableCompat.setTintList(this.mDrawable, tint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setTintMode(PorterDuff.Mode tintMode) {
        if (this.mDrawable != null) {
            DrawableCompat.setTintMode(this.mDrawable, tintMode);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setHotspot(float x, float y) {
        if (this.mDrawable != null) {
            DrawableCompat.setHotspot(this.mDrawable, x, y);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setHotspotBounds(int left, int top, int right, int bottom) {
        if (this.mDrawable != null) {
            DrawableCompat.setHotspotBounds(this.mDrawable, left, top, right, bottom);
        }
    }

    public Drawable getWrappedDrawable() {
        return this.mDrawable;
    }

    public void setWrappedDrawable(Drawable drawable) {
        if (this.mDrawable != null) {
            this.mDrawable.setCallback(null);
        }
        this.mDrawable = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
        }
        onBoundsChange(getBounds());
        invalidateSelf();
    }
}
