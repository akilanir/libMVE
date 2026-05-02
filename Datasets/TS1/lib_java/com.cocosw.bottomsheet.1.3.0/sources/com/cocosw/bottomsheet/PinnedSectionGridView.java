package com.cocosw.bottomsheet;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.GridView;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/PinnedSectionGridView.class */
class PinnedSectionGridView extends GridView {
    private int mNumColumns;
    private int mHorizontalSpacing;
    private int mColumnWidth;
    private int mAvailableWidth;

    public PinnedSectionGridView(Context context) {
        super(context);
    }

    public PinnedSectionGridView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PinnedSectionGridView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.widget.GridView
    public int getNumColumns() {
        return this.mNumColumns;
    }

    @Override // android.widget.GridView
    public void setNumColumns(int numColumns) {
        this.mNumColumns = numColumns;
        super.setNumColumns(numColumns);
    }

    @Override // android.widget.GridView
    public int getHorizontalSpacing() {
        return this.mHorizontalSpacing;
    }

    @Override // android.widget.GridView
    public void setHorizontalSpacing(int horizontalSpacing) {
        this.mHorizontalSpacing = horizontalSpacing;
        super.setHorizontalSpacing(horizontalSpacing);
    }

    @Override // android.widget.GridView
    public int getColumnWidth() {
        return this.mColumnWidth;
    }

    @Override // android.widget.GridView
    public void setColumnWidth(int columnWidth) {
        this.mColumnWidth = columnWidth;
        super.setColumnWidth(columnWidth);
    }

    public int getAvailableWidth() {
        return this.mAvailableWidth != 0 ? this.mAvailableWidth : getWidth();
    }
}
