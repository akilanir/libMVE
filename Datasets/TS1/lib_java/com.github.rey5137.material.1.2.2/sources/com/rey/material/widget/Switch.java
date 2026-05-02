package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
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
import android.widget.Checkable;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ColorUtil;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Switch.class */
public class Switch extends View implements Checkable, ThemeManager.OnThemeChangedListener {
    private RippleManager mRippleManager;
    protected int mStyleId;
    protected int mCurrentStyle;
    private boolean mRunning;
    private Paint mPaint;
    private RectF mDrawRect;
    private RectF mTempRect;
    private Path mTrackPath;
    private int mTrackSize;
    private ColorStateList mTrackColors;
    private Paint.Cap mTrackCap;
    private int mThumbRadius;
    private ColorStateList mThumbColors;
    private float mThumbPosition;
    private int mMaxAnimDuration;
    private Interpolator mInterpolator;
    private int mGravity;
    private boolean mChecked;
    private float mMemoX;
    private float mStartX;
    private float mFlingVelocity;
    private long mStartTime;
    private int mAnimDuration;
    private float mStartPosition;
    private int[] mTempStates;
    private int mShadowSize;
    private int mShadowOffset;
    private Path mShadowPath;
    private Paint mShadowPaint;
    private static final int COLOR_SHADOW_START = 1275068416;
    private static final int COLOR_SHADOW_END = 0;
    private boolean mIsRtl;
    private OnCheckedChangeListener mOnCheckedChangeListener;
    private final Runnable mUpdater;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Switch$OnCheckedChangeListener.class */
    public interface OnCheckedChangeListener {
        void onCheckedChanged(Switch r1, boolean z);
    }

