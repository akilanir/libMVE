package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.TypefaceUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider.class */
public class Slider extends View implements ThemeManager.OnThemeChangedListener {
    private RippleManager mRippleManager;
    protected int mStyleId;
    protected int mCurrentStyle;
    private Paint mPaint;
    private RectF mDrawRect;
    private RectF mTempRect;
    private Path mLeftTrackPath;
    private Path mRightTrackPath;
    private Path mMarkPath;
    private int mMinValue;
    private int mMaxValue;
    private int mStepValue;
    private boolean mDiscreteMode;
    private int mPrimaryColor;
    private int mSecondaryColor;
    private int mTrackSize;
    private Paint.Cap mTrackCap;
    private int mThumbBorderSize;
    private int mThumbRadius;
    private int mThumbFocusRadius;
    private float mThumbPosition;
    private Typeface mTypeface;
    private int mTextSize;
    private int mTextColor;
    private int mGravity;
    private int mTravelAnimationDuration;
    private int mTransformAnimationDuration;
    private Interpolator mInterpolator;
    private int mBaselineOffset;
    private int mTouchSlop;
    private PointF mMemoPoint;
    private boolean mIsDragging;
    private float mThumbCurrentRadius;
    private float mThumbFillPercent;
    private boolean mAlwaysFillThumb;
    private int mTextHeight;
    private int mMemoValue;
    private String mValueText;
    private ThumbRadiusAnimator mThumbRadiusAnimator;
    private ThumbStrokeAnimator mThumbStrokeAnimator;
    private ThumbMoveAnimator mThumbMoveAnimator;
    private boolean mIsRtl;
    private OnPositionChangeListener mOnPositionChangeListener;
    private ValueDescriptionProvider mValueDescriptionProvider;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$OnPositionChangeListener.class */
    public interface OnPositionChangeListener {
        void onPositionChanged(Slider slider, boolean z, float f, float f2, int i, int i2);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$ValueDescriptionProvider.class */
    public interface ValueDescriptionProvider {
        String getDescription(int i);
    }

    public Slider(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mMinValue = 0;
        this.mMaxValue = 100;
        this.mStepValue = 1;
        this.mDiscreteMode = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.BUTT;
        this.mThumbBorderSize = -1;
        this.mThumbRadius = -1;
        this.mThumbFocusRadius = -1;
        this.mThumbPosition = -1.0f;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -1;
        this.mGravity = 17;
        this.mTravelAnimationDuration = -1;
        this.mTransformAnimationDuration = -1;
        this.mAlwaysFillThumb = false;
        this.mIsRtl = false;
        init(context, null, 0, 0);
    }

    public Slider(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mMinValue = 0;
        this.mMaxValue = 100;
        this.mStepValue = 1;
        this.mDiscreteMode = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.BUTT;
        this.mThumbBorderSize = -1;
        this.mThumbRadius = -1;
        this.mThumbFocusRadius = -1;
        this.mThumbPosition = -1.0f;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -1;
        this.mGravity = 17;
        this.mTravelAnimationDuration = -1;
        this.mTransformAnimationDuration = -1;
        this.mAlwaysFillThumb = false;
        this.mIsRtl = false;
        init(context, attrs, 0, 0);
    }

