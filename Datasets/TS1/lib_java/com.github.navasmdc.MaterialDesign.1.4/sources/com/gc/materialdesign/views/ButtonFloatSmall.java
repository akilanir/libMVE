package com.gc.materialdesign.views;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ButtonFloatSmall.class */
public class ButtonFloatSmall extends ButtonFloat {
    public ButtonFloatSmall(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.sizeRadius = 20;
        this.sizeIcon = 20;
        setDefaultProperties();
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(Utils.dpToPx(this.sizeIcon, getResources()), Utils.dpToPx(this.sizeIcon, getResources()));
        params.addRule(13, -1);
        this.icon.setLayoutParams(params);
    }

    @Override // com.gc.materialdesign.views.ButtonFloat, com.gc.materialdesign.views.Button
    protected void setDefaultProperties() {
        this.rippleSpeed = Utils.dpToPx(2.0f, getResources());
        this.rippleSize = 10;
        setMinimumHeight(Utils.dpToPx(this.sizeRadius * 2, getResources()));
        setMinimumWidth(Utils.dpToPx(this.sizeRadius * 2, getResources()));
        setBackgroundResource(R.drawable.background_button_float);
    }
}
