package com.rey.material.drawable;

import android.content.Context;
import android.content.res.TypedArray;
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
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.R;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/LinearProgressDrawable.class */
public class LinearProgressDrawable extends Drawable implements Animatable {
    private long mLastUpdateTime;
    private long mLastProgressStateTime;
    private long mLastRunStateTime;
    private int mProgressState;
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
    public static final int ALIGN_TOP = 0;
    public static final int ALIGN_CENTER = 1;
    public static final int ALIGN_BOTTOM = 2;
    private Paint mPaint;
    private float mStartLine;
    private float mLineWidth;
    private int mStrokeColorIndex;
    private float mAnimTime;
    private Path mPath;
    private DashPathEffect mPathEffect;
    private float mProgressPercent;
    private float mSecondaryProgressPercent;
    private int mMaxLineWidth;
    private float mMaxLineWidthPercent;
    private int mMinLineWidth;
    private float mMinLineWidthPercent;
    private int mStrokeSize;
    private int mVerticalAlign;
    private int[] mStrokeColors;
    private int mStrokeSecondaryColor;
    private boolean mReverse;
    private int mTravelDuration;
    private int mTransformDuration;
    private int mKeepDuration;
    private int mInAnimationDuration;
    private int mOutAnimationDuration;
    private int mProgressMode;
    private Interpolator mTransformInterpolator;
    private final Runnable mUpdater;

