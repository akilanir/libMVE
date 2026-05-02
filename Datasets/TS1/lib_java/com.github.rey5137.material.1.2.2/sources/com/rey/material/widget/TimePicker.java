package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.text.format.DateFormat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.TypefaceUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TimePicker.class */
public class TimePicker extends View implements ThemeManager.OnThemeChangedListener {
    protected int mStyleId;
    protected int mCurrentStyle;
    private int mBackgroundColor;
    private int mSelectionColor;
    private int mSelectionRadius;
    private int mTickSize;
    private Typeface mTypeface;
    private int mTextSize;
    private int mTextColor;
    private int mTextHighlightColor;
    private boolean m24Hour;
    private int mAnimDuration;
    private Interpolator mInInterpolator;
    private Interpolator mOutInterpolator;
    private long mStartTime;
    private float mAnimProgress;
    private boolean mRunning;
    private Paint mPaint;
    private PointF mCenterPoint;
    private float mOuterRadius;
    private float mInnerRadius;
    private float mSecondInnerRadius;
    private float[] mLocations;
    private Rect mRect;
    private String[] mTicks;
    private int mMode;
    public static final int MODE_HOUR = 0;
    public static final int MODE_MINUTE = 1;
    private int mHour;
    private int mMinute;
    private boolean mEdited;
    private OnTimeChangedListener mOnTimeChangedListener;
    private final Runnable mUpdater;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TimePicker$OnTimeChangedListener.class */
    public interface OnTimeChangedListener {
        void onModeChanged(int i);

        void onHourChanged(int i, int i2);

        void onMinuteChanged(int i, int i2);
    }

