package com.mikepenz.materialdrawer.model.interfaces;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/IDrawerItem.class */
public interface IDrawerItem {
    int getIdentifier();

    Object getTag();

    boolean isEnabled();

    String getType();

    int getLayoutRes();

    View convertView(LayoutInflater layoutInflater, View view, ViewGroup viewGroup);
}
