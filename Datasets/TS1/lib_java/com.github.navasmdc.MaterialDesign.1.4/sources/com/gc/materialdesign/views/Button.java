package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Button.class */
public abstract class Button extends CustomView {
    static final String ANDROIDXML = "http://schemas.android.com/apk/res/android";
    int minWidth;
    int minHeight;
    int background;
    float rippleSpeed;
    int rippleSize;
    Integer rippleColor;
    View.OnClickListener onClickListener;
    boolean clickAfterRipple;
    int backgroundColor;
    float x;
    float y;
    float radius;

    protected abstract void setAttributes(AttributeSet attributeSet);

    public abstract TextView getTextView();

    public Button(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.rippleSpeed = 12.0f;
        this.rippleSize = 3;
        this.clickAfterRipple = true;
        this.backgroundColor = Color.parseColor("#1E88E5");
        this.x = -1.0f;
        this.y = -1.0f;
        this.radius = -1.0f;
        setDefaultProperties();
        this.clickAfterRipple = attrs.getAttributeBooleanValue("http://schemas.android.com/apk/res-auto", "animate", true);
        setAttributes(attrs);
        this.beforeBackground = this.backgroundColor;
        if (this.rippleColor == null) {
            this.rippleColor = Integer.valueOf(makePressColor());
        }
    }

    protected void setDefaultProperties() {
        setMinimumHeight(Utils.dpToPx(this.minHeight, getResources()));
        setMinimumWidth(Utils.dpToPx(this.minWidth, getResources()));
        setBackgroundResource(this.background);
        setBackgroundColor(this.backgroundColor);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        invalidate();
        if (isEnabled()) {
            this.isLastTouch = true;
            if (event.getAction() == 0) {
                this.radius = getHeight() / this.rippleSize;
                this.x = event.getX();
                this.y = event.getY();
                return true;
            }
            if (event.getAction() == 2) {
                this.radius = getHeight() / this.rippleSize;
                this.x = event.getX();
                this.y = event.getY();
                if (event.getX() > getWidth() || event.getX() < 0.0f || event.getY() > getHeight() || event.getY() < 0.0f) {
                    this.isLastTouch = false;
                    this.x = -1.0f;
                    this.y = -1.0f;
                    return true;
                }
                return true;
            }
            if (event.getAction() != 1) {
                if (event.getAction() == 3) {
                    this.isLastTouch = false;
                    this.x = -1.0f;
                    this.y = -1.0f;
                    return true;
                }
                return true;
            }
            if (event.getX() <= getWidth() && event.getX() >= 0.0f && event.getY() <= getHeight() && event.getY() >= 0.0f) {
                this.radius += 1.0f;
                if (!this.clickAfterRipple && this.onClickListener != null) {
                    this.onClickListener.onClick(this);
                    return true;
                }
                return true;
            }
            this.isLastTouch = false;
            this.x = -1.0f;
            this.y = -1.0f;
            return true;
        }
        return true;
    }

    @Override // android.view.View
    protected void onFocusChanged(boolean gainFocus, int direction, Rect previouslyFocusedRect) {
        if (!gainFocus) {
            this.x = -1.0f;
            this.y = -1.0f;
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return true;
    }

    public Bitmap makeCircle() {
        Bitmap output = Bitmap.createBitmap(getWidth() - Utils.dpToPx(6.0f, getResources()), getHeight() - Utils.dpToPx(7.0f, getResources()), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);
        canvas.drawARGB(0, 0, 0, 0);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setColor(this.rippleColor.intValue());
        canvas.drawCircle(this.x, this.y, this.radius, paint);
        if (this.radius > getHeight() / this.rippleSize) {
            this.radius += this.rippleSpeed;
        }
        if (this.radius >= getWidth()) {
            this.x = -1.0f;
            this.y = -1.0f;
            this.radius = getHeight() / this.rippleSize;
            if (this.onClickListener != null && this.clickAfterRipple) {
                this.onClickListener.onClick(this);
            }
        }
        return output;
    }

    protected int makePressColor() {
        int r = (this.backgroundColor >> 16) & 255;
        int g = (this.backgroundColor >> 8) & 255;
        int b = (this.backgroundColor >> 0) & 255;
        return Color.rgb(r - 30 < 0 ? 0 : r - 30, g - 30 < 0 ? 0 : g - 30, b - 30 < 0 ? 0 : b - 30);
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        this.onClickListener = l;
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        try {
            LayerDrawable layer = (LayerDrawable) getBackground();
            GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
            shape.setColor(this.backgroundColor);
            this.rippleColor = Integer.valueOf(makePressColor());
        } catch (Exception e) {
        }
    }

    public void setRippleSpeed(float rippleSpeed) {
        this.rippleSpeed = rippleSpeed;
    }

    public float getRippleSpeed() {
        return this.rippleSpeed;
    }
}