    public TimePicker(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mSelectionRadius = -1;
        this.mTickSize = -1;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -16777216;
        this.mTextHighlightColor = -1;
        this.m24Hour = true;
        this.mAnimDuration = -1;
        this.mLocations = new float[72];
        this.mMode = 0;
        this.mHour = 0;
        this.mMinute = 0;
        this.mEdited = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.TimePicker.1
            @Override // java.lang.Runnable
            public void run() {
                TimePicker.this.update();
            }
        };
        init(context, null, 0, 0);
    }

    public TimePicker(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mSelectionRadius = -1;
        this.mTickSize = -1;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -16777216;
        this.mTextHighlightColor = -1;
        this.m24Hour = true;
        this.mAnimDuration = -1;
        this.mLocations = new float[72];
        this.mMode = 0;
        this.mHour = 0;
        this.mMinute = 0;
        this.mEdited = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.TimePicker.1
            @Override // java.lang.Runnable
            public void run() {
                TimePicker.this.update();
            }
        };
        init(context, attrs, 0, 0);
    }

    public TimePicker(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mSelectionRadius = -1;
        this.mTickSize = -1;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -16777216;
        this.mTextHighlightColor = -1;
        this.m24Hour = true;
        this.mAnimDuration = -1;
        this.mLocations = new float[72];
        this.mMode = 0;
        this.mHour = 0;
        this.mMinute = 0;
        this.mEdited = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.TimePicker.1
            @Override // java.lang.Runnable
            public void run() {
                TimePicker.this.update();
            }
        };
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public TimePicker(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mSelectionRadius = -1;
        this.mTickSize = -1;
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -16777216;
        this.mTextHighlightColor = -1;
        this.m24Hour = true;
        this.mAnimDuration = -1;
        this.mLocations = new float[72];
        this.mMode = 0;
        this.mHour = 0;
        this.mMinute = 0;
        this.mEdited = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.TimePicker.1
            @Override // java.lang.Runnable
            public void run() {
                TimePicker.this.update();
            }
        };
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mPaint = new Paint(1);
        this.mRect = new Rect();
        this.mBackgroundColor = ColorUtil.getColor(ThemeUtil.colorPrimary(context, -16777216), 0.25f);
        this.mSelectionColor = ThemeUtil.colorPrimary(context, -16777216);
        initTickLabels();
        setWillNotDraw(false);
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    private void initTickLabels() {
        this.mTicks = new String[36];
        for (int i = 0; i < 23; i++) {
            this.mTicks[i] = String.format("%2d", Integer.valueOf(i + 1));
        }
        this.mTicks[23] = String.format("%2d", 0);
        this.mTicks[35] = this.mTicks[23];
        for (int i2 = 24; i2 < 35; i2++) {
            this.mTicks[i2] = String.format("%2d", Integer.valueOf((i2 - 23) * 5));
        }
    }

    public void applyStyle(int styleId) {
        ViewUtil.applyStyle(this, styleId);
        applyStyle(getContext(), null, 0, styleId);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.TimePicker, defStyleAttr, defStyleRes);
        boolean hourDefined = false;
        String familyName = null;
        int style = -1;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.TimePicker_tp_backgroundColor) {
                this.mBackgroundColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_selectionColor) {
                this.mSelectionColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_selectionRadius) {
                this.mSelectionRadius = a.getDimensionPixelOffset(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_tickSize) {
                this.mTickSize = a.getDimensionPixelOffset(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_textSize) {
                this.mTextSize = a.getDimensionPixelOffset(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_textColor) {
                this.mTextColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_textHighlightColor) {
                this.mTextHighlightColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_animDuration) {
                this.mAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.TimePicker_tp_inInterpolator) {
                this.mInInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.TimePicker_tp_outInterpolator) {
                this.mOutInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.TimePicker_tp_mode) {
                setMode(a.getInteger(attr, 0), false);
            } else if (attr == R.styleable.TimePicker_tp_24Hour) {
                set24Hour(a.getBoolean(attr, false));
                hourDefined = true;
            } else if (attr == R.styleable.TimePicker_tp_hour) {
                setHour(a.getInteger(attr, 0));
            } else if (attr == R.styleable.TimePicker_tp_minute) {
                setMinute(a.getInteger(attr, 0));
            } else if (attr == R.styleable.TimePicker_tp_fontFamily) {
                familyName = a.getString(attr);
            } else if (attr == R.styleable.TimePicker_tp_textStyle) {
                style = a.getInteger(attr, 0);
            }
        }
        a.recycle();
        if (this.mSelectionRadius < 0) {
            this.mSecondInnerRadius = ThemeUtil.dpToPx(context, 8);
        }
        if (this.mTickSize < 0) {
            this.mTickSize = ThemeUtil.dpToPx(context, 1);
        }
        if (this.mTextSize < 0) {
            this.mTextSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_caption_material);
        }
        if (this.mAnimDuration < 0) {
            this.mAnimDuration = context.getResources().getInteger(android.R.integer.config_mediumAnimTime);
        }
        if (this.mInInterpolator == null) {
            this.mInInterpolator = new DecelerateInterpolator();
        }
        if (this.mOutInterpolator == null) {
            this.mOutInterpolator = new DecelerateInterpolator();
        }
        if (!hourDefined) {
            set24Hour(DateFormat.is24HourFormat(context));
        }
        if (familyName != null || style >= 0) {
            this.mTypeface = TypefaceUtil.load(context, familyName, style);
        }
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
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public int getSelectionColor() {
        return this.mSelectionColor;
    }

    public Typeface getTypeface() {
        return this.mTypeface;
    }

    public int getTextSize() {
        return this.mTextSize;
    }

    public int getTextColor() {
        return this.mTextColor;
    }

    public int getTextHighlightColor() {
        return this.mTextHighlightColor;
    }

    public int getAnimDuration() {
        return this.mAnimDuration;
    }

    public Interpolator getInInterpolator() {
        return this.mInInterpolator;
    }

    public Interpolator getOutInterpolator() {
        return this.mOutInterpolator;
    }

    public int getMode() {
        return this.mMode;
    }

    public int getHour() {
        return this.mHour;
    }

    public int getMinute() {
        return this.mMinute;
    }

    public boolean is24Hour() {
        return this.m24Hour;
    }

    public void setMode(int mode, boolean animation) {
        if (this.mMode != mode) {
            this.mMode = mode;
            if (this.mOnTimeChangedListener != null) {
                this.mOnTimeChangedListener.onModeChanged(this.mMode);
            }
            if (animation) {
                startAnimation();
            } else {
                invalidate();
            }
        }
    }

    public void setHour(int hour) {
        int hour2;
        if (this.m24Hour) {
            hour2 = Math.max(hour, 0) % 24;
        } else {
            hour2 = Math.max(hour, 0) % 12;
        }
        if (this.mHour != hour2) {
            int old = this.mHour;
            this.mHour = hour2;
            if (this.mOnTimeChangedListener != null) {
                this.mOnTimeChangedListener.onHourChanged(old, this.mHour);
            }
            if (this.mMode == 0) {
                invalidate();
            }
        }
    }

    public void setMinute(int minute) {
        int minute2 = Math.min(Math.max(minute, 0), 59);
        if (this.mMinute != minute2) {
            int old = this.mMinute;
            this.mMinute = minute2;
            if (this.mOnTimeChangedListener != null) {
                this.mOnTimeChangedListener.onMinuteChanged(old, this.mMinute);
            }
            if (this.mMode == 1) {
                invalidate();
            }
        }
    }

    public void setOnTimeChangedListener(OnTimeChangedListener listener) {
        this.mOnTimeChangedListener = listener;
    }

    public void set24Hour(boolean b) {
        if (this.m24Hour != b) {
            this.m24Hour = b;
            if (!this.m24Hour && this.mHour > 11) {
                setHour(this.mHour - 12);
            }
            calculateTextLocation();
        }
    }

    private float getAngle(int value, int mode) {
        switch (mode) {
            case 0:
                return (float) ((-1.5707963267948966d) + (0.5235987755982988d * value));
            case 1:
                return (float) ((-1.5707963267948966d) + (0.10471975511965977d * value));
            default:
                return 0.0f;
        }
    }

    private int getSelectedTick(int value, int mode) {
        switch (mode) {
            case 0:
                return value == 0 ? this.m24Hour ? 23 : 11 : value - 1;
            case 1:
                if (value % 5 == 0) {
                    if (value == 0) {
                        return 35;
                    }
                    return (value / 5) + 23;
                }
                return -1;
            default:
                return -1;
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = widthMode == 0 ? this.mSelectionRadius * 12 : (View.MeasureSpec.getSize(widthMeasureSpec) - getPaddingLeft()) - getPaddingRight();
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = heightMode == 0 ? this.mSelectionRadius * 12 : (View.MeasureSpec.getSize(heightMeasureSpec) - getPaddingTop()) - getPaddingBottom();
        int size = Math.min(widthSize, heightSize);
        int width = widthMode == 1073741824 ? widthSize : size;
        int height = heightMode == 1073741824 ? heightSize : size;
        setMeasuredDimension(width + getPaddingLeft() + getPaddingRight(), height + getPaddingTop() + getPaddingBottom());
    }

    private void calculateTextLocation() {
        if (this.mCenterPoint == null) {
            return;
        }
        double angle = -1.0471975511965976d;
        this.mPaint.setTextSize(this.mTextSize);
        this.mPaint.setTypeface(this.mTypeface);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        if (this.m24Hour) {
            for (int i = 0; i < 12; i++) {
                this.mPaint.getTextBounds(this.mTicks[i], 0, this.mTicks[i].length(), this.mRect);
                if (i == 0) {
                    this.mSecondInnerRadius = (this.mInnerRadius - this.mSelectionRadius) - this.mRect.height();
                }
                float x = this.mCenterPoint.x + (((float) Math.cos(angle)) * this.mSecondInnerRadius);
                float y = this.mCenterPoint.y + (((float) Math.sin(angle)) * this.mSecondInnerRadius);
                this.mLocations[i * 2] = x;
                this.mLocations[(i * 2) + 1] = y + (this.mRect.height() / 2.0f);
                angle += 0.5235987755982988d;
            }
            for (int i2 = 12; i2 < this.mTicks.length; i2++) {
                float x2 = this.mCenterPoint.x + (((float) Math.cos(angle)) * this.mInnerRadius);
                float y2 = this.mCenterPoint.y + (((float) Math.sin(angle)) * this.mInnerRadius);
                this.mPaint.getTextBounds(this.mTicks[i2], 0, this.mTicks[i2].length(), this.mRect);
                this.mLocations[i2 * 2] = x2;
                this.mLocations[(i2 * 2) + 1] = y2 + (this.mRect.height() / 2.0f);
                angle += 0.5235987755982988d;
            }
            return;
        }
        for (int i3 = 0; i3 < 12; i3++) {
            float x3 = this.mCenterPoint.x + (((float) Math.cos(angle)) * this.mInnerRadius);
            float y3 = this.mCenterPoint.y + (((float) Math.sin(angle)) * this.mInnerRadius);
            this.mPaint.getTextBounds(this.mTicks[i3], 0, this.mTicks[i3].length(), this.mRect);
            this.mLocations[i3 * 2] = x3;
            this.mLocations[(i3 * 2) + 1] = y3 + (this.mRect.height() / 2.0f);
            angle += 0.5235987755982988d;
        }
        for (int i4 = 24; i4 < this.mTicks.length; i4++) {
            float x4 = this.mCenterPoint.x + (((float) Math.cos(angle)) * this.mInnerRadius);
            float y4 = this.mCenterPoint.y + (((float) Math.sin(angle)) * this.mInnerRadius);
            this.mPaint.getTextBounds(this.mTicks[i4], 0, this.mTicks[i4].length(), this.mRect);
            this.mLocations[i4 * 2] = x4;
            this.mLocations[(i4 * 2) + 1] = y4 + (this.mRect.height() / 2.0f);
            angle += 0.5235987755982988d;
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        int left = getPaddingLeft();
        int top = getPaddingTop();
        int size = Math.min((w - getPaddingLeft()) - getPaddingRight(), (h - getPaddingTop()) - getPaddingBottom());
        if (this.mCenterPoint == null) {
            this.mCenterPoint = new PointF();
        }
        this.mOuterRadius = size / 2.0f;
        this.mCenterPoint.set(left + this.mOuterRadius, top + this.mOuterRadius);
        this.mInnerRadius = (this.mOuterRadius - this.mSelectionRadius) - ThemeUtil.dpToPx(getContext(), 4);
        calculateTextLocation();
    }

    private int getPointedValue(float x, float y, boolean isDown) {
        float radius = (float) Math.sqrt(Math.pow(x - this.mCenterPoint.x, 2.0d) + Math.pow(y - this.mCenterPoint.y, 2.0d));
        if (isDown) {
            if (this.mMode == 0 && this.m24Hour) {
                if (radius > this.mInnerRadius + this.mSelectionRadius || radius < this.mSecondInnerRadius - this.mSelectionRadius) {
                    return -1;
                }
            } else if (radius > this.mInnerRadius + this.mSelectionRadius || radius < this.mInnerRadius - this.mSelectionRadius) {
                return -1;
            }
        }
        float angle = (float) Math.atan2(y - this.mCenterPoint.y, x - this.mCenterPoint.x);
        if (angle < 0.0f) {
            angle = (float) (angle + 6.283185307179586d);
        }
        if (this.mMode == 0) {
            if (!this.m24Hour) {
                int value = ((int) Math.round((angle * 6.0f) / 3.141592653589793d)) + 3;
                return value > 11 ? value - 12 : value;
            }
            if (radius > this.mSecondInnerRadius + (this.mSelectionRadius / 2)) {
                int value2 = ((int) Math.round((angle * 6.0f) / 3.141592653589793d)) + 15;
                if (value2 == 24) {
                    return 0;
                }
                if (value2 > 24) {
                    return value2 - 12;
                }
                return value2;
            }
            int value3 = ((int) Math.round((angle * 6.0f) / 3.141592653589793d)) + 3;
            return value3 > 12 ? value3 - 12 : value3;
        }
        if (this.mMode == 1) {
            int value4 = ((int) Math.round((angle * 30.0f) / 3.141592653589793d)) + 15;
            return value4 > 59 ? value4 - 60 : value4;
        }
        return -1;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction()) {
            case 0:
                int value = getPointedValue(event.getX(), event.getY(), true);
                if (value < 0) {
                    return false;
                }
                if (this.mMode == 0) {
                    setHour(value);
                } else if (this.mMode == 1) {
                    setMinute(value);
                }
                this.mEdited = true;
                return true;
            case 1:
                if (this.mEdited && this.mMode == 0) {
                    setMode(1, true);
                    this.mEdited = false;
                    return true;
                }
                return false;
            case 2:
                int value2 = getPointedValue(event.getX(), event.getY(), false);
                if (value2 < 0) {
                    return true;
                }
                if (this.mMode == 0) {
                    setHour(value2);
                } else if (this.mMode == 1) {
                    setMinute(value2);
                }
                this.mEdited = true;
                return true;
            case 3:
                this.mEdited = false;
                return false;
            default:
                return false;
        }
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        float outAngle;
        float inAngle;
        float outOffset;
        float inOffset;
        int outSelectedTick;
        int inSelectedTick;
        int outStart;
        int outLength;
        float outRadius;
        int inStart;
        int inLength;
        float inRadius;
        float angle;
        int selectedTick;
        int start;
        int length;
        float radius;
        super.draw(canvas);
        this.mPaint.setColor(this.mBackgroundColor);
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(this.mCenterPoint.x, this.mCenterPoint.y, this.mOuterRadius, this.mPaint);
        if (!this.mRunning) {
            if (this.mMode == 0) {
                angle = getAngle(this.mHour, 0);
                selectedTick = getSelectedTick(this.mHour, 0);
                start = 0;
                length = this.m24Hour ? 24 : 12;
                radius = (!this.m24Hour || selectedTick >= 12) ? this.mInnerRadius : this.mSecondInnerRadius;
            } else {
                angle = getAngle(this.mMinute, 1);
                selectedTick = getSelectedTick(this.mMinute, 1);
                start = 24;
                length = 12;
                radius = this.mInnerRadius;
            }
            this.mPaint.setColor(this.mSelectionColor);
            float x = this.mCenterPoint.x + (((float) Math.cos(angle)) * radius);
            float y = this.mCenterPoint.y + (((float) Math.sin(angle)) * radius);
            canvas.drawCircle(x, y, this.mSelectionRadius, this.mPaint);
            this.mPaint.setStyle(Paint.Style.STROKE);
            this.mPaint.setStrokeWidth(this.mTickSize);
            canvas.drawLine(this.mCenterPoint.x, this.mCenterPoint.y, x - (((float) Math.cos(angle)) * this.mSelectionRadius), y - (((float) Math.sin(angle)) * this.mSelectionRadius), this.mPaint);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mPaint.setColor(this.mTextColor);
            canvas.drawCircle(this.mCenterPoint.x, this.mCenterPoint.y, this.mTickSize * 2, this.mPaint);
            this.mPaint.setTextSize(this.mTextSize);
            this.mPaint.setTypeface(this.mTypeface);
            this.mPaint.setTextAlign(Paint.Align.CENTER);
            for (int i = 0; i < length; i++) {
                int index = start + i;
                this.mPaint.setColor(index == selectedTick ? this.mTextHighlightColor : this.mTextColor);
                canvas.drawText(this.mTicks[index], this.mLocations[index * 2], this.mLocations[(index * 2) + 1], this.mPaint);
            }
            return;
        }
        float maxOffset = (this.mOuterRadius - this.mInnerRadius) + (this.mTextSize / 2);
        int textOutColor = ColorUtil.getColor(this.mTextColor, 1.0f - this.mAnimProgress);
        int textHighlightOutColor = ColorUtil.getColor(this.mTextHighlightColor, 1.0f - this.mAnimProgress);
        int textInColor = ColorUtil.getColor(this.mTextColor, this.mAnimProgress);
        int textHighlightInColor = ColorUtil.getColor(this.mTextHighlightColor, this.mAnimProgress);
        if (this.mMode == 1) {
            outAngle = getAngle(this.mHour, 0);
            inAngle = getAngle(this.mMinute, 1);
            outOffset = this.mOutInterpolator.getInterpolation(this.mAnimProgress) * maxOffset;
            inOffset = (1.0f - this.mInInterpolator.getInterpolation(this.mAnimProgress)) * (-maxOffset);
            outSelectedTick = getSelectedTick(this.mHour, 0);
            inSelectedTick = getSelectedTick(this.mMinute, 1);
            outStart = 0;
            outLength = this.m24Hour ? 24 : 12;
            outRadius = (!this.m24Hour || outSelectedTick >= 12) ? this.mInnerRadius : this.mSecondInnerRadius;
            inStart = 24;
            inLength = 12;
            inRadius = this.mInnerRadius;
        } else {
            outAngle = getAngle(this.mMinute, 1);
            inAngle = getAngle(this.mHour, 0);
            outOffset = this.mOutInterpolator.getInterpolation(this.mAnimProgress) * (-maxOffset);
            inOffset = (1.0f - this.mInInterpolator.getInterpolation(this.mAnimProgress)) * maxOffset;
            outSelectedTick = getSelectedTick(this.mMinute, 1);
            inSelectedTick = getSelectedTick(this.mHour, 0);
            outStart = 24;
            outLength = 12;
            outRadius = this.mInnerRadius;
            inStart = 0;
            inLength = this.m24Hour ? 24 : 12;
            inRadius = (!this.m24Hour || inSelectedTick >= 12) ? this.mInnerRadius : this.mSecondInnerRadius;
        }
        this.mPaint.setColor(ColorUtil.getColor(this.mSelectionColor, 1.0f - this.mAnimProgress));
        float x2 = this.mCenterPoint.x + (((float) Math.cos(outAngle)) * (outRadius + outOffset));
        float y2 = this.mCenterPoint.y + (((float) Math.sin(outAngle)) * (outRadius + outOffset));
        canvas.drawCircle(x2, y2, this.mSelectionRadius, this.mPaint);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeWidth(this.mTickSize);
        canvas.drawLine(this.mCenterPoint.x, this.mCenterPoint.y, x2 - (((float) Math.cos(outAngle)) * this.mSelectionRadius), y2 - (((float) Math.sin(outAngle)) * this.mSelectionRadius), this.mPaint);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(ColorUtil.getColor(this.mSelectionColor, this.mAnimProgress));
        float x3 = this.mCenterPoint.x + (((float) Math.cos(inAngle)) * (inRadius + inOffset));
        float y3 = this.mCenterPoint.y + (((float) Math.sin(inAngle)) * (inRadius + inOffset));
        canvas.drawCircle(x3, y3, this.mSelectionRadius, this.mPaint);
        this.mPaint.setStyle(Paint.Style.STROKE);
        this.mPaint.setStrokeWidth(this.mTickSize);
        canvas.drawLine(this.mCenterPoint.x, this.mCenterPoint.y, x3 - (((float) Math.cos(inAngle)) * this.mSelectionRadius), y3 - (((float) Math.sin(inAngle)) * this.mSelectionRadius), this.mPaint);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setColor(this.mTextColor);
        canvas.drawCircle(this.mCenterPoint.x, this.mCenterPoint.y, this.mTickSize * 2, this.mPaint);
        this.mPaint.setTextSize(this.mTextSize);
        this.mPaint.setTypeface(this.mTypeface);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        double angle2 = -1.0471975511965976d;
        for (int i2 = 0; i2 < outLength; i2++) {
            int index2 = i2 + outStart;
            float x4 = this.mLocations[index2 * 2] + (((float) Math.cos(angle2)) * outOffset);
            float y4 = this.mLocations[(index2 * 2) + 1] + (((float) Math.sin(angle2)) * outOffset);
            this.mPaint.setColor(index2 == outSelectedTick ? textHighlightOutColor : textOutColor);
            canvas.drawText(this.mTicks[index2], x4, y4, this.mPaint);
            angle2 += 0.5235987755982988d;
        }
        for (int i3 = 0; i3 < inLength; i3++) {
            int index3 = i3 + inStart;
            float x5 = this.mLocations[index3 * 2] + (((float) Math.cos(angle2)) * inOffset);
            float y5 = this.mLocations[(index3 * 2) + 1] + (((float) Math.sin(angle2)) * inOffset);
            this.mPaint.setColor(index3 == inSelectedTick ? textHighlightInColor : textInColor);
            canvas.drawText(this.mTicks[index3], x5, y5, this.mPaint);
            angle2 += 0.5235987755982988d;
        }
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
        this.mAnimProgress = 0.0f;
    }

    private void startAnimation() {
        if (getHandler() != null) {
            resetAnimation();
            this.mRunning = true;
            getHandler().postAtTime(this.mUpdater, SystemClock.uptimeMillis() + 16);
        }
        invalidate();
    }

    private void stopAnimation() {
        this.mRunning = false;
        this.mAnimProgress = 1.0f;
        if (getHandler() != null) {
            getHandler().removeCallbacks(this.mUpdater);
        }
        invalidate();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        long curTime = SystemClock.uptimeMillis();
        this.mAnimProgress = Math.min(1.0f, (curTime - this.mStartTime) / this.mAnimDuration);
        if (this.mAnimProgress == 1.0f) {
            stopAnimation();
        }
        if (this.mRunning) {
            if (getHandler() != null) {
                getHandler().postAtTime(this.mUpdater, SystemClock.uptimeMillis() + 16);
            } else {
                stopAnimation();
            }
        }
        invalidate();
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.mode = this.mMode;
        ss.hour = this.mHour;
        ss.minute = this.mMinute;
        ss.is24Hour = this.m24Hour;
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        set24Hour(ss.is24Hour);
        setMode(ss.mode, false);
        setHour(ss.hour);
        setMinute(ss.minute);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/TimePicker$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int mode;
        int hour;
        int minute;
        boolean is24Hour;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.rey.material.widget.TimePicker.SavedState.1
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
            this.mode = in.readInt();
            this.hour = in.readInt();
            this.minute = in.readInt();
            this.is24Hour = in.readInt() == 1;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeValue(Integer.valueOf(this.mode));
            out.writeValue(Integer.valueOf(this.hour));
            out.writeValue(Integer.valueOf(this.minute));
            out.writeValue(Integer.valueOf(this.is24Hour ? 1 : 0));
        }

        public String toString() {
            return "TimePicker.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " mode=" + this.mode + " hour=" + this.hour + " minute=" + this.minute + "24hour=" + this.is24Hour + "}";
        }
    }
}
