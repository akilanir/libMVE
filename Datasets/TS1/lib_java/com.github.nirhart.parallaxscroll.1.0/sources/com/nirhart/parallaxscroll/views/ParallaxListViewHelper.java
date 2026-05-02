package com.nirhart.parallaxscroll.views;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.TranslateAnimation;
import android.widget.AbsListView;
import android.widget.ListView;
import com.nirhart.parallaxscroll.R;

/* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxListViewHelper.class */
public class ParallaxListViewHelper implements AbsListView.OnScrollListener {
    private static final float DEFAULT_ALPHA_FACTOR = -1.0f;
    private static final float DEFAULT_PARALLAX_FACTOR = 1.9f;
    private static final boolean DEFAULT_IS_CIRCULAR = false;
    private ParallaxedView parallaxedView;
    private boolean isCircular;
    private ListView listView;
    private float parallaxFactor = DEFAULT_PARALLAX_FACTOR;
    private float alphaFactor = DEFAULT_ALPHA_FACTOR;
    private AbsListView.OnScrollListener listener = null;

    protected ParallaxListViewHelper(Context context, AttributeSet attrs, ListView listView) {
        init(context, attrs, listView);
    }

    protected void init(Context context, AttributeSet attrs, ListView listView) {
        this.listView = listView;
        TypedArray typeArray = context.obtainStyledAttributes(attrs, R.styleable.ParallaxScroll);
        this.parallaxFactor = typeArray.getFloat(0, DEFAULT_PARALLAX_FACTOR);
        this.alphaFactor = typeArray.getFloat(1, DEFAULT_ALPHA_FACTOR);
        this.isCircular = typeArray.getBoolean(4, false);
        typeArray.recycle();
    }

    protected void setOnScrollListener(AbsListView.OnScrollListener l) {
        this.listener = l;
    }

    protected void addParallaxedHeaderView(View v) {
        addParallaxedView(v);
    }

    protected void addParallaxedHeaderView(View v, Object data, boolean isSelectable) {
        addParallaxedView(v);
    }

    protected void addParallaxedView(View v) {
        this.parallaxedView = new ListViewParallaxedItem(v);
    }

    protected void parallaxScroll() {
        if (this.isCircular) {
            circularParallax();
        } else {
            headerParallax();
        }
    }

    private void circularParallax() {
        int top;
        if (this.listView.getChildCount() > 0 && (top = -this.listView.getChildAt(0).getTop()) >= 0) {
            fillParallaxedViews();
            setFilters(top);
        }
    }

    private void headerParallax() {
        int top;
        if (this.parallaxedView != null && this.listView.getChildCount() > 0 && (top = -this.listView.getChildAt(0).getTop()) >= 0) {
            setFilters(top);
        }
    }

    private void setFilters(int top) {
        this.parallaxedView.setOffset(top / this.parallaxFactor);
        if (this.alphaFactor != DEFAULT_ALPHA_FACTOR) {
            float alpha = top <= 0 ? 1.0f : 100.0f / (top * this.alphaFactor);
            this.parallaxedView.setAlpha(alpha);
        }
        this.parallaxedView.animateNow();
    }

    private void fillParallaxedViews() {
        if (this.parallaxedView == null || !this.parallaxedView.is(this.listView.getChildAt(0))) {
            if (this.parallaxedView != null) {
                resetFilters();
                this.parallaxedView.setView(this.listView.getChildAt(0));
            } else {
                this.parallaxedView = new ListViewParallaxedItem(this.listView.getChildAt(0));
            }
        }
    }

    private void resetFilters() {
        this.parallaxedView.setOffset(0.0f);
        if (this.alphaFactor != DEFAULT_ALPHA_FACTOR) {
            this.parallaxedView.setAlpha(1.0f);
        }
        this.parallaxedView.animateNow();
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        parallaxScroll();
        if (this.listener != null) {
            this.listener.onScroll(view, firstVisibleItem, visibleItemCount, totalItemCount);
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        if (this.listener != null) {
            this.listener.onScrollStateChanged(view, scrollState);
        }
    }

    /* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxListViewHelper$ListViewParallaxedItem.class */
    protected class ListViewParallaxedItem extends ParallaxedView {
        public ListViewParallaxedItem(View view) {
            super(view);
        }

        @Override // com.nirhart.parallaxscroll.views.ParallaxedView
        protected void translatePreICS(View view, float offset) {
            addAnimation(new TranslateAnimation(0.0f, 0.0f, offset, offset));
        }
    }
}
