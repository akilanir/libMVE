package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Switch.class */
public class Switch extends CustomView {
    int backgroundColor;
    Ball ball;
    boolean check;
    boolean eventCheck;
    boolean press;
    OnCheckListener onCheckListener;
    boolean placedBall;

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Switch$OnCheckListener.class */
    public interface OnCheckListener {
        void onCheck(boolean z);
    }

    public Switch(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.backgroundColor = Color.parseColor("#4CAF50");
        this.check = false;
        this.eventCheck = false;
        this.press = false;
        this.placedBall = false;
        setAttributes(attrs);
        setOnClickListener(new View.OnClickListener() { // from class: com.gc.materialdesign.views.Switch.1
            @Override // android.view.View.OnClickListener
            public void onClick(View arg0) {
                if (Switch.this.check) {
                    Switch.this.setChecked(false);
                } else {
                    Switch.this.setChecked(true);
                }
            }
        });
    }

    protected void setAttributes(AttributeSet attrs) {
        setBackgroundResource(R.drawable.background_transparent);
        setMinimumHeight(Utils.dpToPx(48.0f, getResources()));
        setMinimumWidth(Utils.dpToPx(80.0f, getResources()));
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            int background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (background != -1) {
                setBackgroundColor(background);
            }
        }
        this.check = attrs.getAttributeBooleanValue("http://schemas.android.com/apk/res-auto", "check", false);
        this.eventCheck = this.check;
        this.ball = new Ball(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(Utils.dpToPx(20.0f, getResources()), Utils.dpToPx(20.0f, getResources()));
        params.addRule(15, -1);
        this.ball.setLayoutParams(params);
        addView(this.ball);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (isEnabled()) {
            this.isLastTouch = true;
            if (event.getAction() == 0) {
                this.press = true;
                return true;
            }
            if (event.getAction() == 2) {
                float x = event.getX();
                float x2 = x < this.ball.xIni ? this.ball.xIni : x;
                float x3 = x2 > this.ball.xFin ? this.ball.xFin : x2;
                if (x3 > this.ball.xCen) {
                    this.check = true;
                } else {
                    this.check = false;
                }
                ViewHelper.setX(this.ball, x3);
                this.ball.changeBackground();
                if (event.getX() <= getWidth() && event.getX() >= 0.0f) {
                    this.isLastTouch = false;
                    this.press = false;
                    return true;
                }
                return true;
            }
            if (event.getAction() == 1 || event.getAction() == 3) {
                this.press = false;
                this.isLastTouch = false;
                if (this.eventCheck != this.check) {
                    this.eventCheck = this.check;
                    if (this.onCheckListener != null) {
                        this.onCheckListener.onCheck(this.check);
                    }
                }
                if (event.getX() <= getWidth() && event.getX() >= 0.0f) {
                    this.ball.animateCheck();
                    return true;
                }
                return true;
            }
            return true;
        }
        return true;
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.placedBall) {
            placeBall();
        }
        Bitmap bitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas temp = new Canvas(bitmap);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setColor(this.check ? this.backgroundColor : Color.parseColor("#B0B0B0"));
        paint.setStrokeWidth(Utils.dpToPx(2.0f, getResources()));
        temp.drawLine(getHeight() / 2, getHeight() / 2, getWidth() - (getHeight() / 2), getHeight() / 2, paint);
        Paint transparentPaint = new Paint();
        transparentPaint.setAntiAlias(true);
        transparentPaint.setColor(getResources().getColor(android.R.color.transparent));
        transparentPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        temp.drawCircle(ViewHelper.getX(this.ball) + (this.ball.getWidth() / 2), ViewHelper.getY(this.ball) + (this.ball.getHeight() / 2), this.ball.getWidth() / 2, transparentPaint);
        canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint());
        if (this.press) {
            paint.setColor(this.check ? makePressColor() : Color.parseColor("#446D6D6D"));
            canvas.drawCircle(ViewHelper.getX(this.ball) + (this.ball.getWidth() / 2), getHeight() / 2, getHeight() / 2, paint);
        }
        invalidate();
    }

    protected int makePressColor() {
        int r = (this.backgroundColor >> 16) & 255;
        int g = (this.backgroundColor >> 8) & 255;
        int b = (this.backgroundColor >> 0) & 255;
        return Color.argb(70, r - 30 < 0 ? 0 : r - 30, g - 30 < 0 ? 0 : g - 30, b - 30 < 0 ? 0 : b - 30);
    }

    private void placeBall() {
        ViewHelper.setX(this.ball, (getHeight() / 2) - (this.ball.getWidth() / 2));
        this.ball.xIni = ViewHelper.getX(this.ball);
        this.ball.xFin = (getWidth() - (getHeight() / 2)) - (this.ball.getWidth() / 2);
        this.ball.xCen = (getWidth() / 2) - (this.ball.getWidth() / 2);
        this.placedBall = true;
        this.ball.animateCheck();
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
    }

    public void setChecked(boolean check) {
        invalidate();
        this.check = check;
        this.ball.animateCheck();
    }

    public boolean isCheck() {
        return this.check;
    }

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Switch$Ball.class */
    class Ball extends View {
        float xIni;
        float xFin;
        float xCen;

        public Ball(Context context) {
            super(context);
            setBackgroundResource(R.drawable.background_switch_ball_uncheck);
        }

        public void changeBackground() {
            if (Switch.this.check) {
                setBackgroundResource(R.drawable.background_checkbox);
                LayerDrawable layer = (LayerDrawable) getBackground();
                GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
                shape.setColor(Switch.this.backgroundColor);
                return;
            }
            setBackgroundResource(R.drawable.background_switch_ball_uncheck);
        }

        public void animateCheck() {
            ObjectAnimator objectAnimator;
            changeBackground();
            if (Switch.this.check) {
                objectAnimator = ObjectAnimator.ofFloat(this, "x", new float[]{Switch.this.ball.xFin});
            } else {
                objectAnimator = ObjectAnimator.ofFloat(this, "x", new float[]{Switch.this.ball.xIni});
            }
            objectAnimator.setDuration(300L);
            objectAnimator.start();
        }
    }

    public void setOncheckListener(OnCheckListener onCheckListener) {
        this.onCheckListener = onCheckListener;
    }
}
