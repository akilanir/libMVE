package com.rey.material.drawable;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/CheckBoxDrawable.class */
public class CheckBoxDrawable extends Drawable implements Animatable {
    private boolean mRunning;
    private Paint mPaint;
    private long mStartTime;
    private float mAnimProgress;
    private int mAnimDuration;
    private int mStrokeSize;
    private int mWidth;
    private int mHeight;
    private int mCornerRadius;
    private int mBoxSize;
    private int mTickColor;
    private int mPrevColor;
    private int mCurColor;
    private ColorStateList mStrokeColor;
    private RectF mBoxRect;
    private Path mTickPath;
    private float mTickPathProgress;
    private boolean mChecked;
    private boolean mInEditMode;
    private boolean mAnimEnable;
    private static final float[] TICK_DATA = {0.0f, 0.473f, 0.367f, 0.839f, 1.0f, 0.207f};
    private static final float FILL_TIME = 0.4f;
    private final Runnable mUpdater;

    private CheckBoxDrawable(int width, int height, int boxSize, int cornerRadius, int strokeSize, ColorStateList strokeColor, int tickColor, int animDuration) {
        this.mRunning = false;
        this.mTickPathProgress = -1.0f;
        this.mChecked = false;
        this.mInEditMode = false;
        this.mAnimEnable = true;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.CheckBoxDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                CheckBoxDrawable.this.update();
            }
        };
        this.mWidth = width;
        this.mHeight = height;
        this.mBoxSize = boxSize;
        this.mCornerRadius = cornerRadius;
        this.mStrokeSize = strokeSize;
        this.mStrokeColor = strokeColor;
        this.mTickColor = tickColor;
        this.mAnimDuration = animDuration;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mBoxRect = new RectF();
        this.mTickPath = new Path();
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
    protected void onBoundsChange(Rect bounds) {
        this.mBoxRect.set(bounds.exactCenterX() - (this.mBoxSize / 2), bounds.exactCenterY() - (this.mBoxSize / 2), bounds.exactCenterX() + (this.mBoxSize / 2), bounds.exactCenterY() + (this.mBoxSize / 2));
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mChecked) {
            drawChecked(canvas);
        } else {
            drawUnchecked(canvas);
        }
    }

    private Path getTickPath(Path path, float x, float y, float size, float progress, boolean in) {
        if (this.mTickPathProgress == progress) {
            return path;
        }
        this.mTickPathProgress = progress;
        float x1 = x + (size * TICK_DATA[0]);
        float y1 = y + (size * TICK_DATA[1]);
        float x2 = x + (size * TICK_DATA[2]);
        float y2 = y + (size * TICK_DATA[3]);
        float x3 = x + (size * TICK_DATA[4]);
        float y3 = y + (size * TICK_DATA[5]);
        float d1 = (float) Math.sqrt(Math.pow(x1 - x2, 2.0d) + Math.pow(y1 - y2, 2.0d));
        float d2 = (float) Math.sqrt(Math.pow(x1 - x2, 2.0d) + Math.pow(y1 - y2, 2.0d));
        float midProgress = d1 / (d1 + d2);
        path.reset();
        if (in) {
            path.moveTo(x1, y1);
            if (progress < midProgress) {
                float progress2 = progress / midProgress;
                path.lineTo((x1 * (1.0f - progress2)) + (x2 * progress2), (y1 * (1.0f - progress2)) + (y2 * progress2));
            } else {
                float progress3 = (progress - midProgress) / (1.0f - midProgress);
                path.lineTo(x2, y2);
                path.lineTo((x2 * (1.0f - progress3)) + (x3 * progress3), (y2 * (1.0f - progress3)) + (y3 * progress3));
            }
        } else {
            path.moveTo(x3, y3);
            if (progress < midProgress) {
                float progress4 = progress / midProgress;
                path.lineTo(x2, y2);
                path.lineTo((x1 * (1.0f - progress4)) + (x2 * progress4), (y1 * (1.0f - progress4)) + (y2 * progress4));
            } else {
                float progress5 = (progress - midProgress) / (1.0f - midProgress);
                path.lineTo((x2 * (1.0f - progress5)) + (x3 * progress5), (y2 * (1.0f - progress5)) + (y3 * progress5));
            }
        }
        return path;
    }

    private void drawChecked(Canvas canvas) {
        float size = this.mBoxSize - (this.mStrokeSize * 2);
        float x = this.mBoxRect.left + this.mStrokeSize;
        float y = this.mBoxRect.top + this.mStrokeSize;
        if (!isRunning()) {
            this.mPaint.setColor(this.mCurColor);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.FILL_AND_STROKE);
            canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setStrokeJoin(Paint.Join.MITER);
            this.mPaint.setStrokeCap(Paint.Cap.BUTT);
            this.mPaint.setColor(this.mTickColor);
            canvas.drawPath(getTickPath(this.mTickPath, x, y, size, 1.0f, true), this.mPaint);
            return;
        }
        if (this.mAnimProgress < FILL_TIME) {
            float progress = this.mAnimProgress / FILL_TIME;
            float fillWidth = ((this.mBoxSize - this.mStrokeSize) / 2.0f) * progress;
            float padding = ((this.mStrokeSize / 2.0f) + (fillWidth / 2.0f)) - 0.5f;
            this.mPaint.setColor(ColorUtil.getMiddleColor(this.mPrevColor, this.mCurColor, progress));
            this.mPaint.setStrokeWidth(fillWidth);
            this.mPaint.setStyle(Paint.Style.STROKE);
            canvas.drawRect(this.mBoxRect.left + padding, this.mBoxRect.top + padding, this.mBoxRect.right - padding, this.mBoxRect.bottom - padding, this.mPaint);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
            return;
        }
        float progress2 = (this.mAnimProgress - FILL_TIME) / 0.6f;
        this.mPaint.setColor(this.mCurColor);
        this.mPaint.setStrokeWidth(this.mStrokeSize);
        this.mPaint.setStyle(Paint.Style.FILL_AND_STROKE);
        canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeJoin(Paint.Join.MITER);
        this.mPaint.setStrokeCap(Paint.Cap.BUTT);
        this.mPaint.setColor(this.mTickColor);
        canvas.drawPath(getTickPath(this.mTickPath, x, y, size, progress2, true), this.mPaint);
    }

    private void drawUnchecked(Canvas canvas) {
        if (!isRunning()) {
            this.mPaint.setColor(this.mCurColor);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.STROKE);
            canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
            return;
        }
        if (this.mAnimProgress < 0.6f) {
            float size = this.mBoxSize - (this.mStrokeSize * 2);
            float x = this.mBoxRect.left + this.mStrokeSize;
            float y = this.mBoxRect.top + this.mStrokeSize;
            float progress = this.mAnimProgress / 0.6f;
            this.mPaint.setColor(this.mPrevColor);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.FILL_AND_STROKE);
            canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setStrokeJoin(Paint.Join.MITER);
            this.mPaint.setStrokeCap(Paint.Cap.BUTT);
            this.mPaint.setColor(this.mTickColor);
            canvas.drawPath(getTickPath(this.mTickPath, x, y, size, progress, false), this.mPaint);
            return;
        }
        float progress2 = ((this.mAnimProgress + FILL_TIME) - 1.0f) / FILL_TIME;
        float fillWidth = ((this.mBoxSize - this.mStrokeSize) / 2.0f) * (1.0f - progress2);
        float padding = ((this.mStrokeSize / 2.0f) + (fillWidth / 2.0f)) - 0.5f;
        this.mPaint.setColor(ColorUtil.getMiddleColor(this.mPrevColor, this.mCurColor, progress2));
        this.mPaint.setStrokeWidth(fillWidth);
        this.mPaint.setStyle(Paint.Style.STROKE);
        canvas.drawRect(this.mBoxRect.left + padding, this.mBoxRect.top + padding, this.mBoxRect.right - padding, this.mBoxRect.bottom - padding, this.mPaint);
        this.mPaint.setStrokeWidth(this.mStrokeSize);
        canvas.drawRoundRect(this.mBoxRect, this.mCornerRadius, this.mCornerRadius, this.mPaint);
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

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/CheckBoxDrawable$Builder.class */
    public static class Builder {
        private int mAnimDuration;
        private int mStrokeSize;
        private int mWidth;
        private int mHeight;
        private ColorStateList mStrokeColor;
        private int mCornerRadius;
        private int mBoxSize;
        private int mTickColor;

        public Builder() {
            this.mAnimDuration = 400;
            this.mStrokeSize = 4;
            this.mWidth = 64;
            this.mHeight = 64;
            this.mCornerRadius = 8;
            this.mBoxSize = 32;
            this.mTickColor = -1;
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        /* JADX WARN: Type inference failed for: r0v30, types: [int[], int[][]] */
        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            this.mAnimDuration = 400;
            this.mStrokeSize = 4;
            this.mWidth = 64;
            this.mHeight = 64;
            this.mCornerRadius = 8;
            this.mBoxSize = 32;
            this.mTickColor = -1;
            TypedArray a = context.obtainStyledAttributes(attrs, com.rey.material.R.styleable.CheckBoxDrawable, defStyleAttr, defStyleRes);
            width(a.getDimensionPixelSize(com.rey.material.R.styleable.CheckBoxDrawable_cbd_width, ThemeUtil.dpToPx(context, 32)));
            height(a.getDimensionPixelSize(com.rey.material.R.styleable.CheckBoxDrawable_cbd_height, ThemeUtil.dpToPx(context, 32)));
            boxSize(a.getDimensionPixelSize(com.rey.material.R.styleable.CheckBoxDrawable_cbd_boxSize, ThemeUtil.dpToPx(context, 18)));
            cornerRadius(a.getDimensionPixelSize(com.rey.material.R.styleable.CheckBoxDrawable_cbd_cornerRadius, ThemeUtil.dpToPx(context, 2)));
            strokeSize(a.getDimensionPixelSize(com.rey.material.R.styleable.CheckBoxDrawable_cbd_strokeSize, ThemeUtil.dpToPx(context, 2)));
            strokeColor(a.getColorStateList(com.rey.material.R.styleable.CheckBoxDrawable_cbd_strokeColor));
            tickColor(a.getColor(com.rey.material.R.styleable.CheckBoxDrawable_cbd_tickColor, -1));
            animDuration(a.getInt(com.rey.material.R.styleable.CheckBoxDrawable_cbd_animDuration, context.getResources().getInteger(R.integer.config_mediumAnimTime)));
            a.recycle();
            if (this.mStrokeColor == null) {
                ?? r0 = {new int[]{-16842912}, new int[]{R.attr.state_checked}};
                int[] colors = {ThemeUtil.colorControlNormal(context, -16777216), ThemeUtil.colorControlActivated(context, -16777216)};
                strokeColor(new ColorStateList(r0, colors));
            }
        }

        public CheckBoxDrawable build() {
            if (this.mStrokeColor == null) {
                this.mStrokeColor = ColorStateList.valueOf(-16777216);
            }
            return new CheckBoxDrawable(this.mWidth, this.mHeight, this.mBoxSize, this.mCornerRadius, this.mStrokeSize, this.mStrokeColor, this.mTickColor, this.mAnimDuration);
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

        public Builder tickColor(int color) {
            this.mTickColor = color;
            return this;
        }

        public Builder cornerRadius(int radius) {
            this.mCornerRadius = radius;
            return this;
        }

        public Builder boxSize(int size) {
            this.mBoxSize = size;
            return this;
        }

        public Builder animDuration(int duration) {
            this.mAnimDuration = duration;
            return this;
        }
    }
}
