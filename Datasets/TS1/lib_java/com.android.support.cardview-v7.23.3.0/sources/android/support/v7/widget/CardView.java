package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

/* loaded from: com.android.support.cardview-v7.23.3.0.jar:android/support/v7/widget/CardView.class */
public class CardView extends FrameLayout implements CardViewDelegate {
    private static final int[] COLOR_BACKGROUND_ATTR = {R.attr.colorBackground};
    private static final CardViewImpl IMPL;
    private boolean mCompatPadding;
    private boolean mPreventCornerOverlap;
    private int mUserSetMinWidth;
    private int mUserSetMinHeight;
    private final Rect mContentPadding;
    private final Rect mShadowBounds;

    static {
        if (Build.VERSION.SDK_INT >= 21) {
            IMPL = new CardViewApi21();
        } else if (Build.VERSION.SDK_INT >= 17) {
            IMPL = new CardViewJellybeanMr1();
        } else {
            IMPL = new CardViewEclairMr1();
        }
        IMPL.initStatic();
    }

    public CardView(Context context) {
        super(context);
        this.mContentPadding = new Rect();
        this.mShadowBounds = new Rect();
        initialize(context, null, 0);
    }

    public CardView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mContentPadding = new Rect();
        this.mShadowBounds = new Rect();
        initialize(context, attrs, 0);
    }

    public CardView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mContentPadding = new Rect();
        this.mShadowBounds = new Rect();
        initialize(context, attrs, defStyleAttr);
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
    }

    @Override // android.view.View
    public void setPaddingRelative(int start, int top, int end, int bottom) {
    }

    @Override // android.support.v7.widget.CardViewDelegate
    public boolean getUseCompatPadding() {
        return this.mCompatPadding;
    }

    public void setUseCompatPadding(boolean useCompatPadding) {
        if (this.mCompatPadding == useCompatPadding) {
            return;
        }
        this.mCompatPadding = useCompatPadding;
        IMPL.onCompatPaddingChanged(this);
    }

    public void setContentPadding(int left, int top, int right, int bottom) {
        this.mContentPadding.set(left, top, right, bottom);
        IMPL.updatePadding(this);
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (!(IMPL instanceof CardViewApi21)) {
            int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
            switch (widthMode) {
                case Integer.MIN_VALUE:
                case 1073741824:
                    int minWidth = (int) Math.ceil(IMPL.getMinWidth(this));
                    widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(Math.max(minWidth, View.MeasureSpec.getSize(widthMeasureSpec)), widthMode);
                    break;
            }
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            switch (heightMode) {
                case Integer.MIN_VALUE:
                case 1073741824:
                    int minHeight = (int) Math.ceil(IMPL.getMinHeight(this));
                    heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(Math.max(minHeight, View.MeasureSpec.getSize(heightMeasureSpec)), heightMode);
                    break;
            }
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            return;
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    private void initialize(Context context, AttributeSet attrs, int defStyleAttr) {
        int backgroundColor;
        TypedArray a = context.obtainStyledAttributes(attrs, android.support.v7.cardview.R.styleable.CardView, defStyleAttr, android.support.v7.cardview.R.style.CardView);
        if (a.hasValue(android.support.v7.cardview.R.styleable.CardView_cardBackgroundColor)) {
            backgroundColor = a.getColor(android.support.v7.cardview.R.styleable.CardView_cardBackgroundColor, 0);
        } else {
            TypedArray aa = getContext().obtainStyledAttributes(COLOR_BACKGROUND_ATTR);
            int themeColorBackground = aa.getColor(0, 0);
            aa.recycle();
            float[] hsv = new float[3];
            Color.colorToHSV(themeColorBackground, hsv);
            backgroundColor = hsv[2] > 0.5f ? getResources().getColor(android.support.v7.cardview.R.color.cardview_light_background) : getResources().getColor(android.support.v7.cardview.R.color.cardview_dark_background);
        }
        float radius = a.getDimension(android.support.v7.cardview.R.styleable.CardView_cardCornerRadius, 0.0f);
        float elevation = a.getDimension(android.support.v7.cardview.R.styleable.CardView_cardElevation, 0.0f);
        float maxElevation = a.getDimension(android.support.v7.cardview.R.styleable.CardView_cardMaxElevation, 0.0f);
        this.mCompatPadding = a.getBoolean(android.support.v7.cardview.R.styleable.CardView_cardUseCompatPadding, false);
        this.mPreventCornerOverlap = a.getBoolean(android.support.v7.cardview.R.styleable.CardView_cardPreventCornerOverlap, true);
        int defaultPadding = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_contentPadding, 0);
        this.mContentPadding.left = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_contentPaddingLeft, defaultPadding);
        this.mContentPadding.top = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_contentPaddingTop, defaultPadding);
        this.mContentPadding.right = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_contentPaddingRight, defaultPadding);
        this.mContentPadding.bottom = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_contentPaddingBottom, defaultPadding);
        if (elevation > maxElevation) {
            maxElevation = elevation;
        }
        this.mUserSetMinWidth = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_android_minWidth, 0);
        this.mUserSetMinHeight = a.getDimensionPixelSize(android.support.v7.cardview.R.styleable.CardView_android_minHeight, 0);
        a.recycle();
        IMPL.initialize(this, context, backgroundColor, radius, elevation, maxElevation);
    }

    @Override // android.view.View
    public void setMinimumWidth(int minWidth) {
        this.mUserSetMinWidth = minWidth;
        super.setMinimumWidth(minWidth);
    }

    @Override // android.view.View
    public void setMinimumHeight(int minHeight) {
        this.mUserSetMinHeight = minHeight;
        super.setMinimumHeight(minHeight);
    }

    @Override // android.support.v7.widget.CardViewDelegate
    public void setMinWidthHeightInternal(int width, int height) {
        if (width > this.mUserSetMinWidth) {
            super.setMinimumWidth(width);
        }
        if (height > this.mUserSetMinHeight) {
            super.setMinimumHeight(height);
        }
    }

    public void setCardBackgroundColor(int color) {
        IMPL.setBackgroundColor(this, color);
    }

    public int getContentPaddingLeft() {
        return this.mContentPadding.left;
    }

    public int getContentPaddingRight() {
        return this.mContentPadding.right;
    }

    public int getContentPaddingTop() {
        return this.mContentPadding.top;
    }

    public int getContentPaddingBottom() {
        return this.mContentPadding.bottom;
    }

    public void setRadius(float radius) {
        IMPL.setRadius(this, radius);
    }

    @Override // android.support.v7.widget.CardViewDelegate
    public float getRadius() {
        return IMPL.getRadius(this);
    }

    @Override // android.support.v7.widget.CardViewDelegate
    public void setShadowPadding(int left, int top, int right, int bottom) {
        this.mShadowBounds.set(left, top, right, bottom);
        super.setPadding(left + this.mContentPadding.left, top + this.mContentPadding.top, right + this.mContentPadding.right, bottom + this.mContentPadding.bottom);
    }

    public void setCardElevation(float elevation) {
        IMPL.setElevation(this, elevation);
    }

    public float getCardElevation() {
        return IMPL.getElevation(this);
    }

    public void setMaxCardElevation(float maxElevation) {
        IMPL.setMaxElevation(this, maxElevation);
    }

    public float getMaxCardElevation() {
        return IMPL.getMaxElevation(this);
    }

    @Override // android.support.v7.widget.CardViewDelegate
    public boolean getPreventCornerOverlap() {
        return this.mPreventCornerOverlap;
    }

    public void setPreventCornerOverlap(boolean preventCornerOverlap) {
        if (preventCornerOverlap == this.mPreventCornerOverlap) {
            return;
        }
        this.mPreventCornerOverlap = preventCornerOverlap;
        IMPL.onPreventCornerOverlapChanged(this);
    }
}
