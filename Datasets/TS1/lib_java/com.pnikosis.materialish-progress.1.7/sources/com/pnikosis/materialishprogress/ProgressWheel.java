package com.pnikosis.materialishprogress;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;

/* loaded from: com.pnikosis.materialish-progress.1.7.jar:com/pnikosis/materialishprogress/ProgressWheel.class */
public class ProgressWheel extends View {
    private static final String TAG = ProgressWheel.class.getSimpleName();
    private final int barLength = 16;
    private final int barMaxLength = 270;
    private final long pauseGrowingTime = 200;
    private int circleRadius;
    private int barWidth;
    private int rimWidth;
    private boolean fillRadius;
    private double timeStartGrowing;
    private double barSpinCycleTime;
    private float barExtraLength;
    private boolean barGrowingFromFront;
    private long pausedTimeWithoutGrowing;
    private int barColor;
    private int rimColor;
    private Paint barPaint;
    private Paint rimPaint;
    private RectF circleBounds;
    private float spinSpeed;
    private long lastTimeAnimated;
    private boolean linearProgress;
    private float mProgress;
    private float mTargetProgress;
    private boolean isSpinning;
    private ProgressCallback callback;
    private boolean shouldAnimate;

    /* loaded from: com.pnikosis.materialish-progress.1.7.jar:com/pnikosis/materialishprogress/ProgressWheel$ProgressCallback.class */
    public interface ProgressCallback {
        void onProgressUpdate(float f);
    }

    public ProgressWheel(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.barLength = 16;
        this.barMaxLength = 270;
        this.pauseGrowingTime = 200L;
        this.circleRadius = 28;
        this.barWidth = 4;
        this.rimWidth = 4;
        this.fillRadius = false;
        this.timeStartGrowing = 0.0d;
        this.barSpinCycleTime = 460.0d;
        this.barExtraLength = 0.0f;
        this.barGrowingFromFront = true;
        this.pausedTimeWithoutGrowing = 0L;
        this.barColor = -1442840576;
        this.rimColor = 16777215;
        this.barPaint = new Paint();
        this.rimPaint = new Paint();
        this.circleBounds = new RectF();
        this.spinSpeed = 230.0f;
        this.lastTimeAnimated = 0L;
        this.mProgress = 0.0f;
        this.mTargetProgress = 0.0f;
        this.isSpinning = false;
        parseAttributes(context.obtainStyledAttributes(attrs, R.styleable.ProgressWheel));
        setAnimationEnabled();
    }

    public ProgressWheel(Context context) {
        super(context);
        this.barLength = 16;
        this.barMaxLength = 270;
        this.pauseGrowingTime = 200L;
        this.circleRadius = 28;
        this.barWidth = 4;
        this.rimWidth = 4;
        this.fillRadius = false;
        this.timeStartGrowing = 0.0d;
        this.barSpinCycleTime = 460.0d;
        this.barExtraLength = 0.0f;
        this.barGrowingFromFront = true;
        this.pausedTimeWithoutGrowing = 0L;
        this.barColor = -1442840576;
        this.rimColor = 16777215;
        this.barPaint = new Paint();
        this.rimPaint = new Paint();
        this.circleBounds = new RectF();
        this.spinSpeed = 230.0f;
        this.lastTimeAnimated = 0L;
        this.mProgress = 0.0f;
        this.mTargetProgress = 0.0f;
        this.isSpinning = false;
        setAnimationEnabled();
    }

    @TargetApi(17)
    private void setAnimationEnabled() {
        float animationValue;
        int currentApiVersion = Build.VERSION.SDK_INT;
        if (currentApiVersion >= 17) {
            animationValue = Settings.Global.getFloat(getContext().getContentResolver(), "animator_duration_scale", 1.0f);
        } else {
            animationValue = Settings.System.getFloat(getContext().getContentResolver(), "animator_duration_scale", 1.0f);
        }
        this.shouldAnimate = animationValue != 0.0f;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width;
        int height;
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int viewWidth = this.circleRadius + getPaddingLeft() + getPaddingRight();
        int viewHeight = this.circleRadius + getPaddingTop() + getPaddingBottom();
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        if (widthMode == 1073741824) {
            width = widthSize;
        } else if (widthMode == Integer.MIN_VALUE) {
            width = Math.min(viewWidth, widthSize);
        } else {
            width = viewWidth;
        }
        if (heightMode == 1073741824 || widthMode == 1073741824) {
            height = heightSize;
        } else if (heightMode == Integer.MIN_VALUE) {
            height = Math.min(viewHeight, heightSize);
        } else {
            height = viewHeight;
        }
        setMeasuredDimension(width, height);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        setupBounds(w, h);
        setupPaints();
        invalidate();
    }

