package com.mikepenz.materialdrawer.adapter;

import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import java.util.ArrayList;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/adapter/DrawerAdapter.class */
public class DrawerAdapter extends BaseDrawerAdapter {
    public DrawerAdapter() {
    }

    public DrawerAdapter(ArrayList<IDrawerItem> drawerItems) {
        setDrawerItems(drawerItems);
    }
}
