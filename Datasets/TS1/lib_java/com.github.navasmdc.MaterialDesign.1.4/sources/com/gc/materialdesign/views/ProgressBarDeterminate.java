package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RelativeLayout;
import com.gc.materialdesign.R;
import com.gc.materialdesign.utils.Utils;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ProgressBarDeterminate.class */
public class ProgressBarDeterminate extends CustomView {
    int max;
    int min;
    int progress;
    int backgroundColor;
    View progressView;
    int pendindProgress;

    public ProgressBarDeterminate(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.max = 100;
        this.min = 0;
        this.progress = 0;
        this.backgroundColor = Color.parseColor("#1E88E5");
        this.pendindProgress = -1;
        setAttributes(attrs);
    }

    protected void setAttributes(AttributeSet attrs) {
        this.progressView = new View(getContext());
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(1, 1);
        this.progressView.setLayoutParams(params);
        this.progressView.setBackgroundResource(R.drawable.background_progress);
        addView(this.progressView);
        int bacgroundColor = attrs.getAttributeResourceValue("http://schemas.android.com/apk/res/android", "background", -1);
        if (bacgroundColor != -1) {
            setBackgroundColor(getResources().getColor(bacgroundColor));
        } else {
            int background = attrs.getAttributeIntValue("http://schemas.android.com/apk/res/android", "background", -1);
            if (background != -1) {
                setBackgroundColor(background);
            } else {
                setBackgroundColor(Color.parseColor("#1E88E5"));
            }
        }
        this.min = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "min", 0);
        this.max = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "max", 100);
        this.progress = attrs.getAttributeIntValue("http://schemas.android.com/apk/res-auto", "progress", this.min);
        setMinimumHeight(Utils.dpToPx(3.0f, getResources()));
        post(new Runnable() { // from class: com.gc.materialdesign.views.ProgressBarDeterminate.1
            @Override // java.lang.Runnable
            public void run() {
                RelativeLayout.LayoutParams params2 = (RelativeLayout.LayoutParams) ProgressBarDeterminate.this.progressView.getLayoutParams();
                params2.height = ProgressBarDeterminate.this.getHeight();
                ProgressBarDeterminate.this.progressView.setLayoutParams(params2);
            }
        });
    }

    protected int makePressColor() {
        int r = (this.backgroundColor >> 16) & 255;
        int g = (this.backgroundColor >> 8) & 255;
        int b = (this.backgroundColor >> 0) & 255;
        return Color.argb(128, r, g, b);
    }

    @Override // com.gc.materialdesign.views.CustomView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.pendindProgress != -1) {
            setProgress(this.pendindProgress);
        }
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public void setProgress(int progress) {
        if (getWidth() == 0) {
            this.pendindProgress = progress;
            return;
        }
        this.progress = progress;
        if (progress > this.max) {
            progress = this.max;
        }
        if (progress < this.min) {
            progress = this.min;
        }
        int totalWidth = this.max - this.min;
        double progressPercent = progress / totalWidth;
        int progressWidth = (int) (getWidth() * progressPercent);
        RelativeLayout.LayoutParams params = (RelativeLayout.LayoutParams) this.progressView.getLayoutParams();
        params.width = progressWidth;
        params.height = getHeight();
        this.progressView.setLayoutParams(params);
        this.pendindProgress = -1;
    }

    public int getProgress() {
        return this.progress;
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.backgroundColor = color;
        if (isEnabled()) {
            this.beforeBackground = this.backgroundColor;
        }
        LayerDrawable layer = (LayerDrawable) this.progressView.getBackground();
        GradientDrawable shape = (GradientDrawable) layer.findDrawableByLayerId(R.id.shape_bacground);
        shape.setColor(color);
        super.setBackgroundColor(makePressColor());
    }
}
