package com.rey.material.drawable;

import android.R;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/OvalShadowDrawable.class */
public class OvalShadowDrawable extends Drawable implements Animatable {
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private Paint mShadowPaint;
    private Paint mGlowPaint;
    private int mRadius;
    private float mShadowSize;
    private float mShadowOffset;
    private Path mShadowPath;
    private Path mGlowPath;
    private ColorStateList mColorStateList;
    private int mPrevColor;
    private int mCurColor;
    private static final int COLOR_SHADOW_START = 1275068416;
    private static final int COLOR_SHADOW_END = 0;
    private boolean mRunning = false;
    private boolean mEnable = true;
    private boolean mInEditMode = false;
    private boolean mAnimEnable = true;
    private RectF mTempRect = new RectF();
    private boolean mNeedBuildShadow = true;
    private final Runnable mUpdater = new Runnable() { // from class: com.rey.material.drawable.OvalShadowDrawable.1
        @Override // java.lang.Runnable
        public void run() {
            OvalShadowDrawable.this.update();
        }
    };
    private Paint mPaint = new Paint(5);

    public OvalShadowDrawable(int radius, ColorStateList colorStateList, float shadowSize, float shadowOffset, int animDuration) {
        this.mAnimDuration = animDuration;
        this.mPaint.setStyle(Paint.Style.FILL);
        setColor(colorStateList);
        setRadius(radius);
        setShadow(shadowSize, shadowOffset);
    }

    public boolean setRadius(int radius) {
        if (this.mRadius != radius) {
            this.mRadius = radius;
            this.mNeedBuildShadow = true;
            invalidateSelf();
            return true;
        }
        return false;
    }

    public boolean setShadow(float size, float offset) {
        if (this.mShadowSize != size || this.mShadowOffset != offset) {
            this.mShadowSize = size;
            this.mShadowOffset = offset;
            this.mNeedBuildShadow = true;
            invalidateSelf();
            return true;
        }
        return false;
    }

    public boolean setAnimationDuration(int duration) {
        if (this.mAnimDuration != duration) {
            this.mAnimDuration = duration;
            return true;
        }
        return false;
    }

    public void setColor(ColorStateList colorStateList) {
        this.mColorStateList = colorStateList;
        onStateChange(getState());
    }

    public void setColor(int color) {
        this.mColorStateList = ColorStateList.valueOf(color);
        onStateChange(getState());
    }

    public ColorStateList getColor() {
        return this.mColorStateList;
    }

    public void setInEditMode(boolean b) {
        this.mInEditMode = b;
    }

    public void setAnimEnable(boolean b) {
        this.mAnimEnable = b;
    }

    public int getRadius() {
        return this.mRadius;
    }

    public float getShadowSize() {
        return this.mShadowSize;
    }

    public float getShadowOffset() {
        return this.mShadowOffset;
    }

    public float getPaddingLeft() {
        return this.mShadowSize;
    }

    public float getPaddingTop() {
        return this.mShadowSize;
    }

    public float getPaddingRight() {
        return this.mShadowSize;
    }

    public float getPaddingBottom() {
        return this.mShadowSize + this.mShadowOffset;
    }

    public float getCenterX() {
        return this.mRadius + this.mShadowSize;
    }

    public float getCenterY() {
        return this.mRadius + this.mShadowSize;
    }

    public boolean isPointerOver(float x, float y) {
        float distance = (float) Math.sqrt(Math.pow(x - getCenterX(), 2.0d) + Math.pow(y - getCenterY(), 2.0d));
        return distance < ((float) this.mRadius);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return (int) (((this.mRadius + this.mShadowSize) * 2.0f) + 0.5f);
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return (int) (((this.mRadius + this.mShadowSize) * 2.0f) + this.mShadowOffset + 0.5f);
    }

