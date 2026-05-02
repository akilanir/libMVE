package com.jpardogo.android.googleprogressbar.library;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Interpolator;

/* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable.class */
public class GoogleMusicDicesDrawable extends Drawable implements Drawable.Callback {
    private static final int ANIMATION_DURATION = 350;
    private static final int ANIMATION_START_DELAY = 150;
    private Paint mPaint;
    private Paint mPaintShadow;
    private Paint mPaintCircle;
    private int mSize;
    private float mScale;
    private DiceRotation mDiceRotation;
    private DiceState[] mDiceStates;
    private int mDiceState;
    private static final int DICE_SIDE_COLOR = Color.parseColor("#FFDBDBDB");
    private static final int DICE_SIDE_SHADOW_COLOR = Color.parseColor("#FFB8B8B9");
    private static final Interpolator ACCELERATE_INTERPOLATOR = new AccelerateInterpolator();

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide.class */
    private enum DiceSide {
        ONE,
        TWO,
        THREE,
        FOUR,
        FIVE,
        SIX
    }

    static /* synthetic */ int access$108(GoogleMusicDicesDrawable x0) {
        int i = x0.mDiceState;
        x0.mDiceState = i + 1;
        return i;
    }

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation.class */
    private enum DiceRotation {
        LEFT,
        DOWN;

        DiceRotation invert() {
            return this == LEFT ? DOWN : LEFT;
        }
    }

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState.class */
    private class DiceState {
        private DiceSide side1;
        private DiceSide side2;

        DiceState(DiceSide side1, DiceSide side2) {
            this.side1 = side1;
            this.side2 = side2;
        }
    }

    public GoogleMusicDicesDrawable() {
        init();
    }

    private void init() {
        this.mPaint = new Paint(1);
        this.mPaint.setColor(DICE_SIDE_COLOR);
        this.mPaintShadow = new Paint(1);
        this.mPaintShadow.setColor(DICE_SIDE_SHADOW_COLOR);
        this.mPaintCircle = new Paint(1);
        this.mPaintCircle.setColor(-1);
        this.mDiceStates = new DiceState[]{new DiceState(DiceSide.ONE, DiceSide.THREE), new DiceState(DiceSide.TWO, DiceSide.THREE), new DiceState(DiceSide.TWO, DiceSide.SIX), new DiceState(DiceSide.FOUR, DiceSide.SIX), new DiceState(DiceSide.FOUR, DiceSide.FIVE), new DiceState(DiceSide.ONE, DiceSide.FIVE)};
        this.mDiceRotation = DiceRotation.LEFT;
        initObjectAnimator();
    }

