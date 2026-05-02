package com.jpardogo.android.googleprogressbar.library;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;

/* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable.class */
public class NexusRotationCrossDrawable extends Drawable implements Drawable.Callback {
    private static final int ANIMATION_DURATION = 150;
    private static final int ANIMATION_START_DELAY = 300;
    private static final Interpolator LINEAR_INTERPOLATOR = new LinearInterpolator();
    private int mCenter;
    private Point[] mArrowPoints = new Point[5];
    private Path mPath = new Path();
    private Paint mPaint1 = new Paint(1);
    private Paint mPaint2;
    private Paint mPaint3;
    private Paint mPaint4;
    private int mRotationAngle;

    public NexusRotationCrossDrawable(int[] colors) {
        this.mPaint1.setColor(colors[0]);
        this.mPaint2 = new Paint(1);
        this.mPaint2.setColor(colors[1]);
        this.mPaint3 = new Paint(1);
        this.mPaint3.setColor(colors[2]);
        this.mPaint4 = new Paint(1);
        this.mPaint4.setColor(colors[3]);
        initObjectAnimator();
    }

    private void initObjectAnimator() {
        final ObjectAnimator objectAnimator = ObjectAnimator.ofInt(this, "rotationAngle", 0, 180);
        objectAnimator.setInterpolator(LINEAR_INTERPOLATOR);
        objectAnimator.setDuration(150L);
        objectAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.jpardogo.android.googleprogressbar.library.NexusRotationCrossDrawable.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                if (NexusRotationCrossDrawable.this.mRotationAngle == 180) {
                    objectAnimator.setIntValues(180, 360);
                    objectAnimator.setStartDelay(600L);
                } else {
                    objectAnimator.setIntValues(0, 180);
                    objectAnimator.setStartDelay(300L);
                    NexusRotationCrossDrawable.this.mRotationAngle = 0;
                }
                objectAnimator.start();
            }
        });
        objectAnimator.start();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        drawArrows(canvas);
    }

    private void drawArrows(Canvas canvas) {
        canvas.rotate(this.mRotationAngle, this.mCenter, this.mCenter);
        this.mPath.reset();
        this.mPath.moveTo(this.mArrowPoints[0].x, this.mArrowPoints[0].y);
        for (int i = 1; i < this.mArrowPoints.length; i++) {
            this.mPath.lineTo(this.mArrowPoints[i].x, this.mArrowPoints[i].y);
        }
        this.mPath.lineTo(this.mArrowPoints[0].x, this.mArrowPoints[0].y);
        canvas.save();
        canvas.drawPath(this.mPath, this.mPaint1);
        canvas.restore();
        canvas.save();
        canvas.rotate(90.0f, this.mCenter, this.mCenter);
        canvas.drawPath(this.mPath, this.mPaint2);
        canvas.restore();
        canvas.save();
        canvas.rotate(180.0f, this.mCenter, this.mCenter);
        canvas.drawPath(this.mPath, this.mPaint3);
        canvas.restore();
        canvas.save();
        canvas.rotate(270.0f, this.mCenter, this.mCenter);
        canvas.drawPath(this.mPath, this.mPaint4);
        canvas.restore();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.invalidateDrawable(this);
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.scheduleDrawable(this, what, when);
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.unscheduleDrawable(this, what);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint1.setAlpha(alpha);
        this.mPaint2.setAlpha(alpha);
        this.mPaint3.setAlpha(alpha);
        this.mPaint4.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint1.setColorFilter(cf);
        this.mPaint2.setColorFilter(cf);
        this.mPaint3.setColorFilter(cf);
        this.mPaint4.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        measureDrawable(bounds);
    }

    private void measureDrawable(Rect bounds) {
        this.mCenter = bounds.centerX();
        int arrowMargin = bounds.width() / 50;
        int arrowWidth = bounds.width() / 15;
        int padding = this.mCenter - ((int) (this.mCenter / Math.sqrt(2.0d)));
        this.mArrowPoints[0] = new Point(this.mCenter - arrowMargin, this.mCenter - arrowMargin);
        this.mArrowPoints[1] = new Point(this.mArrowPoints[0].x, this.mArrowPoints[0].y - arrowWidth);
        this.mArrowPoints[2] = new Point(padding + arrowWidth, padding);
        this.mArrowPoints[3] = new Point(padding, padding + arrowWidth);
        this.mArrowPoints[4] = new Point(this.mArrowPoints[0].x - arrowWidth, this.mArrowPoints[0].y);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    void setRotationAngle(int angle) {
        this.mRotationAngle = angle;
    }

    int getRotationAngle() {
        return this.mRotationAngle;
    }

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder.class */
    public static class Builder {
        private int[] mColors;

        public Builder(Context context) {
            initDefaults(context);
        }

        private void initDefaults(Context context) {
            this.mColors = context.getResources().getIntArray(R.array.google_colors);
        }

        public Builder colors(int[] colors) {
            if (colors == null || colors.length != 4) {
                throw new IllegalArgumentException("Your color array must contains 4 values");
            }
            this.mColors = colors;
            return this;
        }

        public Drawable build() {
            return new NexusRotationCrossDrawable(this.mColors);
        }
    }
}
