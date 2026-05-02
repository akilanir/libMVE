package com.melnykov.fab;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Build;
import android.support.annotation.IntDef;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.ImageButton;
import com.nineoldandroids.view.ViewHelper;
import com.nineoldandroids.view.ViewPropertyAnimator;

/* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/FloatingActionButton.class */
public class FloatingActionButton extends ImageButton {
    private static final int TRANSLATE_DURATION_MILLIS = 200;
    public static final int TYPE_NORMAL = 0;
    public static final int TYPE_MINI = 1;
    private boolean mVisible;
    private int mColorNormal;
    private int mColorPressed;
    private int mColorRipple;
    private boolean mShadow;
    private int mType;
    private int mShadowSize;
    private int mScrollThreshold;
    private boolean mMarginsSet;
    private final Interpolator mInterpolator;

    @IntDef({0, 1})
    /* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/FloatingActionButton$TYPE.class */
    public @interface TYPE {
    }

    public FloatingActionButton(Context context) {
        this(context, null);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        init(context, attrs);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mInterpolator = new AccelerateDecelerateInterpolator();
        init(context, attrs);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int size = getDimension(this.mType == 0 ? R.dimen.fab_size_normal : R.dimen.fab_size_mini);
        if (this.mShadow && !hasLollipopApi()) {
            size += this.mShadowSize * 2;
            setMarginsWithoutShadow();
        }
        setMeasuredDimension(size, size);
    }

    private void init(Context context, AttributeSet attributeSet) {
        this.mVisible = true;
        this.mColorNormal = getColor(R.color.material_blue_500);
        this.mColorPressed = getColor(R.color.material_blue_600);
        this.mColorRipple = getColor(R.color.white);
        this.mType = 0;
        this.mShadow = true;
        this.mScrollThreshold = getResources().getDimensionPixelOffset(R.dimen.fab_scroll_threshold);
        this.mShadowSize = getDimension(R.dimen.fab_shadow_size);
        if (attributeSet != null) {
            initAttributes(context, attributeSet);
        }
        updateBackground();
    }

    private void initAttributes(Context context, AttributeSet attributeSet) {
        TypedArray attr = getTypedArray(context, attributeSet, R.styleable.FloatingActionButton);
        if (attr != null) {
            try {
                this.mColorNormal = attr.getColor(R.styleable.FloatingActionButton_fab_colorNormal, getColor(R.color.material_blue_500));
                this.mColorPressed = attr.getColor(R.styleable.FloatingActionButton_fab_colorPressed, getColor(R.color.material_blue_600));
                this.mColorRipple = attr.getColor(R.styleable.FloatingActionButton_fab_colorRipple, getColor(R.color.white));
                this.mShadow = attr.getBoolean(R.styleable.FloatingActionButton_fab_shadow, true);
                this.mType = attr.getInt(R.styleable.FloatingActionButton_fab_type, 0);
                attr.recycle();
            } catch (Throwable th) {
                attr.recycle();
                throw th;
            }
        }
    }

    private void updateBackground() {
        StateListDrawable drawable = new StateListDrawable();
        drawable.addState(new int[]{R.attr.state_pressed}, createDrawable(this.mColorPressed));
        drawable.addState(new int[0], createDrawable(this.mColorNormal));
        setBackgroundCompat(drawable);
    }

