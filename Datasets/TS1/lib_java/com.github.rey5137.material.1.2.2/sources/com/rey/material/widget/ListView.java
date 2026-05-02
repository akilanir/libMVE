package com.rey.material.widget;

import android.content.Context;
import android.support.v7.widget.ListViewCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AbsListView;
import com.rey.material.app.ThemeManager;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ListView.class */
public class ListView extends ListViewCompat implements ThemeManager.OnThemeChangedListener {
    private AbsListView.RecyclerListener mRecyclerListener;
    protected int mStyleId;
    protected int mCurrentStyle;

    public ListView(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, null, 0, 0);
    }

    public ListView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, 0, 0);
    }

    public ListView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, 0);
    }

    public ListView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.setRecyclerListener(new AbsListView.RecyclerListener() { // from class: com.rey.material.widget.ListView.1
            @Override // android.widget.AbsListView.RecyclerListener
            public void onMovedToScrapHeap(View view) {
                RippleManager.cancelRipple(view);
                if (ListView.this.mRecyclerListener != null) {
                    ListView.this.mRecyclerListener.onMovedToScrapHeap(view);
                }
            }
        });
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            onThemeChanged(null);
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    public void setRecyclerListener(AbsListView.RecyclerListener listener) {
        this.mRecyclerListener = listener;
    }
}
