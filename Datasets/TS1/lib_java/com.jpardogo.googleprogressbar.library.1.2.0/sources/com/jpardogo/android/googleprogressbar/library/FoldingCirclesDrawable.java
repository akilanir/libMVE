package com.jpardogo.android.googleprogressbar.library;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable.class */
public class FoldingCirclesDrawable extends Drawable implements Drawable.Callback {
    private static final int ALPHA_OPAQUE = 255;
    private static final int ALPHA_ABOVE_DEFAULT = 235;
    private Paint mFstHalfPaint;
    private Paint mScndHalfPaint;
    private Paint mAbovePaint;
    private int mDiameter;
    private Path mPath;
    private int mHalf;
    private ProgressStates mCurrentState;
    private int mControlPointMinimum;
    private int mControlPointMaximum;
    private int mAxisValue;
    private ColorFilter mColorFilter;
    private static int mColor1;
    private static int mColor2;
    private static int mColor3;
    private static int mColor4;
    private int fstColor;
    private int scndColor;
    private boolean goesBackward;
    private static final float CIRCLE_COUNT = ProgressStates.values().length;
    private static final float MAX_LEVEL = 10000.0f;
    private static final float MAX_LEVEL_PER_CIRCLE = MAX_LEVEL / CIRCLE_COUNT;
    private RectF mOval = new RectF();
    private int mAlpha = ALPHA_OPAQUE;

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$ProgressStates.class */
    private enum ProgressStates {
        FOLDING_DOWN,
        FOLDING_LEFT,
        FOLDING_UP,
        FOLDING_RIGHT
    }

    public FoldingCirclesDrawable(int[] colors) {
        initCirclesProgress(colors);
    }

    private void initCirclesProgress(int[] colors) {
        initColors(colors);
        this.mPath = new Path();
        Paint basePaint = new Paint();
        basePaint.setAntiAlias(true);
        this.mFstHalfPaint = new Paint(basePaint);
        this.mScndHalfPaint = new Paint(basePaint);
        this.mAbovePaint = new Paint(basePaint);
        setAlpha(this.mAlpha);
        setColorFilter(this.mColorFilter);
    }

    private void initColors(int[] colors) {
        mColor1 = colors[0];
        mColor2 = colors[1];
        mColor3 = colors[2];
        mColor4 = colors[3];
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        measureCircleProgress(bounds.width(), bounds.height());
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        boolean halfPassed;
        int animationLevel = ((float) level) == MAX_LEVEL ? 0 : level;
        int stateForLevel = (int) (animationLevel / MAX_LEVEL_PER_CIRCLE);
        this.mCurrentState = ProgressStates.values()[stateForLevel];
        resetColor(this.mCurrentState);
        int levelForCircle = (int) (animationLevel % MAX_LEVEL_PER_CIRCLE);
        if (!this.goesBackward) {
            halfPassed = levelForCircle != ((int) (((float) animationLevel) % (MAX_LEVEL_PER_CIRCLE / 2.0f)));
        } else {
            halfPassed = levelForCircle == ((int) (((float) animationLevel) % (MAX_LEVEL_PER_CIRCLE / 2.0f)));
            levelForCircle = (int) (MAX_LEVEL_PER_CIRCLE - levelForCircle);
        }
        this.mFstHalfPaint.setColor(this.fstColor);
        this.mScndHalfPaint.setColor(this.scndColor);
        if (!halfPassed) {
            this.mAbovePaint.setColor(this.mScndHalfPaint.getColor());
        } else {
            this.mAbovePaint.setColor(this.mFstHalfPaint.getColor());
        }
        setAlpha(this.mAlpha);
        this.mAxisValue = (int) (this.mControlPointMinimum + ((this.mControlPointMaximum - this.mControlPointMinimum) * (levelForCircle / MAX_LEVEL_PER_CIRCLE)));
        return true;
    }

