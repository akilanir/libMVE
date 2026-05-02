package com.gc.materialdesign.views;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.gc.materialdesign.BuildConfig;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Slider.class */
public class Slider extends CustomView {
    int backgroundColor;
    Ball ball;
    NumberIndicator numberIndicator;
    boolean showNumberIndicator;
    boolean press;
    int value;
    int max;
    int min;
    OnValueChangedListener onValueChangedListener;
    boolean placedBall;

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Slider$OnValueChangedListener.class */
    public interface OnValueChangedListener {
        void onValueChanged(int i);
    }

    public Slider(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.backgroundColor = Color.parseColor("#4CAF50");
        this.showNumberIndicator = false;
        this.press = false;
        this.value = 0;
        this.max = 100;
        this.min = 0;
        this.placedBall = false;
        setAttributes(attrs);
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
        this.showNumberIndicator = attrs.getAttributeBooleanValue("http://schemas.android.com/apk/res-auto", "showNumberIndicator", false);
        this.min = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "min", 0);
        this.max = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "max", 0);
        this.value = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "value", this.min);
        this.ball = new Ball(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(Utils.dpToPx(20.0f, getResources()), Utils.dpToPx(20.0f, getResources()));
        params.addRule(15, -1);
        this.ball.setLayoutParams(params);
        addView(this.ball);
        if (this.showNumberIndicator) {
            this.numberIndicator = new NumberIndicator(getContext());
        }
    }

    @Override // android.view.View
    public void invalidate() {
        this.ball.invalidate();
        super.invalidate();
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.placedBall) {
            placeBall();
        }
        if (this.value == this.min) {
            Bitmap bitmap = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
            Canvas temp = new Canvas(bitmap);
            Paint paint = new Paint();
            paint.setColor(Color.parseColor("#B0B0B0"));
            paint.setStrokeWidth(Utils.dpToPx(2.0f, getResources()));
            temp.drawLine(getHeight() / 2, getHeight() / 2, getWidth() - (getHeight() / 2), getHeight() / 2, paint);
            Paint transparentPaint = new Paint();
            transparentPaint.setColor(getResources().getColor(android.R.color.transparent));
            transparentPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
            temp.drawCircle(ViewHelper.getX(this.ball) + (this.ball.getWidth() / 2), ViewHelper.getY(this.ball) + (this.ball.getHeight() / 2), this.ball.getWidth() / 2, transparentPaint);
            canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint());
        } else {
            Paint paint2 = new Paint();
            paint2.setColor(Color.parseColor("#B0B0B0"));
            paint2.setStrokeWidth(Utils.dpToPx(2.0f, getResources()));
            canvas.drawLine(getHeight() / 2, getHeight() / 2, getWidth() - (getHeight() / 2), getHeight() / 2, paint2);
            paint2.setColor(this.backgroundColor);
            float division = (this.ball.xFin - this.ball.xIni) / (this.max - this.min);
            int value = this.value - this.min;
            canvas.drawLine(getHeight() / 2, getHeight() / 2, (value * division) + (getHeight() / 2), getHeight() / 2, paint2);
        }
        if (this.press && !this.showNumberIndicator) {
            Paint paint3 = new Paint();
            paint3.setColor(this.backgroundColor);
            paint3.setAntiAlias(true);
            canvas.drawCircle(ViewHelper.getX(this.ball) + (this.ball.getWidth() / 2), getHeight() / 2, getHeight() / 3, paint3);
        }
        invalidate();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int newValue;
        this.isLastTouch = true;
        if (isEnabled()) {
            if (event.getAction() == 0 || event.getAction() == 2) {
                if (this.numberIndicator != null && !this.numberIndicator.isShowing()) {
                    this.numberIndicator.show();
                }
                if (event.getX() <= getWidth() && event.getX() >= 0.0f) {
                    this.press = true;
                    float division = (this.ball.xFin - this.ball.xIni) / (this.max - this.min);
                    if (event.getX() > this.ball.xFin) {
                        newValue = this.max;
                    } else if (event.getX() < this.ball.xIni) {
                        newValue = this.min;
                    } else {
                        newValue = this.min + ((int) ((event.getX() - this.ball.xIni) / division));
                    }
                    if (this.value != newValue) {
                        this.value = newValue;
                        if (this.onValueChangedListener != null) {
                            this.onValueChangedListener.onValueChanged(newValue);
                        }
                    }
                    float x = event.getX();
                    float x2 = x < this.ball.xIni ? this.ball.xIni : x;
                    float x3 = x2 > this.ball.xFin ? this.ball.xFin : x2;
                    ViewHelper.setX(this.ball, x3);
                    this.ball.changeBackground();
                    if (this.numberIndicator != null) {
                        this.numberIndicator.indicator.x = x3;
                        this.numberIndicator.indicator.finalY = Utils.getRelativeTop(this) - (getHeight() / 2);
                        this.numberIndicator.indicator.finalSize = getHeight() / 2;
                        this.numberIndicator.numberIndicator.setText(BuildConfig.FLAVOR);
                        return true;
                    }
                    return true;
                }
                this.press = false;
                this.isLastTouch = false;
                if (this.numberIndicator != null) {
                    this.numberIndicator.dismiss();
                    return true;
                }
                return true;
            }
            if (event.getAction() == 1 || event.getAction() == 3) {
                if (this.numberIndicator != null) {
                    this.numberIndicator.dismiss();
                }
                this.isLastTouch = false;
                this.press = false;
                return true;
            }
            return true;
        }
        return true;
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
    }

    public OnValueChangedListener getOnValueChangedListener() {
        return this.onValueChangedListener;
    }

    public void setOnValueChangedListener(OnValueChangedListener onValueChangedListener) {
        this.onValueChangedListener = onValueChangedListener;
    }

    public int getValue() {
        return this.value;
    }

    public void setValue(final int value) {
        if (!this.placedBall) {
            post(new Runnable() { // from class: com.gc.materialdesign.views.Slider.1
                @Override // java.lang.Runnable
                public void run() {
                    Slider.this.setValue(value);
                }
            });
            return;
        }
        this.value = value;
        float division = (this.ball.xFin - this.ball.xIni) / this.max;
        ViewHelper.setX(this.ball, ((value * division) + (getHeight() / 2)) - (this.ball.getWidth() / 2));
        this.ball.changeBackground();
    }

    public int getMax() {
        return this.max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return this.min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public boolean isShowNumberIndicator() {
        return this.showNumberIndicator;
    }

    public void setShowNumberIndicator(boolean showNumberIndicator) {
        this.showNumberIndicator = showNumberIndicator;
        this.numberIndicator = showNumberIndicator ? new NumberIndicator(getContext()) : null;
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
    }

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Slider$Ball.class */
    class Ball extends View {
        float xIni;
        float xFin;
        float xCen;

        public Ball(Context context) {
            super(context);
            setBackgroundResource(R.drawable.background_switch_ball_uncheck);
        }

        public void changeBackground() {
            if (Slider.this.value != Slider.this.min) {
                setBackgroundResource(R.drawable.background_checkbox);
                LayerDrawable layer = (LayerDrawable) getBackground();
                GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
                shape.setColor(Slider.this.backgroundColor);
                return;
            }
            setBackgroundResource(R.drawable.background_switch_ball_uncheck);
        }
    }

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Slider$NumberIndicator.class */
    class NumberIndicator extends Dialog {
        Indicator indicator;
        TextView numberIndicator;

        public NumberIndicator(Context context) {
            super(context, android.R.style.Theme.Translucent);
        }

        @Override // android.app.Dialog
        protected void onCreate(Bundle savedInstanceState) {
            requestWindowFeature(1);
            super.onCreate(savedInstanceState);
            setContentView(R.layout.number_indicator_spinner);
            setCanceledOnTouchOutside(false);
            RelativeLayout content = (RelativeLayout) findViewById(R.id.number_indicator_spinner_content);
            this.indicator = Slider.this.new Indicator(getContext());
            content.addView(this.indicator);
            this.numberIndicator = new TextView(getContext());
            this.numberIndicator.setTextColor(-1);
            this.numberIndicator.setGravity(17);
            content.addView(this.numberIndicator);
            this.indicator.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        }

        @Override // android.app.Dialog, android.content.DialogInterface
        public void dismiss() {
            super.dismiss();
            this.indicator.y = 0.0f;
            this.indicator.size = 0.0f;
            this.indicator.animate = true;
        }

        @Override // android.app.Dialog
        public void onBackPressed() {
        }
    }

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Slider$Indicator.class */
    class Indicator extends RelativeLayout {
        float x;
        float y;
        float size;
        float finalY;
        float finalSize;
        boolean animate;
        boolean numberIndicatorResize;

        public Indicator(Context context) {
            super(context);
            this.x = 0.0f;
            this.y = 0.0f;
            this.size = 0.0f;
            this.finalY = 0.0f;
            this.finalSize = 0.0f;
            this.animate = true;
            this.numberIndicatorResize = false;
            setBackgroundColor(getResources().getColor(android.R.color.transparent));
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (!this.numberIndicatorResize) {
                RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) Slider.this.numberIndicator.numberIndicator.getLayoutParams();
                params.height = ((int) this.finalSize) * 2;
                params.width = ((int) this.finalSize) * 2;
                Slider.this.numberIndicator.numberIndicator.setLayoutParams(params);
            }
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(Slider.this.backgroundColor);
            if (this.animate) {
                if (this.y == 0.0f) {
                    this.y = this.finalY + (this.finalSize * 2.0f);
                }
                this.y -= Utils.dpToPx(6.0f, getResources());
                this.size += Utils.dpToPx(2.0f, getResources());
            }
            canvas.drawCircle(ViewHelper.getX(Slider.this.ball) + Utils.getRelativeLeft((View) Slider.this.ball.getParent()) + (Slider.this.ball.getWidth() / 2), this.y, this.size, paint);
            if (this.animate && this.size >= this.finalSize) {
                this.animate = false;
            }
            if (!this.animate) {
                ViewHelper.setX(Slider.this.numberIndicator.numberIndicator, ((ViewHelper.getX(Slider.this.ball) + Utils.getRelativeLeft((View) Slider.this.ball.getParent())) + (Slider.this.ball.getWidth() / 2)) - this.size);
                ViewHelper.setY(Slider.this.numberIndicator.numberIndicator, this.y - this.size);
                Slider.this.numberIndicator.numberIndicator.setText(Slider.this.value + BuildConfig.FLAVOR);
            }
            invalidate();
        }
    }
}
