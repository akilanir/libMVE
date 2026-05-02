package com.gc.materialdesign.widgets;

import android.R;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.gc.materialdesign.views.Slider;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/ColorSelector.class */
public class ColorSelector extends android.app.Dialog implements Slider.OnValueChangedListener {
    int color;
    Context context;
    View colorView;
    View view;
    View backView;
    OnColorSelectedListener onColorSelectedListener;
    Slider red;
    Slider green;
    Slider blue;

    /* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/widgets/ColorSelector$OnColorSelectedListener.class */
    public interface OnColorSelectedListener {
        void onColorSelected(int i);
    }

    public ColorSelector(Context context, Integer color, OnColorSelectedListener onColorSelectedListener) {
        super(context, R.style.Theme.Translucent);
        this.color = -16777216;
        this.context = context;
        this.onColorSelectedListener = onColorSelectedListener;
        if (color != null) {
            this.color = color.intValue();
        }
        setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.gc.materialdesign.widgets.ColorSelector.1
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialog) {
                if (ColorSelector.this.onColorSelectedListener != null) {
                    ColorSelector.this.onColorSelectedListener.onColorSelected(ColorSelector.this.color);
                }
            }
        });
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(1);
        super.onCreate(savedInstanceState);
        setContentView(com.gc.materialdesign.R.layout.color_selector);
        this.view = (LinearLayout) findViewById(com.gc.materialdesign.R.id.contentSelector);
        this.backView = (RelativeLayout) findViewById(com.gc.materialdesign.R.id.rootSelector);
        this.backView.setOnTouchListener(new View.OnTouchListener() { // from class: com.gc.materialdesign.widgets.ColorSelector.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                if (event.getX() < ColorSelector.this.view.getLeft() || event.getX() > ColorSelector.this.view.getRight() || event.getY() > ColorSelector.this.view.getBottom() || event.getY() < ColorSelector.this.view.getTop()) {
                    ColorSelector.this.dismiss();
                    return false;
                }
                return false;
            }
        });
        this.colorView = findViewById(com.gc.materialdesign.R.id.viewColor);
        this.colorView.setBackgroundColor(this.color);
        this.colorView.post(new Runnable() { // from class: com.gc.materialdesign.widgets.ColorSelector.3
            @Override // java.lang.Runnable
            public void run() {
                LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) ColorSelector.this.colorView.getLayoutParams();
                params.height = ColorSelector.this.colorView.getWidth();
                ColorSelector.this.colorView.setLayoutParams(params);
            }
        });
        this.red = (Slider) findViewById(com.gc.materialdesign.R.id.red);
        this.green = (Slider) findViewById(com.gc.materialdesign.R.id.green);
        this.blue = (Slider) findViewById(com.gc.materialdesign.R.id.blue);
        int r = (this.color >> 16) & 255;
        int g = (this.color >> 8) & 255;
        int b = (this.color >> 0) & 255;
        this.red.setValue(r);
        this.green.setValue(g);
        this.blue.setValue(b);
        this.red.setOnValueChangedListener(this);
        this.green.setOnValueChangedListener(this);
        this.blue.setOnValueChangedListener(this);
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        this.view.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_show_amination));
        this.backView.startAnimation(AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_show_amin));
    }

    @Override // com.gc.materialdesign.views.Slider.OnValueChangedListener
    public void onValueChanged(int value) {
        this.color = Color.rgb(this.red.getValue(), this.green.getValue(), this.blue.getValue());
        this.colorView.setBackgroundColor(this.color);
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        Animation anim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_main_hide_amination);
        anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.gc.materialdesign.widgets.ColorSelector.4
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                ColorSelector.this.view.post(new Runnable() { // from class: com.gc.materialdesign.widgets.ColorSelector.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ColorSelector.super.dismiss();
                    }
                });
            }
        });
        Animation backAnim = AnimationUtils.loadAnimation(this.context, com.gc.materialdesign.R.anim.dialog_root_hide_amin);
        this.view.startAnimation(anim);
        this.backView.startAnimation(backAnim);
    }
}
