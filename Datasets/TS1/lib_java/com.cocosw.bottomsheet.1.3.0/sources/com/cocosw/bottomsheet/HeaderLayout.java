package com.cocosw.bottomsheet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/HeaderLayout.class */
class HeaderLayout extends FrameLayout {
    private int mHeaderWidth;

    public HeaderLayout(Context context) {
        super(context);
        this.mHeaderWidth = 1;
    }

    public HeaderLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mHeaderWidth = 1;
    }

    public HeaderLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mHeaderWidth = 1;
    }

    public void setHeaderWidth(int width) {
        this.mHeaderWidth = width;
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMeasureSpecNew = this.mHeaderWidth == 1 ? widthMeasureSpec : View.MeasureSpec.makeMeasureSpec(this.mHeaderWidth, View.MeasureSpec.getMode(widthMeasureSpec));
        super.onMeasure(widthMeasureSpecNew, heightMeasureSpec);
    }
}
