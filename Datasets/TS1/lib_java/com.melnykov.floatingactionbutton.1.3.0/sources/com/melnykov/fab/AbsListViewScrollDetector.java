package com.melnykov.fab;

import android.support.annotation.NonNull;
import android.view.View;
import android.widget.AbsListView;

/* loaded from: com.melnykov.floatingactionbutton.1.3.0.jar:com/melnykov/fab/AbsListViewScrollDetector.class */
abstract class AbsListViewScrollDetector implements AbsListView.OnScrollListener {
    private int mLastScrollY;
    private int mPreviousFirstVisibleItem;
    private AbsListView mListView;
    private int mScrollThreshold;

    abstract void onScrollUp();

    abstract void onScrollDown();

    AbsListViewScrollDetector() {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        if (totalItemCount == 0) {
            return;
        }
        if (isSameRow(firstVisibleItem)) {
            int newScrollY = getTopItemScrollY();
            boolean isSignificantDelta = Math.abs(this.mLastScrollY - newScrollY) > this.mScrollThreshold;
            if (isSignificantDelta) {
                if (this.mLastScrollY > newScrollY) {
                    onScrollUp();
                } else {
                    onScrollDown();
                }
            }
            this.mLastScrollY = newScrollY;
            return;
        }
        if (firstVisibleItem > this.mPreviousFirstVisibleItem) {
            onScrollUp();
        } else {
            onScrollDown();
        }
        this.mLastScrollY = getTopItemScrollY();
        this.mPreviousFirstVisibleItem = firstVisibleItem;
    }

    public void setScrollThreshold(int scrollThreshold) {
        this.mScrollThreshold = scrollThreshold;
    }

    public void setListView(@NonNull AbsListView listView) {
        this.mListView = listView;
    }

    private boolean isSameRow(int firstVisibleItem) {
        return firstVisibleItem == this.mPreviousFirstVisibleItem;
    }

    private int getTopItemScrollY() {
        if (this.mListView == null || this.mListView.getChildAt(0) == null) {
            return 0;
        }
        View topChild = this.mListView.getChildAt(0);
        return topChild.getTop();
    }
}
