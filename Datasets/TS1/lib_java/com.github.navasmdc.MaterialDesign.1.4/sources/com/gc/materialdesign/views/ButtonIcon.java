package com.gc.materialdesign.views;

import android.R;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ButtonIcon.class */
public class ButtonIcon extends ButtonFloat {
    public ButtonIcon(Context context, AttributeSet attrs) {
        super(context, attrs);
        try {
            setBackground(new ColorDrawable(getResources().getColor(R.color.transparent)));
        } catch (NoSuchMethodError e) {
            setBackgroundDrawable(new ColorDrawable(getResources().getColor(R.color.transparent)));
        }
        this.rippleSpeed = Utils.dpToPx(2.0f, getResources());
        this.rippleSize = Utils.dpToPx(5.0f, getResources());
    }

    @Override // com.gc.materialdesign.views.Button, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        boolean returnBool = super.onTouchEvent(event);
        if (this.x != -1.0f) {
            this.x = getWidth() / 2;
            this.y = getHeight() / 2;
        }
        return returnBool;
    }

    @Override // com.gc.materialdesign.views.ButtonFloat, com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.x != -1.0f) {
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(makePressColor());
            canvas.drawCircle(this.x, this.y, this.radius, paint);
            if (this.radius > getHeight() / this.rippleSize) {
                this.radius += this.rippleSpeed;
            }
            if (this.radius >= (getWidth() / 2) - this.rippleSpeed) {
                this.x = -1.0f;
                this.y = -1.0f;
                this.radius = getHeight() / this.rippleSize;
                if (this.onClickListener != null && this.clickAfterRipple) {
                    this.onClickListener.onClick(this);
                }
            }
            invalidate();
        }
    }

    @Override // com.gc.materialdesign.views.Button
    protected int makePressColor() {
        return this.backgroundColor;
    }
}
