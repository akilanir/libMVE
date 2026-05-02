package com.rey.material.drawable;

import android.R;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathEffect;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/DividerDrawable.class */
public class DividerDrawable extends Drawable implements Animatable {
    private boolean mRunning;
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private Paint mPaint;
    private ColorStateList mColorStateList;
    private int mHeight;
    private int mPrevColor;
    private int mCurColor;
    private boolean mEnable;
    private PathEffect mPathEffect;
    private Path mPath;
    private boolean mInEditMode;
    private boolean mAnimEnable;
    private int mPaddingLeft;
    private int mPaddingRight;
    private final Runnable mUpdater;

    public DividerDrawable(int height, ColorStateList colorStateList, int animDuration) {
        this(height, 0, 0, colorStateList, animDuration);
    }

    public DividerDrawable(int height, int paddingLeft, int paddingRight, ColorStateList colorStateList, int animDuration) {
        this.mRunning = false;
        this.mEnable = true;
        this.mInEditMode = false;
        this.mAnimEnable = true;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.DividerDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                DividerDrawable.this.update();
            }
        };
        this.mHeight = height;
        this.mPaddingLeft = paddingLeft;
        this.mPaddingRight = paddingRight;
        this.mAnimDuration = animDuration;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeWidth(this.mHeight);
        this.mPaint.setStrokeCap(Paint.Cap.ROUND);
        this.mPaint.setStrokeJoin(Paint.Join.ROUND);
        this.mPath = new Path();
        this.mAnimEnable = false;
        setColor(colorStateList);
        this.mAnimEnable = true;
    }

    public void setDividerHeight(int height) {
        if (this.mHeight != height) {
            this.mHeight = height;
            this.mPaint.setStrokeWidth(this.mHeight);
            invalidateSelf();
        }
    }

    public int getDividerHeight() {
        return this.mHeight;
    }

    public void setPadding(int left, int right) {
        if (this.mPaddingLeft != left || this.mPaddingRight != right) {
            this.mPaddingLeft = left;
            this.mPaddingRight = right;
            invalidateSelf();
        }
    }

    public int getPaddingLeft() {
        return this.mPaddingLeft;
    }

    public int getPaddingRight() {
        return this.mPaddingRight;
    }

    public void setInEditMode(boolean b) {
        this.mInEditMode = b;
    }

    public void setAnimEnable(boolean b) {
        this.mAnimEnable = b;
    }

    public void setColor(ColorStateList colorStateList) {
        this.mColorStateList = colorStateList;
        onStateChange(getState());
    }

    public void setAnimationDuration(int duration) {
        this.mAnimDuration = duration;
    }

    private PathEffect getPathEffect() {
        if (this.mPathEffect == null) {
            this.mPathEffect = new DashPathEffect(new float[]{0.2f, this.mHeight * 2}, 0.0f);
        }
        return this.mPathEffect;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mHeight == 0) {
            return;
        }
        Rect bounds = getBounds();
        float y = bounds.bottom - (this.mHeight / 2);
        if (!isRunning()) {
            this.mPath.reset();
            this.mPath.moveTo(bounds.left + this.mPaddingLeft, y);
            this.mPath.lineTo(bounds.right - this.mPaddingRight, y);
            this.mPaint.setPathEffect(this.mEnable ? null : getPathEffect());
            this.mPaint.setColor(this.mCurColor);
            canvas.drawPath(this.mPath, this.mPaint);
            return;
        }
        float centerX = (((bounds.right + bounds.left) - this.mPaddingRight) + this.mPaddingLeft) / 2.0f;
        float start = (centerX * (1.0f - this.mAnimProgress)) + ((bounds.left + this.mPaddingLeft) * this.mAnimProgress);
        float end = (centerX * (1.0f - this.mAnimProgress)) + ((bounds.right + this.mPaddingRight) * this.mAnimProgress);
        this.mPaint.setPathEffect(null);
        if (this.mAnimProgress < 1.0f) {
            this.mPaint.setColor(this.mPrevColor);
            this.mPath.reset();
            this.mPath.moveTo(bounds.left + this.mPaddingLeft, y);
            this.mPath.lineTo(start, y);
            this.mPath.moveTo(bounds.right - this.mPaddingRight, y);
            this.mPath.lineTo(end, y);
            canvas.drawPath(this.mPath, this.mPaint);
        }
        this.mPaint.setColor(this.mCurColor);
        this.mPath.reset();
        this.mPath.moveTo(start, y);
        this.mPath.lineTo(end, y);
        canvas.drawPath(this.mPath, this.mPaint);
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
        this.mEnable = ViewUtil.hasState(state, R.attr.state_enabled);
        int color = this.mColorStateList.getColorForState(state, this.mCurColor);
        if (this.mCurColor != color) {
            if (!this.mInEditMode && this.mAnimEnable && this.mEnable && this.mAnimDuration > 0) {
                this.mPrevColor = isRunning() ? this.mPrevColor : this.mCurColor;
                this.mCurColor = color;
                start();
                return true;
            }
            this.mPrevColor = color;
            this.mCurColor = color;
            return true;
        }
        if (!isRunning()) {
            this.mPrevColor = color;
            return false;
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
