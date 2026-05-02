package com.melnykov.fab;

import android.widget.ScrollView;
import com.melnykov.fab.ObservableScrollView;

/* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/ScrollViewScrollDetector.class */
abstract class ScrollViewScrollDetector implements ObservableScrollView.OnScrollChangedListener {
    private int mLastScrollY;
    private int mScrollThreshold;

    abstract void onScrollUp();

    abstract void onScrollDown();

    ScrollViewScrollDetector() {
    }

    @Override // com.melnykov.fab.ObservableScrollView.OnScrollChangedListener
    public void onScrollChanged(ScrollView who, int l, int t, int oldl, int oldt) {
        boolean isSignificantDelta = Math.abs(t - this.mLastScrollY) > this.mScrollThreshold;
        if (isSignificantDelta) {
            if (t > this.mLastScrollY) {
                onScrollUp();
            } else {
                onScrollDown();
            }
        }
        this.mLastScrollY = t;
    }

    public void setScrollThreshold(int scrollThreshold) {
        this.mScrollThreshold = scrollThreshold;
    }
}
