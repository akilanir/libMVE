package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SectionDrawerItem.class */
public class SectionDrawerItem implements IDrawerItem, Nameable<SectionDrawerItem>, Tagable<SectionDrawerItem>, Typefaceable<SectionDrawerItem> {
    private String name;
    private Object tag;
    private int identifier = -1;
    private int nameRes = -1;
    private boolean divider = true;
    private int textColor = 0;
    private int textColorRes = -1;
    private Typeface typeface = null;

    public SectionDrawerItem withIdentifier(int identifier) {
        this.identifier = identifier;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public SectionDrawerItem withName(String name) {
        this.name = name;
        this.nameRes = -1;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public SectionDrawerItem withName(int nameRes) {
        this.nameRes = nameRes;
        this.name = null;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public SectionDrawerItem withTag(Object object) {
        this.tag = object;
        return this;
    }

    public SectionDrawerItem setDivider(boolean divider) {
        this.divider = divider;
        return this;
    }

    public SectionDrawerItem withTextColor(int textColor) {
        this.textColor = textColor;
        return this;
    }

    public SectionDrawerItem withTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public SectionDrawerItem withTypeface(Typeface typeface) {
        this.typeface = typeface;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Tagable
    public Object getTag() {
        return this.tag;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public void setTag(Object tag) {
        this.tag = tag;
    }

    public boolean hasDivider() {
        return this.divider;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public String getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public int getNameRes() {
        return this.nameRes;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public void setName(String name) {
        this.name = name;
        this.nameRes = -1;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public void setNameRes(int nameRes) {
        this.nameRes = nameRes;
        this.name = null;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public int getIdentifier() {
        return this.identifier;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isEnabled() {
        return false;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "SECTION_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_section;
    }

    public int getTextColor() {
        return this.textColor;
    }

    public void setTextColor(int textColor) {
        this.textColor = textColor;
    }

    public int getTextColorRes() {
        return this.textColorRes;
    }

    public void setTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public void setTypeface(Typeface typeface) {
        this.typeface = typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View convertView(LayoutInflater inflater, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;
        Context ctx = parent.getContext();
        if (convertView == null) {
            convertView = inflater.inflate(getLayoutRes(), parent, false);
            viewHolder = new ViewHolder(convertView);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        viewHolder.view.setClickable(false);
        viewHolder.view.setEnabled(false);
        this.textColor = UIUtils.decideColor(ctx, getTextColor(), getTextColorRes(), R.attr.material_drawer_secondary_text, R.color.material_drawer_secondary_text);
        viewHolder.name.setTextColor(this.textColor);
        if (getNameRes() != -1) {
            viewHolder.name.setText(getNameRes());
        } else {
            viewHolder.name.setText(getName());
        }
        if (hasDivider()) {
            viewHolder.divider.setVisibility(0);
        } else {
            viewHolder.divider.setVisibility(8);
        }
        viewHolder.divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(parent.getContext(), R.attr.material_drawer_divider, R.color.material_drawer_divider));
        return convertView;
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private View divider;
        private TextView name;

        private ViewHolder(View view) {
            this.view = view;
            this.divider = view.findViewById(R.id.divider);
            this.name = (TextView) view.findViewById(R.id.name);
        }
    }
}