    private void buildShadow() {
        if (this.mShadowSize <= 0.0f) {
            return;
        }
        if (this.mShadowPaint == null) {
            this.mShadowPaint = new Paint(5);
            this.mShadowPaint.setStyle(Paint.Style.FILL);
            this.mShadowPaint.setDither(true);
        }
        float startRatio = this.mRadius / ((this.mRadius + this.mShadowSize) + this.mShadowOffset);
        this.mShadowPaint.setShader(new RadialGradient(0.0f, 0.0f, this.mRadius + this.mShadowSize, new int[]{COLOR_SHADOW_START, COLOR_SHADOW_START, 0}, new float[]{0.0f, startRatio, 1.0f}, Shader.TileMode.CLAMP));
        if (this.mShadowPath == null) {
            this.mShadowPath = new Path();
            this.mShadowPath.setFillType(Path.FillType.EVEN_ODD);
        } else {
            this.mShadowPath.reset();
        }
        float radius = this.mRadius + this.mShadowSize;
        this.mTempRect.set(-radius, -radius, radius, radius);
        this.mShadowPath.addOval(this.mTempRect, Path.Direction.CW);
        float radius2 = this.mRadius - 1;
        this.mTempRect.set(-radius2, (-radius2) - this.mShadowOffset, radius2, radius2 - this.mShadowOffset);
        this.mShadowPath.addOval(this.mTempRect, Path.Direction.CW);
        if (this.mGlowPaint == null) {
            this.mGlowPaint = new Paint(5);
            this.mGlowPaint.setStyle(Paint.Style.FILL);
            this.mGlowPaint.setDither(true);
        }
        float startRatio2 = (this.mRadius - (this.mShadowSize / 2.0f)) / (this.mRadius + (this.mShadowSize / 2.0f));
        this.mGlowPaint.setShader(new RadialGradient(0.0f, 0.0f, this.mRadius + (this.mShadowSize / 2.0f), new int[]{COLOR_SHADOW_START, COLOR_SHADOW_START, 0}, new float[]{0.0f, startRatio2, 1.0f}, Shader.TileMode.CLAMP));
        if (this.mGlowPath == null) {
            this.mGlowPath = new Path();
            this.mGlowPath.setFillType(Path.FillType.EVEN_ODD);
        } else {
            this.mGlowPath.reset();
        }
        float radius3 = this.mRadius + (this.mShadowSize / 2.0f);
        this.mTempRect.set(-radius3, -radius3, radius3, radius3);
        this.mGlowPath.addOval(this.mTempRect, Path.Direction.CW);
        float radius4 = this.mRadius - 1;
        this.mTempRect.set(-radius4, -radius4, radius4, radius4);
        this.mGlowPath.addOval(this.mTempRect, Path.Direction.CW);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mNeedBuildShadow) {
            buildShadow();
            this.mNeedBuildShadow = false;
        }
        if (this.mShadowSize > 0.0f) {
            int saveCount = canvas.save();
            canvas.translate(this.mShadowSize + this.mRadius, this.mShadowSize + this.mRadius + this.mShadowOffset);
            canvas.drawPath(this.mShadowPath, this.mShadowPaint);
            canvas.restoreToCount(saveCount);
        }
        int saveCount2 = canvas.save();
        canvas.translate(this.mShadowSize + this.mRadius, this.mShadowSize + this.mRadius);
        if (this.mShadowSize > 0.0f) {
            canvas.drawPath(this.mGlowPath, this.mGlowPaint);
        }
        this.mTempRect.set(-this.mRadius, -this.mRadius, this.mRadius, this.mRadius);
        if (!isRunning()) {
            this.mPaint.setColor(this.mCurColor);
        } else {
            this.mPaint.setColor(ColorUtil.getMiddleColor(this.mPrevColor, this.mCurColor, this.mAnimProgress));
        }
        canvas.drawOval(this.mTempRect, this.mPaint);
        canvas.restoreToCount(saveCount2);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mShadowPaint.setAlpha(alpha);
        this.mPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mShadowPaint.setColorFilter(cf);
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
            invalidateSelf();
            return true;
        }
        if (!isRunning()) {
            this.mPrevColor = color;
            return false;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public void jumpToCurrentState() {
        super.jumpToCurrentState();
        stop();
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
