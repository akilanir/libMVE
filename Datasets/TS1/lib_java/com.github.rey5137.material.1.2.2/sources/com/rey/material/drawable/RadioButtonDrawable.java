package com.rey.material.drawable;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/RadioButtonDrawable.class */
public class RadioButtonDrawable extends Drawable implements Animatable {
    private boolean mRunning;
    private Paint mPaint;
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private int mStrokeSize;
    private int mWidth;
    private int mHeight;
    private int mRadius;
    private int mInnerRadius;
    private int mPrevColor;
    private int mCurColor;
    private ColorStateList mStrokeColor;
    private boolean mChecked;
    private boolean mInEditMode;
    private boolean mAnimEnable;
    private final Runnable mUpdater;

    private RadioButtonDrawable(int width, int height, int strokeSize, ColorStateList strokeColor, int radius, int innerRadius, int animDuration) {
        this.mRunning = false;
        this.mChecked = false;
        this.mInEditMode = false;
        this.mAnimEnable = true;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.RadioButtonDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                RadioButtonDrawable.this.update();
            }
        };
        this.mAnimDuration = animDuration;
        this.mStrokeSize = strokeSize;
        this.mWidth = width;
        this.mHeight = height;
        this.mRadius = radius;
        this.mInnerRadius = innerRadius;
        this.mStrokeColor = strokeColor;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
    }

    public void setInEditMode(boolean b) {
        this.mInEditMode = b;
    }

    public void setAnimEnable(boolean b) {
        this.mAnimEnable = b;
    }

    public boolean isAnimEnable() {
        return this.mAnimEnable;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.mWidth;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.mHeight;
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumWidth() {
        return this.mWidth;
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumHeight() {
        return this.mHeight;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mChecked) {
            drawChecked(canvas);
        } else {
            drawUnchecked(canvas);
        }
    }

    private void drawChecked(Canvas canvas) {
        float cx = getBounds().exactCenterX();
        float cy = getBounds().exactCenterY();
        if (isRunning()) {
            float halfStrokeSize = this.mStrokeSize / 2.0f;
            float inTime = (this.mRadius - halfStrokeSize) / ((((this.mRadius - halfStrokeSize) + this.mRadius) - this.mStrokeSize) - this.mInnerRadius);
            if (this.mAnimProgress < inTime) {
                float inProgress = this.mAnimProgress / inTime;
                float outerRadius = this.mRadius + (halfStrokeSize * (1.0f - inProgress));
                float innerRadius = (this.mRadius - halfStrokeSize) * (1.0f - inProgress);
                this.mPaint.setColor(ColorUtil.getMiddleColor(this.mPrevColor, this.mCurColor, inProgress));
                this.mPaint.setStrokeWidth(outerRadius - innerRadius);
                this.mPaint.setStyle(Paint.Style.STROKE);
                canvas.drawCircle(cx, cy, (outerRadius + innerRadius) / 2.0f, this.mPaint);
                return;
            }
            float outProgress = (this.mAnimProgress - inTime) / (1.0f - inTime);
            this.mPaint.setColor(this.mCurColor);
            this.mPaint.setStyle(Paint.Style.FILL);
            canvas.drawCircle(cx, cy, ((this.mRadius - this.mStrokeSize) * (1.0f - outProgress)) + (this.mInnerRadius * outProgress), this.mPaint);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(cx, cy, (this.mRadius + (halfStrokeSize * outProgress)) - halfStrokeSize, this.mPaint);
            return;
        }
        this.mPaint.setColor(this.mCurColor);
        this.mPaint.setStrokeWidth(this.mStrokeSize);
        this.mPaint.setStyle(Paint.Style.STROKE);
        canvas.drawCircle(cx, cy, this.mRadius, this.mPaint);
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(cx, cy, this.mInnerRadius, this.mPaint);
    }

    private void drawUnchecked(Canvas canvas) {
        float cx = getBounds().exactCenterX();
        float cy = getBounds().exactCenterY();
        if (isRunning()) {
            float halfStrokeSize = this.mStrokeSize / 2.0f;
            float inTime = ((this.mRadius - this.mStrokeSize) - this.mInnerRadius) / ((((this.mRadius - halfStrokeSize) + this.mRadius) - this.mStrokeSize) - this.mInnerRadius);
            if (this.mAnimProgress < inTime) {
                float inProgress = this.mAnimProgress / inTime;
                this.mPaint.setColor(ColorUtil.getMiddleColor(this.mPrevColor, this.mCurColor, inProgress));
                this.mPaint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx, cy, ((this.mRadius - this.mStrokeSize) * inProgress) + (this.mInnerRadius * (1.0f - inProgress)), this.mPaint);
                this.mPaint.setStrokeWidth(this.mStrokeSize);
                this.mPaint.setStyle(Paint.Style.STROKE);
                canvas.drawCircle(cx, cy, (this.mRadius + (halfStrokeSize * (1.0f - inProgress))) - halfStrokeSize, this.mPaint);
                return;
            }
            float outProgress = (this.mAnimProgress - inTime) / (1.0f - inTime);
            float outerRadius = this.mRadius + (halfStrokeSize * outProgress);
            float innerRadius = (this.mRadius - halfStrokeSize) * outProgress;
            this.mPaint.setColor(this.mCurColor);
            this.mPaint.setStrokeWidth(outerRadius - innerRadius);
            this.mPaint.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(cx, cy, (outerRadius + innerRadius) / 2.0f, this.mPaint);
            return;
        }
        this.mPaint.setColor(this.mCurColor);
        this.mPaint.setStrokeWidth(this.mStrokeSize);
        this.mPaint.setStyle(Paint.Style.STROKE);
        canvas.drawCircle(cx, cy, this.mRadius, this.mPaint);
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        boolean checked = ViewUtil.hasState(state, R.attr.state_checked);
        int color = this.mStrokeColor.getColorForState(state, this.mCurColor);
        boolean needRedraw = false;
        if (this.mChecked != checked) {
            this.mChecked = checked;
            needRedraw = true;
            if (!this.mInEditMode && this.mAnimEnable) {
                start();
            }
        }
        if (this.mCurColor != color) {
            this.mPrevColor = isRunning() ? this.mCurColor : color;
            this.mCurColor = color;
            needRedraw = true;
        } else if (!isRunning()) {
            this.mPrevColor = color;
        }
        return needRedraw;
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

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/RadioButtonDrawable$Builder.class */
    public static class Builder {
        private int mAnimDuration;
        private int mStrokeSize;
        private int mWidth;
        private int mHeight;
        private int mRadius;
        private int mInnerRadius;
        private ColorStateList mStrokeColor;

        public Builder() {
            this.mAnimDuration = 400;
            this.mStrokeSize = 4;
            this.mWidth = 64;
            this.mHeight = 64;
            this.mRadius = 18;
            this.mInnerRadius = 10;
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        /* JADX WARN: Type inference failed for: r0v27, types: [int[], int[][]] */
        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            this.mAnimDuration = 400;
            this.mStrokeSize = 4;
            this.mWidth = 64;
            this.mHeight = 64;
            this.mRadius = 18;
            this.mInnerRadius = 10;
            TypedArray a = context.obtainStyledAttributes(attrs, com.rey.material.R.styleable.RadioButtonDrawable, defStyleAttr, defStyleRes);
            width(a.getDimensionPixelSize(com.rey.material.R.styleable.RadioButtonDrawable_rbd_width, ThemeUtil.dpToPx(context, 32)));
            height(a.getDimensionPixelSize(com.rey.material.R.styleable.RadioButtonDrawable_rbd_height, ThemeUtil.dpToPx(context, 32)));
            strokeSize(a.getDimensionPixelSize(com.rey.material.R.styleable.RadioButtonDrawable_rbd_strokeSize, ThemeUtil.dpToPx(context, 2)));
            radius(a.getDimensionPixelSize(com.rey.material.R.styleable.RadioButtonDrawable_rbd_radius, ThemeUtil.dpToPx(context, 10)));
            innerRadius(a.getDimensionPixelSize(com.rey.material.R.styleable.RadioButtonDrawable_rbd_innerRadius, ThemeUtil.dpToPx(context, 5)));
            strokeColor(a.getColorStateList(com.rey.material.R.styleable.RadioButtonDrawable_rbd_strokeColor));
            animDuration(a.getInt(com.rey.material.R.styleable.RadioButtonDrawable_rbd_animDuration, context.getResources().getInteger(R.integer.config_mediumAnimTime)));
            a.recycle();
            if (this.mStrokeColor == null) {
                ?? r0 = {new int[]{-16842912}, new int[]{R.attr.state_checked}};
                int[] colors = {ThemeUtil.colorControlNormal(context, -16777216), ThemeUtil.colorControlActivated(context, -16777216)};
                strokeColor(new ColorStateList(r0, colors));
            }
        }

        public RadioButtonDrawable build() {
            if (this.mStrokeColor == null) {
                this.mStrokeColor = ColorStateList.valueOf(-16777216);
            }
            return new RadioButtonDrawable(this.mWidth, this.mHeight, this.mStrokeSize, this.mStrokeColor, this.mRadius, this.mInnerRadius, this.mAnimDuration);
        }

        public Builder width(int width) {
            this.mWidth = width;
            return this;
        }

        public Builder height(int height) {
            this.mHeight = height;
            return this;
        }

        public Builder strokeSize(int size) {
            this.mStrokeSize = size;
            return this;
        }

        public Builder strokeColor(int color) {
            this.mStrokeColor = ColorStateList.valueOf(color);
            return this;
        }

        public Builder strokeColor(ColorStateList color) {
            this.mStrokeColor = color;
            return this;
        }

        public Builder radius(int radius) {
            this.mRadius = radius;
            return this;
        }

        public Builder innerRadius(int radius) {
            this.mInnerRadius = radius;
            return this;
        }

        public Builder animDuration(int duration) {
            this.mAnimDuration = duration;
            return this;
        }
    }
}