    private void initObjectAnimator() {
        final ObjectAnimator objectAnimator = ObjectAnimator.ofFloat(this, "scale", 0.0f, 1.0f);
        objectAnimator.setInterpolator(ACCELERATE_INTERPOLATOR);
        objectAnimator.setDuration(350L);
        objectAnimator.setStartDelay(150L);
        objectAnimator.addListener(new AnimatorListenerAdapter() { // from class: com.jpardogo.android.googleprogressbar.library.GoogleMusicDicesDrawable.1
            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animation) {
                GoogleMusicDicesDrawable.this.mScale = 0.0f;
                GoogleMusicDicesDrawable.access$108(GoogleMusicDicesDrawable.this);
                if (GoogleMusicDicesDrawable.this.mDiceState == GoogleMusicDicesDrawable.this.mDiceStates.length) {
                    GoogleMusicDicesDrawable.this.mDiceState = 0;
                }
                GoogleMusicDicesDrawable.this.mDiceRotation = GoogleMusicDicesDrawable.this.mDiceRotation.invert();
                objectAnimator.start();
            }
        });
        objectAnimator.start();
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.mDiceRotation != null) {
            switch (this.mDiceRotation) {
                case DOWN:
                    drawScaleY(canvas);
                    break;
                case LEFT:
                    drawScaleX(canvas);
                    break;
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
        this.mPaintShadow.setAlpha(alpha);
        this.mPaintCircle.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
        this.mPaintShadow.setColorFilter(cf);
        this.mPaintCircle.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.mSize = bounds.width();
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

    private void drawScaleX(Canvas canvas) {
        canvas.save();
        Matrix matrix = new Matrix();
        matrix.preScale(1.0f - this.mScale, 1.0f, 0.0f, this.mSize / 2);
        canvas.concat(matrix);
        drawDiceSide(canvas, this.mDiceStates[this.mDiceState].side1, this.mScale > 0.1f);
        canvas.restore();
        canvas.save();
        Matrix matrix2 = new Matrix();
        matrix2.preScale(this.mScale, 1.0f, this.mSize, this.mSize / 2);
        canvas.concat(matrix2);
        drawDiceSide(canvas, this.mDiceStates[this.mDiceState].side2, false);
        canvas.restore();
    }

    private void drawScaleY(Canvas canvas) {
        canvas.save();
        Matrix matrix = new Matrix();
        matrix.preScale(1.0f, this.mScale, this.mSize / 2, 0.0f);
        canvas.concat(matrix);
        drawDiceSide(canvas, this.mDiceStates[this.mDiceState].side1, false);
        canvas.restore();
        canvas.save();
        Matrix matrix2 = new Matrix();
        matrix2.preScale(1.0f, 1.0f - this.mScale, this.mSize / 2, this.mSize);
        canvas.concat(matrix2);
        drawDiceSide(canvas, this.mDiceStates[this.mDiceState].side2, this.mScale > 0.1f);
        canvas.restore();
    }

    private void drawDiceSide(Canvas canvas, DiceSide side, boolean shadow) {
        int circleRadius = this.mSize / 10;
        canvas.drawRect(0.0f, 0.0f, this.mSize, this.mSize, shadow ? this.mPaintShadow : this.mPaint);
        switch (AnonymousClass2.$SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[side.ordinal()]) {
            case 1:
                canvas.drawCircle(this.mSize / 2, this.mSize / 2, circleRadius, this.mPaintCircle);
                break;
            case 2:
                canvas.drawCircle(this.mSize / 4, this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize / 4, circleRadius, this.mPaintCircle);
                break;
            case 3:
                canvas.drawCircle(this.mSize / 2, this.mSize / 2, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize / 4, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize - (this.mSize / 4), this.mSize / 10, this.mPaintCircle);
                break;
            case 4:
                canvas.drawCircle(this.mSize / 4, this.mSize / 4, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize / 4, circleRadius, this.mPaintCircle);
                break;
            case BuildConfig.VERSION_CODE /* 5 */:
                canvas.drawCircle(this.mSize / 2, this.mSize / 2, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize / 4, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize / 4, circleRadius, this.mPaintCircle);
                break;
            case 6:
                canvas.drawCircle(this.mSize / 4, this.mSize / 4, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize / 2, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize / 4, this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize / 4, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize / 2, circleRadius, this.mPaintCircle);
                canvas.drawCircle(this.mSize - (this.mSize / 4), this.mSize - (this.mSize / 4), circleRadius, this.mPaintCircle);
                break;
        }
    }

    /* renamed from: com.jpardogo.android.googleprogressbar.library.GoogleMusicDicesDrawable$2, reason: invalid class name */
    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$2.class */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide = new int[DiceSide.values().length];

        static {
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.ONE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.TWO.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.THREE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.FOUR.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.FIVE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide[DiceSide.SIX.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceRotation = new int[DiceRotation.values().length];
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceRotation[DiceRotation.DOWN.ordinal()] = 1;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceRotation[DiceRotation.LEFT.ordinal()] = 2;
            } catch (NoSuchFieldError e8) {
            }
        }
    }

    float getScale() {
        return this.mScale;
    }

    void setScale(float scale) {
        this.mScale = scale;
    }

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$Builder.class */
    public static class Builder {
        public Drawable build() {
            return new GoogleMusicDicesDrawable();
        }
    }
}
