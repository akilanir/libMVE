package com.getbase.floatingactionbutton;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.Shape;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.util.AttributeSet;

/* loaded from: com.getbase.floatingactionbutton.1.10.0.jar:com/getbase/floatingactionbutton/AddFloatingActionButton.class */
public class AddFloatingActionButton extends FloatingActionButton {
    int mPlusColor;

    public AddFloatingActionButton(Context context) {
        this(context, null);
    }

    public AddFloatingActionButton(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AddFloatingActionButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // com.getbase.floatingactionbutton.FloatingActionButton
    void init(Context context, AttributeSet attributeSet) {
        TypedArray attr = context.obtainStyledAttributes(attributeSet, R.styleable.AddFloatingActionButton, 0, 0);
        this.mPlusColor = attr.getColor(R.styleable.AddFloatingActionButton_fab_plusIconColor, getColor(R.color.white));
        attr.recycle();
        super.init(context, attributeSet);
    }

    public int getPlusColor() {
        return this.mPlusColor;
    }

    public void setPlusColorResId(@ColorRes int plusColor) {
        setPlusColor(getColor(plusColor));
    }

    public void setPlusColor(int color) {
        if (this.mPlusColor != color) {
            this.mPlusColor = color;
            updateBackground();
        }
    }

    @Override // com.getbase.floatingactionbutton.FloatingActionButton
    public void setIcon(@DrawableRes int icon) {
        throw new UnsupportedOperationException("Use FloatingActionButton if you want to use custom icon");
    }

    @Override // com.getbase.floatingactionbutton.FloatingActionButton
    Drawable getIconDrawable() {
        final float iconSize = getDimension(R.dimen.fab_icon_size);
        final float iconHalfSize = iconSize / 2.0f;
        float plusSize = getDimension(R.dimen.fab_plus_icon_size);
        final float plusHalfStroke = getDimension(R.dimen.fab_plus_icon_stroke) / 2.0f;
        final float plusOffset = (iconSize - plusSize) / 2.0f;
        Shape shape = new Shape() { // from class: com.getbase.floatingactionbutton.AddFloatingActionButton.1
            @Override // android.graphics.drawable.shapes.Shape
            public void draw(Canvas canvas, Paint paint) {
                canvas.drawRect(plusOffset, iconHalfSize - plusHalfStroke, iconSize - plusOffset, iconHalfSize + plusHalfStroke, paint);
                canvas.drawRect(iconHalfSize - plusHalfStroke, plusOffset, iconHalfSize + plusHalfStroke, iconSize - plusOffset, paint);
            }
        };
        ShapeDrawable drawable = new ShapeDrawable(shape);
        Paint paint = drawable.getPaint();
        paint.setColor(this.mPlusColor);
        paint.setStyle(Paint.Style.FILL);
        paint.setAntiAlias(true);
        return drawable;
    }
}
