package com.melnykov.fab;

import android.support.v7.widget.RecyclerView;

/* loaded from: com.melnykov.floatingactionbutton.1.1.0.jar:com/melnykov/fab/RecyclerViewScrollDetector.class */
abstract class RecyclerViewScrollDetector extends RecyclerView.OnScrollListener {
    private int mScrollThreshold;

    abstract void onScrollUp();

    abstract void onScrollDown();

    RecyclerViewScrollDetector() {
    }

    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        boolean isSignificantDelta = Math.abs(dy) > this.mScrollThreshold;
        if (isSignificantDelta) {
            if (dy > 0) {
                onScrollUp();
            } else {
                onScrollDown();
            }
        }
    }

    public void setScrollThreshold(int scrollThreshold) {
        this.mScrollThreshold = scrollThreshold;
    }
}
