package com.afollestad.materialdialogs.progress;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.util.Property;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;

@TargetApi(14)
/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/progress/CircularProgressDrawable.class */
public class CircularProgressDrawable extends Drawable implements Animatable {
    private static final Interpolator ANGLE_INTERPOLATOR = new LinearInterpolator();
    private static final Interpolator SWEEP_INTERPOLATOR = new DecelerateInterpolator();
    private static final int ANGLE_ANIMATOR_DURATION = 2000;
    private static final int SWEEP_ANIMATOR_DURATION = 600;
    private static final int MIN_SWEEP_ANGLE = 30;
    private ObjectAnimator mObjectAnimatorSweep;
    private ObjectAnimator mObjectAnimatorAngle;
    private boolean mModeAppearing;
    private float mCurrentGlobalAngleOffset;
    private float mCurrentGlobalAngle;
    private float mCurrentSweepAngle;
    private float mBorderWidth;
    private boolean mRunning;
    private final RectF fBounds = new RectF();
    private Property<CircularProgressDrawable, Float> mAngleProperty = new Property<CircularProgressDrawable, Float>(Float.class, "angle") { // from class: com.afollestad.materialdialogs.progress.CircularProgressDrawable.1
        @Override // android.util.Property
        public Float get(CircularProgressDrawable object) {
            return Float.valueOf(object.getCurrentGlobalAngle());
        }

        @Override // android.util.Property
        public void set(CircularProgressDrawable object, Float value) {
            object.setCurrentGlobalAngle(value.floatValue());
        }
    };
    private Property<CircularProgressDrawable, Float> mSweepProperty = new Property<CircularProgressDrawable, Float>(Float.class, "arc") { // from class: com.afollestad.materialdialogs.progress.CircularProgressDrawable.2
        @Override // android.util.Property
        public Float get(CircularProgressDrawable object) {
            return Float.valueOf(object.getCurrentSweepAngle());
        }

        @Override // android.util.Property
        public void set(CircularProgressDrawable object, Float value) {
            object.setCurrentSweepAngle(value.floatValue());
        }
    };
    private Paint mPaint = new Paint();

    public CircularProgressDrawable(int color, float borderWidth) {
        this.mBorderWidth = borderWidth;
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeWidth(borderWidth);
        this.mPaint.setColor(color);
        setupAnimations();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        float sweepAngle;
        float startAngle = this.mCurrentGlobalAngle - this.mCurrentGlobalAngleOffset;
        float sweepAngle2 = this.mCurrentSweepAngle;
        if (!this.mModeAppearing) {
            startAngle += sweepAngle2;
            sweepAngle = (360.0f - sweepAngle2) - 30.0f;
        } else {
            sweepAngle = sweepAngle2 + 30.0f;
        }
        canvas.drawArc(this.fBounds, startAngle, sweepAngle, false, this.mPaint);
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
        return -2;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (isRunning()) {
            return;
        }
        this.mRunning = true;
        this.mObjectAnimatorAngle.start();
        this.mObjectAnimatorSweep.start();
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (!isRunning()) {
            return;
        }
        this.mRunning = false;
        this.mObjectAnimatorAngle.cancel();
        this.mObjectAnimatorSweep.cancel();
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return this.mRunning;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.fBounds.left = bounds.left + (this.mBorderWidth / 2.0f) + 0.5f;
        this.fBounds.right = (bounds.right - (this.mBorderWidth / 2.0f)) - 0.5f;
        this.fBounds.top = bounds.top + (this.mBorderWidth / 2.0f) + 0.5f;
        this.fBounds.bottom = (bounds.bottom - (this.mBorderWidth / 2.0f)) - 0.5f;
    }

    public void setCurrentGlobalAngle(float currentGlobalAngle) {
        this.mCurrentGlobalAngle = currentGlobalAngle;
        invalidateSelf();
    }

    public float getCurrentGlobalAngle() {
        return this.mCurrentGlobalAngle;
    }

    public void setCurrentSweepAngle(float currentSweepAngle) {
        this.mCurrentSweepAngle = currentSweepAngle;
        invalidateSelf();
    }

    public float getCurrentSweepAngle() {
        return this.mCurrentSweepAngle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggleAppearingMode() {
        this.mModeAppearing = !this.mModeAppearing;
        if (this.mModeAppearing) {
            this.mCurrentGlobalAngleOffset = (this.mCurrentGlobalAngleOffset + 60.0f) % 360.0f;
        }
    }

    private void setupAnimations() {
        this.mObjectAnimatorAngle = ObjectAnimator.ofFloat(this, this.mAngleProperty, 360.0f);
        this.mObjectAnimatorAngle.setInterpolator(ANGLE_INTERPOLATOR);
        this.mObjectAnimatorAngle.setDuration(2000L);
        this.mObjectAnimatorAngle.setRepeatMode(1);
        this.mObjectAnimatorAngle.setRepeatCount(-1);
        this.mObjectAnimatorSweep = ObjectAnimator.ofFloat(this, this.mSweepProperty, 300.0f);
        this.mObjectAnimatorSweep.setInterpolator(SWEEP_INTERPOLATOR);
        this.mObjectAnimatorSweep.setDuration(600L);
        this.mObjectAnimatorSweep.setRepeatMode(1);
        this.mObjectAnimatorSweep.setRepeatCount(-1);
        this.mObjectAnimatorSweep.addListener(new Animator.AnimatorListener() { // from class: com.afollestad.materialdialogs.progress.CircularProgressDrawable.3
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animation) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animation) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animation) {
                CircularProgressDrawable.this.toggleAppearingMode();
            }
        });
    }
}
