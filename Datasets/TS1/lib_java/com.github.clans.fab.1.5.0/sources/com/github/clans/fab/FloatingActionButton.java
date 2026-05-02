package com.github.clans.fab;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Xfermode;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.graphics.drawable.shapes.Shape;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageButton;
import android.widget.TextView;

/* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionButton.class */
public class FloatingActionButton extends ImageButton {
    public static final int SIZE_NORMAL = 0;
    public static final int SIZE_MINI = 1;
    int mFabSize;
    boolean mShowShadow;
    int mShadowColor;
    int mShadowRadius;
    int mShadowXOffset;
    int mShadowYOffset;
    private static final Xfermode PORTER_DUFF_CLEAR = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);
    private static final long PAUSE_GROWING_TIME = 200;
    private static final double BAR_SPIN_CYCLE_TIME = 500.0d;
    private static final int BAR_MAX_LENGTH = 270;
    private int mColorNormal;
    private int mColorPressed;
    private int mColorRipple;
    private Drawable mIcon;
    private int mIconSize;
    private Animation mShowAnimation;
    private Animation mHideAnimation;
    private String mLabelText;
    private View.OnClickListener mClickListener;
    private Drawable mBackgroundDrawable;
    private boolean mUsingElevation;
    private boolean mUsingElevationCompat;
    private boolean mProgressBarEnabled;
    private int mProgressWidth;
    private int mProgressColor;
    private int mProgressBackgroundColor;
    private boolean mShouldUpdateButtonPosition;
    private float mOriginalX;
    private float mOriginalY;
    private boolean mButtonPositionSaved;
    private RectF mProgressCircleBounds;
    private Paint mBackgroundPaint;
    private Paint mProgressPaint;
    private boolean mProgressIndeterminate;
    private long mLastTimeAnimated;
    private float mSpinSpeed;
    private long mPausedTimeWithoutGrowing;
    private double mTimeStartGrowing;
    private boolean mBarGrowingFromFront;
    private int mBarLength;
    private float mBarExtraLength;
    private float mCurrentProgress;
    private float mTargetProgress;
    private int mProgress;
    private boolean mAnimateProgress;
    private boolean mShouldProgressIndeterminate;
    private boolean mShouldSetProgress;
    private int mProgressMax;
    private boolean mShowProgressBackground;
    GestureDetector mGestureDetector;

    public FloatingActionButton(Context context) {
        this(context, null);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShadowRadius = Util.dpToPx(getContext(), 4.0f);
        this.mShadowXOffset = Util.dpToPx(getContext(), 1.0f);
        this.mShadowYOffset = Util.dpToPx(getContext(), 3.0f);
        this.mIconSize = Util.dpToPx(getContext(), 24.0f);
        this.mProgressWidth = Util.dpToPx(getContext(), 6.0f);
        this.mOriginalX = -1.0f;
        this.mOriginalY = -1.0f;
        this.mProgressCircleBounds = new RectF();
        this.mBackgroundPaint = new Paint(1);
        this.mProgressPaint = new Paint(1);
        this.mSpinSpeed = 195.0f;
        this.mPausedTimeWithoutGrowing = 0L;
        this.mBarGrowingFromFront = true;
        this.mBarLength = 16;
        this.mProgressMax = 100;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.FloatingActionButton.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                Label label = (Label) FloatingActionButton.this.getTag(R.id.fab_label);
                if (label != null) {
                    label.onActionDown();
                }
                FloatingActionButton.this.onActionDown();
                return super.onDown(e);
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                Label label = (Label) FloatingActionButton.this.getTag(R.id.fab_label);
                if (label != null) {
                    label.onActionUp();
                }
                FloatingActionButton.this.onActionUp();
                return super.onSingleTapUp(e);
            }
        });
        init(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mShadowRadius = Util.dpToPx(getContext(), 4.0f);
        this.mShadowXOffset = Util.dpToPx(getContext(), 1.0f);
        this.mShadowYOffset = Util.dpToPx(getContext(), 3.0f);
        this.mIconSize = Util.dpToPx(getContext(), 24.0f);
        this.mProgressWidth = Util.dpToPx(getContext(), 6.0f);
        this.mOriginalX = -1.0f;
        this.mOriginalY = -1.0f;
        this.mProgressCircleBounds = new RectF();
        this.mBackgroundPaint = new Paint(1);
        this.mProgressPaint = new Paint(1);
        this.mSpinSpeed = 195.0f;
        this.mPausedTimeWithoutGrowing = 0L;
        this.mBarGrowingFromFront = true;
        this.mBarLength = 16;
        this.mProgressMax = 100;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.FloatingActionButton.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                Label label = (Label) FloatingActionButton.this.getTag(R.id.fab_label);
                if (label != null) {
                    label.onActionDown();
                }
                FloatingActionButton.this.onActionDown();
                return super.onDown(e);
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                Label label = (Label) FloatingActionButton.this.getTag(R.id.fab_label);
                if (label != null) {
                    label.onActionUp();
                }
                FloatingActionButton.this.onActionUp();
                return super.onSingleTapUp(e);
            }
        });
        init(context, attrs, defStyleAttr);
    }

    private void init(Context context, AttributeSet attrs, int defStyleAttr) {
        TypedArray attr = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyleAttr, 0);
        this.mColorNormal = attr.getColor(R.styleable.FloatingActionButton_fab_colorNormal, -2473162);
        this.mColorPressed = attr.getColor(R.styleable.FloatingActionButton_fab_colorPressed, -1617853);
        this.mColorRipple = attr.getColor(R.styleable.FloatingActionButton_fab_colorRipple, -1711276033);
        this.mShowShadow = attr.getBoolean(R.styleable.FloatingActionButton_fab_showShadow, true);
        this.mShadowColor = attr.getColor(R.styleable.FloatingActionButton_fab_shadowColor, 1711276032);
        this.mShadowRadius = attr.getDimensionPixelSize(R.styleable.FloatingActionButton_fab_shadowRadius, this.mShadowRadius);
        this.mShadowXOffset = attr.getDimensionPixelSize(R.styleable.FloatingActionButton_fab_shadowXOffset, this.mShadowXOffset);
        this.mShadowYOffset = attr.getDimensionPixelSize(R.styleable.FloatingActionButton_fab_shadowYOffset, this.mShadowYOffset);
        this.mFabSize = attr.getInt(R.styleable.FloatingActionButton_fab_size, 0);
        this.mLabelText = attr.getString(R.styleable.FloatingActionButton_fab_label);
        this.mShouldProgressIndeterminate = attr.getBoolean(R.styleable.FloatingActionButton_fab_progress_indeterminate, false);
        this.mProgressColor = attr.getColor(R.styleable.FloatingActionButton_fab_progress_color, -16738680);
        this.mProgressBackgroundColor = attr.getColor(R.styleable.FloatingActionButton_fab_progress_backgroundColor, 1291845632);
        this.mProgressMax = attr.getInt(R.styleable.FloatingActionButton_fab_progress_max, this.mProgressMax);
        this.mShowProgressBackground = attr.getBoolean(R.styleable.FloatingActionButton_fab_progress_showBackground, true);
        if (attr.hasValue(R.styleable.FloatingActionButton_fab_progress)) {
            this.mProgress = attr.getInt(R.styleable.FloatingActionButton_fab_progress, 0);
            this.mShouldSetProgress = true;
        }
        if (attr.hasValue(R.styleable.FloatingActionButton_fab_elevationCompat)) {
            float elevation = attr.getDimensionPixelOffset(R.styleable.FloatingActionButton_fab_elevationCompat, 0);
            if (isInEditMode()) {
                setElevation(elevation);
            } else {
                setElevationCompat(elevation);
            }
        }
        initShowAnimation(attr);
        initHideAnimation(attr);
        attr.recycle();
        if (isInEditMode()) {
            if (this.mShouldProgressIndeterminate) {
                setIndeterminate(true);
            } else if (this.mShouldSetProgress) {
                saveButtonOriginalPosition();
                setProgress(this.mProgress, false);
            }
        }
        setClickable(true);
    }

    private void initShowAnimation(TypedArray attr) {
        int resourceId = attr.getResourceId(R.styleable.FloatingActionButton_fab_showAnimation, R.anim.fab_scale_up);
        this.mShowAnimation = AnimationUtils.loadAnimation(getContext(), resourceId);
    }

    private void initHideAnimation(TypedArray attr) {
        int resourceId = attr.getResourceId(R.styleable.FloatingActionButton_fab_hideAnimation, R.anim.fab_scale_down);
        this.mHideAnimation = AnimationUtils.loadAnimation(getContext(), resourceId);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getCircleSize() {
        return getResources().getDimensionPixelSize(this.mFabSize == 0 ? R.dimen.fab_size_normal : R.dimen.fab_size_mini);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int calculateMeasuredWidth() {
        int width = getCircleSize() + calculateShadowWidth();
        if (this.mProgressBarEnabled) {
            width += this.mProgressWidth * 2;
        }
        return width;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int calculateMeasuredHeight() {
        int height = getCircleSize() + calculateShadowHeight();
        if (this.mProgressBarEnabled) {
            height += this.mProgressWidth * 2;
        }
        return height;
    }

    int calculateShadowWidth() {
        if (hasShadow()) {
            return getShadowX() * 2;
        }
        return 0;
    }

    int calculateShadowHeight() {
        if (hasShadow()) {
            return getShadowY() * 2;
        }
        return 0;
    }

    private int getShadowX() {
        return this.mShadowRadius + Math.abs(this.mShadowXOffset);
    }

    private int getShadowY() {
        return this.mShadowRadius + Math.abs(this.mShadowYOffset);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float calculateCenterX() {
        return getMeasuredWidth() / 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public float calculateCenterY() {
        return getMeasuredHeight() / 2;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(calculateMeasuredWidth(), calculateMeasuredHeight());
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mProgressBarEnabled) {
            if (this.mShowProgressBackground) {
                canvas.drawArc(this.mProgressCircleBounds, 360.0f, 360.0f, false, this.mBackgroundPaint);
            }
            boolean shouldInvalidate = false;
            if (this.mProgressIndeterminate) {
                shouldInvalidate = true;
                long deltaTime = SystemClock.uptimeMillis() - this.mLastTimeAnimated;
                float deltaNormalized = (deltaTime * this.mSpinSpeed) / 1000.0f;
                updateProgressLength(deltaTime);
                this.mCurrentProgress += deltaNormalized;
                if (this.mCurrentProgress > 360.0f) {
                    this.mCurrentProgress -= 360.0f;
                }
                this.mLastTimeAnimated = SystemClock.uptimeMillis();
                float from = this.mCurrentProgress - 90.0f;
                float to = this.mBarLength + this.mBarExtraLength;
                if (isInEditMode()) {
                    from = 0.0f;
                    to = 135.0f;
                }
                canvas.drawArc(this.mProgressCircleBounds, from, to, false, this.mProgressPaint);
            } else {
                if (this.mCurrentProgress != this.mTargetProgress) {
                    shouldInvalidate = true;
                    float deltaNormalized2 = ((SystemClock.uptimeMillis() - this.mLastTimeAnimated) / 1000.0f) * this.mSpinSpeed;
                    if (this.mCurrentProgress > this.mTargetProgress) {
                        this.mCurrentProgress = Math.max(this.mCurrentProgress - deltaNormalized2, this.mTargetProgress);
                    } else {
                        this.mCurrentProgress = Math.min(this.mCurrentProgress + deltaNormalized2, this.mTargetProgress);
                    }
                    this.mLastTimeAnimated = SystemClock.uptimeMillis();
                }
                canvas.drawArc(this.mProgressCircleBounds, -90.0f, this.mCurrentProgress, false, this.mProgressPaint);
            }
            if (shouldInvalidate) {
                invalidate();
            }
        }
    }

    private void updateProgressLength(long deltaTimeInMillis) {
        if (this.mPausedTimeWithoutGrowing >= PAUSE_GROWING_TIME) {
            this.mTimeStartGrowing += deltaTimeInMillis;
            if (this.mTimeStartGrowing > BAR_SPIN_CYCLE_TIME) {
                this.mTimeStartGrowing -= BAR_SPIN_CYCLE_TIME;
                this.mPausedTimeWithoutGrowing = 0L;
                this.mBarGrowingFromFront = !this.mBarGrowingFromFront;
            }
            float distance = (((float) Math.cos(((this.mTimeStartGrowing / BAR_SPIN_CYCLE_TIME) + 1.0d) * 3.141592653589793d)) / 2.0f) + 0.5f;
            float length = BAR_MAX_LENGTH - this.mBarLength;
            if (this.mBarGrowingFromFront) {
                this.mBarExtraLength = distance * length;
                return;
            }
            float newLength = length * (1.0f - distance);
            this.mCurrentProgress += this.mBarExtraLength - newLength;
            this.mBarExtraLength = newLength;
            return;
        }
        this.mPausedTimeWithoutGrowing += deltaTimeInMillis;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        saveButtonOriginalPosition();
        if (this.mShouldProgressIndeterminate) {
            setIndeterminate(true);
            this.mShouldProgressIndeterminate = false;
        } else if (this.mShouldSetProgress) {
            setProgress(this.mProgress, this.mAnimateProgress);
            this.mShouldSetProgress = false;
        } else if (this.mShouldUpdateButtonPosition) {
            updateButtonPosition();
            this.mShouldUpdateButtonPosition = false;
        }
        super.onSizeChanged(w, h, oldw, oldh);
        setupProgressBounds();
        setupProgressBarPaints();
        updateBackground();
    }

    @Override // android.view.View
    @TargetApi(21)
    public void setLayoutParams(ViewGroup.LayoutParams params) {
        if ((params instanceof ViewGroup.MarginLayoutParams) && this.mUsingElevationCompat) {
            ((ViewGroup.MarginLayoutParams) params).leftMargin += getShadowX();
            ((ViewGroup.MarginLayoutParams) params).topMargin += getShadowY();
            ((ViewGroup.MarginLayoutParams) params).rightMargin += getShadowX();
            ((ViewGroup.MarginLayoutParams) params).bottomMargin += getShadowY();
        }
        super.setLayoutParams(params);
    }

    void updateBackground() {
        LayerDrawable layerDrawable;
        if (hasShadow()) {
            layerDrawable = new LayerDrawable(new Drawable[]{new Shadow(), createFillDrawable(), getIconDrawable()});
        } else {
            layerDrawable = new LayerDrawable(new Drawable[]{createFillDrawable(), getIconDrawable()});
        }
        int iconSize = -1;
        if (getIconDrawable() != null) {
            iconSize = Math.max(getIconDrawable().getIntrinsicWidth(), getIconDrawable().getIntrinsicHeight());
        }
        int iconOffset = (getCircleSize() - (iconSize > 0 ? iconSize : this.mIconSize)) / 2;
        int circleInsetHorizontal = hasShadow() ? this.mShadowRadius + Math.abs(this.mShadowXOffset) : 0;
        int circleInsetVertical = hasShadow() ? this.mShadowRadius + Math.abs(this.mShadowYOffset) : 0;
        if (this.mProgressBarEnabled) {
            circleInsetHorizontal += this.mProgressWidth;
            circleInsetVertical += this.mProgressWidth;
        }
        layerDrawable.setLayerInset(hasShadow() ? 2 : 1, circleInsetHorizontal + iconOffset, circleInsetVertical + iconOffset, circleInsetHorizontal + iconOffset, circleInsetVertical + iconOffset);
        setBackgroundCompat(layerDrawable);
    }

    protected Drawable getIconDrawable() {
        if (this.mIcon != null) {
            return this.mIcon;
        }
        return new ColorDrawable(0);
    }

    /* JADX WARN: Type inference failed for: r4v2, types: [int[], int[][]] */
    @TargetApi(21)
    private Drawable createFillDrawable() {
        StateListDrawable drawable = new StateListDrawable();
        drawable.addState(new int[]{R.attr.state_pressed}, createCircleDrawable(this.mColorPressed));
        drawable.addState(new int[0], createCircleDrawable(this.mColorNormal));
        if (Util.hasLollipop()) {
            RippleDrawable ripple = new RippleDrawable(new ColorStateList(new int[]{new int[0]}, new int[]{this.mColorRipple}), drawable, null);
            setOutlineProvider(new ViewOutlineProvider() { // from class: com.github.clans.fab.FloatingActionButton.1
                @Override // android.view.ViewOutlineProvider
                public void getOutline(View view, Outline outline) {
                    outline.setOval(0, 0, view.getWidth(), view.getHeight());
                }
            });
            setClipToOutline(true);
            this.mBackgroundDrawable = ripple;
            return ripple;
        }
        this.mBackgroundDrawable = drawable;
        return drawable;
    }

    private Drawable createCircleDrawable(int color) {
        CircleDrawable shapeDrawable = new CircleDrawable(new OvalShape());
        shapeDrawable.getPaint().setColor(color);
        return shapeDrawable;
    }

    @TargetApi(16)
    private void setBackgroundCompat(Drawable drawable) {
        if (Util.hasJellyBean()) {
            setBackground(drawable);
        } else {
            setBackgroundDrawable(drawable);
        }
    }

    private void saveButtonOriginalPosition() {
        if (!this.mButtonPositionSaved) {
            if (this.mOriginalX == -1.0f) {
                this.mOriginalX = getX();
            }
            if (this.mOriginalY == -1.0f) {
                this.mOriginalY = getY();
            }
            this.mButtonPositionSaved = true;
        }
    }

    private void updateButtonPosition() {
        float x;
        float y;
        if (this.mProgressBarEnabled) {
            x = this.mOriginalX > getX() ? getX() + this.mProgressWidth : getX() - this.mProgressWidth;
            y = this.mOriginalY > getY() ? getY() + this.mProgressWidth : getY() - this.mProgressWidth;
        } else {
            x = this.mOriginalX;
            y = this.mOriginalY;
        }
        setX(x);
        setY(y);
    }

    private void setupProgressBarPaints() {
        this.mBackgroundPaint.setColor(this.mProgressBackgroundColor);
        this.mBackgroundPaint.setStyle(Paint.Style.STROKE);
        this.mBackgroundPaint.setStrokeWidth(this.mProgressWidth);
        this.mProgressPaint.setColor(this.mProgressColor);
        this.mProgressPaint.setStyle(Paint.Style.STROKE);
        this.mProgressPaint.setStrokeWidth(this.mProgressWidth);
    }

    private void setupProgressBounds() {
        int circleInsetHorizontal = hasShadow() ? getShadowX() : 0;
        int circleInsetVertical = hasShadow() ? getShadowY() : 0;
        this.mProgressCircleBounds = new RectF(circleInsetHorizontal + (this.mProgressWidth / 2), circleInsetVertical + (this.mProgressWidth / 2), (calculateMeasuredWidth() - circleInsetHorizontal) - (this.mProgressWidth / 2), (calculateMeasuredHeight() - circleInsetVertical) - (this.mProgressWidth / 2));
    }

    Animation getShowAnimation() {
        return this.mShowAnimation;
    }

    Animation getHideAnimation() {
        return this.mHideAnimation;
    }

    void playShowAnimation() {
        startAnimation(this.mShowAnimation);
    }

    void playHideAnimation() {
        startAnimation(this.mHideAnimation);
    }

    View.OnClickListener getOnClickListener() {
        return this.mClickListener;
    }

    TextView getLabelView() {
        return (TextView) getTag(R.id.fab_label);
    }

    void setColors(int colorNormal, int colorPressed, int colorRipple) {
        this.mColorNormal = colorNormal;
        this.mColorPressed = colorPressed;
        this.mColorRipple = colorRipple;
    }

    @TargetApi(21)
    void onActionDown() {
        if (this.mBackgroundDrawable instanceof StateListDrawable) {
            StateListDrawable drawable = (StateListDrawable) this.mBackgroundDrawable;
            drawable.setState(new int[]{R.attr.state_pressed});
        } else if (Util.hasLollipop()) {
            RippleDrawable ripple = (RippleDrawable) this.mBackgroundDrawable;
            ripple.setState(new int[]{R.attr.state_enabled, R.attr.state_pressed});
            ripple.setHotspot(calculateCenterX(), calculateCenterY());
            ripple.setVisible(true, true);
        }
    }

    @TargetApi(21)
    void onActionUp() {
        if (this.mBackgroundDrawable instanceof StateListDrawable) {
            StateListDrawable drawable = (StateListDrawable) this.mBackgroundDrawable;
            drawable.setState(new int[0]);
        } else if (Util.hasLollipop()) {
            RippleDrawable ripple = (RippleDrawable) this.mBackgroundDrawable;
            ripple.setState(new int[0]);
            ripple.setHotspot(calculateCenterX(), calculateCenterY());
            ripple.setVisible(true, true);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mClickListener != null) {
            Label label = (Label) getTag(R.id.fab_label);
            int action = event.getAction();
            switch (action) {
                case SIZE_MINI /* 1 */:
                    if (label != null) {
                        label.onActionUp();
                        break;
                    }
                    break;
            }
            this.mGestureDetector.onTouchEvent(event);
        }
        return super.onTouchEvent(event);
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        ProgressSavedState ss = new ProgressSavedState(superState);
        ss.mCurrentProgress = this.mCurrentProgress;
        ss.mTargetProgress = this.mTargetProgress;
        ss.mSpinSpeed = this.mSpinSpeed;
        ss.mProgressWidth = this.mProgressWidth;
        ss.mProgressColor = this.mProgressColor;
        ss.mProgressBackgroundColor = this.mProgressBackgroundColor;
        ss.mShouldProgressIndeterminate = this.mProgressIndeterminate;
        ss.mShouldSetProgress = this.mProgressBarEnabled && this.mProgress > 0 && !this.mProgressIndeterminate;
        ss.mProgress = this.mProgress;
        ss.mAnimateProgress = this.mAnimateProgress;
        ss.mShowProgressBackground = this.mShowProgressBackground;
        return ss;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof ProgressSavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        ProgressSavedState ss = (ProgressSavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.mCurrentProgress = ss.mCurrentProgress;
        this.mTargetProgress = ss.mTargetProgress;
        this.mSpinSpeed = ss.mSpinSpeed;
        this.mProgressWidth = ss.mProgressWidth;
        this.mProgressColor = ss.mProgressColor;
        this.mProgressBackgroundColor = ss.mProgressBackgroundColor;
        this.mShouldProgressIndeterminate = ss.mShouldProgressIndeterminate;
        this.mShouldSetProgress = ss.mShouldSetProgress;
        this.mProgress = ss.mProgress;
        this.mAnimateProgress = ss.mAnimateProgress;
        this.mShowProgressBackground = ss.mShowProgressBackground;
        this.mLastTimeAnimated = SystemClock.uptimeMillis();
    }

    /* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionButton$CircleDrawable.class */
    private class CircleDrawable extends ShapeDrawable {
        private int circleInsetHorizontal;
        private int circleInsetVertical;

        private CircleDrawable() {
        }

        private CircleDrawable(Shape s) {
            super(s);
            this.circleInsetHorizontal = FloatingActionButton.this.hasShadow() ? FloatingActionButton.this.mShadowRadius + Math.abs(FloatingActionButton.this.mShadowXOffset) : 0;
            this.circleInsetVertical = FloatingActionButton.this.hasShadow() ? FloatingActionButton.this.mShadowRadius + Math.abs(FloatingActionButton.this.mShadowYOffset) : 0;
            if (FloatingActionButton.this.mProgressBarEnabled) {
                this.circleInsetHorizontal += FloatingActionButton.this.mProgressWidth;
                this.circleInsetVertical += FloatingActionButton.this.mProgressWidth;
            }
        }

        @Override // android.graphics.drawable.ShapeDrawable, android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            setBounds(this.circleInsetHorizontal, this.circleInsetVertical, FloatingActionButton.this.calculateMeasuredWidth() - this.circleInsetHorizontal, FloatingActionButton.this.calculateMeasuredHeight() - this.circleInsetVertical);
            super.draw(canvas);
        }
    }

    /* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionButton$Shadow.class */
    private class Shadow extends Drawable {
        private Paint mPaint;
        private Paint mErase;
        private float mRadius;

        private Shadow() {
            this.mPaint = new Paint(1);
            this.mErase = new Paint(1);
            init();
        }

        private void init() {
            FloatingActionButton.this.setLayerType(1, null);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mPaint.setColor(FloatingActionButton.this.mColorNormal);
            this.mErase.setXfermode(FloatingActionButton.PORTER_DUFF_CLEAR);
            if (!FloatingActionButton.this.isInEditMode()) {
                this.mPaint.setShadowLayer(FloatingActionButton.this.mShadowRadius, FloatingActionButton.this.mShadowXOffset, FloatingActionButton.this.mShadowYOffset, FloatingActionButton.this.mShadowColor);
            }
            this.mRadius = FloatingActionButton.this.getCircleSize() / 2;
            if (FloatingActionButton.this.mProgressBarEnabled && FloatingActionButton.this.mShowProgressBackground) {
                this.mRadius += FloatingActionButton.this.mProgressWidth;
            }
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.drawCircle(FloatingActionButton.this.calculateCenterX(), FloatingActionButton.this.calculateCenterY(), this.mRadius, this.mPaint);
            canvas.drawCircle(FloatingActionButton.this.calculateCenterX(), FloatingActionButton.this.calculateCenterY(), this.mRadius, this.mErase);
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return 0;
        }
    }

    /* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/FloatingActionButton$ProgressSavedState.class */
    static class ProgressSavedState extends View.BaseSavedState {
        float mCurrentProgress;
        float mTargetProgress;
        float mSpinSpeed;
        int mProgress;
        int mProgressWidth;
        int mProgressColor;
        int mProgressBackgroundColor;
        boolean mProgressBarEnabled;
        boolean mProgressBarVisibilityChanged;
        boolean mProgressIndeterminate;
        boolean mShouldProgressIndeterminate;
        boolean mShouldSetProgress;
        boolean mAnimateProgress;
        boolean mShowProgressBackground;
        public static final Parcelable.Creator<ProgressSavedState> CREATOR = new Parcelable.Creator<ProgressSavedState>() { // from class: com.github.clans.fab.FloatingActionButton.ProgressSavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ProgressSavedState createFromParcel(Parcel in) {
                return new ProgressSavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public ProgressSavedState[] newArray(int size) {
                return new ProgressSavedState[size];
            }
        };

        ProgressSavedState(Parcelable superState) {
            super(superState);
        }

        private ProgressSavedState(Parcel in) {
            super(in);
            this.mCurrentProgress = in.readFloat();
            this.mTargetProgress = in.readFloat();
            this.mProgressBarEnabled = in.readInt() != 0;
            this.mSpinSpeed = in.readFloat();
            this.mProgress = in.readInt();
            this.mProgressWidth = in.readInt();
            this.mProgressColor = in.readInt();
            this.mProgressBackgroundColor = in.readInt();
            this.mProgressBarVisibilityChanged = in.readInt() != 0;
            this.mProgressIndeterminate = in.readInt() != 0;
            this.mShouldProgressIndeterminate = in.readInt() != 0;
            this.mShouldSetProgress = in.readInt() != 0;
            this.mAnimateProgress = in.readInt() != 0;
            this.mShowProgressBackground = in.readInt() != 0;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeFloat(this.mCurrentProgress);
            out.writeFloat(this.mTargetProgress);
            out.writeInt(this.mProgressBarEnabled ? 1 : 0);
            out.writeFloat(this.mSpinSpeed);
            out.writeInt(this.mProgress);
            out.writeInt(this.mProgressWidth);
            out.writeInt(this.mProgressColor);
            out.writeInt(this.mProgressBackgroundColor);
            out.writeInt(this.mProgressBarVisibilityChanged ? 1 : 0);
            out.writeInt(this.mProgressIndeterminate ? 1 : 0);
            out.writeInt(this.mShouldProgressIndeterminate ? 1 : 0);
            out.writeInt(this.mShouldSetProgress ? 1 : 0);
            out.writeInt(this.mAnimateProgress ? 1 : 0);
            out.writeInt(this.mShowProgressBackground ? 1 : 0);
        }
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        if (this.mIcon != drawable) {
            this.mIcon = drawable;
            updateBackground();
        }
    }

    @Override // android.widget.ImageView
    public void setImageResource(int resId) {
        Drawable drawable = getResources().getDrawable(resId);
        if (this.mIcon != drawable) {
            this.mIcon = drawable;
            updateBackground();
        }
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        super.setOnClickListener(l);
        this.mClickListener = l;
        View label = (View) getTag(R.id.fab_label);
        if (label != null) {
            label.setOnClickListener(new View.OnClickListener() { // from class: com.github.clans.fab.FloatingActionButton.3
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (FloatingActionButton.this.mClickListener != null) {
                        FloatingActionButton.this.mClickListener.onClick(FloatingActionButton.this);
                    }
                }
            });
        }
    }

    public void setButtonSize(int size) {
        if (size != 0 && size != 1) {
            throw new IllegalArgumentException("Use @FabSize constants only!");
        }
        if (this.mFabSize != size) {
            this.mFabSize = size;
            updateBackground();
        }
    }

    public int getButtonSize() {
        return this.mFabSize;
    }

    public void setColorNormal(int color) {
        if (this.mColorNormal != color) {
            this.mColorNormal = color;
            updateBackground();
        }
    }

    public void setColorNormalResId(int colorResId) {
        setColorNormal(getResources().getColor(colorResId));
    }

    public int getColorNormal() {
        return this.mColorNormal;
    }

    public void setColorPressed(int color) {
        if (color != this.mColorPressed) {
            this.mColorPressed = color;
            updateBackground();
        }
    }

    public void setColorPressedResId(int colorResId) {
        setColorPressed(getResources().getColor(colorResId));
    }

    public int getColorPressed() {
        return this.mColorPressed;
    }

    public void setColorRipple(int color) {
        if (color != this.mColorRipple) {
            this.mColorRipple = color;
            updateBackground();
        }
    }

    public void setColorRippleResId(int colorResId) {
        setColorRipple(getResources().getColor(colorResId));
    }

    public int getColorRipple() {
        return this.mColorRipple;
    }

    public void setShowShadow(boolean show) {
        if (this.mShowShadow != show) {
            this.mShowShadow = show;
            updateBackground();
        }
    }

    public boolean hasShadow() {
        return !this.mUsingElevation && this.mShowShadow;
    }

    public void setShadowRadius(int dimenResId) {
        int shadowRadius = getResources().getDimensionPixelSize(dimenResId);
        if (this.mShadowRadius != shadowRadius) {
            this.mShadowRadius = shadowRadius;
            requestLayout();
            updateBackground();
        }
    }

    public void setShadowRadius(float shadowRadiusDp) {
        this.mShadowRadius = Util.dpToPx(getContext(), shadowRadiusDp);
        requestLayout();
        updateBackground();
    }

    public int getShadowRadius() {
        return this.mShadowRadius;
    }

    public void setShadowXOffset(int dimenResId) {
        int shadowXOffset = getResources().getDimensionPixelSize(dimenResId);
        if (this.mShadowXOffset != shadowXOffset) {
            this.mShadowXOffset = shadowXOffset;
            requestLayout();
            updateBackground();
        }
    }

    public void setShadowXOffset(float shadowXOffsetDp) {
        this.mShadowXOffset = Util.dpToPx(getContext(), shadowXOffsetDp);
        requestLayout();
        updateBackground();
    }

    public int getShadowXOffset() {
        return this.mShadowXOffset;
    }

    public void setShadowYOffset(int dimenResId) {
        int shadowYOffset = getResources().getDimensionPixelSize(dimenResId);
        if (this.mShadowYOffset != shadowYOffset) {
            this.mShadowYOffset = shadowYOffset;
            requestLayout();
            updateBackground();
        }
    }

    public void setShadowYOffset(float shadowYOffsetDp) {
        this.mShadowYOffset = Util.dpToPx(getContext(), shadowYOffsetDp);
        requestLayout();
        updateBackground();
    }

    public int getShadowYOffset() {
        return this.mShadowYOffset;
    }

    public void setShadowColorResource(int colorResId) {
        int shadowColor = getResources().getColor(colorResId);
        if (this.mShadowColor != shadowColor) {
            this.mShadowColor = shadowColor;
            updateBackground();
        }
    }

    public void setShadowColor(int color) {
        if (this.mShadowColor != color) {
            this.mShadowColor = color;
            updateBackground();
        }
    }

    public int getShadowColor() {
        return this.mShadowColor;
    }

    public boolean isHidden() {
        return getVisibility() == 4;
    }

    public void show(boolean animate) {
        if (isHidden()) {
            if (animate) {
                playShowAnimation();
            }
            setVisibility(0);
        }
    }

    public void hide(boolean animate) {
        if (!isHidden()) {
            if (animate) {
                playHideAnimation();
            }
            setVisibility(4);
        }
    }

    public void toggle(boolean animate) {
        if (isHidden()) {
            show(animate);
        } else {
            hide(animate);
        }
    }

    public void setLabelText(String text) {
        this.mLabelText = text;
        TextView labelView = getLabelView();
        if (labelView != null) {
            labelView.setText(text);
        }
    }

    public String getLabelText() {
        return this.mLabelText;
    }

    public void setShowAnimation(Animation showAnimation) {
        this.mShowAnimation = showAnimation;
    }

    public void setHideAnimation(Animation hideAnimation) {
        this.mHideAnimation = hideAnimation;
    }

    public void setLabelVisibility(int visibility) {
        TextView labelView = getLabelView();
        if (labelView != null) {
            labelView.setVisibility(visibility);
        }
    }

    public int getLabelVisibility() {
        TextView labelView = getLabelView();
        if (labelView != null) {
            return labelView.getVisibility();
        }
        return -1;
    }

    @Override // android.view.View
    public void setElevation(float elevation) {
        if (Util.hasLollipop() && elevation > 0.0f) {
            super.setElevation(elevation);
            if (!isInEditMode()) {
                this.mUsingElevation = true;
                this.mShowShadow = false;
            }
            updateBackground();
        }
    }

    @TargetApi(21)
    public void setElevationCompat(float elevation) {
        this.mShadowColor = 637534208;
        this.mShadowRadius = Math.round(elevation / 2.0f);
        this.mShadowXOffset = 0;
        this.mShadowYOffset = Math.round(this.mFabSize == 0 ? elevation : elevation / 2.0f);
        if (Util.hasLollipop()) {
            super.setElevation(elevation);
            this.mUsingElevationCompat = true;
            this.mShowShadow = false;
            updateBackground();
            ViewGroup.LayoutParams layoutParams = getLayoutParams();
            if (layoutParams != null) {
                setLayoutParams(layoutParams);
                return;
            }
            return;
        }
        this.mShowShadow = true;
        updateBackground();
    }

    public synchronized void setIndeterminate(boolean indeterminate) {
        if (!indeterminate) {
            this.mCurrentProgress = 0.0f;
        }
        this.mProgressBarEnabled = indeterminate;
        this.mShouldUpdateButtonPosition = true;
        this.mProgressIndeterminate = indeterminate;
        this.mLastTimeAnimated = SystemClock.uptimeMillis();
        setupProgressBounds();
        saveButtonOriginalPosition();
        updateBackground();
    }

    public synchronized void setMax(int max) {
        this.mProgressMax = max;
    }

    public synchronized int getMax() {
        return this.mProgressMax;
    }

    public synchronized void setProgress(int progress, boolean animate) {
        if (this.mProgressIndeterminate) {
            return;
        }
        this.mProgress = progress;
        this.mAnimateProgress = animate;
        if (!this.mButtonPositionSaved) {
            this.mShouldSetProgress = true;
            return;
        }
        this.mProgressBarEnabled = true;
        this.mShouldUpdateButtonPosition = true;
        setupProgressBounds();
        saveButtonOriginalPosition();
        updateBackground();
        if (progress < 0) {
            progress = 0;
        } else if (progress > this.mProgressMax) {
            progress = this.mProgressMax;
        }
        if (progress == this.mTargetProgress) {
            return;
        }
        this.mTargetProgress = this.mProgressMax > 0 ? (progress / this.mProgressMax) * 360.0f : 0.0f;
        this.mLastTimeAnimated = SystemClock.uptimeMillis();
        if (!animate) {
            this.mCurrentProgress = this.mTargetProgress;
        }
        invalidate();
    }

    public synchronized int getProgress() {
        if (this.mProgressIndeterminate) {
            return 0;
        }
        return this.mProgress;
    }

    public synchronized void hideProgress() {
        this.mProgressBarEnabled = false;
        this.mShouldUpdateButtonPosition = true;
        updateBackground();
    }

    public synchronized void setShowProgressBackground(boolean show) {
        this.mShowProgressBackground = show;
    }

    public synchronized boolean isProgressBackgroundShown() {
        return this.mShowProgressBackground;
    }
}
