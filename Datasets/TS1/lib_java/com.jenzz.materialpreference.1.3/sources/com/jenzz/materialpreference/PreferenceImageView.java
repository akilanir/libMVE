package com.jenzz.materialpreference;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

/* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/PreferenceImageView.class */
public class PreferenceImageView extends ImageView {
    private int maxWidth;
    private int maxHeight;

    public PreferenceImageView(Context context) {
        super(context);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
    }

    public PreferenceImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
    }

    public PreferenceImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
    }

    @TargetApi(21)
    public PreferenceImageView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.maxWidth = Integer.MAX_VALUE;
        this.maxHeight = Integer.MAX_VALUE;
    }

    @Override // android.widget.ImageView
    public void setMaxWidth(int maxWidth) {
        super.setMaxWidth(maxWidth);
        this.maxWidth = maxWidth;
    }

    @Override // android.widget.ImageView
    public void setMaxHeight(int maxHeight) {
        super.setMaxHeight(maxHeight);
        this.maxHeight = maxHeight;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        if (widthMode == Integer.MIN_VALUE || widthMode == 0) {
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            if (this.maxWidth != Integer.MAX_VALUE && (this.maxWidth < widthSize || widthMode == 0)) {
                widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.maxWidth, Integer.MIN_VALUE);
            }
        }
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        if (heightMode == Integer.MIN_VALUE || heightMode == 0) {
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            if (this.maxHeight != Integer.MAX_VALUE && (this.maxHeight < heightSize || heightMode == 0)) {
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.maxHeight, Integer.MIN_VALUE);
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
