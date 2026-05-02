package com.mikepenz.materialdrawer.model.utils;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/utils/ViewHolderFactory.class */
public interface ViewHolderFactory<T extends RecyclerView.ViewHolder> {
    T factory(View view);
}
