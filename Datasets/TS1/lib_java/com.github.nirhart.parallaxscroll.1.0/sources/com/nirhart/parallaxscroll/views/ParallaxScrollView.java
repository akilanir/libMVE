package com.nirhart.parallaxscroll.views;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import com.nirhart.parallaxscroll.R;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxScrollView.class */
public class ParallaxScrollView extends ScrollView {
    private static final int DEFAULT_PARALLAX_VIEWS = 1;
    private static final float DEFAULT_INNER_PARALLAX_FACTOR = 1.9f;
    private static final float DEFAULT_PARALLAX_FACTOR = 1.9f;
    private static final float DEFAULT_ALPHA_FACTOR = -1.0f;
    private int numOfParallaxViews;
    private float innerParallaxFactor;
    private float parallaxFactor;
    private float alphaFactor;
    private ArrayList<ParallaxedView> parallaxedViews;

    public ParallaxScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.numOfParallaxViews = 1;
        this.innerParallaxFactor = 1.9f;
        this.parallaxFactor = 1.9f;
        this.alphaFactor = DEFAULT_ALPHA_FACTOR;
        this.parallaxedViews = new ArrayList<>();
        init(context, attrs);
    }

    public ParallaxScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.numOfParallaxViews = 1;
        this.innerParallaxFactor = 1.9f;
        this.parallaxFactor = 1.9f;
        this.alphaFactor = DEFAULT_ALPHA_FACTOR;
        this.parallaxedViews = new ArrayList<>();
        init(context, attrs);
    }

    public ParallaxScrollView(Context context) {
        super(context);
        this.numOfParallaxViews = 1;
        this.innerParallaxFactor = 1.9f;
        this.parallaxFactor = 1.9f;
        this.alphaFactor = DEFAULT_ALPHA_FACTOR;
        this.parallaxedViews = new ArrayList<>();
    }

    protected void init(Context context, AttributeSet attrs) {
        TypedArray typeArray = context.obtainStyledAttributes(attrs, R.styleable.ParallaxScroll);
        this.parallaxFactor = typeArray.getFloat(0, 1.9f);
        this.alphaFactor = typeArray.getFloat(1, DEFAULT_ALPHA_FACTOR);
        this.innerParallaxFactor = typeArray.getFloat(2, 1.9f);
        this.numOfParallaxViews = typeArray.getInt(3, 1);
        typeArray.recycle();
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        makeViewsParallax();
    }

    private void makeViewsParallax() {
        if (getChildCount() > 0 && (getChildAt(0) instanceof ViewGroup)) {
            ViewGroup viewsHolder = (ViewGroup) getChildAt(0);
            int numOfParallaxViews = Math.min(this.numOfParallaxViews, viewsHolder.getChildCount());
            for (int i = 0; i < numOfParallaxViews; i++) {
                ParallaxedView parallaxedView = new ScrollViewParallaxedItem(viewsHolder.getChildAt(i));
                this.parallaxedViews.add(parallaxedView);
            }
        }
    }

    @Override // android.view.View
    protected void onScrollChanged(int l, int t, int oldl, int oldt) {
        super.onScrollChanged(l, t, oldl, oldt);
        float parallax = this.parallaxFactor;
        float alpha = this.alphaFactor;
        Iterator i$ = this.parallaxedViews.iterator();
        while (i$.hasNext()) {
            ParallaxedView parallaxedView = i$.next();
            parallaxedView.setOffset(t / parallax);
            parallax *= this.innerParallaxFactor;
            if (alpha != DEFAULT_ALPHA_FACTOR) {
                float fixedAlpha = t <= 0 ? 1.0f : 100.0f / (t * alpha);
                parallaxedView.setAlpha(fixedAlpha);
                alpha /= this.alphaFactor;
            }
            parallaxedView.animateNow();
        }
    }

    /* loaded from: com.github.nirhart.parallaxscroll.1.0.jar:com/nirhart/parallaxscroll/views/ParallaxScrollView$ScrollViewParallaxedItem.class */
    protected class ScrollViewParallaxedItem extends ParallaxedView {
        public ScrollViewParallaxedItem(View view) {
            super(view);
        }

        @Override // com.nirhart.parallaxscroll.views.ParallaxedView
        protected void translatePreICS(View view, float offset) {
            view.offsetTopAndBottom(((int) offset) - this.lastOffset);
            this.lastOffset = (int) offset;
        }
    }
}
