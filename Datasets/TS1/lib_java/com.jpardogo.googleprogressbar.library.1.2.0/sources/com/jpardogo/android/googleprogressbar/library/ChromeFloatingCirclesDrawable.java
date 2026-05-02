package com.jpardogo.android.googleprogressbar.library;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable.class */
public class ChromeFloatingCirclesDrawable extends Drawable implements Drawable.Callback {
    private static final int MAX_LEVEL = 10000;
    private static final int CENT_LEVEL = 5000;
    private static final int MID_LEVEL = 2500;
    private static final int ALPHA_OPAQUE = 255;
    private static final int ACCELERATION_LEVEL = 2;
    private ColorFilter mColorFilter;
    private Point[] mArrowPoints;
    private Paint mPaint1;
    private Paint mPaint2;
    private Paint mPaint3;
    private Paint mPaint4;
    private double unit;
    private int width;
    private int x_beg;
    private int y_beg;
    private int x_end;
    private int y_end;
    private int offset;
    private double max_speed;
    private double offsetPercentage;
    private int colorSign;
    private int mAlpha = ALPHA_OPAQUE;
    private int acceleration = ACCELERATION_LEVEL;
    private double distance = 6250000.0d;
    private ProgressStates currentProgressStates = ProgressStates.GREEN_TOP;

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$ProgressStates.class */
    private enum ProgressStates {
        GREEN_TOP,
        YELLOW_TOP,
        RED_TOP,
        BLUE_TOP
    }

    public ChromeFloatingCirclesDrawable(int[] colors) {
        initCirclesProgress(colors);
    }

    private void initCirclesProgress(int[] colors) {
        initColors(colors);
        setAlpha(this.mAlpha);
        setColorFilter(this.mColorFilter);
        setAcceleration(ACCELERATION_LEVEL);
        this.offsetPercentage = 0.0d;
        this.colorSign = 1;
    }

    private void initColors(int[] colors) {
        this.mPaint1 = new Paint(1);
        this.mPaint1.setColor(colors[0]);
        this.mPaint1.setAntiAlias(true);
        this.mPaint2 = new Paint(1);
        this.mPaint2.setColor(colors[1]);
        this.mPaint2.setAntiAlias(true);
        this.mPaint3 = new Paint(1);
        this.mPaint3.setColor(colors[ACCELERATION_LEVEL]);
        this.mPaint3.setAntiAlias(true);
        this.mPaint4 = new Paint(1);
        this.mPaint4.setColor(colors[3]);
        this.mPaint4.setAntiAlias(true);
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        measureCircleProgress(bounds.width(), bounds.height());
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        int level2 = level % (MAX_LEVEL / this.acceleration);
        int temp_level = level2 % (MID_LEVEL / this.acceleration);
        int ef_width = (int) (this.unit * 3.0d);
        if (level2 < CENT_LEVEL / this.acceleration) {
            if (level2 < MID_LEVEL / this.acceleration) {
                if (this.colorSign == 15) {
                    changeTopColor();
                    this.colorSign = 1;
                }
                this.offsetPercentage = (((0.5d * this.acceleration) * temp_level) * temp_level) / this.distance;
                this.offset = (int) ((this.offsetPercentage * ef_width) / 2.0d);
            } else {
                this.colorSign |= ACCELERATION_LEVEL;
                this.offsetPercentage = (((this.max_speed * temp_level) - (((0.5d * this.acceleration) * temp_level) * temp_level)) / this.distance) + 1.0d;
                this.offset = (int) ((this.offsetPercentage * ef_width) / 2.0d);
            }
        } else if (level2 < 7500 / this.acceleration) {
            if (this.colorSign == 3) {
                changeTopColor();
                this.colorSign |= 4;
            }
            this.offsetPercentage = (((0.5d * this.acceleration) * temp_level) * temp_level) / this.distance;
            this.offset = (int) (ef_width - ((this.offsetPercentage * ef_width) / 2.0d));
        } else {
            this.colorSign |= 8;
            this.offsetPercentage = (((this.max_speed * temp_level) - (((0.5d * this.acceleration) * temp_level) * temp_level)) / this.distance) + 1.0d;
            this.offsetPercentage = this.offsetPercentage == 1.0d ? 2.0d : this.offsetPercentage;
            this.offset = (int) (ef_width - ((this.offsetPercentage * ef_width) / 2.0d));
        }
        this.mArrowPoints[0].set(((int) this.unit) + this.x_beg + this.offset, ((int) this.unit) + this.y_beg + this.offset);
        this.mArrowPoints[1].set((((int) (this.unit * 4.0d)) + this.x_beg) - this.offset, (((int) (this.unit * 4.0d)) + this.y_beg) - this.offset);
        this.mArrowPoints[ACCELERATION_LEVEL].set(((int) this.unit) + this.x_beg + this.offset, (((int) (this.unit * 4.0d)) + this.y_beg) - this.offset);
        this.mArrowPoints[3].set((((int) (this.unit * 4.0d)) + this.x_beg) - this.offset, ((int) this.unit) + this.y_beg + this.offset);
        return true;
    }