    private void setupPaints() {
        this.barPaint.setColor(this.barColor);
        this.barPaint.setAntiAlias(true);
        this.barPaint.setStyle(Paint.Style.STROKE);
        this.barPaint.setStrokeWidth(this.barWidth);
        this.rimPaint.setColor(this.rimColor);
        this.rimPaint.setAntiAlias(true);
        this.rimPaint.setStyle(Paint.Style.STROKE);
        this.rimPaint.setStrokeWidth(this.rimWidth);
    }

    private void setupBounds(int layout_width, int layout_height) {
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        if (!this.fillRadius) {
            int minValue = Math.min((layout_width - paddingLeft) - paddingRight, (layout_height - paddingBottom) - paddingTop);
            int circleDiameter = Math.min(minValue, (this.circleRadius * 2) - (this.barWidth * 2));
            int xOffset = ((((layout_width - paddingLeft) - paddingRight) - circleDiameter) / 2) + paddingLeft;
            int yOffset = ((((layout_height - paddingTop) - paddingBottom) - circleDiameter) / 2) + paddingTop;
            this.circleBounds = new RectF(xOffset + this.barWidth, yOffset + this.barWidth, (xOffset + circleDiameter) - this.barWidth, (yOffset + circleDiameter) - this.barWidth);
            return;
        }
        this.circleBounds = new RectF(paddingLeft + this.barWidth, paddingTop + this.barWidth, (layout_width - paddingRight) - this.barWidth, (layout_height - paddingBottom) - this.barWidth);
    }

    private void parseAttributes(TypedArray a) {
        DisplayMetrics metrics = getContext().getResources().getDisplayMetrics();
        this.barWidth = (int) TypedValue.applyDimension(1, this.barWidth, metrics);
        this.rimWidth = (int) TypedValue.applyDimension(1, this.rimWidth, metrics);
        this.circleRadius = (int) TypedValue.applyDimension(1, this.circleRadius, metrics);
        this.circleRadius = (int) a.getDimension(R.styleable.ProgressWheel_matProg_circleRadius, this.circleRadius);
        this.fillRadius = a.getBoolean(R.styleable.ProgressWheel_matProg_fillRadius, false);
        this.barWidth = (int) a.getDimension(R.styleable.ProgressWheel_matProg_barWidth, this.barWidth);
        this.rimWidth = (int) a.getDimension(R.styleable.ProgressWheel_matProg_rimWidth, this.rimWidth);
        float baseSpinSpeed = a.getFloat(R.styleable.ProgressWheel_matProg_spinSpeed, this.spinSpeed / 360.0f);
        this.spinSpeed = baseSpinSpeed * 360.0f;
        this.barSpinCycleTime = a.getInt(R.styleable.ProgressWheel_matProg_barSpinCycleTime, (int) this.barSpinCycleTime);
        this.barColor = a.getColor(R.styleable.ProgressWheel_matProg_barColor, this.barColor);
        this.rimColor = a.getColor(R.styleable.ProgressWheel_matProg_rimColor, this.rimColor);
        this.linearProgress = a.getBoolean(R.styleable.ProgressWheel_matProg_linearProgress, false);
        if (a.getBoolean(R.styleable.ProgressWheel_matProg_progressIndeterminate, false)) {
            spin();
        }
        a.recycle();
    }

