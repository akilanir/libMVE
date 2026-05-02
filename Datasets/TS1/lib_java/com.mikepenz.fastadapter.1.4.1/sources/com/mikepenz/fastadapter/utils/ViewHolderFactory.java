package com.mikepenz.fastadapter.utils;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/utils/ViewHolderFactory.class */
public interface ViewHolderFactory<T extends RecyclerView.ViewHolder> {
    T create(View view);
}
