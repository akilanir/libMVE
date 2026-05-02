package com.rey.material.drawable;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.R;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/CircularProgressDrawable.class */
public class CircularProgressDrawable extends Drawable implements Animatable {
    private long mLastUpdateTime;
    private long mLastProgressStateTime;
    private long mLastRunStateTime;
    private int mProgressState;
    private static final int PROGRESS_STATE_HIDE = -1;
    private static final int PROGRESS_STATE_STRETCH = 0;
    private static final int PROGRESS_STATE_KEEP_STRETCH = 1;
    private static final int PROGRESS_STATE_SHRINK = 2;
    private static final int PROGRESS_STATE_KEEP_SHRINK = 3;
    private int mRunState;
    private static final int RUN_STATE_STOPPED = 0;
    private static final int RUN_STATE_STARTING = 1;
    private static final int RUN_STATE_STARTED = 2;
    private static final int RUN_STATE_RUNNING = 3;
    private static final int RUN_STATE_STOPPING = 4;
    private Paint mPaint;
    private RectF mRect;
    private float mStartAngle;
    private float mSweepAngle;
    private int mStrokeColorIndex;
    private int mPadding;
    private float mInitialAngle;
    private float mProgressPercent;
    private float mSecondaryProgressPercent;
    private float mMaxSweepAngle;
    private float mMinSweepAngle;
    private int mStrokeSize;
    private int[] mStrokeColors;
    private int mStrokeSecondaryColor;
    private boolean mReverse;
    private int mRotateDuration;
    private int mTransformDuration;
    private int mKeepDuration;
    private float mInStepPercent;
    private int[] mInColors;
    private int mInAnimationDuration;
    private int mOutAnimationDuration;
    private int mProgressMode;
    private Interpolator mTransformInterpolator;
    private final Runnable mUpdater;

