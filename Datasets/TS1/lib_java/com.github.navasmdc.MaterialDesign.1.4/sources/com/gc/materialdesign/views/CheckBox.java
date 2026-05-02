package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/CheckBox.class */
public class CheckBox extends CustomView {
    int backgroundColor;
    Check checkView;
    boolean press;
    boolean check;
    OnCheckListener onCheckListener;
    int step;

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/CheckBox$OnCheckListener.class */
    public interface OnCheckListener {
        void onCheck(boolean z);
    }

    public CheckBox(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.backgroundColor = Color.parseColor("#4CAF50");
        this.press = false;
        this.check = false;
        this.step = 0;
        setAttributes(attrs);
    }

    protected void setAttributes(AttributeSet attrs) {
        setBackgroundResource(R.drawable.background_checkbox);
        setMinimumHeight(Utils.dpToPx(48.0f, getResources()));
        setMinimumWidth(Utils.dpToPx(48.0f, getResources()));
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            int background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (background != -1) {
                setBackgroundColor(background);
            }
        }
        final boolean check = attrs.getAttributeBooleanValue("http://schemas.android.com/apk/res-auto", "check", false);
        post(new Runnable() { // from class: com.gc.materialdesign.views.CheckBox.1
            @Override // java.lang.Runnable
            public void run() {
                CheckBox.this.setChecked(check);
                CheckBox.this.setPressed(false);
                CheckBox.this.changeBackgroundColor(CheckBox.this.getResources().getColor(android.R.color.transparent));
            }
        });
        this.checkView = new Check(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(Utils.dpToPx(20.0f, getResources()), Utils.dpToPx(20.0f, getResources()));
        params.addRule(13, -1);
        this.checkView.setLayoutParams(params);
        addView(this.checkView);
    }

    @Override // android.view.View
    public void invalidate() {
        this.checkView.invalidate();
        super.invalidate();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        invalidate();
        if (isEnabled()) {
            this.isLastTouch = true;
            if (event.getAction() == 0) {
                changeBackgroundColor(this.check ? makePressColor() : Color.parseColor("#446D6D6D"));
                return true;
            }
            if (event.getAction() == 1) {
                changeBackgroundColor(getResources().getColor(android.R.color.transparent));
                this.press = false;
                if (event.getX() <= getWidth() && event.getX() >= 0.0f && event.getY() <= getHeight() && event.getY() >= 0.0f) {
                    this.isLastTouch = false;
                    this.check = !this.check;
                    if (this.onCheckListener != null) {
                        this.onCheckListener.onCheck(this.check);
                    }
                    if (this.check) {
                        this.step = 0;
                    }
                    if (this.check) {
                        this.checkView.changeBackground();
                        return true;
                    }
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
        if (this.press) {
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(this.check ? makePressColor() : Color.parseColor("#446D6D6D"));
            canvas.drawCircle(getWidth() / 2, getHeight() / 2, getWidth() / 2, paint);
            invalidate();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void changeBackgroundColor(int color) {
        LayerDrawable layer = (LayerDrawable) getBackground();
        GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
        shape.setColor(color);
    }

    protected int makePressColor() {
        int r = (this.backgroundColor >> 16) & 255;
        int g = (this.backgroundColor >> 8) & 255;
        int b = (this.backgroundColor >> 0) & 255;
        return Color.argb(70, r - 30 < 0 ? 0 : r - 30, g - 30 < 0 ? 0 : g - 30, b - 30 < 0 ? 0 : b - 30);
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        changeBackgroundColor(color);
    }

    public void setChecked(boolean check) {
        invalidate();
        this.check = check;
        setPressed(false);
        changeBackgroundColor(getResources().getColor(android.R.color.transparent));
        if (check) {
            this.step = 0;
        }
        if (check) {
            this.checkView.changeBackground();
        }
    }

    public boolean isCheck() {
        return this.check;
    }

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/CheckBox$Check.class */
    class Check extends View {
        Bitmap sprite;

        public Check(Context context) {
            super(context);
            setBackgroundResource(R.drawable.background_checkbox_uncheck);
            this.sprite = BitmapFactory.decodeResource(context.getResources(), R.drawable.sprite_check);
        }

        public void changeBackground() {
            if (CheckBox.this.check) {
                setBackgroundResource(R.drawable.background_checkbox_check);
                LayerDrawable layer = (LayerDrawable) getBackground();
                GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
                shape.setColor(CheckBox.this.backgroundColor);
                return;
            }
            setBackgroundResource(R.drawable.background_checkbox_uncheck);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (CheckBox.this.check) {
                if (CheckBox.this.step < 11) {
                    CheckBox.this.step++;
                    invalidate();
                }
            } else {
                if (CheckBox.this.step >= 0) {
                    CheckBox.this.step--;
                    invalidate();
                }
                if (CheckBox.this.step == -1) {
                    invalidate();
                    changeBackground();
                }
            }
            Rect src = new Rect(40 * CheckBox.this.step, 0, (40 * CheckBox.this.step) + 40, 40);
            Rect dst = new Rect(0, 0, getWidth() - 2, getHeight());
            canvas.drawBitmap(this.sprite, src, dst, (Paint) null);
        }
    }

    public void setOncheckListener(OnCheckListener onCheckListener) {
        this.onCheckListener = onCheckListener;
    }
}
