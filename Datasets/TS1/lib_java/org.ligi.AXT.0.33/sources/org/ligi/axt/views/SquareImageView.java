package org.ligi.axt.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/views/SquareImageView.class */
public class SquareImageView extends ImageView {
    public SquareImageView(Context context) {
        super(context);
    }

    public SquareImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int parentWidth = View.MeasureSpec.getSize(widthMeasureSpec);
        int parentHeight = View.MeasureSpec.getSize(heightMeasureSpec);
        int size = Math.min(parentWidth, parentHeight);
        setMeasuredDimension(size, size);
    }
}
