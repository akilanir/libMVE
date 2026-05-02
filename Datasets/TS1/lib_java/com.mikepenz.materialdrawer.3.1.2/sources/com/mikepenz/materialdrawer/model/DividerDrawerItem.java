package com.mikepenz.materialdrawer.model;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/DividerDrawerItem.class */
public class DividerDrawerItem implements IDrawerItem {
    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public int getIdentifier() {
        return -1;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Tagable
    public Object getTag() {
        return null;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isEnabled() {
        return false;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "DIVIDER_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_divider;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View convertView(LayoutInflater inflater, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;
        if (convertView == null) {
            convertView = inflater.inflate(getLayoutRes(), parent, false);
            viewHolder = new ViewHolder(convertView);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        viewHolder.view.setClickable(false);
        viewHolder.view.setEnabled(false);
        viewHolder.view.setMinimumHeight(1);
        viewHolder.divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(parent.getContext(), R.attr.material_drawer_divider, R.color.material_drawer_divider));
        return convertView;
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private View divider;

        private ViewHolder(View view) {
            this.view = view;
            this.divider = view.findViewById(R.id.divider);
        }
    }
}
