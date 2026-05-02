package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/LayoutRipple.class */
public class LayoutRipple extends CustomView {
    int background;
    float rippleSpeed;
    int rippleSize;
    View.OnClickListener onClickListener;
    int backgroundColor;
    Integer rippleColor;
    Float xRippleOrigin;
    Float yRippleOrigin;
    float x;
    float y;
    float radius;

    public LayoutRipple(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.rippleSpeed = 10.0f;
        this.rippleSize = 3;
        this.backgroundColor = Color.parseColor("#FFFFFF");
        this.x = -1.0f;
        this.y = -1.0f;
        this.radius = -1.0f;
        setAttributes(attrs);
    }

    protected void setAttributes(AttributeSet attrs) {
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            this.background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (this.background != -1) {
                setBackgroundColor(this.background);
            } else {
                setBackgroundColor(this.backgroundColor);
            }
        }
        int rippleColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res-auto", "rippleColor", -1);
        if (rippleColor != -1) {
            setRippleColor(getResources().getColor(rippleColor));
        } else {
            int background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "rippleColor", -1);
            if (background != -1) {
                setRippleColor(background);
            } else {
                setRippleColor(makePressColor());
            }
        }
        this.rippleSpeed = attrs.getAttributeFloatValue("http://schemas.android.com/apk/res-auto", "rippleSpeed", 20.0f);
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        super.setBackgroundColor(color);
    }

    public void setRippleSpeed(int rippleSpeed) {
        this.rippleSpeed = rippleSpeed;
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
            } else if (event.getAction() == 2) {
                this.radius = getHeight() / this.rippleSize;
                this.x = event.getX();
                this.y = event.getY();
                if (event.getX() > getWidth() || event.getX() < 0.0f || event.getY() > getHeight() || event.getY() < 0.0f) {
                    this.isLastTouch = false;
                    this.x = -1.0f;
                    this.y = -1.0f;
                }
            } else if (event.getAction() == 1) {
                if (event.getX() <= getWidth() && event.getX() >= 0.0f && event.getY() <= getHeight() && event.getY() >= 0.0f) {
                    this.radius += 1.0f;
                } else {
                    this.isLastTouch = false;
                    this.x = -1.0f;
                    this.y = -1.0f;
                }
            }
            if (event.getAction() == 3) {
                this.isLastTouch = false;
                this.x = -1.0f;
                this.y = -1.0f;
                return true;
            }
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
        Bitmap output = Bitmap.createBitmap(getWidth(), getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);
        canvas.drawARGB(0, 0, 0, 0);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        if (this.rippleColor == null) {
            this.rippleColor = Integer.valueOf(makePressColor());
        }
        paint.setColor(this.rippleColor.intValue());
        this.x = this.xRippleOrigin == null ? this.x : this.xRippleOrigin.floatValue();
        this.y = this.yRippleOrigin == null ? this.y : this.yRippleOrigin.floatValue();
        canvas.drawCircle(this.x, this.y, this.radius, paint);
        if (this.radius > getHeight() / this.rippleSize) {
            this.radius += this.rippleSpeed;
        }
        if (this.radius >= getWidth()) {
            this.x = -1.0f;
            this.y = -1.0f;
            this.radius = getHeight() / this.rippleSize;
            if (this.onClickListener != null) {
                this.onClickListener.onClick(this);
            }
        }
        return output;
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.x != -1.0f) {
            Rect src = new Rect(0, 0, getWidth(), getHeight());
            Rect dst = new Rect(0, 0, getWidth(), getHeight());
            canvas.drawBitmap(makeCircle(), src, dst, (Paint) null);
            invalidate();
        }
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

    public void setRippleColor(int rippleColor) {
        this.rippleColor = Integer.valueOf(rippleColor);
    }

    public void setxRippleOrigin(Float xRippleOrigin) {
        this.xRippleOrigin = xRippleOrigin;
    }

    public void setyRippleOrigin(Float yRippleOrigin) {
        this.yRippleOrigin = yRippleOrigin;
    }
}