    public void setCallback(ProgressCallback progressCallback) {
        this.callback = progressCallback;
        if (!this.isSpinning) {
            runCallback();
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawArc(this.circleBounds, 360.0f, 360.0f, false, this.rimPaint);
        boolean mustInvalidate = false;
        if (!this.shouldAnimate) {
            return;
        }
        if (this.isSpinning) {
            mustInvalidate = true;
            long deltaTime = SystemClock.uptimeMillis() - this.lastTimeAnimated;
            float deltaNormalized = (deltaTime * this.spinSpeed) / 1000.0f;
            updateBarLength(deltaTime);
            this.mProgress += deltaNormalized;
            if (this.mProgress > 360.0f) {
                this.mProgress -= 360.0f;
                runCallback(-1.0f);
            }
            this.lastTimeAnimated = SystemClock.uptimeMillis();
            float from = this.mProgress - 90.0f;
            float length = 16.0f + this.barExtraLength;
            if (isInEditMode()) {
                from = 0.0f;
                length = 135.0f;
            }
            canvas.drawArc(this.circleBounds, from, length, false, this.barPaint);
        } else {
            float oldProgress = this.mProgress;
            if (this.mProgress != this.mTargetProgress) {
                mustInvalidate = true;
                float deltaNormalized2 = ((SystemClock.uptimeMillis() - this.lastTimeAnimated) / 1000.0f) * this.spinSpeed;
                this.mProgress = Math.min(this.mProgress + deltaNormalized2, this.mTargetProgress);
                this.lastTimeAnimated = SystemClock.uptimeMillis();
            }
            if (oldProgress != this.mProgress) {
                runCallback();
            }
            float offset = 0.0f;
            float progress = this.mProgress;
            if (!this.linearProgress) {
                offset = ((float) (1.0d - Math.pow(1.0f - (this.mProgress / 360.0f), 2.0f * 2.0f))) * 360.0f;
                progress = ((float) (1.0d - Math.pow(1.0f - (this.mProgress / 360.0f), 2.0f))) * 360.0f;
            }
            if (isInEditMode()) {
                progress = 360.0f;
            }
            canvas.drawArc(this.circleBounds, offset - 90.0f, progress, false, this.barPaint);
        }
        if (mustInvalidate) {
            invalidate();
        }
    }

    @Override // android.view.View
    protected void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (visibility == 0) {
            this.lastTimeAnimated = SystemClock.uptimeMillis();
        }
    }

    private void updateBarLength(long deltaTimeInMilliSeconds) {
        if (this.pausedTimeWithoutGrowing >= 200) {
            this.timeStartGrowing += deltaTimeInMilliSeconds;
            if (this.timeStartGrowing > this.barSpinCycleTime) {
                this.timeStartGrowing -= this.barSpinCycleTime;
                this.pausedTimeWithoutGrowing = 0L;
                this.barGrowingFromFront = !this.barGrowingFromFront;
            }
            float distance = (((float) Math.cos(((this.timeStartGrowing / this.barSpinCycleTime) + 1.0d) * 3.141592653589793d)) / 2.0f) + 0.5f;
            if (this.barGrowingFromFront) {
                this.barExtraLength = distance * 254.0f;
                return;
            }
            float newLength = 254.0f * (1.0f - distance);
            this.mProgress += this.barExtraLength - newLength;
            this.barExtraLength = newLength;
            return;
        }
        this.pausedTimeWithoutGrowing += deltaTimeInMilliSeconds;
    }

    public boolean isSpinning() {
        return this.isSpinning;
    }

    public void resetCount() {
        this.mProgress = 0.0f;
        this.mTargetProgress = 0.0f;
        invalidate();
    }

    public void stopSpinning() {
        this.isSpinning = false;
        this.mProgress = 0.0f;
        this.mTargetProgress = 0.0f;
        invalidate();
    }

    public void spin() {
        this.lastTimeAnimated = SystemClock.uptimeMillis();
        this.isSpinning = true;
        invalidate();
    }

    private void runCallback(float value) {
        if (this.callback != null) {
            this.callback.onProgressUpdate(value);
        }
    }

    private void runCallback() {
        if (this.callback != null) {
            float normalizedProgress = Math.round((this.mProgress * 100.0f) / 360.0f) / 100.0f;
            this.callback.onProgressUpdate(normalizedProgress);
        }
    }