    public Slider(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mMinValue = 0;
        this.mMaxValue = 100;
        this.mStepValue = 1;
        this.mDiscreteMode = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.BUTT;
        this.mThumbBorderSize = -1;
        this.mThumbRadius = -1;
        this.mThumbFocusRadius = -1;
        this.mThumbPosition = -1.0f;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -1;
        this.mGravity = 17;
        this.mTravelAnimationDuration = -1;
        this.mTransformAnimationDuration = -1;
        this.mAlwaysFillThumb = false;
        this.mIsRtl = false;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public Slider(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mMinValue = 0;
        this.mMaxValue = 100;
        this.mStepValue = 1;
        this.mDiscreteMode = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.BUTT;
        this.mThumbBorderSize = -1;
        this.mThumbRadius = -1;
        this.mThumbFocusRadius = -1;
        this.mThumbPosition = -1.0f;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -1;
        this.mGravity = 17;
        this.mTravelAnimationDuration = -1;
        this.mTransformAnimationDuration = -1;
        this.mAlwaysFillThumb = false;
        this.mIsRtl = false;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mPaint = new Paint(1);
        this.mPrimaryColor = ThemeUtil.colorControlActivated(context, -16777216);
        this.mSecondaryColor = ThemeUtil.colorControlNormal(context, -16777216);
        this.mDrawRect = new RectF();
        this.mTempRect = new RectF();
        this.mLeftTrackPath = new Path();
        this.mRightTrackPath = new Path();
        this.mThumbRadiusAnimator = new ThumbRadiusAnimator();
        this.mThumbStrokeAnimator = new ThumbStrokeAnimator();
        this.mThumbMoveAnimator = new ThumbMoveAnimator();
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.mMemoPoint = new PointF();
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        getRippleManager().onCreate(this, context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.Slider, defStyleAttr, defStyleRes);
        int minValue = getMinValue();
        int maxValue = getMaxValue();
        boolean valueRangeDefined = false;
        int value = -1;
        boolean valueDefined = false;
        String familyName = null;
        int style = 0;
        boolean textStyleDefined = false;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.Slider_sl_discreteMode) {
                this.mDiscreteMode = a.getBoolean(attr, false);
            } else if (attr == R.styleable.Slider_sl_primaryColor) {
                this.mPrimaryColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.Slider_sl_secondaryColor) {
                this.mSecondaryColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.Slider_sl_trackSize) {
                this.mTrackSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Slider_sl_trackCap) {
                int cap = a.getInteger(attr, 0);
                if (cap == 0) {
                    this.mTrackCap = Paint.Cap.BUTT;
                } else if (cap == 1) {
                    this.mTrackCap = Paint.Cap.ROUND;
                } else {
                    this.mTrackCap = Paint.Cap.SQUARE;
                }
            } else if (attr == R.styleable.Slider_sl_thumbBorderSize) {
                this.mThumbBorderSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Slider_sl_thumbRadius) {
                this.mThumbRadius = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Slider_sl_thumbFocusRadius) {
                this.mThumbFocusRadius = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Slider_sl_travelAnimDuration) {
                this.mTravelAnimationDuration = a.getInteger(attr, 0);
                this.mTransformAnimationDuration = this.mTravelAnimationDuration;
            } else if (attr == R.styleable.Slider_sl_alwaysFillThumb) {
                this.mAlwaysFillThumb = a.getBoolean(R.styleable.Slider_sl_alwaysFillThumb, false);
            } else if (attr == R.styleable.Slider_sl_interpolator) {
                int resId = a.getResourceId(R.styleable.Slider_sl_interpolator, 0);
                this.mInterpolator = AnimationUtils.loadInterpolator(context, resId);
            } else if (attr == R.styleable.Slider_android_gravity) {
                this.mGravity = a.getInteger(attr, 0);
            } else if (attr == R.styleable.Slider_sl_minValue) {
                minValue = a.getInteger(attr, 0);
                valueRangeDefined = true;
            } else if (attr == R.styleable.Slider_sl_maxValue) {
                maxValue = a.getInteger(attr, 0);
                valueRangeDefined = true;
            } else if (attr == R.styleable.Slider_sl_stepValue) {
                this.mStepValue = a.getInteger(attr, 0);
            } else if (attr == R.styleable.Slider_sl_value) {
                value = a.getInteger(attr, 0);
                valueDefined = true;
            } else if (attr == R.styleable.Slider_sl_fontFamily) {
                familyName = a.getString(attr);
                textStyleDefined = true;
            } else if (attr == R.styleable.Slider_sl_textStyle) {
                style = a.getInteger(attr, 0);
                textStyleDefined = true;
            } else if (attr == R.styleable.Slider_sl_textColor) {
                this.mTextColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.Slider_sl_textSize) {
                this.mTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Slider_android_enabled) {
                setEnabled(a.getBoolean(attr, true));
            } else if (attr == R.styleable.Slider_sl_baselineOffset) {
                this.mBaselineOffset = a.getDimensionPixelOffset(attr, 0);
            }
        }
        a.recycle();
        if (this.mTrackSize < 0) {
            this.mTrackSize = ThemeUtil.dpToPx(context, 2);
        }
        if (this.mThumbBorderSize < 0) {
            this.mThumbBorderSize = ThemeUtil.dpToPx(context, 2);
        }
        if (this.mThumbRadius < 0) {
            this.mThumbRadius = ThemeUtil.dpToPx(context, 10);
        }
        if (this.mThumbFocusRadius < 0) {
            this.mThumbFocusRadius = ThemeUtil.dpToPx(context, 14);
        }
        if (this.mTravelAnimationDuration < 0) {
            this.mTravelAnimationDuration = context.getResources().getInteger(android.R.integer.config_mediumAnimTime);
            this.mTransformAnimationDuration = this.mTravelAnimationDuration;
        }
        if (this.mInterpolator == null) {
            this.mInterpolator = new DecelerateInterpolator();
        }
        if (valueRangeDefined) {
            setValueRange(minValue, maxValue, false);
        }
        if (valueDefined) {
            setValue(value, false);
        } else if (this.mThumbPosition < 0.0f) {
            setValue(this.mMinValue, false);
        }
        if (textStyleDefined) {
            this.mTypeface = TypefaceUtil.load(context, familyName, style);
        }
        if (this.mTextSize < 0) {
            this.mTextSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_small_material);
        }
        this.mPaint.setTextSize(this.mTextSize);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mPaint.setTypeface(this.mTypeface);
        measureText();
        invalidate();
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            onThemeChanged(null);
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        RippleManager.cancelRipple(this);
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    private void measureText() {
        if (this.mValueText == null) {
            return;
        }
        Rect temp = new Rect();
        this.mPaint.setTextSize(this.mTextSize);
        float width = this.mPaint.measureText(this.mValueText);
        float maxWidth = (float) (((this.mThumbRadius * Math.sqrt(2.0d)) * 2.0d) - ThemeUtil.dpToPx(getContext(), 8));
        if (width > maxWidth) {
            float textSize = (this.mTextSize * maxWidth) / width;
            this.mPaint.setTextSize(textSize);
        }
        this.mPaint.getTextBounds(this.mValueText, 0, this.mValueText.length(), temp);
        this.mTextHeight = temp.height();
    }