    public Switch(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mRunning = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.ROUND;
        this.mThumbRadius = -1;
        this.mMaxAnimDuration = -1;
        this.mGravity = 16;
        this.mChecked = false;
        this.mTempStates = new int[2];
        this.mShadowSize = -1;
        this.mShadowOffset = -1;
        this.mIsRtl = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.Switch.1
            @Override // java.lang.Runnable
            public void run() {
                Switch.this.update();
            }
        };
        init(context, null, 0, 0);
    }

    public Switch(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mRunning = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.ROUND;
        this.mThumbRadius = -1;
        this.mMaxAnimDuration = -1;
        this.mGravity = 16;
        this.mChecked = false;
        this.mTempStates = new int[2];
        this.mShadowSize = -1;
        this.mShadowOffset = -1;
        this.mIsRtl = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.Switch.1
            @Override // java.lang.Runnable
            public void run() {
                Switch.this.update();
            }
        };
        init(context, attrs, 0, 0);
    }

    public Switch(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mRunning = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.ROUND;
        this.mThumbRadius = -1;
        this.mMaxAnimDuration = -1;
        this.mGravity = 16;
        this.mChecked = false;
        this.mTempStates = new int[2];
        this.mShadowSize = -1;
        this.mShadowOffset = -1;
        this.mIsRtl = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.Switch.1
            @Override // java.lang.Runnable
            public void run() {
                Switch.this.update();
            }
        };
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public Switch(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mRunning = false;
        this.mTrackSize = -1;
        this.mTrackCap = Paint.Cap.ROUND;
        this.mThumbRadius = -1;
        this.mMaxAnimDuration = -1;
        this.mGravity = 16;
        this.mChecked = false;
        this.mTempStates = new int[2];
        this.mShadowSize = -1;
        this.mShadowOffset = -1;
        this.mIsRtl = false;
        this.mUpdater = new Runnable() { // from class: com.rey.material.widget.Switch.1
            @Override // java.lang.Runnable
            public void run() {
                Switch.this.update();
            }
        };
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mPaint = new Paint(1);
        this.mDrawRect = new RectF();
        this.mTempRect = new RectF();
        this.mTrackPath = new Path();
        this.mFlingVelocity = ViewConfiguration.get(context).getScaledMinimumFlingVelocity();
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    /* JADX WARN: Type inference failed for: r0v28, types: [int[], int[][]] */
    /* JADX WARN: Type inference failed for: r0v33, types: [int[], int[][]] */
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        int resId;
        getRippleManager().onCreate(this, context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.Switch, defStyleAttr, defStyleRes);
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.Switch_sw_trackSize) {
                this.mTrackSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Switch_sw_trackColor) {
                this.mTrackColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Switch_sw_trackCap) {
                int cap = a.getInteger(attr, 0);
                if (cap == 0) {
                    this.mTrackCap = Paint.Cap.BUTT;
                } else if (cap == 1) {
                    this.mTrackCap = Paint.Cap.ROUND;
                } else {
                    this.mTrackCap = Paint.Cap.SQUARE;
                }
            } else if (attr == R.styleable.Switch_sw_thumbColor) {
                this.mThumbColors = a.getColorStateList(attr);
            } else if (attr == R.styleable.Switch_sw_thumbRadius) {
                this.mThumbRadius = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.Switch_sw_thumbElevation) {
                this.mShadowSize = a.getDimensionPixelSize(attr, 0);
                this.mShadowOffset = this.mShadowSize / 2;
            } else if (attr == R.styleable.Switch_sw_animDuration) {
                this.mMaxAnimDuration = a.getInt(attr, 0);
            } else if (attr == R.styleable.Switch_android_gravity) {
                this.mGravity = a.getInt(attr, 0);
            } else if (attr == R.styleable.Switch_android_checked) {
                setCheckedImmediately(a.getBoolean(attr, this.mChecked));
            } else if (attr == R.styleable.Switch_sw_interpolator && (resId = a.getResourceId(R.styleable.Switch_sw_interpolator, 0)) != 0) {
                this.mInterpolator = AnimationUtils.loadInterpolator(context, resId);
            }
        }
        a.recycle();
        if (this.mTrackSize < 0) {
            this.mTrackSize = ThemeUtil.dpToPx(context, 2);
        }
        if (this.mThumbRadius < 0) {
            this.mThumbRadius = ThemeUtil.dpToPx(context, 8);
        }
        if (this.mShadowSize < 0) {
            this.mShadowSize = ThemeUtil.dpToPx(context, 2);
            this.mShadowOffset = this.mShadowSize / 2;
        }
        if (this.mMaxAnimDuration < 0) {
            this.mMaxAnimDuration = context.getResources().getInteger(android.R.integer.config_mediumAnimTime);
        }
        if (this.mInterpolator == null) {
            this.mInterpolator = new DecelerateInterpolator();
        }
        if (this.mTrackColors == null) {
            ?? r0 = {new int[]{-16842912}, new int[]{android.R.attr.state_checked}};
            int[] colors = {ColorUtil.getColor(ThemeUtil.colorControlNormal(context, -16777216), 0.5f), ColorUtil.getColor(ThemeUtil.colorControlActivated(context, -16777216), 0.5f)};
            this.mTrackColors = new ColorStateList(r0, colors);
        }
        if (this.mThumbColors == null) {
            ?? r02 = {new int[]{-16842912}, new int[]{android.R.attr.state_checked}};
            int[] colors2 = {16448250, ThemeUtil.colorControlActivated(context, -16777216)};
            this.mThumbColors = new ColorStateList(r02, colors2);
        }
        this.mPaint.setStrokeCap(this.mTrackCap);
        buildShadow();
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

    public void setOnCheckedChangeListener(OnCheckedChangeListener listener) {
        this.mOnCheckedChangeListener = listener;
    }

    @Override // android.widget.Checkable
    public void setChecked(boolean checked) {
        if (this.mChecked != checked) {
            this.mChecked = checked;
            if (this.mOnCheckedChangeListener != null) {
                this.mOnCheckedChangeListener.onCheckedChanged(this, this.mChecked);
            }
        }
        float desPos = this.mChecked ? 1.0f : 0.0f;
        if (this.mThumbPosition != desPos) {
            startAnimation();
        }
    }

    public void setCheckedImmediately(boolean checked) {
        if (this.mChecked != checked) {
            this.mChecked = checked;
            if (this.mOnCheckedChangeListener != null) {
                this.mOnCheckedChangeListener.onCheckedChanged(this, this.mChecked);
            }
        }
        this.mThumbPosition = this.mChecked ? 1.0f : 0.0f;
        invalidate();
    }

    @Override // android.widget.Checkable
    public boolean isChecked() {
        return this.mChecked;
    }

    @Override // android.widget.Checkable
    public void toggle() {
        if (isEnabled()) {
            setChecked(!this.mChecked);
        }
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
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        super.onTouchEvent(event);
        getRippleManager().onTouchEvent(this, event);
        float x = event.getX();
        if (this.mIsRtl) {
            x = (2.0f * this.mDrawRect.centerX()) - x;
        }
        switch (event.getAction()) {
            case 0:
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(true);
                }
                this.mMemoX = x;
                this.mStartX = this.mMemoX;
                this.mStartTime = SystemClock.uptimeMillis();
                break;
            case 1:
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(false);
                }
                float velocity = ((x - this.mStartX) / (SystemClock.uptimeMillis() - this.mStartTime)) * 1000.0f;
                if (Math.abs(velocity) >= this.mFlingVelocity) {
                    setChecked(velocity > 0.0f);
                    break;
                } else if ((!this.mChecked && this.mThumbPosition < 0.1f) || (this.mChecked && this.mThumbPosition > 0.9f)) {
                    toggle();
                    break;
                } else {
                    setChecked(this.mThumbPosition > 0.5f);
                    break;
                }
                break;
            case 2:
                float offset = (x - this.mMemoX) / (this.mDrawRect.width() - (this.mThumbRadius * 2));
                this.mThumbPosition = Math.min(1.0f, Math.max(0.0f, this.mThumbPosition + offset));
                this.mMemoX = x;
                invalidate();
                break;
            case 3:
                if (getParent() != null) {
                    getParent().requestDisallowInterceptTouchEvent(false);
                }
                setChecked(this.mThumbPosition > 0.5f);
                break;
        }
        return true;
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
        return (this.mThumbRadius * 4) + Math.max(this.mShadowSize, getPaddingLeft()) + Math.max(this.mShadowSize, getPaddingRight());
    }

    @Override // android.view.View
    public int getSuggestedMinimumHeight() {
        return (this.mThumbRadius * 2) + Math.max(this.mShadowSize - this.mShadowOffset, getPaddingTop()) + Math.max(this.mShadowSize + this.mShadowOffset, getPaddingBottom());
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.mDrawRect.left = Math.max(this.mShadowSize, getPaddingLeft());
        this.mDrawRect.right = w - Math.max(this.mShadowSize, getPaddingRight());
        int height = this.mThumbRadius * 2;
        int align = this.mGravity & 112;
        switch (align) {
            case 48:
                this.mDrawRect.top = Math.max(this.mShadowSize - this.mShadowOffset, getPaddingTop());
                this.mDrawRect.bottom = this.mDrawRect.top + height;
                break;
            case 80:
                this.mDrawRect.bottom = h - Math.max(this.mShadowSize + this.mShadowOffset, getPaddingBottom());
                this.mDrawRect.top = this.mDrawRect.bottom - height;
                break;
            default:
                this.mDrawRect.top = (h - height) / 2.0f;
                this.mDrawRect.bottom = this.mDrawRect.top + height;
                break;
        }
    }

    private int getTrackColor(boolean checked) {
        this.mTempStates[0] = isEnabled() ? android.R.attr.state_enabled : -16842910;
        this.mTempStates[1] = checked ? android.R.attr.state_checked : -16842912;
        return this.mTrackColors.getColorForState(this.mTempStates, 0);
    }

    private int getThumbColor(boolean checked) {
        this.mTempStates[0] = isEnabled() ? android.R.attr.state_enabled : -16842910;
        this.mTempStates[1] = checked ? android.R.attr.state_checked : -16842912;
        return this.mThumbColors.getColorForState(this.mTempStates, 0);
    }

    private void buildShadow() {
        if (this.mShadowSize <= 0) {
            return;
        }
        if (this.mShadowPaint == null) {
            this.mShadowPaint = new Paint(5);
            this.mShadowPaint.setStyle(Paint.Style.FILL);
            this.mShadowPaint.setDither(true);
        }
        float startRatio = this.mThumbRadius / ((this.mThumbRadius + this.mShadowSize) + this.mShadowOffset);
        this.mShadowPaint.setShader(new RadialGradient(0.0f, 0.0f, this.mThumbRadius + this.mShadowSize, new int[]{COLOR_SHADOW_START, COLOR_SHADOW_START, 0}, new float[]{0.0f, startRatio, 1.0f}, Shader.TileMode.CLAMP));
        if (this.mShadowPath == null) {
            this.mShadowPath = new Path();
            this.mShadowPath.setFillType(Path.FillType.EVEN_ODD);
        } else {
            this.mShadowPath.reset();
        }
        float radius = this.mThumbRadius + this.mShadowSize;
        this.mTempRect.set(-radius, -radius, radius, radius);
        this.mShadowPath.addOval(this.mTempRect, Path.Direction.CW);
        float radius2 = this.mThumbRadius - 1;
        this.mTempRect.set(-radius2, (-radius2) - this.mShadowOffset, radius2, radius2 - this.mShadowOffset);
        this.mShadowPath.addOval(this.mTempRect, Path.Direction.CW);
    }

    private void getTrackPath(float x, float y, float radius) {
        float halfStroke = this.mTrackSize / 2.0f;
        this.mTrackPath.reset();
        if (this.mTrackCap != Paint.Cap.ROUND) {
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            float angle = (float) ((Math.asin(halfStroke / (radius - 1.0f)) / 3.141592653589793d) * 180.0d);
            if (x - radius > this.mDrawRect.left) {
                this.mTrackPath.moveTo(this.mDrawRect.left, y - halfStroke);
                this.mTrackPath.arcTo(this.mTempRect, 180.0f + angle, (-angle) * 2.0f);
                this.mTrackPath.lineTo(this.mDrawRect.left, y + halfStroke);
                this.mTrackPath.close();
            }
            if (x + radius < this.mDrawRect.right) {
                this.mTrackPath.moveTo(this.mDrawRect.right, y - halfStroke);
                this.mTrackPath.arcTo(this.mTempRect, -angle, angle * 2.0f);
                this.mTrackPath.lineTo(this.mDrawRect.right, y + halfStroke);
                this.mTrackPath.close();
                return;
            }
            return;
        }
        float angle2 = (float) ((Math.asin(halfStroke / (radius - 1.0f)) / 3.141592653589793d) * 180.0d);
        if (x - radius > this.mDrawRect.left) {
            float angle22 = (float) ((Math.acos(Math.max(0.0f, (((this.mDrawRect.left + halfStroke) - x) + radius) / halfStroke)) / 3.141592653589793d) * 180.0d);
            this.mTempRect.set(this.mDrawRect.left, y - halfStroke, this.mDrawRect.left + this.mTrackSize, y + halfStroke);
            this.mTrackPath.arcTo(this.mTempRect, 180.0f - angle22, angle22 * 2.0f);
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            this.mTrackPath.arcTo(this.mTempRect, 180.0f + angle2, (-angle2) * 2.0f);
            this.mTrackPath.close();
        }
        if (x + radius < this.mDrawRect.right) {
            float angle23 = (float) Math.acos(Math.max(0.0f, (((x + radius) - this.mDrawRect.right) + halfStroke) / halfStroke));
            this.mTrackPath.moveTo((float) ((this.mDrawRect.right - halfStroke) + (Math.cos(angle23) * halfStroke)), (float) (y + (Math.sin(angle23) * halfStroke)));
            float angle24 = (float) ((angle23 / 3.141592653589793d) * 180.0d);
            this.mTempRect.set(this.mDrawRect.right - this.mTrackSize, y - halfStroke, this.mDrawRect.right, y + halfStroke);
            this.mTrackPath.arcTo(this.mTempRect, angle24, (-angle24) * 2.0f);
            this.mTempRect.set((x - radius) + 1.0f, (y - radius) + 1.0f, (x + radius) - 1.0f, (y + radius) - 1.0f);
            this.mTrackPath.arcTo(this.mTempRect, -angle2, angle2 * 2.0f);
            this.mTrackPath.close();
        }
    }

    @Override // android.view.View
    public void draw(@NonNull Canvas canvas) {
        super.draw(canvas);
        float x = ((this.mDrawRect.width() - (this.mThumbRadius * 2)) * this.mThumbPosition) + this.mDrawRect.left + this.mThumbRadius;
        if (this.mIsRtl) {
            x = (2.0f * this.mDrawRect.centerX()) - x;
        }
        float y = this.mDrawRect.centerY();
        getTrackPath(x, y, this.mThumbRadius);
        this.mPaint.setColor(ColorUtil.getMiddleColor(getTrackColor(false), getTrackColor(true), this.mThumbPosition));
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawPath(this.mTrackPath, this.mPaint);
        if (this.mShadowSize > 0) {
            int saveCount = canvas.save();
            canvas.translate(x, y + this.mShadowOffset);
            canvas.drawPath(this.mShadowPath, this.mShadowPaint);
            canvas.restoreToCount(saveCount);
        }
        this.mPaint.setColor(ColorUtil.getMiddleColor(getThumbColor(false), getThumbColor(true), this.mThumbPosition));
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawCircle(x, y, this.mThumbRadius, this.mPaint);
    }

    private void resetAnimation() {
        this.mStartTime = SystemClock.uptimeMillis();
        this.mStartPosition = this.mThumbPosition;
        this.mAnimDuration = (int) (this.mMaxAnimDuration * (this.mChecked ? 1.0f - this.mStartPosition : this.mStartPosition));
    }

    private void startAnimation() {
        if (getHandler() != null) {
            resetAnimation();
            this.mRunning = true;
            getHandler().postAtTime(this.mUpdater, SystemClock.uptimeMillis() + 16);
        } else {
            this.mThumbPosition = this.mChecked ? 1.0f : 0.0f;
        }
        invalidate();
    }

    private void stopAnimation() {
        this.mRunning = false;
        this.mThumbPosition = this.mChecked ? 1.0f : 0.0f;
        if (getHandler() != null) {
            getHandler().removeCallbacks(this.mUpdater);
        }
        invalidate();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        long curTime = SystemClock.uptimeMillis();
        float progress = Math.min(1.0f, (curTime - this.mStartTime) / this.mAnimDuration);
        float value = this.mInterpolator.getInterpolation(progress);
        this.mThumbPosition = this.mChecked ? (this.mStartPosition * (1.0f - value)) + value : this.mStartPosition * (1.0f - value);
        if (progress == 1.0f) {
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
        ss.checked = isChecked();
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        setChecked(ss.checked);
        requestLayout();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/Switch$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        boolean checked;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.rey.material.widget.Switch.SavedState.1
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
            this.checked = ((Boolean) in.readValue(null)).booleanValue();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeValue(Boolean.valueOf(this.checked));
        }

        public String toString() {
            return "Switch.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " checked=" + this.checked + "}";
        }
    }
}
