package com.nirhart.parallaxscroll.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AbsListView;
import android.widget.ListView;

/* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxListView.class */
public class ParallaxListView extends ListView {
    private ParallaxListViewHelper helper;

    public ParallaxListView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(context, attrs);
    }

    public ParallaxListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    protected void init(Context context, AttributeSet attrs) {
        this.helper = new ParallaxListViewHelper(context, attrs, this);
        super.setOnScrollListener(this.helper);
    }

    @Override // android.widget.AbsListView
    public void setOnScrollListener(AbsListView.OnScrollListener l) {
        this.helper.setOnScrollListener(l);
    }

    public void addParallaxedHeaderView(View v) {
        super.addHeaderView(v);
        this.helper.addParallaxedHeaderView(v);
    }

    public void addParallaxedHeaderView(View v, Object data, boolean isSelectable) {
        super.addHeaderView(v, data, isSelectable);
        this.helper.addParallaxedHeaderView(v, data, isSelectable);
    }
}
