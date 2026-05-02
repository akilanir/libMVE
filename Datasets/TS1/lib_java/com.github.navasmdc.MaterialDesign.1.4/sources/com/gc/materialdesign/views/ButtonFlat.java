package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ButtonFlat.class */
public class ButtonFlat extends Button {
    TextView textButton;

    public ButtonFlat(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setDefaultProperties() {
        this.minHeight = 36;
        this.minWidth = 88;
        this.rippleSize = 3;
        setMinimumHeight(Utils.dpToPx(this.minHeight, getResources()));
        setMinimumWidth(Utils.dpToPx(this.minWidth, getResources()));
        setBackgroundResource(R.drawable.background_transparent);
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setAttributes(AttributeSet attrs) {
        String text;
        int textResource = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "text", -1);
        if (textResource != -1) {
            text = getResources().getString(textResource);
        } else {
            text = attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "text");
        }
        if (text != null) {
            this.textButton = new TextView(getContext());
            this.textButton.setText(text.toUpperCase());
            this.textButton.setTextColor(this.backgroundColor);
            this.textButton.setTypeface(null, 1);
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -2);
            params.addRule(13, -1);
            this.textButton.setLayoutParams(params);
            addView(this.textButton);
        }
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
            return;
        }
        this.background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (this.background != -1) {
            setBackgroundColor(this.background);
        }
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.x != -1.0f) {
            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(makePressColor());
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
            invalidate();
        }
    }

    @Override // com.gc.materialdesign.views.Button
    protected int makePressColor() {
        return Color.parseColor("#88DDDDDD");
    }

    public void setText(String text) {
        this.textButton.setText(text.toUpperCase());
    }

    @Override // com.gc.materialdesign.views.Button, android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        this.textButton.setTextColor(color);
    }

    @Override // com.gc.materialdesign.views.Button
    public TextView getTextView() {
        return this.textButton;
    }

    public String getText() {
        return this.textButton.getText().toString();
    }
}