    /* renamed from: com.jpardogo.android.googleprogressbar.library.ChromeFloatingCirclesDrawable$1, reason: invalid class name */
    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates = new int[ProgressStates.values().length];

        static {
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[ProgressStates.GREEN_TOP.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[ProgressStates.YELLOW_TOP.ordinal()] = ChromeFloatingCirclesDrawable.ACCELERATION_LEVEL;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[ProgressStates.RED_TOP.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[ProgressStates.BLUE_TOP.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    private void changeTopColor() {
        switch (AnonymousClass1.$SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[this.currentProgressStates.ordinal()]) {
            case 1:
                this.currentProgressStates = ProgressStates.YELLOW_TOP;
                break;
            case ACCELERATION_LEVEL /* 2 */:
                this.currentProgressStates = ProgressStates.RED_TOP;
                break;
            case 3:
                this.currentProgressStates = ProgressStates.BLUE_TOP;
                break;
            case 4:
                this.currentProgressStates = ProgressStates.GREEN_TOP;
                break;
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.currentProgressStates != ProgressStates.RED_TOP) {
            canvas.drawCircle(this.mArrowPoints[0].x, this.mArrowPoints[0].y, (float) this.unit, this.mPaint1);
        }
        if (this.currentProgressStates != ProgressStates.BLUE_TOP) {
            canvas.drawCircle(this.mArrowPoints[1].x, this.mArrowPoints[1].y, (float) this.unit, this.mPaint2);
        }
        if (this.currentProgressStates != ProgressStates.YELLOW_TOP) {
            canvas.drawCircle(this.mArrowPoints[ACCELERATION_LEVEL].x, this.mArrowPoints[ACCELERATION_LEVEL].y, (float) this.unit, this.mPaint3);
        }
        if (this.currentProgressStates != ProgressStates.GREEN_TOP) {
            canvas.drawCircle(this.mArrowPoints[3].x, this.mArrowPoints[3].y, (float) this.unit, this.mPaint4);
        }
        switch (AnonymousClass1.$SwitchMap$com$jpardogo$android$googleprogressbar$library$ChromeFloatingCirclesDrawable$ProgressStates[this.currentProgressStates.ordinal()]) {
            case 1:
                canvas.drawCircle(this.mArrowPoints[3].x, this.mArrowPoints[3].y, (float) this.unit, this.mPaint4);
                break;
            case ACCELERATION_LEVEL /* 2 */:
                canvas.drawCircle(this.mArrowPoints[ACCELERATION_LEVEL].x, this.mArrowPoints[ACCELERATION_LEVEL].y, (float) this.unit, this.mPaint3);
                break;
            case 3:
                canvas.drawCircle(this.mArrowPoints[0].x, this.mArrowPoints[0].y, (float) this.unit, this.mPaint1);
                break;
            case 4:
                canvas.drawCircle(this.mArrowPoints[1].x, this.mArrowPoints[1].y, (float) this.unit, this.mPaint2);
                break;
        }
    }

    private void measureCircleProgress(int width, int height) {
        if (width > height) {
            this.width = height - 1;
            this.x_beg = ((width - height) / ACCELERATION_LEVEL) + 1;
            this.y_beg = 1;
            this.x_end = this.x_beg + this.width;
            this.y_end = this.width;
        } else {
            this.width = width - 1;
            this.x_beg = 1;
            this.y_beg = ((height - width) / ACCELERATION_LEVEL) + 1;
            this.x_end = this.width;
            this.y_end = this.y_beg + this.width;
        }
        this.unit = this.width / 5.0d;
        this.mArrowPoints = new Point[4];
        this.mArrowPoints[0] = new Point(((int) this.unit) + this.x_beg, ((int) this.unit) + this.y_beg);
        this.mArrowPoints[1] = new Point(((int) (this.unit * 4.0d)) + this.x_beg, ((int) (this.unit * 4.0d)) + this.y_beg);
        this.mArrowPoints[ACCELERATION_LEVEL] = new Point(((int) this.unit) + this.x_beg, ((int) (this.unit * 4.0d)) + this.y_beg);
        this.mArrowPoints[3] = new Point(((int) (this.unit * 4.0d)) + this.x_beg, ((int) this.unit) + this.y_beg);
    }

    public void setAcceleration(int acceleration) {
        this.acceleration = acceleration;
        this.distance = 0.5d * acceleration * (MID_LEVEL / acceleration) * (MID_LEVEL / acceleration);
        this.max_speed = acceleration * (MID_LEVEL / acceleration);
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
        this.mColorFilter = cf;
        this.mPaint1.setColorFilter(cf);
        this.mPaint2.setColorFilter(cf);
        this.mPaint3.setColorFilter(cf);
        this.mPaint4.setColorFilter(cf);
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

    /* loaded from: com.jpardogo.googleprogressbar.library.1.2.0.jar:com/jpardogo/android/googleprogressbar/library/ChromeFloatingCirclesDrawable$Builder.class */
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
            return new ChromeFloatingCirclesDrawable(this.mColors);
        }
    }
}
