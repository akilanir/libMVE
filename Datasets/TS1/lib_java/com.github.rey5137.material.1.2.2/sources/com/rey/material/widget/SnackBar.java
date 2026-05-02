package com.rey.material.widget;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.RippleDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/SnackBar.class */
public class SnackBar extends FrameLayout implements ThemeManager.OnThemeChangedListener {
    private TextView mText;
    private Button mAction;
    public static final int MATCH_PARENT = -1;
    public static final int WRAP_CONTENT = -2;
    private BackgroundDrawable mBackground;
    private int mMarginStart;
    private int mMarginBottom;
    private int mWidth;
    private int mHeight;
    private int mMaxHeight;
    private int mMinHeight;
    private long mDuration;
    private int mActionId;
    private boolean mRemoveOnDismiss;
    private Animation mInAnimation;
    private Animation mOutAnimation;
    private Runnable mDismissRunnable;
    private int mState;
    public static final int STATE_DISMISSED = 0;
    public static final int STATE_SHOWN = 1;
    public static final int STATE_SHOWING = 2;
    public static final int STATE_DISMISSING = 3;
    private boolean mIsRtl;
    private OnActionClickListener mActionClickListener;
    private OnStateChangeListener mStateChangeListener;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/SnackBar$OnActionClickListener.class */
    public interface OnActionClickListener {
        void onActionClick(SnackBar snackBar, int i);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/SnackBar$OnStateChangeListener.class */
    public interface OnStateChangeListener {
        void onStateChange(SnackBar snackBar, int i, int i2);
    }

    public static SnackBar make(Context context) {
        return new SnackBar(context);
    }

    public SnackBar(Context context) {
        super(context);
        this.mDismissRunnable = new Runnable() { // from class: com.rey.material.widget.SnackBar.1
            @Override // java.lang.Runnable
            public void run() {
                SnackBar.this.dismiss();
            }
        };
        this.mState = 0;
    }

    public SnackBar(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mDismissRunnable = new Runnable() { // from class: com.rey.material.widget.SnackBar.1
            @Override // java.lang.Runnable
            public void run() {
                SnackBar.this.dismiss();
            }
        };
        this.mState = 0;
    }

    public SnackBar(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mDismissRunnable = new Runnable() { // from class: com.rey.material.widget.SnackBar.1
            @Override // java.lang.Runnable
            public void run() {
                SnackBar.this.dismiss();
            }
        };
        this.mState = 0;
    }

    public SnackBar(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mDismissRunnable = new Runnable() { // from class: com.rey.material.widget.SnackBar.1
            @Override // java.lang.Runnable
            public void run() {
                SnackBar.this.dismiss();
            }
        };
        this.mState = 0;
    }

