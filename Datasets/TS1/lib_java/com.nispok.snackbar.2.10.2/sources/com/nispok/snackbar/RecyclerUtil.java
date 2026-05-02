package com.nispok.snackbar;

import android.support.v7.widget.RecyclerView;
import android.view.View;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/RecyclerUtil.class */
class RecyclerUtil {
    RecyclerUtil() {
    }

    static void setScrollListener(final Snackbar snackbar, View view) {
        RecyclerView recyclerView = (RecyclerView) view;
        recyclerView.setOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.nispok.snackbar.RecyclerUtil.1
            public void onScrollStateChanged(RecyclerView recyclerView2, int newState) {
                super.onScrollStateChanged(recyclerView2, newState);
                snackbar.dismiss();
            }
        });
    }
}
