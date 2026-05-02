package com.rey.material.drawable;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/ToolbarRippleDrawable.class */
public class ToolbarRippleDrawable extends Drawable implements Animatable {
    private boolean mRunning;
    private Paint mShaderPaint;
    private Paint mFillPaint;
    private RadialGradient mInShader;
    private RadialGradient mOutShader;
    private Matrix mMatrix;
    private int mAlpha;
    private RectF mBackgroundBounds;
    private Path mBackground;
    private int mBackgroundAnimDuration;
    private int mBackgroundColor;
    private float mBackgroundAlphaPercent;
    private PointF mRipplePoint;
    private float mRippleRadius;
    private int mRippleType;
    private int mMaxRippleRadius;
    private int mRippleAnimDuration;
    private int mRippleColor;
    private float mRippleAlphaPercent;
    private int mDelayClickType;
    private Interpolator mInInterpolator;
    private Interpolator mOutInterpolator;
    private long mStartTime;
    private boolean mPressed;
    private int mState;
    private static final int STATE_OUT = 0;
    private static final int STATE_PRESS = 1;
    private static final int STATE_HOVER = 2;
    private static final int STATE_RELEASE_ON_HOLD = 3;
    private static final int STATE_RELEASE = 4;
    private static final int TYPE_TOUCH_MATCH_VIEW = -1;
    private static final int TYPE_TOUCH = 0;
    private static final int TYPE_WAVE = 1;
    private static final float[] GRADIENT_STOPS = {0.0f, 0.99f, 1.0f};
    private static final float GRADIENT_RADIUS = 16.0f;
    private final Runnable mUpdater;

    private ToolbarRippleDrawable(int backgroundAnimDuration, int backgroundColor, int rippleType, int delayClickType, int maxTouchRadius, int touchAnimDuration, int touchColor, Interpolator inInterpolator, Interpolator outInterpolator) {
        this.mRunning = false;
        this.mAlpha = 255;
        this.mPressed = false;
        this.mState = 0;
        this.mUpdater = new Runnable() { // from class: com.rey.material.drawable.ToolbarRippleDrawable.1
            @Override // java.lang.Runnable
            public void run() {
                switch (ToolbarRippleDrawable.this.mRippleType) {
                    case -1:
                    case 0:
                        ToolbarRippleDrawable.this.updateTouch();
                        break;
                    case 1:
                        ToolbarRippleDrawable.this.updateWave();
                        break;
                }
            }
        };
        this.mBackgroundAnimDuration = backgroundAnimDuration;
        this.mBackgroundColor = backgroundColor;
        this.mRippleType = rippleType;
        this.mMaxRippleRadius = maxTouchRadius;
        this.mRippleAnimDuration = touchAnimDuration;
        this.mRippleColor = touchColor;
        this.mDelayClickType = delayClickType;
        if (this.mRippleType == 0 && this.mMaxRippleRadius <= 0) {
            this.mRippleType = -1;
        }
        this.mInInterpolator = inInterpolator;
        this.mOutInterpolator = outInterpolator;
        this.mFillPaint = new Paint(1);
        this.mFillPaint.setStyle(Paint.Style.FILL);
        this.mShaderPaint = new Paint(1);
        this.mShaderPaint.setStyle(Paint.Style.FILL);
        this.mBackground = new Path();
        this.mBackgroundBounds = new RectF();
        this.mRipplePoint = new PointF();
        this.mMatrix = new Matrix();
        this.mInShader = new RadialGradient(0.0f, 0.0f, GRADIENT_RADIUS, new int[]{this.mRippleColor, this.mRippleColor, 0}, GRADIENT_STOPS, Shader.TileMode.CLAMP);
        if (this.mRippleType == 1) {
            this.mOutShader = new RadialGradient(0.0f, 0.0f, GRADIENT_RADIUS, new int[]{0, ColorUtil.getColor(this.mRippleColor, 0.0f), this.mRippleColor}, GRADIENT_STOPS, Shader.TileMode.CLAMP);
        }
    }

    public int getDelayClickType() {
        return this.mDelayClickType;
    }

