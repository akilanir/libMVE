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

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SecondaryDrawerItem.class */
public class SecondaryDrawerItem extends BaseDrawerItem<SecondaryDrawerItem> implements ColorfulBadgeable<SecondaryDrawerItem> {
    private String badge;
    private int badgeTextColor = 0;
    private int badgeBackgroundRes = 0;

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public SecondaryDrawerItem withBadge(String badge) {
        this.badge = badge;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public String getBadge() {
        return this.badge;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public void setBadge(String badge) {
        this.badge = badge;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public SecondaryDrawerItem withBadgeTextColor(int color) {
        this.badgeTextColor = color;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public int getBadgeTextColor() {
        return this.badgeTextColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public void setBadgeTextColor(int color) {
        this.badgeTextColor = color;
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
    public SecondaryDrawerItem withBadgeBackgroundResource(int res) {
        this.badgeBackgroundRes = res;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "SECONDARY_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_secondary;
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
            color = UIUtils.decideColor(ctx, getTextColor(), getTextColorRes(), R.attr.material_drawer_secondary_text, R.color.material_drawer_secondary_text);
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
        if (getBadge() != null) {
            viewHolder.badge.setText(getBadge());
            viewHolder.badge.setVisibility(0);
        } else {
            viewHolder.badge.setVisibility(8);
        }
        viewHolder.name.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
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

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;
        private TextView badge;

        private ViewHolder(View view) {
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.icon);
            this.name = (TextView) view.findViewById(R.id.name);
            this.badge = (TextView) view.findViewById(R.id.badge);
        }
    }
}
