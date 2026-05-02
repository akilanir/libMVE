package com.mikepenz.materialdrawer.model.interfaces;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/IDrawerItem.class */
public interface IDrawerItem<T> extends Identifyable<T> {
    Object getTag();

    boolean isEnabled();

    boolean isSelected();

    T withSetSelected(boolean z);

    boolean isSelectable();

    T withSelectable(boolean z);

    String getType();

    int getLayoutRes();

    View generateView(Context context);

    View generateView(Context context, ViewGroup viewGroup);

    RecyclerView.ViewHolder getViewHolder(ViewGroup viewGroup);

    void bindView(RecyclerView.ViewHolder viewHolder);

    boolean equals(Integer num);

    boolean equals(Object obj);
}
