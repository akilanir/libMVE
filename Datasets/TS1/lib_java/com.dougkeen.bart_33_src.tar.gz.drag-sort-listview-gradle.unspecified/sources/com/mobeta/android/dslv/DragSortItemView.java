package com.mobeta.android.dslv;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;

/* loaded from: com.dougkeen.bart_33_src.tar.gz.drag-sort-listview-gradle.unspecified.jar:com/mobeta/android/dslv/DragSortItemView.class */
public class DragSortItemView extends ViewGroup {
    private int mGravity;

    public DragSortItemView(Context context) {
        super(context);
        this.mGravity = 48;
        setLayoutParams(new AbsListView.LayoutParams(-1, -2));
    }

    public void setGravity(int gravity) {
        this.mGravity = gravity;
    }

    public int getGravity() {
        return this.mGravity;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        View child = getChildAt(0);
        if (child == null) {
            return;
        }
        if (this.mGravity == 48) {
            child.layout(0, 0, getMeasuredWidth(), child.getMeasuredHeight());
        } else {
            child.layout(0, getMeasuredHeight() - child.getMeasuredHeight(), getMeasuredWidth(), getMeasuredHeight());
        }
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int height = View.MeasureSpec.getSize(heightMeasureSpec);
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        View child = getChildAt(0);
        if (child == null) {
            setMeasuredDimension(0, width);
            return;
        }
        if (child.isLayoutRequested()) {
            measureChild(child, widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(0, 0));
        }
        if (heightMode == 0) {
            ViewGroup.LayoutParams lp = getLayoutParams();
            if (lp.height > 0) {
                height = lp.height;
            } else {
                height = child.getMeasuredHeight();
            }
        }
        setMeasuredDimension(width, height);
    }
}
