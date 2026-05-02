package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable;
import com.mikepenz.materialdrawer.util.PressedEffectStateListDrawable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/PrimaryDrawerItem.class */
public class PrimaryDrawerItem extends BaseDrawerItem<PrimaryDrawerItem> implements ColorfulBadgeable<PrimaryDrawerItem> {
    private String description;
    private String badge;
    private int descriptionTextColor = 0;
    private int descriptionRes = -1;
    private int badgeTextColor = 0;
    private int badgeBackgroundRes = 0;

    public PrimaryDrawerItem withDescription(String description) {
        this.descriptionRes = -1;
        this.description = description;
        return this;
    }

    public PrimaryDrawerItem withDescription(int descriptionRes) {
        this.description = null;
        this.descriptionRes = descriptionRes;
        return this;
    }

    public PrimaryDrawerItem withDescriptionTextColor(int color) {
        this.descriptionTextColor = color;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public PrimaryDrawerItem withBadge(String badge) {
        this.badge = badge;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public PrimaryDrawerItem withBadgeTextColor(int color) {
        this.badgeTextColor = color;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public void setBadgeBackgroundResource(int res) {
        this.badgeBackgroundRes = res;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public int getBadgeBackgroundResource() {
        return this.badgeBackgroundRes;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public PrimaryDrawerItem withBadgeBackgroundResource(int res) {
        this.badgeBackgroundRes = res;
        return this;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.descriptionRes = -1;
        this.description = description;
    }

    public int getDescriptionRes() {
        return this.descriptionRes;
    }

    public void setDescriptionRes(int descriptionRes) {
        this.description = null;
        this.descriptionRes = descriptionRes;
    }

    public int getDescriptionTextColor() {
        return this.descriptionTextColor;
    }

    public void setDescriptionTextColor(int color) {
        this.descriptionTextColor = color;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public String getBadge() {
        return this.badge;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public int getBadgeTextColor() {
        return this.badgeTextColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public void setBadgeTextColor(int color) {
        this.badgeTextColor = color;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public void setBadge(String badge) {
        this.badge = badge;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "PRIMARY_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_primary;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View convertView(LayoutInflater inflater, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;
        int color;
        int iconColor;
        Context ctx = parent.getContext();
        if (convertView == null) {
            convertView = inflater.inflate(getLayoutRes(), parent, false);
            viewHolder = new ViewHolder(convertView);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        int selectedColor = UIUtils.decideColor(ctx, getSelectedColor(), getSelectedColorRes(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
        if (isEnabled()) {
            color = UIUtils.decideColor(ctx, getTextColor(), getTextColorRes(), R.attr.material_drawer_primary_text, R.color.material_drawer_primary_text);
        } else {
            color = UIUtils.decideColor(ctx, getDisabledTextColor(), getDisabledTextColorRes(), R.attr.material_drawer_hint_text, R.color.material_drawer_hint_text);
        }
        int selectedTextColor = UIUtils.decideColor(ctx, getSelectedTextColor(), getSelectedTextColorRes(), R.attr.material_drawer_selected_text, R.color.material_drawer_selected_text);
        if (isEnabled()) {
            iconColor = UIUtils.decideColor(ctx, getIconColor(), getIconColorRes(), R.attr.material_drawer_primary_icon, R.color.material_drawer_primary_icon);
        } else {
            iconColor = UIUtils.decideColor(ctx, getDisabledIconColor(), getDisabledIconColorRes(), R.attr.material_drawer_hint_text, R.color.material_drawer_hint_text);
        }
        int selectedIconColor = UIUtils.decideColor(ctx, getSelectedIconColor(), getSelectedIconColorRes(), R.attr.material_drawer_selected_text, R.color.material_drawer_selected_text);
        UIUtils.setBackground(viewHolder.view, UIUtils.getDrawerItemBackground(selectedColor));
        if (getNameRes() != -1) {
            viewHolder.name.setText(getNameRes());
        } else {
            viewHolder.name.setText(getName());
        }
        viewHolder.description.setVisibility(0);
        if (getDescriptionRes() == -1) {
            if (getDescription() != null) {
                viewHolder.description.setText(getDescription());
            } else {
                viewHolder.description.setVisibility(8);
            }
        } else {
            viewHolder.description.setText(getDescriptionRes());
        }
        if (getBadge() != null) {
            viewHolder.badge.setText(getBadge());
            viewHolder.badge.setVisibility(0);
        } else {
            viewHolder.badge.setVisibility(8);
        }
        viewHolder.name.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
        if (this.descriptionTextColor != 0) {
            viewHolder.description.setTextColor(this.descriptionTextColor);
        } else {
            viewHolder.description.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
        }
        if (this.badgeTextColor != 0) {
            viewHolder.badge.setTextColor(this.badgeTextColor);
        } else {
            viewHolder.badge.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
        }
        if (this.badgeBackgroundRes != 0) {
            viewHolder.badge.setBackgroundResource(this.badgeBackgroundRes);
        }
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
            viewHolder.description.setTypeface(getTypeface());
            viewHolder.badge.setTypeface(getTypeface());
        }
        Drawable icon = UIUtils.decideIcon(ctx, getIcon(), getIIcon(), getIconRes(), iconColor, isIconTinted());
        Drawable selectedIcon = UIUtils.decideIcon(ctx, getSelectedIcon(), getIIcon(), getSelectedIconRes(), selectedIconColor, isIconTinted());
        if (icon != null) {
            if (selectedIcon == null) {
                if (isIconTinted()) {
                    viewHolder.icon.setImageDrawable(new PressedEffectStateListDrawable(icon, iconColor, selectedIconColor));
                } else {
                    viewHolder.icon.setImageDrawable(icon);
                }
            } else {
                viewHolder.icon.setImageDrawable(UIUtils.getIconStateList(icon, selectedIcon));
            }
            viewHolder.icon.setVisibility(0);
        } else {
            viewHolder.icon.setVisibility(8);
        }
        return convertView;
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;
        private TextView description;
        private TextView badge;

        private ViewHolder(View view) {
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.icon);
            this.name = (TextView) view.findViewById(R.id.name);
            this.description = (TextView) view.findViewById(R.id.description);
            this.badge = (TextView) view.findViewById(R.id.badge);
        }
    }
}