    private CircularProgressDrawable(int padding, float initialAngle, float progressPercent, float secondaryProgressPercent, float maxSweepAngle, float minSweepAngle, int strokeSize, int[] strokeColors, int strokeSecondaryColor, boolean reverse, int rotateDuration, int transformDuration, int keepDuration, Interpolator transformInterpolator, int progressMode, int inAnimDuration, float inStepPercent, int[] inStepColors, int outAnimDuration) {
        this.mRunState = 0;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.CircularProgressDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                CircularProgressDrawable.this.update();
            }
        };
        this.mPadding = padding;
        this.mInitialAngle = initialAngle;
        setProgress(progressPercent);
        setSecondaryProgress(secondaryProgressPercent);
        this.mMaxSweepAngle = maxSweepAngle;
        this.mMinSweepAngle = minSweepAngle;
        this.mStrokeSize = strokeSize;
        this.mStrokeColors = strokeColors;
        this.mStrokeSecondaryColor = strokeSecondaryColor;
        this.mReverse = reverse;
        this.mRotateDuration = rotateDuration;
        this.mTransformDuration = transformDuration;
        this.mKeepDuration = keepDuration;
        this.mTransformInterpolator = transformInterpolator;
        this.mProgressMode = progressMode;
        this.mInAnimationDuration = inAnimDuration;
        this.mInStepPercent = inStepPercent;
        this.mInColors = inStepColors;
        this.mOutAnimationDuration = outAnimDuration;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeCap(Paint.Cap.ROUND);
        this.mPaint.setStrokeJoin(Paint.Join.ROUND);
        this.mRect = new RectF();
    }

    public void applyStyle(Context context, int resId) {
        TypedArray a = context.obtainStyledAttributes(resId, R.styleable.CircularProgressDrawable);
        int strokeColor = 0;
        boolean strokeColorDefined = false;
        int[] strokeColors = null;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.CircularProgressDrawable_cpd_padding) {
                this.mPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_initialAngle) {
                this.mInitialAngle = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_pv_progress) {
                setProgress(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.CircularProgressDrawable_pv_secondaryProgress) {
                setSecondaryProgress(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_maxSweepAngle) {
                this.mMaxSweepAngle = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_minSweepAngle) {
                this.mMinSweepAngle = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_strokeSize) {
                this.mStrokeSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_strokeColor) {
                strokeColor = a.getColor(attr, 0);
                strokeColorDefined = true;
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_strokeColors) {
                TypedArray ta = context.getResources().obtainTypedArray(a.getResourceId(attr, 0));
                strokeColors = new int[ta.length()];
                for (int j = 0; j < ta.length(); j++) {
                    strokeColors[j] = ta.getColor(j, 0);
                }
                ta.recycle();
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_strokeSecondaryColor) {
                this.mStrokeSecondaryColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_reverse) {
                this.mReverse = a.getBoolean(attr, false);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_rotateDuration) {
                this.mRotateDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_transformDuration) {
                this.mTransformDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_keepDuration) {
                this.mKeepDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_transformInterpolator) {
                this.mTransformInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.CircularProgressDrawable_pv_progressMode) {
                this.mProgressMode = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_inAnimDuration) {
                this.mInAnimationDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_inStepColors) {
                TypedArray ta2 = context.getResources().obtainTypedArray(a.getResourceId(attr, 0));
                this.mInColors = new int[ta2.length()];
                for (int j2 = 0; j2 < ta2.length(); j2++) {
                    this.mInColors[j2] = ta2.getColor(j2, 0);
                }
                ta2.recycle();
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_inStepPercent) {
                this.mInStepPercent = a.getFloat(attr, 0.0f);
            } else if (attr == R.styleable.CircularProgressDrawable_cpd_outAnimDuration) {
                this.mOutAnimationDuration = a.getInteger(attr, 0);
            }
        }
        a.recycle();
        if (strokeColors != null) {
            this.mStrokeColors = strokeColors;
        } else if (strokeColorDefined) {
            this.mStrokeColors = new int[]{strokeColor};
        }
        if (this.mStrokeColorIndex >= this.mStrokeColors.length) {
            this.mStrokeColorIndex = 0;
        }
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        switch (this.mProgressMode) {
            case 0:
                drawDeterminate(canvas);
                break;
            case 1:
                drawIndeterminate(canvas);
                break;
        }
    }

    private void drawDeterminate(Canvas canvas) {
        Rect bounds = getBounds();
        float radius = 0.0f;
        float size = 0.0f;
        if (this.mRunState == 1) {
            size = (this.mStrokeSize * Math.min(this.mInAnimationDuration, SystemClock.uptimeMillis() - this.mLastRunStateTime)) / this.mInAnimationDuration;
            if (size > 0.0f) {
                radius = (((Math.min(bounds.width(), bounds.height()) - (this.mPadding * 2)) - (this.mStrokeSize * 2)) + size) / 2.0f;
            }
        } else if (this.mRunState == RUN_STATE_STOPPING) {
            size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
            if (size > 0.0f) {
                radius = (((Math.min(bounds.width(), bounds.height()) - (this.mPadding * 2)) - (this.mStrokeSize * 2)) + size) / 2.0f;
            }
        } else if (this.mRunState != 0) {
            size = this.mStrokeSize;
            radius = ((Math.min(bounds.width(), bounds.height()) - (this.mPadding * 2)) - this.mStrokeSize) / 2.0f;
        }
        if (radius > 0.0f) {
            float x = (bounds.left + bounds.right) / 2.0f;
            float y = (bounds.top + bounds.bottom) / 2.0f;
            this.mPaint.setStrokeWidth(size);
            this.mPaint.setStyle(Paint.Style.STROKE);
            if (this.mProgressPercent == 1.0f) {
                this.mPaint.setColor(this.mStrokeColors[0]);
                canvas.drawCircle(x, y, radius, this.mPaint);
            } else {
                if (this.mProgressPercent == 0.0f) {
                    this.mPaint.setColor(this.mStrokeSecondaryColor);
                    canvas.drawCircle(x, y, radius, this.mPaint);
                    return;
                }
                float sweepAngle = (this.mReverse ? -360 : 360) * this.mProgressPercent;
                this.mRect.set(x - radius, y - radius, x + radius, y + radius);
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                canvas.drawArc(this.mRect, this.mStartAngle + sweepAngle, (this.mReverse ? -360 : 360) - sweepAngle, false, this.mPaint);
                this.mPaint.setColor(this.mStrokeColors[0]);
                canvas.drawArc(this.mRect, this.mStartAngle, sweepAngle, false, this.mPaint);
            }
        }
    }

    private int getIndeterminateStrokeColor() {
        if (this.mProgressState != 3 || this.mStrokeColors.length == 1) {
            return this.mStrokeColors[this.mStrokeColorIndex];
        }
        float value = Math.max(0.0f, Math.min(1.0f, (SystemClock.uptimeMillis() - this.mLastProgressStateTime) / this.mKeepDuration));
        int prev_index = this.mStrokeColorIndex == 0 ? this.mStrokeColors.length - 1 : this.mStrokeColorIndex - 1;
        return ColorUtil.getMiddleColor(this.mStrokeColors[prev_index], this.mStrokeColors[this.mStrokeColorIndex], value);
    }

    private void drawIndeterminate(Canvas canvas) {
        if (this.mRunState == 1) {
            Rect bounds = getBounds();
            float x = (bounds.left + bounds.right) / 2.0f;
            float y = (bounds.top + bounds.bottom) / 2.0f;
            float maxRadius = (Math.min(bounds.width(), bounds.height()) - (this.mPadding * 2)) / 2.0f;
            float stepTime = 1.0f / ((this.mInStepPercent * (this.mInColors.length + 2)) + 1.0f);
            float time = (SystemClock.uptimeMillis() - this.mLastRunStateTime) / this.mInAnimationDuration;
            float steps = time / stepTime;
            float outerRadius = 0.0f;
            for (int i = (int) Math.floor(steps); i >= 0; i--) {
                float innerRadius = outerRadius;
                outerRadius = Math.min(1.0f, (steps - i) * this.mInStepPercent) * maxRadius;
                if (i < this.mInColors.length) {
                    if (innerRadius == 0.0f) {
                        this.mPaint.setColor(this.mInColors[i]);
                        this.mPaint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(x, y, outerRadius, this.mPaint);
                    } else {
                        if (outerRadius <= innerRadius) {
                            break;
                        }
                        float radius = (innerRadius + outerRadius) / 2.0f;
                        this.mRect.set(x - radius, y - radius, x + radius, y + radius);
                        this.mPaint.setStrokeWidth(outerRadius - innerRadius);
                        this.mPaint.setStyle(Paint.Style.STROKE);
                        this.mPaint.setColor(this.mInColors[i]);
                        canvas.drawCircle(x, y, radius, this.mPaint);
                    }
                }
            }
            if (this.mProgressState == -1) {
                if (steps >= 1.0f / this.mInStepPercent || time >= 1.0f) {
                    resetAnimation();
                    this.mProgressState = 0;
                    return;
                }
                return;
            }
            float radius2 = maxRadius - (this.mStrokeSize / 2.0f);
            this.mRect.set(x - radius2, y - radius2, x + radius2, y + radius2);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setColor(getIndeterminateStrokeColor());
            canvas.drawArc(this.mRect, this.mStartAngle, this.mSweepAngle, false, this.mPaint);
            return;
        }
        if (this.mRunState == RUN_STATE_STOPPING) {
            float size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
            if (size > 0.0f) {
                Rect bounds2 = getBounds();
                float radius3 = (((Math.min(bounds2.width(), bounds2.height()) - (this.mPadding * 2)) - (this.mStrokeSize * 2)) + size) / 2.0f;
                float x2 = (bounds2.left + bounds2.right) / 2.0f;
                float y2 = (bounds2.top + bounds2.bottom) / 2.0f;
                this.mRect.set(x2 - radius3, y2 - radius3, x2 + radius3, y2 + radius3);
                this.mPaint.setStrokeWidth(size);
                this.mPaint.setStyle(Paint.Style.STROKE);
                this.mPaint.setColor(getIndeterminateStrokeColor());
                canvas.drawArc(this.mRect, this.mStartAngle, this.mSweepAngle, false, this.mPaint);
                return;
            }
            return;
        }
        if (this.mRunState != 0) {
            Rect bounds3 = getBounds();
            float radius4 = ((Math.min(bounds3.width(), bounds3.height()) - (this.mPadding * 2)) - this.mStrokeSize) / 2.0f;
            float x3 = (bounds3.left + bounds3.right) / 2.0f;
            float y3 = (bounds3.top + bounds3.bottom) / 2.0f;
            this.mRect.set(x3 - radius4, y3 - radius4, x3 + radius4, y3 + radius4);
            this.mPaint.setStrokeWidth(this.mStrokeSize);
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setColor(getIndeterminateStrokeColor());
            canvas.drawArc(this.mRect, this.mStartAngle, this.mSweepAngle, false, this.mPaint);
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

    public int getProgressMode() {
        return this.mProgressMode;
    }

    public void setProgressMode(int mode) {
        if (this.mProgressMode != mode) {
            this.mProgressMode = mode;
            invalidateSelf();
        }
    }

    public float getProgress() {
        return this.mProgressPercent;
    }

    public float getSecondaryProgress() {
        return this.mSecondaryProgressPercent;
    }

    public void setProgress(float percent) {
        float percent2 = Math.min(1.0f, Math.max(0.0f, percent));
        if (this.mProgressPercent != percent2) {
            this.mProgressPercent = percent2;
            if (isRunning()) {
                invalidateSelf();
            } else if (this.mProgressPercent != 0.0f) {
                start();
            }
        }
    }

    public void setSecondaryProgress(float percent) {
        float percent2 = Math.min(1.0f, Math.max(0.0f, percent));
        if (this.mSecondaryProgressPercent != percent2) {
            this.mSecondaryProgressPercent = percent2;
            if (isRunning()) {
                invalidateSelf();
            } else if (this.mSecondaryProgressPercent != 0.0f) {
                start();
            }
        }
    }

    private void resetAnimation() {
        this.mLastUpdateTime = SystemClock.uptimeMillis();
        this.mLastProgressStateTime = this.mLastUpdateTime;
        this.mStartAngle = this.mInitialAngle;
        this.mStrokeColorIndex = 0;
        this.mSweepAngle = this.mReverse ? -this.mMinSweepAngle : this.mMinSweepAngle;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        start(this.mInAnimationDuration > 0);
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        stop(this.mOutAnimationDuration > 0);
    }

    private void start(boolean withAnimation) {
        if (isRunning()) {
            return;
        }
        resetAnimation();
        if (withAnimation) {
            this.mRunState = 1;
            this.mLastRunStateTime = SystemClock.uptimeMillis();
            this.mProgressState = -1;
        }
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        invalidateSelf();
    }

    private void stop(boolean withAnimation) {
        if (!isRunning()) {
            return;
        }
        if (withAnimation) {
            this.mLastRunStateTime = SystemClock.uptimeMillis();
            if (this.mRunState == 2) {
                scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
                invalidateSelf();
            }
            this.mRunState = RUN_STATE_STOPPING;
            return;
        }
        this.mRunState = 0;
        unscheduleSelf(this.mUpdater);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunState != 0;
    }

    @Override // android.graphics.drawable.Drawable
    public void scheduleSelf(Runnable what, long when) {
        if (this.mRunState == 0) {
            this.mRunState = this.mInAnimationDuration > 0 ? 1 : 3;
        }
        super.scheduleSelf(what, when);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        switch (this.mProgressMode) {
            case 0:
                updateDeterminate();
                break;
            case 1:
                updateIndeterminate();
                break;
        }
    }

    private void updateDeterminate() {
        long curTime = SystemClock.uptimeMillis();
        float rotateOffset = ((curTime - this.mLastUpdateTime) * 360.0f) / this.mRotateDuration;
        if (this.mReverse) {
            rotateOffset = -rotateOffset;
        }
        this.mLastUpdateTime = curTime;
        this.mStartAngle += rotateOffset;
        if (this.mRunState == 1) {
            if (curTime - this.mLastRunStateTime > this.mInAnimationDuration) {
                this.mRunState = 3;
            }
        } else if (this.mRunState == RUN_STATE_STOPPING && curTime - this.mLastRunStateTime > this.mOutAnimationDuration) {
            stop(false);
            return;
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidateSelf();
    }

    private void updateIndeterminate() {
        long curTime = SystemClock.uptimeMillis();
        float rotateOffset = ((curTime - this.mLastUpdateTime) * 360.0f) / this.mRotateDuration;
        if (this.mReverse) {
            rotateOffset = -rotateOffset;
        }
        this.mLastUpdateTime = curTime;
        switch (this.mProgressState) {
            case 0:
                if (this.mTransformDuration <= 0) {
                    this.mSweepAngle = this.mReverse ? -this.mMinSweepAngle : this.mMinSweepAngle;
                    this.mProgressState = 1;
                    this.mStartAngle += rotateOffset;
                    this.mLastProgressStateTime = curTime;
                    break;
                } else {
                    float value = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    float maxAngle = this.mReverse ? -this.mMaxSweepAngle : this.mMaxSweepAngle;
                    float minAngle = this.mReverse ? -this.mMinSweepAngle : this.mMinSweepAngle;
                    this.mStartAngle += rotateOffset;
                    this.mSweepAngle = (this.mTransformInterpolator.getInterpolation(value) * (maxAngle - minAngle)) + minAngle;
                    if (value > 1.0f) {
                        this.mSweepAngle = maxAngle;
                        this.mProgressState = 1;
                        this.mLastProgressStateTime = curTime;
                        break;
                    }
                }
                break;
            case 1:
                this.mStartAngle += rotateOffset;
                if (curTime - this.mLastProgressStateTime > this.mKeepDuration) {
                    this.mProgressState = 2;
                    this.mLastProgressStateTime = curTime;
                    break;
                }
                break;
            case 2:
                if (this.mTransformDuration <= 0) {
                    this.mSweepAngle = this.mReverse ? -this.mMinSweepAngle : this.mMinSweepAngle;
                    this.mProgressState = 3;
                    this.mStartAngle += rotateOffset;
                    this.mLastProgressStateTime = curTime;
                    this.mStrokeColorIndex = (this.mStrokeColorIndex + 1) % this.mStrokeColors.length;
                    break;
                } else {
                    float value2 = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    float maxAngle2 = this.mReverse ? -this.mMaxSweepAngle : this.mMaxSweepAngle;
                    float minAngle2 = this.mReverse ? -this.mMinSweepAngle : this.mMinSweepAngle;
                    float newSweepAngle = ((1.0f - this.mTransformInterpolator.getInterpolation(value2)) * (maxAngle2 - minAngle2)) + minAngle2;
                    this.mStartAngle += (rotateOffset + this.mSweepAngle) - newSweepAngle;
                    this.mSweepAngle = newSweepAngle;
                    if (value2 > 1.0f) {
                        this.mSweepAngle = minAngle2;
                        this.mProgressState = 3;
                        this.mLastProgressStateTime = curTime;
                        this.mStrokeColorIndex = (this.mStrokeColorIndex + 1) % this.mStrokeColors.length;
                        break;
                    }
                }
                break;
            case 3:
                this.mStartAngle += rotateOffset;
                if (curTime - this.mLastProgressStateTime > this.mKeepDuration) {
                    this.mProgressState = 0;
                    this.mLastProgressStateTime = curTime;
                    break;
                }
                break;
        }
        if (this.mRunState == 1) {
            if (curTime - this.mLastRunStateTime > this.mInAnimationDuration) {
                this.mRunState = 3;
                if (this.mProgressState == -1) {
                    resetAnimation();
                    this.mProgressState = 0;
                }
            }
        } else if (this.mRunState == RUN_STATE_STOPPING && curTime - this.mLastRunStateTime > this.mOutAnimationDuration) {
            stop(false);
            return;
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidateSelf();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/CircularProgressDrawable$Builder.class */
    public static class Builder {
        private int mPadding;
        private float mInitialAngle;
        private float mProgressPercent;
        private float mSecondaryProgressPercent;
        private float mMaxSweepAngle;
        private float mMinSweepAngle;
        private int mStrokeSize;
        private int[] mStrokeColors;
        private int mStrokeSecondaryColor;
        private boolean mReverse;
        private int mRotateDuration;
        private int mTransformDuration;
        private int mKeepDuration;
        private Interpolator mTransformInterpolator;
        private int mProgressMode;
        private float mInStepPercent;
        private int[] mInColors;
        private int mInAnimationDuration;
        private int mOutAnimationDuration;

        public Builder() {
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CircularProgressDrawable, defStyleAttr, defStyleRes);
            padding(a.getDimensionPixelSize(R.styleable.CircularProgressDrawable_cpd_padding, 0));
            initialAngle(a.getInteger(R.styleable.CircularProgressDrawable_cpd_initialAngle, 0));
            progressPercent(a.getFloat(R.styleable.CircularProgressDrawable_pv_progress, 0.0f));
            secondaryProgressPercent(a.getFloat(R.styleable.CircularProgressDrawable_pv_secondaryProgress, 0.0f));
            maxSweepAngle(a.getInteger(R.styleable.CircularProgressDrawable_cpd_maxSweepAngle, 270));
            minSweepAngle(a.getInteger(R.styleable.CircularProgressDrawable_cpd_minSweepAngle, 1));
            strokeSize(a.getDimensionPixelSize(R.styleable.CircularProgressDrawable_cpd_strokeSize, ThemeUtil.dpToPx(context, CircularProgressDrawable.RUN_STATE_STOPPING)));
            strokeColors(a.getColor(R.styleable.CircularProgressDrawable_cpd_strokeColor, ThemeUtil.colorPrimary(context, -16777216)));
            int resId = a.getResourceId(R.styleable.CircularProgressDrawable_cpd_strokeColors, 0);
            if (resId != 0) {
                TypedArray ta = context.getResources().obtainTypedArray(resId);
                int[] colors = new int[ta.length()];
                for (int j = 0; j < ta.length(); j++) {
                    colors[j] = ta.getColor(j, 0);
                }
                ta.recycle();
                strokeColors(colors);
            }
            strokeSecondaryColor(a.getColor(R.styleable.CircularProgressDrawable_cpd_strokeSecondaryColor, 0));
            reverse(a.getBoolean(R.styleable.CircularProgressDrawable_cpd_reverse, false));
            rotateDuration(a.getInteger(R.styleable.CircularProgressDrawable_cpd_rotateDuration, context.getResources().getInteger(android.R.integer.config_longAnimTime)));
            transformDuration(a.getInteger(R.styleable.CircularProgressDrawable_cpd_transformDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            keepDuration(a.getInteger(R.styleable.CircularProgressDrawable_cpd_keepDuration, context.getResources().getInteger(android.R.integer.config_shortAnimTime)));
            int resId2 = a.getResourceId(R.styleable.CircularProgressDrawable_cpd_transformInterpolator, 0);
            if (resId2 != 0) {
                transformInterpolator(AnimationUtils.loadInterpolator(context, resId2));
            }
            progressMode(a.getInteger(R.styleable.CircularProgressDrawable_pv_progressMode, 1));
            inAnimDuration(a.getInteger(R.styleable.CircularProgressDrawable_cpd_inAnimDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            int resId3 = a.getResourceId(R.styleable.CircularProgressDrawable_cpd_inStepColors, 0);
            if (resId3 != 0) {
                TypedArray ta2 = context.getResources().obtainTypedArray(resId3);
                int[] colors2 = new int[ta2.length()];
                for (int j2 = 0; j2 < ta2.length(); j2++) {
                    colors2[j2] = ta2.getColor(j2, 0);
                }
                ta2.recycle();
                inStepColors(colors2);
            }
            inStepPercent(a.getFloat(R.styleable.CircularProgressDrawable_cpd_inStepPercent, 0.5f));
            outAnimDuration(a.getInteger(R.styleable.CircularProgressDrawable_cpd_outAnimDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            a.recycle();
        }

        public CircularProgressDrawable build() {
            if (this.mStrokeColors == null) {
                this.mStrokeColors = new int[]{-16737793};
            }
            if (this.mInColors == null && this.mInAnimationDuration > 0) {
                this.mInColors = new int[]{-4860673, -2168068, -327682};
            }
            if (this.mTransformInterpolator == null) {
                this.mTransformInterpolator = new DecelerateInterpolator();
            }
            return new CircularProgressDrawable(this.mPadding, this.mInitialAngle, this.mProgressPercent, this.mSecondaryProgressPercent, this.mMaxSweepAngle, this.mMinSweepAngle, this.mStrokeSize, this.mStrokeColors, this.mStrokeSecondaryColor, this.mReverse, this.mRotateDuration, this.mTransformDuration, this.mKeepDuration, this.mTransformInterpolator, this.mProgressMode, this.mInAnimationDuration, this.mInStepPercent, this.mInColors, this.mOutAnimationDuration);
        }

        public Builder padding(int padding) {
            this.mPadding = padding;
            return this;
        }

        public Builder initialAngle(float angle) {
            this.mInitialAngle = angle;
            return this;
        }

        public Builder progressPercent(float percent) {
            this.mProgressPercent = percent;
            return this;
        }

        public Builder secondaryProgressPercent(float percent) {
            this.mSecondaryProgressPercent = percent;
            return this;
        }

        public Builder maxSweepAngle(float angle) {
            this.mMaxSweepAngle = angle;
            return this;
        }

        public Builder minSweepAngle(float angle) {
            this.mMinSweepAngle = angle;
            return this;
        }

        public Builder strokeSize(int strokeSize) {
            this.mStrokeSize = strokeSize;
            return this;
        }

        public Builder strokeColors(int... strokeColors) {
            this.mStrokeColors = strokeColors;
            return this;
        }

        public Builder strokeSecondaryColor(int color) {
            this.mStrokeSecondaryColor = color;
            return this;
        }

        public Builder reverse(boolean reverse) {
            this.mReverse = reverse;
            return this;
        }

        public Builder reverse() {
            return reverse(true);
        }

        public Builder rotateDuration(int duration) {
            this.mRotateDuration = duration;
            return this;
        }

        public Builder transformDuration(int duration) {
            this.mTransformDuration = duration;
            return this;
        }

        public Builder keepDuration(int duration) {
            this.mKeepDuration = duration;
            return this;
        }

        public Builder transformInterpolator(Interpolator interpolator) {
            this.mTransformInterpolator = interpolator;
            return this;
        }

        public Builder progressMode(int mode) {
            this.mProgressMode = mode;
            return this;
        }

        public Builder inAnimDuration(int duration) {
            this.mInAnimationDuration = duration;
            return this;
        }

        public Builder inStepPercent(float percent) {
            this.mInStepPercent = percent;
            return this;
        }

        public Builder inStepColors(int... colors) {
            this.mInColors = colors;
            return this;
        }

        public Builder outAnimDuration(int duration) {
            this.mOutAnimationDuration = duration;
            return this;
        }
    }
}