    private String getValueText() {
        int value = getValue();
        if (this.mValueText == null || this.mMemoValue != value) {
            this.mMemoValue = value;
            this.mValueText = this.mValueDescriptionProvider == null ? String.valueOf(this.mMemoValue) : this.mValueDescriptionProvider.getDescription(this.mMemoValue);
            measureText();
        }
        return this.mValueText;
    }

    public int getMinValue() {
        return this.mMinValue;
    }

    public int getMaxValue() {
        return this.mMaxValue;
    }

    public int getStepValue() {
        return this.mStepValue;
    }

    public void setValueRange(int min, int max, boolean animation) {
        if (max >= min) {
            if (min == this.mMinValue && max == this.mMaxValue) {
                return;
            }
            float oldValue = getExactValue();
            float oldPosition = getPosition();
            this.mMinValue = min;
            this.mMaxValue = max;
            setValue(oldValue, animation);
            if (this.mOnPositionChangeListener != null && oldPosition == getPosition() && oldValue != getExactValue()) {
                this.mOnPositionChangeListener.onPositionChanged(this, false, oldPosition, oldPosition, Math.round(oldValue), getValue());
            }
        }
    }

    public int getValue() {
        return Math.round(getExactValue());
    }

    public float getExactValue() {
        return ((this.mMaxValue - this.mMinValue) * getPosition()) + this.mMinValue;
    }

    public float getPosition() {
        return this.mThumbMoveAnimator.isRunning() ? this.mThumbMoveAnimator.getPosition() : this.mThumbPosition;
    }

    public void setPosition(float pos, boolean animation) {
        setPosition(pos, animation, animation, false);
    }

    private void setPosition(float pos, boolean moveAnimation, boolean transformAnimation, boolean fromUser) {
        boolean change = getPosition() != pos;
        int oldValue = getValue();
        float oldPos = getPosition();
        if (!moveAnimation || !this.mThumbMoveAnimator.startAnimation(pos)) {
            this.mThumbPosition = pos;
            if (transformAnimation) {
                if (!this.mIsDragging) {
                    this.mThumbRadiusAnimator.startAnimation(this.mThumbRadius);
                }
                this.mThumbStrokeAnimator.startAnimation(pos == 0.0f ? 0 : 1);
            } else {
                this.mThumbCurrentRadius = this.mThumbRadius;
                this.mThumbFillPercent = (this.mAlwaysFillThumb || this.mThumbPosition != 0.0f) ? 1.0f : 0.0f;
                invalidate();
            }
        }
        int newValue = getValue();
        float newPos = getPosition();
        if (change && this.mOnPositionChangeListener != null) {
            this.mOnPositionChangeListener.onPositionChanged(this, fromUser, oldPos, newPos, oldValue, newValue);
        }
    }

    public void setPrimaryColor(int color) {
        this.mPrimaryColor = color;
        invalidate();
    }

    public void setSecondaryColor(int color) {
        this.mSecondaryColor = color;
        invalidate();
    }

    public void setAlwaysFillThumb(boolean alwaysFillThumb) {
        this.mAlwaysFillThumb = alwaysFillThumb;
    }

    public void setValue(float value, boolean animation) {
        setPosition((Math.min(this.mMaxValue, Math.max(value, this.mMinValue)) - this.mMinValue) / (this.mMaxValue - this.mMinValue), animation);
    }

    public void setOnPositionChangeListener(OnPositionChangeListener listener) {
        this.mOnPositionChangeListener = listener;
    }

    public void setValueDescriptionProvider(ValueDescriptionProvider provider) {
        this.mValueDescriptionProvider = provider;
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        Drawable background = getBackground();
        if ((background instanceof RippleDrawable) && !(drawable instanceof RippleDrawable)) {
            ((RippleDrawable) background).setBackgroundDrawable(drawable);
        } else {
            super.setBackgroundDrawable(drawable);
        }
    }

