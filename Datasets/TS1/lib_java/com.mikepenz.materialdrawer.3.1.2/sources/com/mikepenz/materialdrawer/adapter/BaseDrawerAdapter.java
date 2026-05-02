package com.mikepenz.materialdrawer.adapter;

import android.widget.BaseAdapter;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/adapter/BaseDrawerAdapter.class */
public abstract class BaseDrawerAdapter extends BaseAdapter {
    public abstract ArrayList<IDrawerItem> getDrawerItems();

    public abstract void setDrawerItems(ArrayList<IDrawerItem> arrayList);

    public abstract LinkedHashSet<String> getTypeMapper();

    public abstract void setTypeMapper(LinkedHashSet<String> linkedHashSet);

    public abstract void resetAnimation();

    public void dataUpdated() {
        mapTypes();
        notifyDataSetChanged();
    }

    public void mapTypes() {
        if (getTypeMapper() == null) {
            setTypeMapper(new LinkedHashSet<>());
        }
        if (getDrawerItems() != null) {
            Iterator<IDrawerItem> it = getDrawerItems().iterator();
            while (it.hasNext()) {
                IDrawerItem drawerItem = it.next();
                getTypeMapper().add(drawerItem.getType());
            }
        }
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getItemViewType(int position) {
        if (getDrawerItems() != null && getDrawerItems().size() > position && getTypeMapper() != null) {
            int i = 0;
            Iterator<String> it = getTypeMapper().iterator();
            while (it.hasNext()) {
                String type = it.next();
                if (type.equals(getDrawerItems().get(position).getType())) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        return -1;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public int getViewTypeCount() {
        return 50;
    }
}