    public void setInstantProgress(float progress) {
        if (this.isSpinning) {
            this.mProgress = 0.0f;
            this.isSpinning = false;
        }
        if (progress > 1.0f) {
            progress -= 1.0f;
        } else if (progress < 0.0f) {
            progress = 0.0f;
        }
        if (progress == this.mTargetProgress) {
            return;
        }
        this.mTargetProgress = Math.min(progress * 360.0f, 360.0f);
        this.mProgress = this.mTargetProgress;
        this.lastTimeAnimated = SystemClock.uptimeMillis();
        invalidate();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        WheelSavedState ss = new WheelSavedState(superState);
        ss.mProgress = this.mProgress;
        ss.mTargetProgress = this.mTargetProgress;
        ss.isSpinning = this.isSpinning;
        ss.spinSpeed = this.spinSpeed;
        ss.barWidth = this.barWidth;
        ss.barColor = this.barColor;
        ss.rimWidth = this.rimWidth;
        ss.rimColor = this.rimColor;
        ss.circleRadius = this.circleRadius;
        ss.linearProgress = this.linearProgress;
        ss.fillRadius = this.fillRadius;
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof WheelSavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        WheelSavedState ss = (WheelSavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.mProgress = ss.mProgress;
        this.mTargetProgress = ss.mTargetProgress;
        this.isSpinning = ss.isSpinning;
        this.spinSpeed = ss.spinSpeed;
        this.barWidth = ss.barWidth;
        this.barColor = ss.barColor;
        this.rimWidth = ss.rimWidth;
        this.rimColor = ss.rimColor;
        this.circleRadius = ss.circleRadius;
        this.linearProgress = ss.linearProgress;
        this.fillRadius = ss.fillRadius;
        this.lastTimeAnimated = SystemClock.uptimeMillis();
    }

    public float getProgress() {
        if (this.isSpinning) {
            return -1.0f;
        }
        return this.mProgress / 360.0f;
    }

    public void setProgress(float progress) {
        if (this.isSpinning) {
            this.mProgress = 0.0f;
            this.isSpinning = false;
            runCallback();
        }
        if (progress > 1.0f) {
            progress -= 1.0f;
        } else if (progress < 0.0f) {
            progress = 0.0f;
        }
        if (progress == this.mTargetProgress) {
            return;
        }
        if (this.mProgress == this.mTargetProgress) {
            this.lastTimeAnimated = SystemClock.uptimeMillis();
        }
        this.mTargetProgress = Math.min(progress * 360.0f, 360.0f);
        invalidate();
    }

    public void setLinearProgress(boolean isLinear) {
        this.linearProgress = isLinear;
        if (!this.isSpinning) {
            invalidate();
        }
    }

    public int getCircleRadius() {
        return this.circleRadius;
    }

    public void setCircleRadius(int circleRadius) {
        this.circleRadius = circleRadius;
        if (!this.isSpinning) {
            invalidate();
        }
    }

    public int getBarWidth() {
        return this.barWidth;
    }

    public void setBarWidth(int barWidth) {
        this.barWidth = barWidth;
        if (!this.isSpinning) {
            invalidate();
        }
    }

    public int getBarColor() {
        return this.barColor;
    }

    public void setBarColor(int barColor) {
        this.barColor = barColor;
        setupPaints();
        if (!this.isSpinning) {
            invalidate();
        }
    }

    public int getRimColor() {
        return this.rimColor;
    }

    public void setRimColor(int rimColor) {
        this.rimColor = rimColor;
        setupPaints();
        if (!this.isSpinning) {
            invalidate();
        }
    }

    public float getSpinSpeed() {
        return this.spinSpeed / 360.0f;
    }

    public void setSpinSpeed(float spinSpeed) {
        this.spinSpeed = spinSpeed * 360.0f;
    }

    public int getRimWidth() {
        return this.rimWidth;
    }

    public void setRimWidth(int rimWidth) {
        this.rimWidth = rimWidth;
        if (!this.isSpinning) {
            invalidate();
        }
    }

    /* loaded from: com.pnikosis.materialish-progress.1.7.jar:com/pnikosis/materialishprogress/ProgressWheel$WheelSavedState.class */
    static class WheelSavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<WheelSavedState> CREATOR = new Parcelable.Creator<WheelSavedState>() { // from class: com.pnikosis.materialishprogress.ProgressWheel.WheelSavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public WheelSavedState createFromParcel(Parcel in) {
                return new WheelSavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public WheelSavedState[] newArray(int size) {
                return new WheelSavedState[size];
            }
        };
        float mProgress;
        float mTargetProgress;
        boolean isSpinning;
        float spinSpeed;
        int barWidth;
        int barColor;
        int rimWidth;
        int rimColor;
        int circleRadius;
        boolean linearProgress;
        boolean fillRadius;

        WheelSavedState(Parcelable superState) {
            super(superState);
        }

        private WheelSavedState(Parcel in) {
            super(in);
            this.mProgress = in.readFloat();
            this.mTargetProgress = in.readFloat();
            this.isSpinning = in.readByte() != 0;
            this.spinSpeed = in.readFloat();
            this.barWidth = in.readInt();
            this.barColor = in.readInt();
            this.rimWidth = in.readInt();
            this.rimColor = in.readInt();
            this.circleRadius = in.readInt();
            this.linearProgress = in.readByte() != 0;
            this.fillRadius = in.readByte() != 0;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeFloat(this.mProgress);
            out.writeFloat(this.mTargetProgress);
            out.writeByte((byte) (this.isSpinning ? 1 : 0));
            out.writeFloat(this.spinSpeed);
            out.writeInt(this.barWidth);
            out.writeInt(this.barColor);
            out.writeInt(this.rimWidth);
            out.writeInt(this.rimColor);
            out.writeInt(this.circleRadius);
            out.writeByte((byte) (this.linearProgress ? 1 : 0));
            out.writeByte((byte) (this.fillRadius ? 1 : 0));
        }
    }
}
