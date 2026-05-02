package com.rey.material.drawable;

import android.R;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/CircleDrawable.class */
public class CircleDrawable extends Drawable implements Animatable {
    private long mStartTime;
    private float mAnimProgress;
    private float mX;
    private float mY;
    private float mRadius;
    private boolean mVisible;
    private boolean mRunning = false;
    private int mAnimDuration = 1000;
    private Interpolator mInInterpolator = new DecelerateInterpolator();
    private Interpolator mOutInterpolator = new DecelerateInterpolator();
    private boolean mInEditMode = false;
    private boolean mAnimEnable = true;
    private final Runnable mUpdater = new Runnable() { // from class: com.rey.material.drawable.CircleDrawable.1
        @Override // java.lang.Runnable
        public void run() {
            CircleDrawable.this.update();
        }
    };
    private Paint mPaint = new Paint(1);

    public CircleDrawable() {
        this.mPaint.setStyle(Paint.Style.FILL);
    }

    public void setInEditMode(boolean b) {
        this.mInEditMode = b;
    }

    public void setAnimEnable(boolean b) {
        this.mAnimEnable = b;
    }

    public void setColor(int color) {
        this.mPaint.setColor(color);
        invalidateSelf();
    }

    public void setAnimDuration(int duration) {
        this.mAnimDuration = duration;
    }

    public void setInterpolator(Interpolator in, Interpolator out) {
        this.mInInterpolator = in;
        this.mOutInterpolator = out;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        boolean visible = ViewUtil.hasState(state, R.attr.state_checked) || ViewUtil.hasState(state, R.attr.state_pressed);
        if (this.mVisible != visible) {
            this.mVisible = visible;
            if (!this.mInEditMode && this.mAnimEnable) {
                start();
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.mX = bounds.exactCenterX();
        this.mY = bounds.exactCenterY();
        this.mRadius = Math.min(bounds.width(), bounds.height()) / 2.0f;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (!this.mRunning) {
            if (this.mVisible) {
                canvas.drawCircle(this.mX, this.mY, this.mRadius, this.mPaint);
            }
        } else {
            float radius = this.mVisible ? this.mInInterpolator.getInterpolation(this.mAnimProgress) * this.mRadius : (1.0f - this.mOutInterpolator.getInterpolation(this.mAnimProgress)) * this.mRadius;
            canvas.drawCircle(this.mX, this.mY, radius, this.mPaint);
        }
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
