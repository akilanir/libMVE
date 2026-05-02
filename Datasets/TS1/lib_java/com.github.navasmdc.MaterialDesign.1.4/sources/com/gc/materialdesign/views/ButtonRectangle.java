package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ButtonRectangle.class */
public class ButtonRectangle extends Button {
    TextView textButton;
    int paddingTop;
    int paddingBottom;
    int paddingLeft;
    int paddingRight;
    Integer height;
    Integer width;

    public ButtonRectangle(Context context, AttributeSet attrs) {
        super(context, attrs);
        setDefaultProperties();
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setDefaultProperties() {
        this.minWidth = 80;
        this.minHeight = 36;
        this.background = R.drawable.background_button_rectangle;
        super.setDefaultProperties();
    }

    @Override // com.gc.materialdesign.views.Button
    protected void setAttributes(AttributeSet attrs) {
        String text;
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            this.background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (this.background != -1) {
                setBackgroundColor(this.background);
            }
        }
        attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "padding");
        int textResource = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "text", -1);
        if (textResource != -1) {
            text = getResources().getString(textResource);
        } else {
            text = attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "text");
        }
        if (text != null) {
            this.textButton = new TextView(getContext());
            this.textButton.setText(text);
            this.textButton.setTextColor(-1);
            this.textButton.setTypeface(null, 1);
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -2);
            params.addRule(13, -1);
            params.setMargins(Utils.dpToPx(5.0f, getResources()), Utils.dpToPx(5.0f, getResources()), Utils.dpToPx(5.0f, getResources()), Utils.dpToPx(5.0f, getResources()));
            this.textButton.setLayoutParams(params);
            addView(this.textButton);
        }
        this.rippleSpeed = attrs.getAttributeFloatValue("http://schemas.android.com/apk/res-auto", "rippleSpeed", Utils.dpToPx(6.0f, getResources()));
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.x != -1.0f) {
            Rect src = new Rect(0, 0, getWidth() - Utils.dpToPx(6.0f, getResources()), getHeight() - Utils.dpToPx(7.0f, getResources()));
            Rect dst = new Rect(Utils.dpToPx(6.0f, getResources()), Utils.dpToPx(6.0f, getResources()), getWidth() - Utils.dpToPx(6.0f, getResources()), getHeight() - Utils.dpToPx(7.0f, getResources()));
            canvas.drawBitmap(makeCircle(), src, dst, (Paint) null);
            invalidate();
        }
    }

    public void setText(String text) {
        this.textButton.setText(text);
    }

    public void setTextColor(int color) {
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