    private LinearProgressDrawable(float progressPercent, float secondaryProgressPercent, int maxLineWidth, float maxLineWidthPercent, int minLineWidth, float minLineWidthPercent, int strokeSize, int verticalAlign, int[] strokeColors, int strokeSecondaryColor, boolean reverse, int travelDuration, int transformDuration, int keepDuration, Interpolator transformInterpolator, int progressMode, int inAnimDuration, int outAnimDuration) {
        this.mRunState = 0;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.LinearProgressDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                LinearProgressDrawable.this.update();
            }
        };
        setProgress(progressPercent);
        setSecondaryProgress(secondaryProgressPercent);
        this.mMaxLineWidth = maxLineWidth;
        this.mMaxLineWidthPercent = maxLineWidthPercent;
        this.mMinLineWidth = minLineWidth;
        this.mMinLineWidthPercent = minLineWidthPercent;
        this.mStrokeSize = strokeSize;
        this.mVerticalAlign = verticalAlign;
        this.mStrokeColors = strokeColors;
        this.mStrokeSecondaryColor = strokeSecondaryColor;
        this.mReverse = reverse;
        this.mTravelDuration = travelDuration;
        this.mTransformDuration = transformDuration;
        this.mKeepDuration = keepDuration;
        this.mTransformInterpolator = transformInterpolator;
        this.mProgressMode = progressMode;
        this.mInAnimationDuration = inAnimDuration;
        this.mOutAnimationDuration = outAnimDuration;
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeCap(Paint.Cap.ROUND);
        this.mPaint.setStrokeJoin(Paint.Join.ROUND);
        this.mPath = new Path();
    }

    public void applyStyle(Context context, int resId) {
        TypedArray a = context.obtainStyledAttributes(resId, R.styleable.LinearProgressDrawable);
        int strokeColor = 0;
        boolean strokeColorDefined = false;
        int[] strokeColors = null;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.LinearProgressDrawable_pv_progress) {
                setProgress(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.LinearProgressDrawable_pv_secondaryProgress) {
                setSecondaryProgress(a.getFloat(attr, 0.0f));
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_maxLineWidth) {
                TypedValue value = a.peekValue(attr);
                if (value.type == 6) {
                    this.mMaxLineWidthPercent = a.getFraction(attr, 1, 1, 0.75f);
                    this.mMaxLineWidth = 0;
                } else {
                    this.mMaxLineWidth = a.getDimensionPixelSize(attr, 0);
                    this.mMaxLineWidthPercent = 0.0f;
                }
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_minLineWidth) {
                TypedValue value2 = a.peekValue(attr);
                if (value2.type == 6) {
                    this.mMinLineWidthPercent = a.getFraction(attr, 1, 1, 0.25f);
                    this.mMinLineWidth = 0;
                } else {
                    this.mMinLineWidth = a.getDimensionPixelSize(attr, 0);
                    this.mMinLineWidthPercent = 0.0f;
                }
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_strokeSize) {
                this.mStrokeSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_verticalAlign) {
                this.mVerticalAlign = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_strokeColor) {
                strokeColor = a.getColor(attr, 0);
                strokeColorDefined = true;
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_strokeColors) {
                TypedArray ta = context.getResources().obtainTypedArray(a.getResourceId(attr, 0));
                strokeColors = new int[ta.length()];
                for (int j = 0; j < ta.length(); j++) {
                    strokeColors[j] = ta.getColor(j, 0);
                }
                ta.recycle();
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_strokeSecondaryColor) {
                this.mStrokeSecondaryColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_reverse) {
                this.mReverse = a.getBoolean(attr, false);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_travelDuration) {
                this.mTravelDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_transformDuration) {
                this.mTransformDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_keepDuration) {
                this.mKeepDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_transformInterpolator) {
                this.mTransformInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.LinearProgressDrawable_pv_progressMode) {
                this.mProgressMode = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_inAnimDuration) {
                this.mInAnimationDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.LinearProgressDrawable_lpd_outAnimDuration) {
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
            case 2:
                drawBuffer(canvas);
                break;
            case 3:
                drawQuery(canvas);
                break;
        }
    }

    private void drawLinePath(Canvas canvas, float x1, float y1, float x2, float y2, Paint paint) {
        this.mPath.reset();
        this.mPath.moveTo(x1, y1);
        this.mPath.lineTo(x2, y2);
        canvas.drawPath(this.mPath, paint);
    }

    private void drawDeterminate(Canvas canvas) {
        Rect bounds = getBounds();
        int width = bounds.width();
        float size = 0.0f;
        if (this.mRunState == 1) {
            size = (this.mStrokeSize * Math.min(this.mInAnimationDuration, SystemClock.uptimeMillis() - this.mLastRunStateTime)) / this.mInAnimationDuration;
        } else if (this.mRunState == RUN_STATE_STOPPING) {
            size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
        } else if (this.mRunState != 0) {
            size = this.mStrokeSize;
        }
        if (size > 0.0f) {
            float y = 0.0f;
            float lineWidth = width * this.mProgressPercent;
            switch (this.mVerticalAlign) {
                case 0:
                    y = size / 2.0f;
                    break;
                case 1:
                    y = bounds.height() / 2.0f;
                    break;
                case 2:
                    y = bounds.height() - (size / 2.0f);
                    break;
            }
            this.mPaint.setStrokeWidth(size);
            this.mPaint.setStyle(Paint.Style.STROKE);
            if (this.mProgressPercent != 1.0f) {
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                if (this.mReverse) {
                    canvas.drawLine(0.0f, y, width - lineWidth, y, this.mPaint);
                } else {
                    canvas.drawLine(lineWidth, y, width, y, this.mPaint);
                }
            }
            if (this.mProgressPercent != 0.0f) {
                this.mPaint.setColor(this.mStrokeColors[0]);
                if (this.mReverse) {
                    drawLinePath(canvas, width - lineWidth, y, width, y, this.mPaint);
                } else {
                    drawLinePath(canvas, 0.0f, y, lineWidth, y, this.mPaint);
                }
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
        Rect bounds = getBounds();
        int width = bounds.width();
        float size = 0.0f;
        if (this.mRunState == 1) {
            size = (this.mStrokeSize * Math.min(this.mInAnimationDuration, SystemClock.uptimeMillis() - this.mLastRunStateTime)) / this.mInAnimationDuration;
        } else if (this.mRunState == RUN_STATE_STOPPING) {
            size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
        } else if (this.mRunState != 0) {
            size = this.mStrokeSize;
        }
        if (size > 0.0f) {
            float y = 0.0f;
            switch (this.mVerticalAlign) {
                case 0:
                    y = size / 2.0f;
                    break;
                case 1:
                    y = bounds.height() / 2.0f;
                    break;
                case 2:
                    y = bounds.height() - (size / 2.0f);
                    break;
            }
            this.mPaint.setStrokeWidth(size);
            this.mPaint.setStyle(Paint.Style.STROKE);
            float endLine = offset(this.mStartLine, this.mLineWidth, width);
            if (this.mReverse) {
                if (endLine <= this.mStartLine) {
                    this.mPaint.setColor(this.mStrokeSecondaryColor);
                    if (endLine > 0.0f) {
                        canvas.drawLine(0.0f, y, endLine, y, this.mPaint);
                    }
                    if (this.mStartLine < width) {
                        canvas.drawLine(this.mStartLine, y, width, y, this.mPaint);
                    }
                    this.mPaint.setColor(getIndeterminateStrokeColor());
                    drawLinePath(canvas, endLine, y, this.mStartLine, y, this.mPaint);
                    return;
                }
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                canvas.drawLine(this.mStartLine, y, endLine, y, this.mPaint);
                this.mPaint.setColor(getIndeterminateStrokeColor());
                this.mPath.reset();
                if (this.mStartLine > 0.0f) {
                    this.mPath.moveTo(0.0f, y);
                    this.mPath.lineTo(this.mStartLine, y);
                }
                if (endLine < width) {
                    this.mPath.moveTo(endLine, y);
                    this.mPath.lineTo(width, y);
                }
                canvas.drawPath(this.mPath, this.mPaint);
                return;
            }
            if (endLine >= this.mStartLine) {
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                if (this.mStartLine > 0.0f) {
                    canvas.drawLine(0.0f, y, this.mStartLine, y, this.mPaint);
                }
                if (endLine < width) {
                    canvas.drawLine(endLine, y, width, y, this.mPaint);
                }
                this.mPaint.setColor(getIndeterminateStrokeColor());
                drawLinePath(canvas, this.mStartLine, y, endLine, y, this.mPaint);
                return;
            }
            this.mPaint.setColor(this.mStrokeSecondaryColor);
            canvas.drawLine(endLine, y, this.mStartLine, y, this.mPaint);
            this.mPaint.setColor(getIndeterminateStrokeColor());
            this.mPath.reset();
            if (endLine > 0.0f) {
                this.mPath.moveTo(0.0f, y);
                this.mPath.lineTo(endLine, y);
            }
            if (this.mStartLine < width) {
                this.mPath.moveTo(this.mStartLine, y);
                this.mPath.lineTo(width, y);
            }
            canvas.drawPath(this.mPath, this.mPaint);
        }
    }

    private PathEffect getPathEffect() {
        if (this.mPathEffect == null) {
            this.mPathEffect = new DashPathEffect(new float[]{0.1f, this.mStrokeSize * 2}, 0.0f);
        }
        return this.mPathEffect;
    }

    private void drawBuffer(Canvas canvas) {
        Rect bounds = getBounds();
        int width = bounds.width();
        float size = 0.0f;
        if (this.mRunState == 1) {
            size = (this.mStrokeSize * Math.min(this.mInAnimationDuration, SystemClock.uptimeMillis() - this.mLastRunStateTime)) / this.mInAnimationDuration;
        } else if (this.mRunState == RUN_STATE_STOPPING) {
            size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
        } else if (this.mRunState != 0) {
            size = this.mStrokeSize;
        }
        if (size > 0.0f) {
            float y = 0.0f;
            float lineWidth = width * this.mProgressPercent;
            float secondaryLineWidth = width * this.mSecondaryProgressPercent;
            switch (this.mVerticalAlign) {
                case 0:
                    y = size / 2.0f;
                    break;
                case 1:
                    y = bounds.height() / 2.0f;
                    break;
                case 2:
                    y = bounds.height() - (size / 2.0f);
                    break;
            }
            this.mPaint.setStyle(Paint.Style.STROKE);
            if (this.mProgressPercent != 1.0f) {
                this.mPaint.setStrokeWidth(size);
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                this.mPaint.setPathEffect(null);
                if (this.mReverse) {
                    drawLinePath(canvas, width - secondaryLineWidth, y, width - lineWidth, y, this.mPaint);
                } else {
                    drawLinePath(canvas, secondaryLineWidth, y, lineWidth, y, this.mPaint);
                }
                this.mPaint.setStrokeWidth(this.mLineWidth);
                this.mPaint.setPathEffect(getPathEffect());
                float offset = (this.mStrokeSize * 2) - this.mStartLine;
                if (this.mReverse) {
                    drawLinePath(canvas, -offset, y, width - secondaryLineWidth, y, this.mPaint);
                } else {
                    drawLinePath(canvas, width + offset, y, secondaryLineWidth, y, this.mPaint);
                }
            }
            if (this.mProgressPercent != 0.0f) {
                this.mPaint.setStrokeWidth(size);
                this.mPaint.setColor(this.mStrokeColors[0]);
                this.mPaint.setPathEffect(null);
                if (this.mReverse) {
                    drawLinePath(canvas, width - lineWidth, y, width, y, this.mPaint);
                } else {
                    drawLinePath(canvas, 0.0f, y, lineWidth, y, this.mPaint);
                }
            }
        }
    }

    private int getQueryStrokeColor() {
        return ColorUtil.getColor(this.mStrokeColors[0], this.mAnimTime);
    }

    private void drawQuery(Canvas canvas) {
        Rect bounds = getBounds();
        int width = bounds.width();
        float size = 0.0f;
        if (this.mRunState == 1) {
            size = (this.mStrokeSize * Math.min(this.mInAnimationDuration, SystemClock.uptimeMillis() - this.mLastRunStateTime)) / this.mInAnimationDuration;
        } else if (this.mRunState == RUN_STATE_STOPPING) {
            size = (this.mStrokeSize * Math.max(0L, (this.mOutAnimationDuration - SystemClock.uptimeMillis()) + this.mLastRunStateTime)) / this.mOutAnimationDuration;
        } else if (this.mRunState != 0) {
            size = this.mStrokeSize;
        }
        if (size > 0.0f) {
            float y = 0.0f;
            switch (this.mVerticalAlign) {
                case 0:
                    y = size / 2.0f;
                    break;
                case 1:
                    y = bounds.height() / 2.0f;
                    break;
                case 2:
                    y = bounds.height() - (size / 2.0f);
                    break;
            }
            this.mPaint.setStrokeWidth(size);
            this.mPaint.setStyle(Paint.Style.STROKE);
            if (this.mProgressPercent != 1.0f) {
                this.mPaint.setColor(this.mStrokeSecondaryColor);
                canvas.drawLine(0.0f, y, width, y, this.mPaint);
                if (this.mAnimTime < 1.0f) {
                    float endLine = Math.max(0.0f, Math.min(width, this.mStartLine + this.mLineWidth));
                    this.mPaint.setColor(getQueryStrokeColor());
                    drawLinePath(canvas, this.mStartLine, y, endLine, y, this.mPaint);
                }
            }
            if (this.mProgressPercent != 0.0f) {
                float lineWidth = width * this.mProgressPercent;
                this.mPaint.setColor(this.mStrokeColors[0]);
                if (this.mReverse) {
                    drawLinePath(canvas, width - lineWidth, y, width, y, this.mPaint);
                } else {
                    drawLinePath(canvas, 0.0f, y, lineWidth, y, this.mPaint);
                }
            }
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
        if (this.mProgressMode == 1) {
            this.mStartLine = this.mReverse ? getBounds().width() : 0.0f;
            this.mStrokeColorIndex = 0;
            this.mLineWidth = this.mReverse ? -this.mMinLineWidth : this.mMinLineWidth;
            this.mProgressState = 0;
            return;
        }
        if (this.mProgressMode == 2) {
            this.mStartLine = 0.0f;
        } else if (this.mProgressMode == 3) {
            this.mStartLine = !this.mReverse ? getBounds().width() : 0.0f;
            this.mStrokeColorIndex = 0;
            this.mLineWidth = !this.mReverse ? -this.mMaxLineWidth : this.mMaxLineWidth;
        }
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
        if (withAnimation) {
            this.mRunState = 1;
            this.mLastRunStateTime = SystemClock.uptimeMillis();
        }
        resetAnimation();
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
            case 2:
                updateBuffer();
                break;
            case 3:
                updateQuery();
                break;
        }
    }

    private void updateDeterminate() {
        long curTime = SystemClock.uptimeMillis();
        if (this.mRunState == 1) {
            if (curTime - this.mLastRunStateTime > this.mInAnimationDuration) {
                this.mRunState = 2;
                return;
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

    private float offset(float pos, float offset, float max) {
        float pos2 = pos + offset;
        if (pos2 > max) {
            return pos2 - max;
        }
        if (pos2 < 0.0f) {
            return max + pos2;
        }
        return pos2;
    }

    private void updateIndeterminate() {
        Rect bounds = getBounds();
        int width = bounds.width();
        long curTime = SystemClock.uptimeMillis();
        float travelOffset = ((curTime - this.mLastUpdateTime) * width) / this.mTravelDuration;
        if (this.mReverse) {
            travelOffset = -travelOffset;
        }
        this.mLastUpdateTime = curTime;
        switch (this.mProgressState) {
            case 0:
                if (this.mTransformDuration <= 0) {
                    this.mLineWidth = this.mMinLineWidth == 0 ? width * this.mMinLineWidthPercent : this.mMinLineWidth;
                    if (this.mReverse) {
                        this.mLineWidth = -this.mLineWidth;
                    }
                    this.mStartLine = offset(this.mStartLine, travelOffset, width);
                    this.mProgressState = 1;
                    this.mLastProgressStateTime = curTime;
                    break;
                } else {
                    float value = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    float maxWidth = this.mMaxLineWidth == 0 ? width * this.mMaxLineWidthPercent : this.mMaxLineWidth;
                    float minWidth = this.mMinLineWidth == 0 ? width * this.mMinLineWidthPercent : this.mMinLineWidth;
                    this.mStartLine = offset(this.mStartLine, travelOffset, width);
                    this.mLineWidth = (this.mTransformInterpolator.getInterpolation(value) * (maxWidth - minWidth)) + minWidth;
                    if (this.mReverse) {
                        this.mLineWidth = -this.mLineWidth;
                    }
                    if (value > 1.0f) {
                        this.mLineWidth = this.mReverse ? -maxWidth : maxWidth;
                        this.mProgressState = 1;
                        this.mLastProgressStateTime = curTime;
                        break;
                    }
                }
                break;
            case 1:
                this.mStartLine = offset(this.mStartLine, travelOffset, width);
                if (curTime - this.mLastProgressStateTime > this.mKeepDuration) {
                    this.mProgressState = 2;
                    this.mLastProgressStateTime = curTime;
                    break;
                }
                break;
            case 2:
                if (this.mTransformDuration <= 0) {
                    this.mLineWidth = this.mMinLineWidth == 0 ? width * this.mMinLineWidthPercent : this.mMinLineWidth;
                    if (this.mReverse) {
                        this.mLineWidth = -this.mLineWidth;
                    }
                    this.mStartLine = offset(this.mStartLine, travelOffset, width);
                    this.mProgressState = 3;
                    this.mLastProgressStateTime = curTime;
                    this.mStrokeColorIndex = (this.mStrokeColorIndex + 1) % this.mStrokeColors.length;
                    break;
                } else {
                    float value2 = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    float maxWidth2 = this.mMaxLineWidth == 0 ? width * this.mMaxLineWidthPercent : this.mMaxLineWidth;
                    float minWidth2 = this.mMinLineWidth == 0 ? width * this.mMinLineWidthPercent : this.mMinLineWidth;
                    float newLineWidth = ((1.0f - this.mTransformInterpolator.getInterpolation(value2)) * (maxWidth2 - minWidth2)) + minWidth2;
                    if (this.mReverse) {
                        newLineWidth = -newLineWidth;
                    }
                    this.mStartLine = offset(this.mStartLine, (travelOffset + this.mLineWidth) - newLineWidth, width);
                    this.mLineWidth = newLineWidth;
                    if (value2 > 1.0f) {
                        this.mLineWidth = this.mReverse ? -minWidth2 : minWidth2;
                        this.mProgressState = 3;
                        this.mLastProgressStateTime = curTime;
                        this.mStrokeColorIndex = (this.mStrokeColorIndex + 1) % this.mStrokeColors.length;
                        break;
                    }
                }
                break;
            case 3:
                this.mStartLine = offset(this.mStartLine, travelOffset, width);
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

    private void updateBuffer() {
        long curTime = SystemClock.uptimeMillis();
        float maxDistance = this.mStrokeSize * 2;
        this.mStartLine += (maxDistance * (curTime - this.mLastUpdateTime)) / this.mTravelDuration;
        while (this.mStartLine > maxDistance) {
            this.mStartLine -= maxDistance;
        }
        this.mLastUpdateTime = curTime;
        switch (this.mProgressState) {
            case 0:
                if (this.mTransformDuration <= 0) {
                    this.mProgressState = 1;
                    this.mLastProgressStateTime = curTime;
                    break;
                } else {
                    float value = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    this.mLineWidth = this.mTransformInterpolator.getInterpolation(value) * this.mStrokeSize;
                    if (value > 1.0f) {
                        this.mLineWidth = this.mStrokeSize;
                        this.mProgressState = 1;
                        this.mLastProgressStateTime = curTime;
                        break;
                    }
                }
                break;
            case 1:
                if (curTime - this.mLastProgressStateTime > this.mKeepDuration) {
                    this.mProgressState = 2;
                    this.mLastProgressStateTime = curTime;
                    break;
                }
                break;
            case 2:
                if (this.mTransformDuration <= 0) {
                    this.mProgressState = 3;
                    this.mLastProgressStateTime = curTime;
                    break;
                } else {
                    float value2 = (curTime - this.mLastProgressStateTime) / this.mTransformDuration;
                    this.mLineWidth = (1.0f - this.mTransformInterpolator.getInterpolation(value2)) * this.mStrokeSize;
                    if (value2 > 1.0f) {
                        this.mLineWidth = 0.0f;
                        this.mProgressState = 3;
                        this.mLastProgressStateTime = curTime;
                        break;
                    }
                }
                break;
            case 3:
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

    private void updateQuery() {
        long curTime = SystemClock.uptimeMillis();
        this.mAnimTime = (curTime - this.mLastProgressStateTime) / this.mTravelDuration;
        boolean requestUpdate = this.mRunState == RUN_STATE_STOPPING || this.mProgressPercent == 0.0f || this.mAnimTime < 1.0f;
        if (this.mAnimTime > 1.0f) {
            this.mLastProgressStateTime = Math.round(curTime - ((this.mAnimTime - 1.0f) * this.mTravelDuration));
            this.mAnimTime -= 1.0f;
        }
        if (requestUpdate && this.mRunState != RUN_STATE_STOPPING) {
            Rect bounds = getBounds();
            int width = bounds.width();
            float maxWidth = this.mMaxLineWidth == 0 ? width * this.mMaxLineWidthPercent : this.mMaxLineWidth;
            float minWidth = this.mMinLineWidth == 0 ? width * this.mMinLineWidthPercent : this.mMinLineWidth;
            this.mLineWidth = (this.mTransformInterpolator.getInterpolation(this.mAnimTime) * (minWidth - maxWidth)) + maxWidth;
            if (this.mReverse) {
                this.mLineWidth = -this.mLineWidth;
            }
            this.mStartLine = this.mReverse ? this.mTransformInterpolator.getInterpolation(this.mAnimTime) * (width + minWidth) : ((1.0f - this.mTransformInterpolator.getInterpolation(this.mAnimTime)) * (width + minWidth)) - minWidth;
        }
        if (this.mRunState == 1) {
            if (curTime - this.mLastRunStateTime > this.mInAnimationDuration) {
                this.mRunState = 3;
            }
        } else if (this.mRunState == RUN_STATE_STOPPING && curTime - this.mLastRunStateTime > this.mOutAnimationDuration) {
            stop(false);
            return;
        }
        if (isRunning()) {
            if (requestUpdate) {
                scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
            } else if (this.mRunState == 3) {
                this.mRunState = 2;
            }
        }
        invalidateSelf();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/LinearProgressDrawable$Builder.class */
    public static class Builder {
        private float mProgressPercent;
        private float mSecondaryProgressPercent;
        private int mMaxLineWidth;
        private float mMaxLineWidthPercent;
        private int mMinLineWidth;
        private float mMinLineWidthPercent;
        private int mStrokeSize;
        private int mVerticalAlign;
        private int[] mStrokeColors;
        private int mStrokeSecondaryColor;
        private boolean mReverse;
        private int mTravelDuration;
        private int mTransformDuration;
        private int mKeepDuration;
        private Interpolator mTransformInterpolator;
        private int mProgressMode;
        private int mInAnimationDuration;
        private int mOutAnimationDuration;

        public Builder() {
            this.mProgressPercent = 0.0f;
            this.mSecondaryProgressPercent = 0.0f;
            this.mStrokeSize = 8;
            this.mVerticalAlign = 2;
            this.mReverse = false;
            this.mTravelDuration = 1000;
            this.mTransformDuration = 800;
            this.mKeepDuration = 200;
            this.mProgressMode = 1;
            this.mInAnimationDuration = 400;
            this.mOutAnimationDuration = 400;
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            this.mProgressPercent = 0.0f;
            this.mSecondaryProgressPercent = 0.0f;
            this.mStrokeSize = 8;
            this.mVerticalAlign = 2;
            this.mReverse = false;
            this.mTravelDuration = 1000;
            this.mTransformDuration = 800;
            this.mKeepDuration = 200;
            this.mProgressMode = 1;
            this.mInAnimationDuration = 400;
            this.mOutAnimationDuration = 400;
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.LinearProgressDrawable, defStyleAttr, defStyleRes);
            progressPercent(a.getFloat(R.styleable.LinearProgressDrawable_pv_progress, 0.0f));
            secondaryProgressPercent(a.getFloat(R.styleable.LinearProgressDrawable_pv_secondaryProgress, 0.0f));
            TypedValue value = a.peekValue(R.styleable.LinearProgressDrawable_lpd_maxLineWidth);
            if (value == null) {
                maxLineWidth(0.75f);
            } else if (value.type == 6) {
                maxLineWidth(a.getFraction(R.styleable.LinearProgressDrawable_lpd_maxLineWidth, 1, 1, 0.75f));
            } else {
                maxLineWidth(a.getDimensionPixelSize(R.styleable.LinearProgressDrawable_lpd_maxLineWidth, 0));
            }
            TypedValue value2 = a.peekValue(R.styleable.LinearProgressDrawable_lpd_minLineWidth);
            if (value2 == null) {
                minLineWidth(0.25f);
            } else if (value2.type == 6) {
                minLineWidth(a.getFraction(R.styleable.LinearProgressDrawable_lpd_minLineWidth, 1, 1, 0.25f));
            } else {
                minLineWidth(a.getDimensionPixelSize(R.styleable.LinearProgressDrawable_lpd_minLineWidth, 0));
            }
            strokeSize(a.getDimensionPixelSize(R.styleable.LinearProgressDrawable_lpd_strokeSize, ThemeUtil.dpToPx(context, LinearProgressDrawable.RUN_STATE_STOPPING)));
            verticalAlign(a.getInteger(R.styleable.LinearProgressDrawable_lpd_verticalAlign, 2));
            strokeColors(a.getColor(R.styleable.LinearProgressDrawable_lpd_strokeColor, ThemeUtil.colorPrimary(context, -16777216)));
            int resId = a.getResourceId(R.styleable.LinearProgressDrawable_lpd_strokeColors, 0);
            if (resId != 0) {
                TypedArray ta = context.getResources().obtainTypedArray(resId);
                int[] colors = new int[ta.length()];
                for (int j = 0; j < ta.length(); j++) {
                    colors[j] = ta.getColor(j, 0);
                }
                ta.recycle();
                strokeColors(colors);
            }
            strokeSecondaryColor(a.getColor(R.styleable.LinearProgressDrawable_lpd_strokeSecondaryColor, 0));
            reverse(a.getBoolean(R.styleable.LinearProgressDrawable_lpd_reverse, false));
            travelDuration(a.getInteger(R.styleable.LinearProgressDrawable_lpd_travelDuration, context.getResources().getInteger(android.R.integer.config_longAnimTime)));
            transformDuration(a.getInteger(R.styleable.LinearProgressDrawable_lpd_transformDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            keepDuration(a.getInteger(R.styleable.LinearProgressDrawable_lpd_keepDuration, context.getResources().getInteger(android.R.integer.config_shortAnimTime)));
            int resId2 = a.getResourceId(R.styleable.LinearProgressDrawable_lpd_transformInterpolator, 0);
            if (resId2 != 0) {
                transformInterpolator(AnimationUtils.loadInterpolator(context, resId2));
            }
            progressMode(a.getInteger(R.styleable.LinearProgressDrawable_pv_progressMode, 1));
            inAnimDuration(a.getInteger(R.styleable.LinearProgressDrawable_lpd_inAnimDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            outAnimDuration(a.getInteger(R.styleable.LinearProgressDrawable_lpd_outAnimDuration, context.getResources().getInteger(android.R.integer.config_mediumAnimTime)));
            a.recycle();
        }

        public LinearProgressDrawable build() {
            if (this.mStrokeColors == null) {
                this.mStrokeColors = new int[]{-16737793};
            }
            if (this.mTransformInterpolator == null) {
                this.mTransformInterpolator = new DecelerateInterpolator();
            }
            return new LinearProgressDrawable(this.mProgressPercent, this.mSecondaryProgressPercent, this.mMaxLineWidth, this.mMaxLineWidthPercent, this.mMinLineWidth, this.mMinLineWidthPercent, this.mStrokeSize, this.mVerticalAlign, this.mStrokeColors, this.mStrokeSecondaryColor, this.mReverse, this.mTravelDuration, this.mTransformDuration, this.mKeepDuration, this.mTransformInterpolator, this.mProgressMode, this.mInAnimationDuration, this.mOutAnimationDuration);
        }

        public Builder secondaryProgressPercent(float percent) {
            this.mSecondaryProgressPercent = percent;
            return this;
        }

        public Builder progressPercent(float percent) {
            this.mProgressPercent = percent;
            return this;
        }

        public Builder maxLineWidth(int width) {
            this.mMaxLineWidth = width;
            return this;
        }

        public Builder maxLineWidth(float percent) {
            this.mMaxLineWidthPercent = Math.max(0.0f, Math.min(1.0f, percent));
            this.mMaxLineWidth = 0;
            return this;
        }

        public Builder minLineWidth(int width) {
            this.mMinLineWidth = width;
            return this;
        }

        public Builder minLineWidth(float percent) {
            this.mMinLineWidthPercent = Math.max(0.0f, Math.min(1.0f, percent));
            this.mMinLineWidth = 0;
            return this;
        }

        public Builder strokeSize(int strokeSize) {
            this.mStrokeSize = strokeSize;
            return this;
        }

        public Builder verticalAlign(int align) {
            this.mVerticalAlign = align;
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

        public Builder travelDuration(int duration) {
            this.mTravelDuration = duration;
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

        public Builder outAnimDuration(int duration) {
            this.mOutAnimationDuration = duration;
            return this;
        }
    }
}
