package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.widget.TextView;
import com.gc.materialdesign.R;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/Card.class */
public class Card extends CustomView {
    TextView textButton;
    int paddingTop;
    int paddingBottom;
    int paddingLeft;
    int paddingRight;
    int backgroundColor;

    public Card(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.backgroundColor = Color.parseColor("#FFFFFF");
        setAttributes(attrs);
    }

    protected void setAttributes(AttributeSet attrs) {
        setBackgroundResource(R.drawable.background_button_rectangle);
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
            return;
        }
        String background = attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "background");
        if (background != null) {
            setBackgroundColor(Color.parseColor(background));
        } else {
            setBackgroundColor(this.backgroundColor);
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        LayerDrawable layer = (LayerDrawable) getBackground();
        GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
        shape.setColor(this.backgroundColor);
    }
}
