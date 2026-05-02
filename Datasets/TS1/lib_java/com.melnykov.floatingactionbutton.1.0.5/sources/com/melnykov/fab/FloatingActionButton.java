package com.melnykov.fab;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Build;
import android.support.annotation.IntDef;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.ImageButton;

/* loaded from: com.melnykov.floatingactionbutton.1.0.5.jar:com/melnykov/fab/FloatingActionButton.class */
public class FloatingActionButton extends ImageButton {
    private static final int TRANSLATE_DURATION_MILLIS = 200;
    private FabOnScrollListener mOnScrollListener;
    public static final int TYPE_NORMAL = 0;
    public static final int TYPE_MINI = 1;
    protected AbsListView mListView;
    private boolean mVisible;
    private int mColorNormal;
    private int mColorPressed;
    private boolean mShadow;
    private int mType;
    private final Interpolator mInterpolator;

    @IntDef({0, 1})
    /* loaded from: com.melnykov.floatingactionbutton.1.0.5.jar:com/melnykov/fab/FloatingActionButton$TYPE.class */
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
        if (this.mShadow) {
            int shadowSize = getDimension(R.dimen.fab_shadow_size);
            size += shadowSize * 2;
        }
        setMeasuredDimension(size, size);
    }

    private void init(Context context, AttributeSet attributeSet) {
        this.mVisible = true;
        this.mColorNormal = getColor(R.color.holo_blue_dark);
        this.mColorPressed = getColor(R.color.holo_blue_light);
        this.mType = 0;
        this.mShadow = true;
        if (attributeSet != null) {
            initAttributes(context, attributeSet);
        }
        updateBackground();
    }

    private void initAttributes(Context context, AttributeSet attributeSet) {
        TypedArray attr = getTypedArray(context, attributeSet, R.styleable.FloatingActionButton);
        if (attr != null) {
            try {
                this.mColorNormal = attr.getColor(1, getColor(R.color.holo_blue_dark));
                this.mColorPressed = attr.getColor(0, getColor(R.color.holo_blue_light));
                this.mShadow = attr.getBoolean(2, true);
                this.mType = attr.getInt(3, 0);
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
        if (this.mShadow) {
            LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{getResources().getDrawable(R.drawable.shadow), shapeDrawable});
            int shadowSize = getDimension(this.mType == 0 ? R.dimen.fab_shadow_size : R.dimen.fab_mini_shadow_size);
            layerDrawable.setLayerInset(1, shadowSize, shadowSize, shadowSize, shadowSize);
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

    private int getDimension(int id) {
        return getResources().getDimensionPixelSize(id);
    }

    @SuppressLint({"NewApi"})
    private void setBackgroundCompat(Drawable drawable) {
        if (Build.VERSION.SDK_INT >= 16) {
            setBackground(drawable);
        } else {
            setBackgroundDrawable(drawable);
        }
    }

    @Deprecated
    protected int getListViewScrollY() {
        View topChild = this.mListView.getChildAt(0);
        if (topChild == null) {
            return 0;
        }
        return (this.mListView.getFirstVisiblePosition() * topChild.getHeight()) - topChild.getTop();
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

    protected AbsListView.OnScrollListener getOnScrollListener() {
        return this.mOnScrollListener;
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
                    vto.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.melnykov.fab.FloatingActionButton.1
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
                animate().setInterpolator(this.mInterpolator).setDuration(200L).translationY(translationY);
            } else {
                setTranslationY(translationY);
            }
        }
    }

    public void attachToListView(@NonNull AbsListView listView) {
        attachToListView(listView, new FabOnScrollListener());
    }

    public void attachToListView(@NonNull AbsListView listView, @NonNull FabOnScrollListener onScrollListener) {
        this.mListView = listView;
        this.mOnScrollListener = onScrollListener;
        onScrollListener.setFloatingActionButton(this);
        onScrollListener.setListView(listView);
        this.mListView.setOnScrollListener(onScrollListener);
    }

    /* loaded from: com.melnykov.floatingactionbutton.1.0.5.jar:com/melnykov/fab/FloatingActionButton$FabOnScrollListener.class */
    public static class FabOnScrollListener extends ScrollDirectionDetector {
        private FloatingActionButton mFloatingActionButton;

        public FabOnScrollListener() {
            setScrollDirectionListener(new ScrollDirectionListener() { // from class: com.melnykov.fab.FloatingActionButton.FabOnScrollListener.1
                @Override // com.melnykov.fab.ScrollDirectionListener
                public void onScrollDown() {
                    FabOnScrollListener.this.mFloatingActionButton.show();
                }

                @Override // com.melnykov.fab.ScrollDirectionListener
                public void onScrollUp() {
                    FabOnScrollListener.this.mFloatingActionButton.hide();
                }
            });
        }

        public void setFloatingActionButton(FloatingActionButton floatingActionButton) {
            this.mFloatingActionButton = floatingActionButton;
        }
    }
}