    protected RippleManager getRippleManager() {
        if (this.mRippleManager == null) {
            synchronized (RippleManager.class) {
                if (this.mRippleManager == null) {
                    this.mRippleManager = new RippleManager();
                }
            }
        }
        return this.mRippleManager;
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        RippleManager rippleManager = getRippleManager();
        if (l == rippleManager) {
            super.setOnClickListener(l);
        } else {
            rippleManager.setOnClickListener(l);
            setOnClickListener(rippleManager);
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        switch (widthMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                widthSize = Math.min(widthSize, getSuggestedMinimumWidth());
                break;
            case 0:
                widthSize = getSuggestedMinimumWidth();
                break;
        }
        switch (heightMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                heightSize = Math.min(heightSize, getSuggestedMinimumHeight());
                break;
            case 0:
                heightSize = getSuggestedMinimumHeight();
                break;
        }
        setMeasuredDimension(widthSize, heightSize);
    }

    @Override // android.view.View
    public int getSuggestedMinimumWidth() {
        return ((this.mDiscreteMode ? (int) (this.mThumbRadius * Math.sqrt(2.0d)) : this.mThumbFocusRadius) * 4) + getPaddingLeft() + getPaddingRight();
    }

    @Override // android.view.View
    public int getSuggestedMinimumHeight() {
        return (this.mDiscreteMode ? (int) (this.mThumbRadius * (4.0d + Math.sqrt(2.0d))) : this.mThumbFocusRadius * 2) + getPaddingTop() + getPaddingBottom();
    }

    @Override // android.view.View
    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            invalidate();
        }
    }

    @Override // android.view.View
    public int getBaseline() {
        int baseline;
        int align = this.mGravity & 112;
        if (this.mDiscreteMode) {
            int fullHeight = (int) (this.mThumbRadius * (4.0d + Math.sqrt(2.0d)));
            int height = this.mThumbRadius * 2;
            switch (align) {
                case 48:
                    baseline = Math.max(getPaddingTop(), fullHeight - height) + this.mThumbRadius;
                    break;
                case 80:
                    baseline = getMeasuredHeight() - getPaddingBottom();
                    break;
                default:
                    baseline = Math.round(Math.max((getMeasuredHeight() - height) / 2.0f, fullHeight - height) + this.mThumbRadius);
                    break;
            }
        } else {
            int height2 = this.mThumbFocusRadius * 2;
            switch (align) {
                case 48:
                    baseline = getPaddingTop() + this.mThumbFocusRadius;
                    break;
                case 80:
                    baseline = getMeasuredHeight() - getPaddingBottom();
                    break;
                default:
                    baseline = Math.round(((getMeasuredHeight() - height2) / 2.0f) + this.mThumbFocusRadius);
                    break;
            }
        }
        return baseline + this.mBaselineOffset;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.mDrawRect.left = getPaddingLeft() + this.mThumbRadius;
        this.mDrawRect.right = (w - getPaddingRight()) - this.mThumbRadius;
        int align = this.mGravity & 112;
        if (this.mDiscreteMode) {
            int fullHeight = (int) (this.mThumbRadius * (4.0d + Math.sqrt(2.0d)));
            int height = this.mThumbRadius * 2;
            switch (align) {
                case 48:
                    this.mDrawRect.top = Math.max(getPaddingTop(), fullHeight - height);
                    this.mDrawRect.bottom = this.mDrawRect.top + height;
                    break;
                case 80:
                    this.mDrawRect.bottom = h - getPaddingBottom();
                    this.mDrawRect.top = this.mDrawRect.bottom - height;
                    break;
                default:
                    this.mDrawRect.top = Math.max((h - height) / 2.0f, fullHeight - height);
                    this.mDrawRect.bottom = this.mDrawRect.top + height;
                    break;
            }
        }
        int height2 = this.mThumbFocusRadius * 2;
        switch (align) {
            case 48:
                this.mDrawRect.top = getPaddingTop();
                this.mDrawRect.bottom = this.mDrawRect.top + height2;
                break;
            case 80:
                this.mDrawRect.bottom = h - getPaddingBottom();
                this.mDrawRect.top = this.mDrawRect.bottom - height2;
                break;
            default:
                this.mDrawRect.top = (h - height2) / 2.0f;
                this.mDrawRect.bottom = this.mDrawRect.top + height2;
                break;
        }
    }

    private boolean isThumbHit(float x, float y, float radius) {
        float cx = (this.mDrawRect.width() * this.mThumbPosition) + this.mDrawRect.left;
        float cy = this.mDrawRect.centerY();
        return x >= cx - radius && x <= cx + radius && y >= cy - radius && y < cy + radius;
    }

    private double distance(float x1, float y1, float x2, float y2) {
        return Math.sqrt(Math.pow(x1 - x2, 2.0d) + Math.pow(y1 - y2, 2.0d));
    }

    private float correctPosition(float position) {
        float position2;
        if (!this.mDiscreteMode) {
            return position;
        }
        int totalOffset = this.mMaxValue - this.mMinValue;
        int valueOffset = Math.round(totalOffset * position);
        int stepOffset = valueOffset / this.mStepValue;
        int lowerValue = stepOffset * this.mStepValue;
        int higherValue = Math.min(totalOffset, (stepOffset + 1) * this.mStepValue);
        if (valueOffset - lowerValue < higherValue - valueOffset) {
            position2 = lowerValue / totalOffset;
        } else {
            position2 = higherValue / totalOffset;
        }
        return position2;
    }

    @Override // android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        super.onTouchEvent(event);
        getRippleManager().onTouchEvent(this, event);
        if (!isEnabled()) {
            return false;
        }
        float x = event.getX();
        float y = event.getY();
        if (this.mIsRtl) {
            x = (2.0f * this.mDrawRect.centerX()) - x;
        }
        switch (event.getAction()) {
            case 0:
                this.mIsDragging = isThumbHit(x, y, (float) this.mThumbRadius) && !this.mThumbMoveAnimator.isRunning();
                this.mMemoPoint.set(x, y);
                if (this.mIsDragging) {
                    this.mThumbRadiusAnimator.startAnimation(this.mDiscreteMode ? 0 : this.mThumbFocusRadius);
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                        return true;
                    }
                    return true;
                }
                return true;
            case 1:
                if (!this.mIsDragging) {
                    if (distance(this.mMemoPoint.x, this.mMemoPoint.y, x, y) <= this.mTouchSlop) {
                        float position = correctPosition(Math.min(1.0f, Math.max(0.0f, (x - this.mDrawRect.left) / this.mDrawRect.width())));
                        setPosition(position, true, true, true);
                        return true;
                    }
                    return true;
                }
                this.mIsDragging = false;
                setPosition(getPosition(), true, true, true);
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(false);
                    return true;
                }
                return true;
            case 2:
                if (this.mIsDragging) {
                    if (this.mDiscreteMode) {
                        float position2 = correctPosition(Math.min(1.0f, Math.max(0.0f, (x - this.mDrawRect.left) / this.mDrawRect.width())));
                        setPosition(position2, true, true, true);
                        return true;
                    }
                    float offset = (x - this.mMemoPoint.x) / this.mDrawRect.width();
                    float position3 = Math.min(1.0f, Math.max(0.0f, this.mThumbPosition + offset));
                    setPosition(position3, false, true, true);
                    this.mMemoPoint.x = x;
                    invalidate();
                    return true;
                }
                return true;
            case 3:
                if (this.mIsDragging) {
                    this.mIsDragging = false;
                    setPosition(getPosition(), true, true, true);
                    if (getParent() != null) {
                        getParent().requestDisallowInterceptTouchEvent(false);
                        return true;
                    }
                    return true;
                }
                return true;
            default:
                return true;
        }
    }

    private void getTrackPath(float x, float y, float radius) {
        float halfStroke = this.mTrackSize / 2.0f;
        this.mLeftTrackPath.reset();
        this.mRightTrackPath.reset();
        if (radius - 1.0f < halfStroke) {
            if (this.mTrackCap != Paint.Cap.ROUND) {
                if (x > this.mDrawRect.left) {
                    this.mLeftTrackPath.moveTo(this.mDrawRect.left, y - halfStroke);
                    this.mLeftTrackPath.lineTo(x, y - halfStroke);
                    this.mLeftTrackPath.lineTo(x, y + halfStroke);
                    this.mLeftTrackPath.lineTo(this.mDrawRect.left, y + halfStroke);
                    this.mLeftTrackPath.close();
                }
                if (x < this.mDrawRect.right) {
                    this.mRightTrackPath.moveTo(this.mDrawRect.right, y + halfStroke);
                    this.mRightTrackPath.lineTo(x, y + halfStroke);
                    this.mRightTrackPath.lineTo(x, y - halfStroke);
                    this.mRightTrackPath.lineTo(this.mDrawRect.right, y - halfStroke);
                    this.mRightTrackPath.close();
                    return;
                }
                return;
            }
            if (x > this.mDrawRect.left) {
                this.mTempRect.set(this.mDrawRect.left, y - halfStroke, this.mDrawRect.left + this.mTrackSize, y + halfStroke);
                this.mLeftTrackPath.arcTo(this.mTempRect, 90.0f, 180.0f);
                this.mLeftTrackPath.lineTo(x, y - halfStroke);
                this.mLeftTrackPath.lineTo(x, y + halfStroke);
                this.mLeftTrackPath.close();
            }
            if (x < this.mDrawRect.right) {
                this.mTempRect.set(this.mDrawRect.right - this.mTrackSize, y - halfStroke, this.mDrawRect.right, y + halfStroke);
                this.mRightTrackPath.arcTo(this.mTempRect, 270.0f, 180.0f);
                this.mRightTrackPath.lineTo(x, y + halfStroke);
                this.mRightTrackPath.lineTo(x, y - halfStroke);
                this.mRightTrackPath.close();
                return;
            }
            return;
        }
        if (this.mTrackCap != Paint.Cap.ROUND) {
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            float angle = (float) ((Math.asin(halfStroke / (radius - 1.0f)) / 3.141592653589793d) * 180.0d);
            if (x - radius > this.mDrawRect.left) {
                this.mLeftTrackPath.moveTo(this.mDrawRect.left, y - halfStroke);
                this.mLeftTrackPath.arcTo(this.mTempRect, 180.0f + angle, (-angle) * 2.0f);
                this.mLeftTrackPath.lineTo(this.mDrawRect.left, y + halfStroke);
                this.mLeftTrackPath.close();
            }
            if (x + radius < this.mDrawRect.right) {
                this.mRightTrackPath.moveTo(this.mDrawRect.right, y - halfStroke);
                this.mRightTrackPath.arcTo(this.mTempRect, -angle, angle * 2.0f);
                this.mRightTrackPath.lineTo(this.mDrawRect.right, y + halfStroke);
                this.mRightTrackPath.close();
                return;
            }
            return;
        }
        float angle2 = (float) ((Math.asin(halfStroke / (radius - 1.0f)) / 3.141592653589793d) * 180.0d);
        if (x - radius > this.mDrawRect.left) {
            float angle22 = (float) ((Math.acos(Math.max(0.0f, (((this.mDrawRect.left + halfStroke) - x) + radius) / halfStroke)) / 3.141592653589793d) * 180.0d);
            this.mTempRect.set(this.mDrawRect.left, y - halfStroke, this.mDrawRect.left + this.mTrackSize, y + halfStroke);
            this.mLeftTrackPath.arcTo(this.mTempRect, 180.0f - angle22, angle22 * 2.0f);
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            this.mLeftTrackPath.arcTo(this.mTempRect, 180.0f + angle2, (-angle2) * 2.0f);
            this.mLeftTrackPath.close();
        }
        if (x + radius < this.mDrawRect.right) {
            float angle23 = (float) Math.acos(Math.max(0.0f, (((x + radius) - this.mDrawRect.right) + halfStroke) / halfStroke));
            this.mRightTrackPath.moveTo((float) ((this.mDrawRect.right - halfStroke) + (Math.cos(angle23) * halfStroke)), (float) (y + (Math.sin(angle23) * halfStroke)));
            float angle24 = (float) ((angle23 / 3.141592653589793d) * 180.0d);
            this.mTempRect.set(this.mDrawRect.right - this.mTrackSize, y - halfStroke, this.mDrawRect.right, y + halfStroke);
            this.mRightTrackPath.arcTo(this.mTempRect, angle24, (-angle24) * 2.0f);
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            this.mRightTrackPath.arcTo(this.mTempRect, -angle2, angle2 * 2.0f);
            this.mRightTrackPath.close();
        }
    }

    private Path getMarkPath(Path path, float cx, float cy, float radius, float factor) {
        if (path == null) {
            path = new Path();
        } else {
            path.reset();
        }
        float x1 = cx - radius;
        float x2 = cx + radius;
        float y3 = cy + radius;
        float nCy = cy - (radius * factor);
        float angle = (float) ((Math.atan2(cy - nCy, x2 - cx) * 180.0d) / 3.141592653589793d);
        float nRadius = (float) distance(cx, nCy, x1, cy);
        this.mTempRect.set(cx - nRadius, nCy - nRadius, cx + nRadius, nCy + nRadius);
        path.moveTo(x1, cy);
        path.arcTo(this.mTempRect, 180.0f - angle, 180.0f + (angle * 2.0f));
        if (factor > 0.9f) {
            path.lineTo(cx, y3);
        } else {
            float x4 = (x2 + cx) / 2.0f;
            float y4 = (cy + y3) / 2.0f;
            double d1 = distance(x2, cy, x4, y4);
            double d2 = d1 / Math.tan((3.141592653589793d * (1.0f - factor)) / 4.0d);
            float nCx = (float) (x4 - (Math.cos(0.7853981633974483d) * d2));
            float nCy2 = (float) (y4 - (Math.sin(0.7853981633974483d) * d2));
            float angle2 = (float) ((Math.atan2(cy - nCy2, x2 - nCx) * 180.0d) / 3.141592653589793d);
            float angle22 = (float) ((Math.atan2(y3 - nCy2, cx - nCx) * 180.0d) / 3.141592653589793d);
            float nRadius2 = (float) distance(nCx, nCy2, x2, cy);
            this.mTempRect.set(nCx - nRadius2, nCy2 - nRadius2, nCx + nRadius2, nCy2 + nRadius2);
            path.arcTo(this.mTempRect, angle2, angle22 - angle2);
            float nCx2 = (cx * 2.0f) - nCx;
            float angle3 = (float) ((Math.atan2(y3 - nCy2, cx - nCx2) * 180.0d) / 3.141592653589793d);
            float angle23 = (float) ((Math.atan2(cy - nCy2, x1 - nCx2) * 180.0d) / 3.141592653589793d);
            this.mTempRect.set(nCx2 - nRadius2, nCy2 - nRadius2, nCx2 + nRadius2, nCy2 + nRadius2);
            path.arcTo(this.mTempRect, angle3 + 0.7853982f, angle23 - angle3);
        }
        path.close();
        return path;
    }

    @Override // android.view.View
    public void draw(@NonNull Canvas canvas) {
        super.draw(canvas);
        float x = (this.mDrawRect.width() * this.mThumbPosition) + this.mDrawRect.left;
        if (this.mIsRtl) {
            x = (2.0f * this.mDrawRect.centerX()) - x;
        }
        float y = this.mDrawRect.centerY();
        int filledPrimaryColor = ColorUtil.getMiddleColor(this.mSecondaryColor, isEnabled() ? this.mPrimaryColor : this.mSecondaryColor, this.mThumbFillPercent);
        getTrackPath(x, y, this.mThumbCurrentRadius);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(this.mIsRtl ? filledPrimaryColor : this.mSecondaryColor);
        canvas.drawPath(this.mRightTrackPath, this.mPaint);
        this.mPaint.setColor(this.mIsRtl ? this.mSecondaryColor : filledPrimaryColor);
        canvas.drawPath(this.mLeftTrackPath, this.mPaint);
        this.mPaint.setColor(filledPrimaryColor);
        if (this.mDiscreteMode) {
            float factor = 1.0f - (this.mThumbCurrentRadius / this.mThumbRadius);
            if (factor > 0.0f) {
                this.mMarkPath = getMarkPath(this.mMarkPath, x, y, this.mThumbRadius, factor);
                this.mPaint.setStyle(Paint.Style.FILL);
                int saveCount = canvas.save();
                canvas.translate(0.0f, (-this.mThumbRadius) * 2 * factor);
                canvas.drawPath(this.mMarkPath, this.mPaint);
                this.mPaint.setColor(ColorUtil.getColor(this.mTextColor, factor));
                canvas.drawText(getValueText(), x, (y + (this.mTextHeight / 2.0f)) - (this.mThumbRadius * factor), this.mPaint);
                canvas.restoreToCount(saveCount);
            }
            float radius = isEnabled() ? this.mThumbCurrentRadius : this.mThumbCurrentRadius - this.mThumbBorderSize;
            if (radius > 0.0f) {
                this.mPaint.setColor(filledPrimaryColor);
                canvas.drawCircle(x, y, radius, this.mPaint);
                return;
            }
            return;
        }
        float radius2 = isEnabled() ? this.mThumbCurrentRadius : this.mThumbCurrentRadius - this.mThumbBorderSize;
        if (this.mThumbFillPercent == 1.0f) {
            this.mPaint.setStyle(Paint.Style.FILL);
        } else {
            float strokeWidth = ((radius2 - this.mThumbBorderSize) * this.mThumbFillPercent) + this.mThumbBorderSize;
            radius2 -= strokeWidth / 2.0f;
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setStrokeWidth(strokeWidth);
        }
        canvas.drawCircle(x, y, radius2, this.mPaint);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$ThumbRadiusAnimator.class */
    class ThumbRadiusAnimator implements Runnable {
        boolean mRunning = false;
        long mStartTime;
        float mStartRadius;
        int mRadius;

        ThumbRadiusAnimator() {
        }

        public void resetAnimation() {
            this.mStartTime = SystemClock.uptimeMillis();
            this.mStartRadius = Slider.this.mThumbCurrentRadius;
        }

        public boolean startAnimation(int radius) {
            if (Slider.this.mThumbCurrentRadius == radius) {
                return false;
            }
            this.mRadius = radius;
            if (Slider.this.getHandler() != null) {
                resetAnimation();
                this.mRunning = true;
                Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                Slider.this.invalidate();
                return true;
            }
            Slider.this.mThumbCurrentRadius = this.mRadius;
            Slider.this.invalidate();
            return false;
        }

        public void stopAnimation() {
            this.mRunning = false;
            Slider.this.mThumbCurrentRadius = this.mRadius;
            if (Slider.this.getHandler() != null) {
                Slider.this.getHandler().removeCallbacks(this);
            }
            Slider.this.invalidate();
        }

        @Override // java.lang.Runnable
        public void run() {
            long curTime = SystemClock.uptimeMillis();
            float progress = Math.min(1.0f, (curTime - this.mStartTime) / Slider.this.mTransformAnimationDuration);
            float value = Slider.this.mInterpolator.getInterpolation(progress);
            Slider.this.mThumbCurrentRadius = ((this.mRadius - this.mStartRadius) * value) + this.mStartRadius;
            if (progress == 1.0f) {
                stopAnimation();
            }
            if (this.mRunning) {
                if (Slider.this.getHandler() != null) {
                    Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                } else {
                    stopAnimation();
                }
            }
            Slider.this.invalidate();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$ThumbStrokeAnimator.class */
    class ThumbStrokeAnimator implements Runnable {
        boolean mRunning = false;
        long mStartTime;
        float mStartFillPercent;
        int mFillPercent;

        ThumbStrokeAnimator() {
        }

        public void resetAnimation() {
            this.mStartTime = SystemClock.uptimeMillis();
            this.mStartFillPercent = Slider.this.mThumbFillPercent;
        }

        public boolean startAnimation(int fillPercent) {
            if (Slider.this.mThumbFillPercent == fillPercent) {
                return false;
            }
            this.mFillPercent = fillPercent;
            if (Slider.this.getHandler() != null) {
                resetAnimation();
                this.mRunning = true;
                Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                Slider.this.invalidate();
                return true;
            }
            Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : this.mFillPercent;
            Slider.this.invalidate();
            return false;
        }

        public void stopAnimation() {
            this.mRunning = false;
            Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : this.mFillPercent;
            if (Slider.this.getHandler() != null) {
                Slider.this.getHandler().removeCallbacks(this);
            }
            Slider.this.invalidate();
        }

        @Override // java.lang.Runnable
        public void run() {
            long curTime = SystemClock.uptimeMillis();
            float progress = Math.min(1.0f, (curTime - this.mStartTime) / Slider.this.mTransformAnimationDuration);
            float value = Slider.this.mInterpolator.getInterpolation(progress);
            Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : ((this.mFillPercent - this.mStartFillPercent) * value) + this.mStartFillPercent;
            if (progress == 1.0f) {
                stopAnimation();
            }
            if (this.mRunning) {
                if (Slider.this.getHandler() != null) {
                    Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                } else {
                    stopAnimation();
                }
            }
            Slider.this.invalidate();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$ThumbMoveAnimator.class */
    class ThumbMoveAnimator implements Runnable {
        boolean mRunning = false;
        long mStartTime;
        float mStartFillPercent;
        float mStartRadius;
        float mStartPosition;
        float mPosition;
        float mFillPercent;
        int mDuration;

        ThumbMoveAnimator() {
        }

        public boolean isRunning() {
            return this.mRunning;
        }

        public float getPosition() {
            return this.mPosition;
        }

        public void resetAnimation() {
            this.mStartTime = SystemClock.uptimeMillis();
            this.mStartPosition = Slider.this.mThumbPosition;
            this.mStartFillPercent = Slider.this.mThumbFillPercent;
            this.mStartRadius = Slider.this.mThumbCurrentRadius;
            this.mFillPercent = this.mPosition == 0.0f ? 0.0f : 1.0f;
            this.mDuration = (!Slider.this.mDiscreteMode || Slider.this.mIsDragging) ? Slider.this.mTravelAnimationDuration : (Slider.this.mTransformAnimationDuration * 2) + Slider.this.mTravelAnimationDuration;
        }

        public boolean startAnimation(float position) {
            if (Slider.this.mThumbPosition == position) {
                return false;
            }
            this.mPosition = position;
            if (Slider.this.getHandler() == null) {
                Slider.this.mThumbPosition = position;
                Slider.this.invalidate();
                return false;
            }
            resetAnimation();
            this.mRunning = true;
            Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
            Slider.this.invalidate();
            return true;
        }

        public void stopAnimation() {
            this.mRunning = false;
            Slider.this.mThumbCurrentRadius = (Slider.this.mDiscreteMode && Slider.this.mIsDragging) ? 0.0f : Slider.this.mThumbRadius;
            Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : this.mFillPercent;
            Slider.this.mThumbPosition = this.mPosition;
            if (Slider.this.getHandler() != null) {
                Slider.this.getHandler().removeCallbacks(this);
            }
            Slider.this.invalidate();
        }

        @Override // java.lang.Runnable
        public void run() {
            long curTime = SystemClock.uptimeMillis();
            float progress = Math.min(1.0f, (curTime - this.mStartTime) / this.mDuration);
            float value = Slider.this.mInterpolator.getInterpolation(progress);
            if (Slider.this.mDiscreteMode) {
                if (Slider.this.mIsDragging) {
                    Slider.this.mThumbPosition = ((this.mPosition - this.mStartPosition) * value) + this.mStartPosition;
                    Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : ((this.mFillPercent - this.mStartFillPercent) * value) + this.mStartFillPercent;
                } else {
                    float p1 = Slider.this.mTravelAnimationDuration / this.mDuration;
                    float p2 = (Slider.this.mTravelAnimationDuration + Slider.this.mTransformAnimationDuration) / this.mDuration;
                    if (progress < p1) {
                        float value2 = Slider.this.mInterpolator.getInterpolation(progress / p1);
                        Slider.this.mThumbCurrentRadius = this.mStartRadius * (1.0f - value2);
                        Slider.this.mThumbPosition = ((this.mPosition - this.mStartPosition) * value2) + this.mStartPosition;
                        Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : ((this.mFillPercent - this.mStartFillPercent) * value2) + this.mStartFillPercent;
                    } else if (progress > p2) {
                        Slider.this.mThumbCurrentRadius = (Slider.this.mThumbRadius * (progress - p2)) / (1.0f - p2);
                    }
                }
            } else {
                Slider.this.mThumbPosition = ((this.mPosition - this.mStartPosition) * value) + this.mStartPosition;
                Slider.this.mThumbFillPercent = Slider.this.mAlwaysFillThumb ? 1.0f : ((this.mFillPercent - this.mStartFillPercent) * value) + this.mStartFillPercent;
                if (progress < 0.2d) {
                    Slider.this.mThumbCurrentRadius = Math.max(Slider.this.mThumbRadius + (Slider.this.mThumbBorderSize * progress * 5.0f), Slider.this.mThumbCurrentRadius);
                } else if (progress >= 0.8d) {
                    Slider.this.mThumbCurrentRadius = Slider.this.mThumbRadius + (Slider.this.mThumbBorderSize * (5.0f - (progress * 5.0f)));
                }
            }
            if (progress == 1.0f) {
                stopAnimation();
            }
            if (this.mRunning) {
                if (Slider.this.getHandler() != null) {
                    Slider.this.getHandler().postAtTime(this, SystemClock.uptimeMillis() + 16);
                } else {
                    stopAnimation();
                }
            }
            Slider.this.invalidate();
        }
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.position = getPosition();
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        setPosition(ss.position, false);
        requestLayout();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Slider$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        float position;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.rey.material.widget.Slider.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.position = in.readFloat();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeFloat(this.position);
        }

        public String toString() {
            return "Slider.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " pos=" + this.position + "}";
        }
    }
}
