package com.github.clans.fab;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Xfermode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.view.animation.Animation;
import android.widget.TextView;

/* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/Label.class */
public class Label extends TextView {
    private static final Xfermode PORTER_DUFF_CLEAR = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);
    private int mShadowRadius;
    private int mShadowXOffset;
    private int mShadowYOffset;
    private int mShadowColor;
    private Drawable mBackgroundDrawable;
    private boolean mShowShadow;
    private int mRawWidth;
    private int mRawHeight;
    private int mColorNormal;
    private int mColorPressed;
    private int mColorRipple;
    private int mCornerRadius;
    private FloatingActionButton mFab;
    private Animation mShowAnimation;
    private Animation mHideAnimation;
    private boolean mUsingStyle;
    GestureDetector mGestureDetector;

    public Label(Context context) {
        super(context);
        this.mShowShadow = true;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.Label.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                Label.this.onActionDown();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionDown();
                }
                return super.onDown(e);
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                Label.this.onActionUp();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionUp();
                }
                return super.onSingleTapUp(e);
            }
        });
    }

    public Label(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mShowShadow = true;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.Label.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                Label.this.onActionDown();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionDown();
                }
                return super.onDown(e);
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                Label.this.onActionUp();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionUp();
                }
                return super.onSingleTapUp(e);
            }
        });
    }

    public Label(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShowShadow = true;
        this.mGestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.github.clans.fab.Label.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onDown(MotionEvent e) {
                Label.this.onActionDown();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionDown();
                }
                return super.onDown(e);
            }

            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                Label.this.onActionUp();
                if (Label.this.mFab != null) {
                    Label.this.mFab.onActionUp();
                }
                return super.onSingleTapUp(e);
            }
        });
    }

    @Override // android.widget.TextView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        setMeasuredDimension(calculateMeasuredWidth(), calculateMeasuredHeight());
    }

    private int calculateMeasuredWidth() {
        if (this.mRawWidth == 0) {
            this.mRawWidth = getMeasuredWidth();
        }
        return getMeasuredWidth() + calculateShadowWidth();
    }

    private int calculateMeasuredHeight() {
        if (this.mRawHeight == 0) {
            this.mRawHeight = getMeasuredHeight();
        }
        return getMeasuredHeight() + calculateShadowHeight();
    }

    int calculateShadowWidth() {
        if (this.mShowShadow) {
            return this.mShadowRadius + Math.abs(this.mShadowXOffset);
        }
        return 0;
    }

    int calculateShadowHeight() {
        if (this.mShowShadow) {
            return this.mShadowRadius + Math.abs(this.mShadowYOffset);
        }
        return 0;
    }

    void updateBackground() {
        LayerDrawable layerDrawable;
        if (this.mShowShadow) {
            layerDrawable = new LayerDrawable(new Drawable[]{new Shadow(), createFillDrawable()});
            int leftInset = this.mShadowRadius + Math.abs(this.mShadowXOffset);
            int topInset = this.mShadowRadius + Math.abs(this.mShadowYOffset);
            int rightInset = this.mShadowRadius + Math.abs(this.mShadowXOffset);
            int bottomInset = this.mShadowRadius + Math.abs(this.mShadowYOffset);
            layerDrawable.setLayerInset(1, leftInset, topInset, rightInset, bottomInset);
        } else {
            layerDrawable = new LayerDrawable(new Drawable[]{createFillDrawable()});
        }
        setBackgroundCompat(layerDrawable);
    }

    /* JADX WARN: Type inference failed for: r4v2, types: [int[], int[][]] */
    @TargetApi(21)
    private Drawable createFillDrawable() {
        StateListDrawable drawable = new StateListDrawable();
        drawable.addState(new int[]{R.attr.state_pressed}, createRectDrawable(this.mColorPressed));
        drawable.addState(new int[0], createRectDrawable(this.mColorNormal));
        if (Util.hasLollipop()) {
            RippleDrawable ripple = new RippleDrawable(new ColorStateList(new int[]{new int[0]}, new int[]{this.mColorRipple}), drawable, null);
            setOutlineProvider(new ViewOutlineProvider() { // from class: com.github.clans.fab.Label.1
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

    private Drawable createRectDrawable(int color) {
        RoundRectShape shape = new RoundRectShape(new float[]{this.mCornerRadius, this.mCornerRadius, this.mCornerRadius, this.mCornerRadius, this.mCornerRadius, this.mCornerRadius, this.mCornerRadius, this.mCornerRadius}, null, null);
        ShapeDrawable shapeDrawable = new ShapeDrawable(shape);
        shapeDrawable.getPaint().setColor(color);
        return shapeDrawable;
    }

    private void setShadow(FloatingActionButton fab) {
        this.mShadowColor = fab.getShadowColor();
        this.mShadowRadius = fab.getShadowRadius();
        this.mShadowXOffset = fab.getShadowXOffset();
        this.mShadowYOffset = fab.getShadowYOffset();
        this.mShowShadow = fab.hasShadow();
    }

    @TargetApi(21)
    private void setBackgroundCompat(Drawable drawable) {
        if (Util.hasJellyBean()) {
            setBackground(drawable);
        } else {
            setBackgroundDrawable(drawable);
        }
    }

    private void playShowAnimation() {
        if (this.mShowAnimation != null) {
            startAnimation(this.mShowAnimation);
        }
    }

    private void playHideAnimation() {
        if (this.mHideAnimation != null) {
            startAnimation(this.mHideAnimation);
        }
    }

    @TargetApi(21)
    void onActionDown() {
        if (this.mUsingStyle) {
            this.mBackgroundDrawable = getBackground();
        }
        if (this.mBackgroundDrawable instanceof StateListDrawable) {
            StateListDrawable drawable = (StateListDrawable) this.mBackgroundDrawable;
            drawable.setState(new int[]{R.attr.state_pressed});
        } else if (Util.hasLollipop() && (this.mBackgroundDrawable instanceof RippleDrawable)) {
            RippleDrawable ripple = (RippleDrawable) this.mBackgroundDrawable;
            ripple.setState(new int[]{R.attr.state_enabled, R.attr.state_pressed});
            ripple.setHotspot(getMeasuredWidth() / 2, getMeasuredHeight() / 2);
            ripple.setVisible(true, true);
        }
    }

    @TargetApi(21)
    void onActionUp() {
        if (this.mUsingStyle) {
            this.mBackgroundDrawable = getBackground();
        }
        if (this.mBackgroundDrawable instanceof StateListDrawable) {
            StateListDrawable drawable = (StateListDrawable) this.mBackgroundDrawable;
            drawable.setState(new int[0]);
        } else if (Util.hasLollipop() && (this.mBackgroundDrawable instanceof RippleDrawable)) {
            RippleDrawable ripple = (RippleDrawable) this.mBackgroundDrawable;
            ripple.setState(new int[0]);
            ripple.setHotspot(getMeasuredWidth() / 2, getMeasuredHeight() / 2);
            ripple.setVisible(true, true);
        }
    }

    void setFab(FloatingActionButton fab) {
        this.mFab = fab;
        setShadow(fab);
    }

    void setShowShadow(boolean show) {
        this.mShowShadow = show;
    }

    void setCornerRadius(int cornerRadius) {
        this.mCornerRadius = cornerRadius;
    }

    void setColors(int colorNormal, int colorPressed, int colorRipple) {
        this.mColorNormal = colorNormal;
        this.mColorPressed = colorPressed;
        this.mColorRipple = colorRipple;
    }

    void show(boolean animate) {
        if (animate) {
            playShowAnimation();
        }
        setVisibility(0);
    }

    void hide(boolean animate) {
        if (animate) {
            playHideAnimation();
        }
        setVisibility(4);
    }

    void setShowAnimation(Animation showAnimation) {
        this.mShowAnimation = showAnimation;
    }

    void setHideAnimation(Animation hideAnimation) {
        this.mHideAnimation = hideAnimation;
    }

    void setUsingStyle(boolean usingStyle) {
        this.mUsingStyle = usingStyle;
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mFab == null || this.mFab.getOnClickListener() == null) {
            return false;
        }
        int action = event.getAction();
        switch (action) {
            case FloatingActionButton.SIZE_MINI /* 1 */:
                onActionUp();
                this.mFab.onActionUp();
                break;
        }
        this.mGestureDetector.onTouchEvent(event);
        return super.onTouchEvent(event);
    }

    /* loaded from: com.github.clans.fab.1.5.0.jar:com/github/clans/fab/Label$Shadow.class */
    private class Shadow extends Drawable {
        private Paint mPaint;
        private Paint mErase;

        private Shadow() {
            this.mPaint = new Paint(1);
            this.mErase = new Paint(1);
            init();
        }

        private void init() {
            Label.this.setLayerType(1, null);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mPaint.setColor(Label.this.mColorNormal);
            this.mErase.setXfermode(Label.PORTER_DUFF_CLEAR);
            if (!Label.this.isInEditMode()) {
                this.mPaint.setShadowLayer(Label.this.mShadowRadius, Label.this.mShadowXOffset, Label.this.mShadowYOffset, Label.this.mShadowColor);
            }
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            RectF shadowRect = new RectF(Label.this.mShadowRadius + Math.abs(Label.this.mShadowXOffset), Label.this.mShadowRadius + Math.abs(Label.this.mShadowYOffset), Label.this.mRawWidth, Label.this.mRawHeight);
            canvas.drawRoundRect(shadowRect, Label.this.mCornerRadius, Label.this.mCornerRadius, this.mPaint);
            canvas.drawRoundRect(shadowRect, Label.this.mCornerRadius, Label.this.mCornerRadius, this.mErase);
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
}