    @Override // com.rey.material.widget.FrameLayout
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mWidth = -1;
        this.mHeight = -2;
        this.mDuration = -1L;
        this.mIsRtl = false;
        this.mText = new TextView(context);
        this.mText.setSingleLine(true);
        this.mText.setGravity(8388627);
        addView(this.mText, new FrameLayout.LayoutParams(-2, -2));
        this.mAction = new Button(context);
        this.mAction.setBackgroundResource(0);
        this.mAction.setGravity(17);
        this.mAction.setOnClickListener(new View.OnClickListener() { // from class: com.rey.material.widget.SnackBar.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (SnackBar.this.mActionClickListener != null) {
                    SnackBar.this.mActionClickListener.onActionClick(SnackBar.this, SnackBar.this.mActionId);
                }
                SnackBar.this.dismiss();
            }
        });
        addView(this.mAction, new FrameLayout.LayoutParams(-2, -2));
        this.mBackground = new BackgroundDrawable();
        this.mBackground.setColor(-13487566);
        ViewUtil.setBackground(this, this.mBackground);
        setClickable(true);
        super.init(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.FrameLayout
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SnackBar, defStyleAttr, defStyleRes);
        int horizontalPadding = -1;
        int verticalPadding = -1;
        int textSize = -1;
        int textColor = 0;
        boolean textColorDefined = false;
        int textAppearance = 0;
        int actionTextSize = -1;
        ColorStateList actionTextColor = null;
        int actionTextAppearance = 0;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.SnackBar_sb_backgroundColor) {
                backgroundColor(a.getColor(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_backgroundCornerRadius) {
                backgroundRadius(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_horizontalPadding) {
                horizontalPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_verticalPadding) {
                verticalPadding = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_width) {
                if (ThemeUtil.getType(a, attr) == 16) {
                    width(a.getInteger(attr, 0));
                } else {
                    width(a.getDimensionPixelSize(attr, 0));
                }
            } else if (attr == R.styleable.SnackBar_sb_height) {
                if (ThemeUtil.getType(a, attr) == 16) {
                    height(a.getInteger(attr, 0));
                } else {
                    height(a.getDimensionPixelSize(attr, 0));
                }
            } else if (attr == R.styleable.SnackBar_sb_minWidth) {
                minWidth(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_maxWidth) {
                maxWidth(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_minHeight) {
                minHeight(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_maxHeight) {
                maxHeight(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_marginStart) {
                marginStart(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_marginBottom) {
                marginBottom(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_textSize) {
                textSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_textColor) {
                textColor = a.getColor(attr, 0);
                textColorDefined = true;
            } else if (attr == R.styleable.SnackBar_sb_textAppearance) {
                textAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_text) {
                text(a.getString(attr));
            } else if (attr == R.styleable.SnackBar_sb_singleLine) {
                singleLine(a.getBoolean(attr, true));
            } else if (attr == R.styleable.SnackBar_sb_maxLines) {
                maxLines(a.getInteger(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_lines) {
                lines(a.getInteger(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_ellipsize) {
                int ellipsize = a.getInteger(attr, 0);
                switch (ellipsize) {
                    case 1:
                        ellipsize(TextUtils.TruncateAt.START);
                        break;
                    case 2:
                        ellipsize(TextUtils.TruncateAt.MIDDLE);
                        break;
                    case 3:
                        ellipsize(TextUtils.TruncateAt.END);
                        break;
                    case 4:
                        ellipsize(TextUtils.TruncateAt.MARQUEE);
                        break;
                    default:
                        ellipsize(TextUtils.TruncateAt.END);
                        break;
                }
            } else if (attr == R.styleable.SnackBar_sb_actionTextSize) {
                actionTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_actionTextColor) {
                actionTextColor = a.getColorStateList(attr);
            } else if (attr == R.styleable.SnackBar_sb_actionTextAppearance) {
                actionTextAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.SnackBar_sb_actionText) {
                actionText(a.getString(attr));
            } else if (attr == R.styleable.SnackBar_sb_actionRipple) {
                actionRipple(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_duration) {
                duration(a.getInteger(attr, 0));
            } else if (attr == R.styleable.SnackBar_sb_removeOnDismiss) {
                removeOnDismiss(a.getBoolean(attr, true));
            } else if (attr == R.styleable.SnackBar_sb_inAnimation) {
                animationIn(AnimationUtils.loadAnimation(getContext(), a.getResourceId(attr, 0)));
            } else if (attr == R.styleable.SnackBar_sb_outAnimation) {
                animationOut(AnimationUtils.loadAnimation(getContext(), a.getResourceId(attr, 0)));
            }
        }
        a.recycle();
        if (horizontalPadding >= 0 || verticalPadding >= 0) {
            padding(horizontalPadding >= 0 ? horizontalPadding : this.mText.getPaddingLeft(), verticalPadding >= 0 ? verticalPadding : this.mText.getPaddingTop());
        }
        if (textAppearance != 0) {
            textAppearance(textAppearance);
        }
        if (textSize >= 0) {
            textSize(textSize);
        }
        if (textColorDefined) {
            textColor(textColor);
        }
        if (textAppearance != 0) {
            actionTextAppearance(actionTextAppearance);
        }
        if (actionTextSize >= 0) {
            actionTextSize(actionTextSize);
        }
        if (actionTextColor != null) {
            actionTextColor(actionTextColor);
        }
    }

    @Override // android.view.View
    @TargetApi(17)
    public void onRtlPropertiesChanged(int layoutDirection) {
        boolean rtl = layoutDirection == 1;
        if (this.mIsRtl != rtl) {
            this.mIsRtl = rtl;
            if (Build.VERSION.SDK_INT >= 17) {
                this.mText.setTextDirection(this.mIsRtl ? 4 : 3);
                this.mAction.setTextDirection(this.mIsRtl ? 4 : 3);
            }
            requestLayout();
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width;
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        if (this.mAction.getVisibility() == 0) {
            this.mAction.measure(View.MeasureSpec.makeMeasureSpec(0, 0), heightMeasureSpec);
            int padding = this.mIsRtl ? this.mText.getPaddingLeft() : this.mText.getPaddingRight();
            this.mText.measure(View.MeasureSpec.makeMeasureSpec(widthSize - (this.mAction.getMeasuredWidth() - padding), widthMode), heightMeasureSpec);
            width = (this.mText.getMeasuredWidth() + this.mAction.getMeasuredWidth()) - padding;
        } else {
            this.mText.measure(View.MeasureSpec.makeMeasureSpec(widthSize, widthMode), heightMeasureSpec);
            width = this.mText.getMeasuredWidth();
        }
        int height = Math.max(this.mText.getMeasuredHeight(), this.mAction.getMeasuredHeight());
        switch (widthMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                width = Math.min(widthSize, width);
                break;
            case 1073741824:
                width = widthSize;
                break;
        }
        switch (heightMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                height = Math.min(heightSize, height);
                break;
            case 1073741824:
                height = heightSize;
                break;
        }
        if (this.mMaxHeight > 0) {
            height = Math.min(this.mMaxHeight, height);
        }
        if (this.mMinHeight > 0) {
            height = Math.max(this.mMinHeight, height);
        }
        setMeasuredDimension(width, height);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int childLeft = getPaddingLeft();
        int childRight = (r - l) - getPaddingRight();
        int childTop = getPaddingTop();
        int childBottom = (b - t) - getPaddingBottom();
        if (this.mAction.getVisibility() == 0) {
            if (this.mIsRtl) {
                this.mAction.layout(childLeft, childTop, childLeft + this.mAction.getMeasuredWidth(), childBottom);
                childLeft += this.mAction.getMeasuredWidth() - this.mText.getPaddingLeft();
            } else {
                this.mAction.layout(childRight - this.mAction.getMeasuredWidth(), childTop, childRight, childBottom);
                childRight -= this.mAction.getMeasuredWidth() - this.mText.getPaddingRight();
            }
        }
        this.mText.layout(childLeft, childTop, childRight, childBottom);
    }

    public SnackBar text(CharSequence text) {
        this.mText.setText(text);
        return this;
    }

    public SnackBar text(int id) {
        return text(getContext().getResources().getString(id));
    }

    public SnackBar textColor(int color) {
        this.mText.setTextColor(color);
        return this;
    }

    public SnackBar textSize(float size) {
        this.mText.setTextSize(2, size);
        return this;
    }

    public SnackBar textAppearance(int resId) {
        if (resId != 0) {
            this.mText.setTextAppearance(getContext(), resId);
        }
        return this;
    }

    public SnackBar ellipsize(TextUtils.TruncateAt at) {
        this.mText.setEllipsize(at);
        return this;
    }

    public SnackBar singleLine(boolean b) {
        this.mText.setSingleLine(b);
        return this;
    }

    public SnackBar maxLines(int lines) {
        this.mText.setMaxLines(lines);
        return this;
    }

    public SnackBar lines(int lines) {
        this.mText.setLines(lines);
        return this;
    }

    public SnackBar actionId(int id) {
        this.mActionId = id;
        return this;
    }

    public SnackBar actionText(CharSequence text) {
        if (TextUtils.isEmpty(text)) {
            this.mAction.setVisibility(4);
        } else {
            this.mAction.setVisibility(0);
            this.mAction.setText(text);
        }
        return this;
    }

    public SnackBar actionText(int id) {
        if (id == 0) {
            return actionText((CharSequence) null);
        }
        return actionText(getContext().getResources().getString(id));
    }

    public SnackBar actionTextColor(int color) {
        this.mAction.setTextColor(color);
        return this;
    }

    public SnackBar actionTextColor(ColorStateList colors) {
        this.mAction.setTextColor(colors);
        return this;
    }

    public SnackBar actionTextAppearance(int resId) {
        if (resId != 0) {
            this.mAction.setTextAppearance(getContext(), resId);
        }
        return this;
    }

    public SnackBar actionTextSize(float size) {
        this.mAction.setTextSize(2, size);
        return this;
    }

    public SnackBar actionRipple(int resId) {
        if (resId != 0) {
            ViewUtil.setBackground(this.mAction, new RippleDrawable.Builder(getContext(), resId).build());
        }
        return this;
    }

    public SnackBar duration(long duration) {
        this.mDuration = duration;
        return this;
    }

    public SnackBar backgroundColor(int color) {
        this.mBackground.setColor(color);
        return this;
    }

    public SnackBar backgroundRadius(int radius) {
        this.mBackground.setRadius(radius);
        return this;
    }

    public SnackBar horizontalPadding(int padding) {
        this.mText.setPadding(padding, this.mText.getPaddingTop(), padding, this.mText.getPaddingBottom());
        this.mAction.setPadding(padding, this.mAction.getPaddingTop(), padding, this.mAction.getPaddingBottom());
        return this;
    }

    public SnackBar verticalPadding(int padding) {
        this.mText.setPadding(this.mText.getPaddingLeft(), padding, this.mText.getPaddingRight(), padding);
        this.mAction.setPadding(this.mAction.getPaddingLeft(), padding, this.mAction.getPaddingRight(), padding);
        return this;
    }

    public SnackBar padding(int horizontalPadding, int verticalPadding) {
        this.mText.setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);
        this.mAction.setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);
        return this;
    }

    public SnackBar width(int width) {
        this.mWidth = width;
        return this;
    }

    public SnackBar minWidth(int width) {
        this.mText.setMinWidth(width);
        return this;
    }

    public SnackBar maxWidth(int width) {
        this.mText.setMaxWidth(width);
        return this;
    }

    public SnackBar height(int height) {
        this.mHeight = height;
        return this;
    }

    public SnackBar maxHeight(int height) {
        this.mMaxHeight = height;
        return this;
    }

    public SnackBar minHeight(int height) {
        this.mMinHeight = height;
        return this;
    }

    public SnackBar marginStart(int size) {
        this.mMarginStart = size;
        return this;
    }

    public SnackBar marginBottom(int size) {
        this.mMarginBottom = size;
        return this;
    }

    public SnackBar actionClickListener(OnActionClickListener listener) {
        this.mActionClickListener = listener;
        return this;
    }

    public SnackBar stateChangeListener(OnStateChangeListener listener) {
        this.mStateChangeListener = listener;
        return this;
    }

    public SnackBar animationIn(Animation anim) {
        this.mInAnimation = anim;
        return this;
    }

    public SnackBar animationOut(Animation anim) {
        this.mOutAnimation = anim;
        return this;
    }

    public SnackBar removeOnDismiss(boolean b) {
        this.mRemoveOnDismiss = b;
        return this;
    }

    public void show(Activity activity) {
        show((ViewGroup) activity.getWindow().findViewById(android.R.id.content));
    }

    public void show(ViewGroup parent) {
        if (this.mState == 2 || this.mState == 3) {
            return;
        }
        if (getParent() != parent) {
            if (getParent() != null) {
                ((ViewGroup) getParent()).removeView(this);
            }
            parent.addView(this);
        }
        show();
    }

    @TargetApi(17)
    public void show() {
        ViewGroup parent = (ViewGroup) getParent();
        if (parent == null || this.mState == 2 || this.mState == 3) {
            return;
        }
        if (parent instanceof android.widget.FrameLayout) {
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) getLayoutParams();
            params.width = this.mWidth;
            params.height = this.mHeight;
            params.gravity = 8388691;
            if (this.mIsRtl) {
                params.rightMargin = this.mMarginStart;
            } else {
                params.leftMargin = this.mMarginStart;
            }
            params.bottomMargin = this.mMarginBottom;
            setLayoutParams(params);
        } else if (parent instanceof android.widget.RelativeLayout) {
            RelativeLayout.LayoutParams params2 = (RelativeLayout.LayoutParams) getLayoutParams();
            params2.width = this.mWidth;
            params2.height = this.mHeight;
            params2.addRule(12);
            params2.addRule(Build.VERSION.SDK_INT >= 17 ? 20 : 9);
            if (this.mIsRtl) {
                params2.rightMargin = this.mMarginStart;
            } else {
                params2.leftMargin = this.mMarginStart;
            }
            params2.bottomMargin = this.mMarginBottom;
            setLayoutParams(params2);
        }
        if (this.mInAnimation != null && this.mState != 1) {
            this.mInAnimation.cancel();
            this.mInAnimation.reset();
            this.mInAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.widget.SnackBar.3
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    SnackBar.this.setState(2);
                    SnackBar.this.setVisibility(0);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    SnackBar.this.setState(1);
                    SnackBar.this.startTimer();
                }
            });
            clearAnimation();
            startAnimation(this.mInAnimation);
            return;
        }
        setVisibility(0);
        setState(1);
        startTimer();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startTimer() {
        removeCallbacks(this.mDismissRunnable);
        if (this.mDuration > 0) {
            postDelayed(this.mDismissRunnable, this.mDuration);
        }
    }

    public void dismiss() {
        if (this.mState != 1) {
            return;
        }
        removeCallbacks(this.mDismissRunnable);
        if (this.mOutAnimation != null) {
            this.mOutAnimation.cancel();
            this.mOutAnimation.reset();
            this.mOutAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.widget.SnackBar.4
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    SnackBar.this.setState(3);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    if (SnackBar.this.mRemoveOnDismiss && SnackBar.this.getParent() != null && (SnackBar.this.getParent() instanceof ViewGroup)) {
                        ((ViewGroup) SnackBar.this.getParent()).removeView(SnackBar.this);
                    }
                    SnackBar.this.setState(0);
                    SnackBar.this.setVisibility(8);
                }
            });
            clearAnimation();
            startAnimation(this.mOutAnimation);
            return;
        }
        if (this.mRemoveOnDismiss && getParent() != null && (getParent() instanceof ViewGroup)) {
            ((ViewGroup) getParent()).removeView(this);
        }
        setState(0);
        setVisibility(8);
    }

    public int getState() {
        return this.mState;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setState(int state) {
        if (this.mState != state) {
            int oldState = this.mState;
            this.mState = state;
            if (this.mStateChangeListener != null) {
                this.mStateChangeListener.onStateChange(this, oldState, this.mState);
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/SnackBar$BackgroundDrawable.class */
    private class BackgroundDrawable extends Drawable {
        private int mBackgroundColor;
        private int mBackgroundRadius;
        private Paint mPaint = new Paint();
        private RectF mRect;

        public BackgroundDrawable() {
            this.mPaint.setAntiAlias(true);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mRect = new RectF();
        }

        public void setColor(int color) {
            if (this.mBackgroundColor != color) {
                this.mBackgroundColor = color;
                this.mPaint.setColor(this.mBackgroundColor);
                invalidateSelf();
            }
        }

        public void setRadius(int radius) {
            if (this.mBackgroundRadius != radius) {
                this.mBackgroundRadius = radius;
                invalidateSelf();
            }
        }

        @Override // android.graphics.drawable.Drawable
        protected void onBoundsChange(Rect bounds) {
            this.mRect.set(bounds);
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.drawRoundRect(this.mRect, this.mBackgroundRadius, this.mBackgroundRadius, this.mPaint);
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
            return -3;
        }
    }
}
