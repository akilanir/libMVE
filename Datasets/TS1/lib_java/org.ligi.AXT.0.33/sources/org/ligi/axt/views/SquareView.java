package org.ligi.axt.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/views/SquareView.class */
public class SquareView extends View {
    public SquareView(Context context) {
        super(context);
    }

    public SquareView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int parentWidth = View.MeasureSpec.getSize(widthMeasureSpec);
        int parentHeight = View.MeasureSpec.getSize(heightMeasureSpec);
        int size = Math.min(parentWidth, parentHeight);
        setMeasuredDimension(size, size);
    }
}