    private void resetColor(ProgressStates currentState) {
        switch (currentState) {
            case FOLDING_DOWN:
                this.fstColor = mColor1;
                this.scndColor = mColor2;
                this.goesBackward = false;
                break;
            case FOLDING_LEFT:
                this.fstColor = mColor1;
                this.scndColor = mColor3;
                this.goesBackward = true;
                break;
            case FOLDING_UP:
                this.fstColor = mColor3;
                this.scndColor = mColor4;
                this.goesBackward = true;
                break;
            case FOLDING_RIGHT:
                this.fstColor = mColor2;
                this.scndColor = mColor4;
                this.goesBackward = false;
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mCurrentState != null) {
            makeCirclesProgress(canvas);
        }
    }

    private void measureCircleProgress(int width, int height) {
        this.mDiameter = Math.min(width, height);
        this.mHalf = this.mDiameter / 2;
        this.mOval.set(0.0f, 0.0f, this.mDiameter, this.mDiameter);
        this.mControlPointMinimum = (-this.mDiameter) / 6;
        this.mControlPointMaximum = this.mDiameter + (this.mDiameter / 6);
    }

    private void makeCirclesProgress(Canvas canvas) {
        switch (this.mCurrentState) {
            case FOLDING_DOWN:
            case FOLDING_UP:
                drawYMotion(canvas);
                break;
            case FOLDING_LEFT:
            case FOLDING_RIGHT:
                drawXMotion(canvas);
                break;
        }
        canvas.drawPath(this.mPath, this.mAbovePaint);
    }

    private void drawXMotion(Canvas canvas) {
        canvas.drawArc(this.mOval, 90.0f, 180.0f, true, this.mFstHalfPaint);
        canvas.drawArc(this.mOval, -270.0f, -180.0f, true, this.mScndHalfPaint);
        this.mPath.reset();
        this.mPath.moveTo(this.mHalf, 0.0f);
        this.mPath.cubicTo(this.mAxisValue, 0.0f, this.mAxisValue, this.mDiameter, this.mHalf, this.mDiameter);
        this.mPath.moveTo(this.mHalf + 1, 0.0f);
        this.mPath.cubicTo(this.mAxisValue, 0.0f, this.mAxisValue, this.mDiameter, this.mHalf + 1, this.mDiameter);
    }

    private void drawYMotion(Canvas canvas) {
        canvas.drawArc(this.mOval, 0.0f, -180.0f, true, this.mFstHalfPaint);
        canvas.drawArc(this.mOval, -180.0f, -180.0f, true, this.mScndHalfPaint);
        this.mPath.reset();
        this.mPath.moveTo(0.0f, this.mHalf);
        this.mPath.cubicTo(0.0f, this.mAxisValue, this.mDiameter, this.mAxisValue, this.mDiameter, this.mHalf);
        this.mPath.moveTo(0.0f, this.mHalf + 1);
        this.mPath.cubicTo(0.0f, this.mAxisValue, this.mDiameter, this.mAxisValue, this.mDiameter, this.mHalf + 1);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mAlpha = alpha;
        this.mFstHalfPaint.setAlpha(alpha);
        this.mScndHalfPaint.setAlpha(alpha);
        int targetAboveAlpha = (ALPHA_ABOVE_DEFAULT * alpha) / ALPHA_OPAQUE;
        this.mAbovePaint.setAlpha(targetAboveAlpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mColorFilter = cf;
        this.mFstHalfPaint.setColorFilter(cf);
        this.mScndHalfPaint.setColorFilter(cf);
        this.mAbovePaint.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
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

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/FoldingCirclesDrawable$Builder.class */
    public static class Builder {
        private int[] mColors;

        public Builder(Context context) {
            initDefaults(context);
        }

        private void initDefaults(Context context) {
            this.mColors = context.getResources().getIntArray(R.array.google_colors);
        }

        public Builder colors(int[] colors) {
            if (colors == null || colors.length == 0) {
                throw new IllegalArgumentException("Your color array must contains at least 4 values");
            }
            this.mColors = colors;
            return this;
        }

        public Drawable build() {
            return new FoldingCirclesDrawable(this.mColors);
        }
    }
}