    public void setDelayClickType(int type) {
        this.mDelayClickType = type;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mAlpha = alpha;
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter filter) {
        this.mFillPaint.setColorFilter(filter);
        this.mShaderPaint.setColorFilter(filter);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    public long getClickDelayTime() {
        switch (this.mDelayClickType) {
            case 0:
                return -1L;
            case 1:
                if (this.mState == 3) {
                    return Math.max(this.mBackgroundAnimDuration, this.mRippleAnimDuration) - (SystemClock.uptimeMillis() - this.mStartTime);
                }
                return -1L;
            case 2:
                if (this.mState == 3) {
                    return (2 * Math.max(this.mBackgroundAnimDuration, this.mRippleAnimDuration)) - (SystemClock.uptimeMillis() - this.mStartTime);
                }
                if (this.mState == STATE_RELEASE) {
                    return Math.max(this.mBackgroundAnimDuration, this.mRippleAnimDuration) - (SystemClock.uptimeMillis() - this.mStartTime);
                }
                return -1L;
            default:
                return -1L;
        }
    }

    private void setRippleState(int state) {
        if (this.mState != state) {
            this.mState = state;
            if (this.mState != 0) {
                if (this.mState != 2) {
                    start();
                    return;
                } else {
                    stop();
                    return;
                }
            }
            stop();
        }
    }

    private boolean setRippleEffect(float x, float y, float radius) {
        if (this.mRipplePoint.x != x || this.mRipplePoint.y != y || this.mRippleRadius != radius) {
            this.mRipplePoint.set(x, y);
            this.mRippleRadius = radius;
            float radius2 = this.mRippleRadius / GRADIENT_RADIUS;
            this.mMatrix.reset();
            this.mMatrix.postTranslate(x, y);
            this.mMatrix.postScale(radius2, radius2, x, y);
            this.mInShader.setLocalMatrix(this.mMatrix);
            if (this.mOutShader != null) {
                this.mOutShader.setLocalMatrix(this.mMatrix);
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.mBackgroundBounds.set(bounds.left, bounds.top, bounds.right, bounds.bottom);
        this.mBackground.reset();
        this.mBackground.addRect(this.mBackgroundBounds, Path.Direction.CW);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        boolean pressed = ViewUtil.hasState(state, R.attr.state_pressed);
        if (this.mPressed != pressed) {
            this.mPressed = pressed;
            if (this.mPressed) {
                Rect bounds = getBounds();
                if (this.mState == 0 || this.mState == STATE_RELEASE) {
                    if (this.mRippleType == 1 || this.mRippleType == -1) {
                        this.mMaxRippleRadius = getMaxRippleRadius(bounds.exactCenterX(), bounds.exactCenterY());
                    }
                    setRippleEffect(bounds.exactCenterX(), bounds.exactCenterY(), 0.0f);
                    setRippleState(1);
                    return true;
                }
                if (this.mRippleType == 0) {
                    setRippleEffect(bounds.exactCenterX(), bounds.exactCenterY(), this.mRippleRadius);
                    return true;
                }
                return true;
            }
            if (this.mState != 0) {
                if (this.mState == 2) {
                    if (this.mRippleType == 1 || this.mRippleType == -1) {
                        setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, 0.0f);
                    }
                    setRippleState(STATE_RELEASE);
                    return true;
                }
                setRippleState(3);
                return true;
            }
            return true;
        }
        return false;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        switch (this.mRippleType) {
            case -1:
            case 0:
                drawTouch(canvas);
                break;
            case 1:
                drawWave(canvas);
                break;
        }
    }

    private void drawTouch(Canvas canvas) {
        if (this.mState != 0) {
            if (this.mBackgroundAlphaPercent > 0.0f) {
                this.mFillPaint.setColor(this.mBackgroundColor);
                this.mFillPaint.setAlpha(Math.round(this.mAlpha * this.mBackgroundAlphaPercent));
                canvas.drawPath(this.mBackground, this.mFillPaint);
            }
            if (this.mRippleRadius > 0.0f && this.mRippleAlphaPercent > 0.0f) {
                this.mShaderPaint.setAlpha(Math.round(this.mAlpha * this.mRippleAlphaPercent));
                this.mShaderPaint.setShader(this.mInShader);
                canvas.drawPath(this.mBackground, this.mShaderPaint);
            }
        }
    }

    private void drawWave(Canvas canvas) {
        if (this.mState != 0) {
            if (this.mState != STATE_RELEASE) {
                if (this.mRippleRadius > 0.0f) {
                    this.mShaderPaint.setShader(this.mInShader);
                    canvas.drawPath(this.mBackground, this.mShaderPaint);
                    return;
                }
                return;
            }
            if (this.mRippleRadius == 0.0f) {
                this.mFillPaint.setColor(this.mRippleColor);
                canvas.drawPath(this.mBackground, this.mFillPaint);
            } else {
                this.mShaderPaint.setShader(this.mOutShader);
                canvas.drawPath(this.mBackground, this.mShaderPaint);
            }
        }
    }

    private int getMaxRippleRadius(float x, float y) {
        float x1 = x < this.mBackgroundBounds.centerX() ? this.mBackgroundBounds.right : this.mBackgroundBounds.left;
        float y1 = y < this.mBackgroundBounds.centerY() ? this.mBackgroundBounds.bottom : this.mBackgroundBounds.top;
        return (int) Math.round(Math.sqrt(Math.pow(x1 - x, 2.0d) + Math.pow(y1 - y, 2.0d)));
    }

    public void cancel() {
        setRippleState(0);
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        if (isRunning()) {
            return;
        }
        resetAnimation();
        scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        if (!isRunning()) {
            return;
        }
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
    public void updateTouch() {
        if (this.mState != STATE_RELEASE) {
            float backgroundProgress = Math.min(1.0f, (SystemClock.uptimeMillis() - this.mStartTime) / this.mBackgroundAnimDuration);
            this.mBackgroundAlphaPercent = (this.mInInterpolator.getInterpolation(backgroundProgress) * Color.alpha(this.mBackgroundColor)) / 255.0f;
            float touchProgress = Math.min(1.0f, (SystemClock.uptimeMillis() - this.mStartTime) / this.mRippleAnimDuration);
            this.mRippleAlphaPercent = this.mInInterpolator.getInterpolation(touchProgress);
            setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, this.mMaxRippleRadius * this.mInInterpolator.getInterpolation(touchProgress));
            if (backgroundProgress == 1.0f && touchProgress == 1.0f) {
                this.mStartTime = SystemClock.uptimeMillis();
                setRippleState(this.mState == 1 ? 2 : STATE_RELEASE);
            }
        } else {
            float backgroundProgress2 = Math.min(1.0f, (SystemClock.uptimeMillis() - this.mStartTime) / this.mBackgroundAnimDuration);
            this.mBackgroundAlphaPercent = ((1.0f - this.mOutInterpolator.getInterpolation(backgroundProgress2)) * Color.alpha(this.mBackgroundColor)) / 255.0f;
            float touchProgress2 = Math.min(1.0f, (SystemClock.uptimeMillis() - this.mStartTime) / this.mRippleAnimDuration);
            this.mRippleAlphaPercent = 1.0f - this.mOutInterpolator.getInterpolation(touchProgress2);
            setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, this.mMaxRippleRadius * (1.0f + (0.5f * this.mOutInterpolator.getInterpolation(touchProgress2))));
            if (backgroundProgress2 == 1.0f && touchProgress2 == 1.0f) {
                setRippleState(0);
            }
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidateSelf();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateWave() {
        float progress = Math.min(1.0f, (SystemClock.uptimeMillis() - this.mStartTime) / this.mRippleAnimDuration);
        if (this.mState != STATE_RELEASE) {
            setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, this.mMaxRippleRadius * this.mInInterpolator.getInterpolation(progress));
            if (progress == 1.0f) {
                this.mStartTime = SystemClock.uptimeMillis();
                if (this.mState == 1) {
                    setRippleState(2);
                } else {
                    setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, 0.0f);
                    setRippleState(STATE_RELEASE);
                }
            }
        } else {
            setRippleEffect(this.mRipplePoint.x, this.mRipplePoint.y, this.mMaxRippleRadius * this.mOutInterpolator.getInterpolation(progress));
            if (progress == 1.0f) {
                setRippleState(0);
            }
        }
        if (isRunning()) {
            scheduleSelf(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidateSelf();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/drawable/ToolbarRippleDrawable$Builder.class */
    public static class Builder {
        private int mBackgroundAnimDuration;
        private int mBackgroundColor;
        private int mRippleType;
        private int mMaxRippleRadius;
        private int mRippleAnimDuration;
        private int mRippleColor;
        private int mDelayClickType;
        private Interpolator mInInterpolator;
        private Interpolator mOutInterpolator;

        public Builder() {
            this.mBackgroundAnimDuration = 200;
            this.mRippleAnimDuration = 400;
        }

        public Builder(Context context, int defStyleRes) {
            this(context, null, 0, defStyleRes);
        }

        public Builder(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
            this.mBackgroundAnimDuration = 200;
            this.mRippleAnimDuration = 400;
            TypedArray a = context.obtainStyledAttributes(attrs, com.rey.material.R.styleable.RippleDrawable, defStyleAttr, defStyleRes);
            backgroundColor(a.getColor(com.rey.material.R.styleable.RippleDrawable_rd_backgroundColor, 0));
            backgroundAnimDuration(a.getInteger(com.rey.material.R.styleable.RippleDrawable_rd_backgroundAnimDuration, context.getResources().getInteger(R.integer.config_mediumAnimTime)));
            rippleType(a.getInteger(com.rey.material.R.styleable.RippleDrawable_rd_rippleType, 0));
            delayClickType(a.getInteger(com.rey.material.R.styleable.RippleDrawable_rd_delayClick, 0));
            int type = ThemeUtil.getType(a, com.rey.material.R.styleable.RippleDrawable_rd_maxRippleRadius);
            if (type >= 16 && type <= 31) {
                maxRippleRadius(a.getInteger(com.rey.material.R.styleable.RippleDrawable_rd_maxRippleRadius, -1));
            } else {
                maxRippleRadius(a.getDimensionPixelSize(com.rey.material.R.styleable.RippleDrawable_rd_maxRippleRadius, ThemeUtil.dpToPx(context, 48)));
            }
            rippleColor(a.getColor(com.rey.material.R.styleable.RippleDrawable_rd_rippleColor, ThemeUtil.colorControlHighlight(context, 0)));
            rippleAnimDuration(a.getInteger(com.rey.material.R.styleable.RippleDrawable_rd_rippleAnimDuration, context.getResources().getInteger(R.integer.config_mediumAnimTime)));
            int resId = a.getResourceId(com.rey.material.R.styleable.RippleDrawable_rd_inInterpolator, 0);
            if (resId != 0) {
                inInterpolator(AnimationUtils.loadInterpolator(context, resId));
            }
            int resId2 = a.getResourceId(com.rey.material.R.styleable.RippleDrawable_rd_outInterpolator, 0);
            if (resId2 != 0) {
                outInterpolator(AnimationUtils.loadInterpolator(context, resId2));
            }
            a.recycle();
        }

        public ToolbarRippleDrawable build() {
            if (this.mInInterpolator == null) {
                this.mInInterpolator = new AccelerateInterpolator();
            }
            if (this.mOutInterpolator == null) {
                this.mOutInterpolator = new DecelerateInterpolator();
            }
            return new ToolbarRippleDrawable(this.mBackgroundAnimDuration, this.mBackgroundColor, this.mRippleType, this.mDelayClickType, this.mMaxRippleRadius, this.mRippleAnimDuration, this.mRippleColor, this.mInInterpolator, this.mOutInterpolator);
        }

        public Builder backgroundAnimDuration(int duration) {
            this.mBackgroundAnimDuration = duration;
            return this;
        }

        public Builder backgroundColor(int color) {
            this.mBackgroundColor = color;
            return this;
        }

        public Builder rippleType(int type) {
            this.mRippleType = type;
            return this;
        }

        public Builder delayClickType(int type) {
            this.mDelayClickType = type;
            return this;
        }

        public Builder maxRippleRadius(int radius) {
            this.mMaxRippleRadius = radius;
            return this;
        }

        public Builder rippleAnimDuration(int duration) {
            this.mRippleAnimDuration = duration;
            return this;
        }

        public Builder rippleColor(int color) {
            this.mRippleColor = color;
            return this;
        }

        public Builder inInterpolator(Interpolator interpolator) {
            this.mInInterpolator = interpolator;
            return this;
        }

        public Builder outInterpolator(Interpolator interpolator) {
            this.mOutInterpolator = interpolator;
            return this;
        }
    }
}
