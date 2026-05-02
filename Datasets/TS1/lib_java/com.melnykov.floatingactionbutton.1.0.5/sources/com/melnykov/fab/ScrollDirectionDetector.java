package com.melnykov.fab;

import android.view.View;
import android.widget.AbsListView;

/* loaded from: com.melnykov.floatingactionbutton.1.0.5.jar:com/melnykov/fab/ScrollDirectionDetector.class */
public abstract class ScrollDirectionDetector implements AbsListView.OnScrollListener {
    private ScrollDirectionListener mScrollDirectionListener;
    private int mPreviousScrollY;
    private int mPreviousFirstVisibleItem;
    public int mLastChangeY;
    private AbsListView mListView;
    private int mMinSignificantScroll;

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        this.mMinSignificantScroll = view.getContext().getResources().getDimensionPixelOffset(R.dimen.fab_min_significant_scroll);
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        int newScrollY = estimateScrollY();
        if (this.mScrollDirectionListener != null && isSameRow(firstVisibleItem) && isSignificantDelta(newScrollY)) {
            if (isScrollUp(newScrollY)) {
                this.mScrollDirectionListener.onScrollUp();
            } else {
                this.mScrollDirectionListener.onScrollDown();
            }
        }
    }

    public ScrollDirectionListener getScrollDirectionListener() {
        return this.mScrollDirectionListener;
    }

    public void setScrollDirectionListener(ScrollDirectionListener mScrollDirectionListener) {
        this.mScrollDirectionListener = mScrollDirectionListener;
    }

    private boolean isScrollUp(int newScrollY) {
        boolean scrollUp = newScrollY > this.mPreviousScrollY;
        this.mPreviousScrollY = newScrollY;
        return scrollUp;
    }

    private boolean isSignificantDelta(int newScrollY) {
        boolean isSignificantDelta = Math.abs(this.mLastChangeY - newScrollY) > this.mMinSignificantScroll;
        if (isSignificantDelta) {
            this.mLastChangeY = newScrollY;
        }
        return isSignificantDelta;
    }

    private boolean isSameRow(int firstVisibleItem) {
        boolean rowsChanged = firstVisibleItem == this.mPreviousFirstVisibleItem;
        this.mPreviousFirstVisibleItem = firstVisibleItem;
        return rowsChanged;
    }

    private int estimateScrollY() {
        if (this.mListView == null || this.mListView.getChildAt(0) == null) {
            return 0;
        }
        View topChild = this.mListView.getChildAt(0);
        return (this.mListView.getFirstVisiblePosition() * topChild.getHeight()) - topChild.getTop();
    }

    public void setListView(AbsListView listView) {
        this.mListView = listView;
    }
}
