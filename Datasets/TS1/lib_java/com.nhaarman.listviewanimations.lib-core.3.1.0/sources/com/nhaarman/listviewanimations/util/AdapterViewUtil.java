package com.nhaarman.listviewanimations.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.AbsListView;
import android.widget.ListView;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/util/AdapterViewUtil.class */
public class AdapterViewUtil {
    private AdapterViewUtil() {
    }

    public static int getPositionForView(@NonNull ListViewWrapper listViewWrapper, @NonNull View view) {
        return listViewWrapper.getPositionForView(view) - listViewWrapper.getHeaderViewsCount();
    }

    public static int getPositionForView(@NonNull AbsListView absListView, @NonNull View view) {
        int position = absListView.getPositionForView(view);
        if (absListView instanceof ListView) {
            position -= ((ListView) absListView).getHeaderViewsCount();
        }
        return position;
    }

    @Nullable
    public static View getViewForPosition(@NonNull ListViewWrapper listViewWrapper, int position) {
        int childCount = listViewWrapper.getChildCount();
        View downView = null;
        for (int i = 0; i < childCount && downView == null; i++) {
            View child = listViewWrapper.getChildAt(i);
            if (child != null && getPositionForView(listViewWrapper, child) == position) {
                downView = child;
            }
        }
        return downView;
    }

    @Nullable
    public static View getViewForPosition(@NonNull AbsListView absListView, int position) {
        int childCount = absListView.getChildCount();
        View downView = null;
        for (int i = 0; i < childCount && downView == null; i++) {
            View child = absListView.getChildAt(i);
            if (child != null && getPositionForView(absListView, child) == position) {
                downView = child;
            }
        }
        return downView;
    }
}
