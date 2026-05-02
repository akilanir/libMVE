package com.cocosw.bottomsheet;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/FillerView.class */
class FillerView extends LinearLayout {
    private View mMeasureTarget;

    public FillerView(Context context) {
        super(context);
    }

    public void setMeasureTarget(View lastViewSeen) {
        this.mMeasureTarget = lastViewSeen;
    }

    public FillerView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (null != this.mMeasureTarget) {
            heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mMeasureTarget.getMeasuredHeight(), 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