    private Drawable createDrawable(int color) {
        OvalShape ovalShape = new OvalShape();
        ShapeDrawable shapeDrawable = new ShapeDrawable(ovalShape);
        shapeDrawable.getPaint().setColor(color);
        if (this.mShadow && !hasLollipopApi()) {
            Drawable shadowDrawable = getResources().getDrawable(this.mType == 0 ? R.drawable.shadow : R.drawable.shadow_mini);
            LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{shadowDrawable, shapeDrawable});
            layerDrawable.setLayerInset(1, this.mShadowSize, this.mShadowSize, this.mShadowSize, this.mShadowSize);
            return layerDrawable;
        }
        return shapeDrawable;
    }

    private TypedArray getTypedArray(Context context, AttributeSet attributeSet, int[] attr) {
        return context.obtainStyledAttributes(attributeSet, attr, 0, 0);
    }

    private int getColor(int id) {
        return getResources().getColor(id);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDimension(int id) {
        return getResources().getDimensionPixelSize(id);
    }

    private void setMarginsWithoutShadow() {
        if (!this.mMarginsSet && (getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) {
            ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) getLayoutParams();
            int leftMargin = layoutParams.leftMargin - this.mShadowSize;
            int topMargin = layoutParams.topMargin - this.mShadowSize;
            int rightMargin = layoutParams.rightMargin - this.mShadowSize;
            int bottomMargin = layoutParams.bottomMargin - this.mShadowSize;
            layoutParams.setMargins(leftMargin, topMargin, rightMargin, bottomMargin);
            requestLayout();
            this.mMarginsSet = true;
        }
    }

    /* JADX WARN: Type inference failed for: r4v1, types: [int[], int[][]] */
    @SuppressLint({"NewApi"})
    private void setBackgroundCompat(Drawable drawable) {
        if (!hasLollipopApi()) {
            if (hasJellyBeanApi()) {
                setBackground(drawable);
                return;
            } else {
                setBackgroundDrawable(drawable);
                return;
            }
        }
        setElevation(this.mShadow ? getDimension(R.dimen.fab_elevation_lollipop) : 0.0f);
        RippleDrawable rippleDrawable = new RippleDrawable(new ColorStateList(new int[]{new int[0]}, new int[]{this.mColorRipple}), drawable, null);
        setOutlineProvider(new ViewOutlineProvider() { // from class: com.melnykov.fab.FloatingActionButton.1
            @Override // android.view.ViewOutlineProvider
            public void getOutline(View view, Outline outline) {
                int size = FloatingActionButton.this.getDimension(FloatingActionButton.this.mType == 0 ? R.dimen.fab_size_normal : R.dimen.fab_size_mini);
                outline.setOval(0, 0, size, size);
            }
        });
        setClipToOutline(true);
        setBackground(rippleDrawable);
    }

    private int getMarginBottom() {
        int marginBottom = 0;
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            marginBottom = ((ViewGroup.MarginLayoutParams) layoutParams).bottomMargin;
        }
        return marginBottom;
    }

    public void setColorNormal(int color) {
        if (color != this.mColorNormal) {
            this.mColorNormal = color;
            updateBackground();
        }
    }

    public void setColorNormalResId(int colorResId) {
        setColorNormal(getColor(colorResId));
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
        setColorPressed(getColor(colorResId));
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
        setColorRipple(getColor(colorResId));
    }

    public int getColorRipple() {
        return this.mColorRipple;
    }

    public void setShadow(boolean shadow) {
        if (shadow != this.mShadow) {
            this.mShadow = shadow;
            updateBackground();
        }
    }

    public boolean hasShadow() {
        return this.mShadow;
    }

    public void setType(@TYPE int type) {
        if (type != this.mType) {
            this.mType = type;
            updateBackground();
        }
    }

    @TYPE
    public int getType() {
        return this.mType;
    }

    public boolean isVisible() {
        return this.mVisible;
    }

    public void show() {
        show(true);
    }

    public void hide() {
        hide(true);
    }

    public void show(boolean animate) {
        toggle(true, animate, false);
    }

    public void hide(boolean animate) {
        toggle(false, animate, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggle(final boolean visible, final boolean animate, boolean force) {
        if (this.mVisible != visible || force) {
            this.mVisible = visible;
            int height = getHeight();
            if (height == 0 && !force) {
                ViewTreeObserver vto = getViewTreeObserver();
                if (vto.isAlive()) {
                    vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.melnykov.fab.FloatingActionButton.2
                        @Override // android.view.ViewTreeObserver.OnPreDrawListener
                        public boolean onPreDraw() {
                            ViewTreeObserver currentVto = FloatingActionButton.this.getViewTreeObserver();
                            if (currentVto.isAlive()) {
                                currentVto.removeOnPreDrawListener(this);
                            }
                            FloatingActionButton.this.toggle(visible, animate, true);
                            return true;
                        }
                    });
                    return;
                }
            }
            int translationY = visible ? 0 : height + getMarginBottom();
            if (animate) {
                ViewPropertyAnimator.animate(this).setInterpolator(this.mInterpolator).setDuration(200L).translationY(translationY);
            } else {
                ViewHelper.setTranslationY(this, translationY);
            }
            if (!hasHoneycombApi()) {
                setClickable(visible);
            }
        }
    }

    public void attachToListView(@NonNull AbsListView listView) {
        attachToListView(listView, null);
    }

    public void attachToRecyclerView(@NonNull RecyclerView recyclerView) {
        attachToRecyclerView(recyclerView, null);
    }

    public void attachToScrollView(@NonNull ObservableScrollView scrollView) {
        attachToScrollView(scrollView, null);
    }

    public void attachToListView(@NonNull AbsListView listView, ScrollDirectionListener listener) {
        AbsListViewScrollDetectorImpl scrollDetector = new AbsListViewScrollDetectorImpl();
        scrollDetector.setListener(listener);
        scrollDetector.setListView(listView);
        scrollDetector.setScrollThreshold(this.mScrollThreshold);
        listView.setOnScrollListener(scrollDetector);
    }

    public void attachToRecyclerView(@NonNull RecyclerView recyclerView, ScrollDirectionListener listener) {
        RecyclerViewScrollDetectorImpl scrollDetector = new RecyclerViewScrollDetectorImpl();
        scrollDetector.setListener(listener);
        scrollDetector.setScrollThreshold(this.mScrollThreshold);
        recyclerView.setOnScrollListener(scrollDetector);
    }

    public void attachToScrollView(@NonNull ObservableScrollView scrollView, ScrollDirectionListener listener) {
        ScrollViewScrollDetectorImpl scrollDetector = new ScrollViewScrollDetectorImpl();
        scrollDetector.setListener(listener);
        scrollDetector.setScrollThreshold(this.mScrollThreshold);
        scrollView.setOnScrollChangedListener(scrollDetector);
    }

    private boolean hasLollipopApi() {
        return Build.VERSION.SDK_INT >= 21;
    }

    private boolean hasJellyBeanApi() {
        return Build.VERSION.SDK_INT >= 16;
    }

    private boolean hasHoneycombApi() {
        return Build.VERSION.SDK_INT >= 11;
    }

    /* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl.class */
    private class AbsListViewScrollDetectorImpl extends AbsListViewScrollDetector {
        private ScrollDirectionListener mListener;

        private AbsListViewScrollDetectorImpl() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setListener(ScrollDirectionListener scrollDirectionListener) {
            this.mListener = scrollDirectionListener;
        }

        @Override // com.melnykov.fab.AbsListViewScrollDetector
        public void onScrollDown() {
            FloatingActionButton.this.show();
            if (this.mListener != null) {
                this.mListener.onScrollDown();
            }
        }

        @Override // com.melnykov.fab.AbsListViewScrollDetector
        public void onScrollUp() {
            FloatingActionButton.this.hide();
            if (this.mListener != null) {
                this.mListener.onScrollUp();
            }
        }
    }

    /* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl.class */
    private class RecyclerViewScrollDetectorImpl extends RecyclerViewScrollDetector {
        private ScrollDirectionListener mListener;

        private RecyclerViewScrollDetectorImpl() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setListener(ScrollDirectionListener scrollDirectionListener) {
            this.mListener = scrollDirectionListener;
        }

        @Override // com.melnykov.fab.RecyclerViewScrollDetector
        public void onScrollDown() {
            FloatingActionButton.this.show();
            if (this.mListener != null) {
                this.mListener.onScrollDown();
            }
        }

        @Override // com.melnykov.fab.RecyclerViewScrollDetector
        public void onScrollUp() {
            FloatingActionButton.this.hide();
            if (this.mListener != null) {
                this.mListener.onScrollUp();
            }
        }
    }

    /* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl.class */
    private class ScrollViewScrollDetectorImpl extends ScrollViewScrollDetector {
        private ScrollDirectionListener mListener;

        private ScrollViewScrollDetectorImpl() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setListener(ScrollDirectionListener scrollDirectionListener) {
            this.mListener = scrollDirectionListener;
        }

        @Override // com.melnykov.fab.ScrollViewScrollDetector
        public void onScrollDown() {
            FloatingActionButton.this.show();
            if (this.mListener != null) {
                this.mListener.onScrollDown();
            }
        }

        @Override // com.melnykov.fab.ScrollViewScrollDetector
        public void onScrollUp() {
            FloatingActionButton.this.hide();
            if (this.mListener != null) {
                this.mListener.onScrollUp();
            }
        }
    }
}
