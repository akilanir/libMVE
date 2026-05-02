package com.nhaarman.listviewanimations.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/util/ListViewWrapper.class */
public interface ListViewWrapper {
    @NonNull
    ViewGroup getListView();

    @Nullable
    View getChildAt(int i);

    int getFirstVisiblePosition();

    int getLastVisiblePosition();

    int getCount();

    int getChildCount();

    int getHeaderViewsCount();

    int getPositionForView(@NonNull View view);

    @Nullable
    ListAdapter getAdapter();

    void smoothScrollBy(int i, int i2);
}
