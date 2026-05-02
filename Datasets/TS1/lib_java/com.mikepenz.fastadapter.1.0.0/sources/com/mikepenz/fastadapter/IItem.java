package com.mikepenz.fastadapter;

import android.content.Context;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/IItem.class */
public interface IItem<T, VH extends RecyclerView.ViewHolder> extends IIdentifyable<T> {
    Object getTag();

    T withTag(Object obj);

    boolean isEnabled();

    T withEnabled(boolean z);

    boolean isSelected();

    T withSetSelected(boolean z);

    boolean isSelectable();

    T withSelectable(boolean z);

    @IdRes
    int getType();

    @LayoutRes
    int getLayoutRes();

    View generateView(Context context);

    View generateView(Context context, ViewGroup viewGroup);

    VH getViewHolder(ViewGroup viewGroup);

    void bindView(VH vh);

    boolean equals(int i);
}
