package com.shamanland.fab;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.ImageButton;

/* loaded from: com.shamanland.fab.0.0.5.jar:com/shamanland/fab/FloatingActionButton.class */
public class FloatingActionButton extends ImageButton {
    public static final int SIZE_NORMAL = 0;
    public static final int SIZE_MINI = 1;
    private int mSize;
    private int mColor;
    private ColorStateList mColorStateList;
    private GradientDrawable mCircleDrawable;

    public int getSize() {
        return this.mSize;
    }

    public void setSize(int size) {
        this.mSize = size;
    }

    public int getColor() {
        return this.mColor;
    }

    public void setColor(int color) {
        this.mColor = color;
    }

    public ColorStateList getColorStateList() {
        return this.mColorStateList;
    }

    public void setColorStateList(ColorStateList colorStateList) {
        this.mColorStateList = colorStateList;
    }

    public FloatingActionButton(Context context) {
        super(context);
        init(context, null, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs, R.attr.floatingActionButtonStyle);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(context, attrs, defStyle);
    }

    private void init(Context context, AttributeSet attrs, int defStyle) {
        try {
            if (isInEditMode()) {
                return;
            }
            if (attrs == null) {
                this.mSize = 0;
                this.mColor = -7829368;
                this.mColorStateList = null;
                return;
            }
            Resources.Theme theme = context.getTheme();
            if (theme == null) {
                this.mSize = 0;
                this.mColor = -7829368;
                this.mColorStateList = null;
                return;
            }
            TypedArray a = theme.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyle, R.style.FloatingActionButton_Dark);
            if (a == null) {
                this.mSize = 0;
                this.mColor = -7829368;
                this.mColorStateList = null;
                return;
            }
            this.mSize = 0;
            this.mColor = -7829368;
            this.mColorStateList = null;
            try {
                initAttrs(a);
                a.recycle();
                initBackground();
            } catch (Throwable th) {
                a.recycle();
                throw th;
            }
        } finally {
            this.mSize = 0;
            this.mColor = -7829368;
            this.mColorStateList = null;
        }
    }

    private void initAttrs(TypedArray a) {
        setSize(a.getInteger(1, 0));
        setColor(a.getColor(0, -7829368));
        setColorStateList(a.getColorStateList(0));
    }

    public void initBackground() {
        int backgroundId;
        if (this.mSize == 1) {
            backgroundId = R.drawable.com_shamanland_fab_circle_mini;
        } else {
            backgroundId = R.drawable.com_shamanland_fab_circle_normal;
        }
        Drawable background = getResources().getDrawable(backgroundId);
        if (background instanceof LayerDrawable) {
            LayerDrawable layers = (LayerDrawable) background;
            if (layers.getNumberOfLayers() == 2) {
                Drawable shadow = layers.getDrawable(0);
                Drawable circle = layers.getDrawable(1);
                if (shadow instanceof GradientDrawable) {
                    ((GradientDrawable) shadow.mutate()).setGradientRadius(getShadowRadius(shadow, circle));
                }
                if (circle instanceof GradientDrawable) {
                    this.mCircleDrawable = (GradientDrawable) circle.mutate();
                    this.mCircleDrawable.setColor(this.mColor);
                }
            }
        }
        if (Build.VERSION.SDK_INT < 16) {
            setBackgroundDrawable(background);
        } else {
            setBackground(background);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mCircleDrawable != null && this.mColorStateList != null) {
            this.mCircleDrawable.setColor(this.mColorStateList.getColorForState(getDrawableState(), this.mColor));
            invalidate();
        }
    }

    protected static int getShadowRadius(Drawable shadow, Drawable circle) {
        int radius = 0;
        if (shadow != null && circle != null) {
            Rect rect = new Rect();
            radius = (circle.getIntrinsicWidth() + (shadow.getPadding(rect) ? rect.left + rect.right : 0)) / 2;
        }
        return Math.max(1, radius);
    }
}
