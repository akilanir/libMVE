package com.nhaarman.listviewanimations.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.AbsListView;
import android.widget.ListAdapter;
import android.widget.ListView;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/util/AbsListViewWrapper.class */
public class AbsListViewWrapper implements ListViewWrapper {

    @NonNull
    private final AbsListView mAbsListView;

    public AbsListViewWrapper(@NonNull AbsListView absListView) {
        this.mAbsListView = absListView;
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    @NonNull
    public AbsListView getListView() {
        return this.mAbsListView;
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    @Nullable
    public View getChildAt(int index) {
        return this.mAbsListView.getChildAt(index);
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getFirstVisiblePosition() {
        return this.mAbsListView.getFirstVisiblePosition();
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getLastVisiblePosition() {
        return this.mAbsListView.getLastVisiblePosition();
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getCount() {
        return this.mAbsListView.getCount();
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getChildCount() {
        return this.mAbsListView.getChildCount();
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getHeaderViewsCount() {
        int result = 0;
        if (this.mAbsListView instanceof ListView) {
            result = ((ListView) this.mAbsListView).getHeaderViewsCount();
        }
        return result;
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public int getPositionForView(@NonNull View view) {
        return this.mAbsListView.getPositionForView(view);
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public ListAdapter getAdapter() {
        return (ListAdapter) this.mAbsListView.getAdapter();
    }

    @Override // com.nhaarman.listviewanimations.util.ListViewWrapper
    public void smoothScrollBy(int distance, int duration) {
        this.mAbsListView.smoothScrollBy(distance, duration);
    }
}
