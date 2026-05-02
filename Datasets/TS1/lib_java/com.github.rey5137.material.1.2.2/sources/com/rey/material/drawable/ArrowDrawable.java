package com.rey.material.drawable;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/ArrowDrawable.class */
public class ArrowDrawable extends Drawable implements Animatable {
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private Paint mPaint;
    private ColorStateList mColorStateList;
    private int mSize;
    private int mCurColor;
    private int mMode;
    private Interpolator mInterpolator;
    private Path mPath;
    public static int MODE_DOWN = 0;
    public static int MODE_UP = 1;
    private boolean mClockwise;
    private boolean mRunning = false;
    private final Runnable mUpdater = new Runnable() { // from class: com.rey.material.drawable.ArrowDrawable.1
        @Override // java.lang.Runnable
        public void run() {
            ArrowDrawable.this.update();
        }
    };

    public ArrowDrawable(int mode, int size, ColorStateList colorStateList, int animDuration, Interpolator interpolator, boolean clockwise) {
        this.mClockwise = true;
        this.mSize = size;
        this.mAnimDuration = animDuration;
        this.mMode = mode;
        this.mInterpolator = interpolator;
        if (this.mInterpolator == null) {
            this.mInterpolator = new DecelerateInterpolator();
        }
        this.mClockwise = clockwise;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPath = new Path();
        setColor(colorStateList);
    }

    public void setColor(ColorStateList colorStateList) {
        this.mColorStateList = colorStateList;
        onStateChange(getState());
    }

    public void setAnimationDuration(int duration) {
        this.mAnimDuration = duration;
    }

    public void setInterpolator(Interpolator interpolator) {
        this.mInterpolator = interpolator;
    }

    public void setClockwise(boolean clockwise) {
        this.mClockwise = clockwise;
    }

    public void setArrowSize(int size) {
        if (this.mSize != size) {
            this.mSize = size;
            invalidateSelf();
        }
    }

    public void setMode(int mode, boolean animation) {
        if (this.mMode != mode) {
            this.mMode = mode;
            if (animation && this.mAnimDuration > 0) {
                start();
            } else {
                invalidateSelf();
            }
        }
    }

    public int getMode() {
        return this.mMode;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        float x = bounds.exactCenterX();
        float y = bounds.exactCenterY();
        this.mPath.reset();
        this.mPath.moveTo(x, y + (this.mSize / 2.0f));
        this.mPath.lineTo(x - this.mSize, y - (this.mSize / 2.0f));
        this.mPath.lineTo(x + this.mSize, y - (this.mSize / 2.0f));
        this.mPath.close();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        float degree;
        int saveCount = canvas.save();
        Rect bounds = getBounds();
        if (!isRunning()) {
            if (this.mMode == MODE_UP) {
                canvas.rotate(180.0f, bounds.exactCenterX(), bounds.exactCenterY());
            }
        } else {
            float value = this.mInterpolator.getInterpolation(this.mAnimProgress);
            if (this.mClockwise) {
                if (this.mMode == MODE_UP) {
                    degree = 180.0f * value;
                } else {
                    degree = 180.0f * (1.0f + value);
                }
            } else if (this.mMode == MODE_UP) {
                degree = (-180.0f) * value;
            } else {
                degree = (-180.0f) * (1.0f + value);
            }
            canvas.rotate(degree, bounds.exactCenterX(), bounds.exactCenterY());
        }
        this.mPaint.setColor(this.mCurColor);
        canvas.drawPath(this.mPath, this.mPaint);
        canvas.restoreToCount(saveCount);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        int color = this.mColorStateList.getColorForState(state, this.mCurColor);
        if (this.mCurColor != color) {
            this.mCurColor = color;
            return true;
        }
        return false;
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
        this.mAnimProgress = 0.0f;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        resetAnimation();
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        this.mRunning = false;
        unscheduleSelf(this.mUpdater);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunning;
    }

    @Override // android.graphics.drawable.Drawable
    public void scheduleSelf(Runnable what, long when) {
        this.mRunning = true;
        super.scheduleSelf(what, when);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        long curTime = SystemClock.uptimeMillis();
        this.mAnimProgress = Math.min(1.0f, (curTime - this.mStartTime) / this.mAnimDuration);
        if (this.mAnimProgress == 1.0f) {
            this.mRunning = false;
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidateSelf();
    }
}
