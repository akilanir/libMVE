package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.ToggleButton;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.OnCheckedChangeListener;
import com.mikepenz.materialdrawer.util.PressedEffectStateListDrawable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ToggleDrawerItem.class */
public class ToggleDrawerItem extends BaseDrawerItem<ToggleDrawerItem> {
    private String description;
    private int descriptionRes = -1;
    private boolean toggleEnabled = true;
    private boolean checkable = false;
    private boolean checked = false;
    private OnCheckedChangeListener onCheckedChangeListener = null;
    private CompoundButton.OnCheckedChangeListener checkedChangeListener = new CompoundButton.OnCheckedChangeListener() { // from class: com.mikepenz.materialdrawer.model.ToggleDrawerItem.2
        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            ToggleDrawerItem.this.checked = isChecked;
            if (ToggleDrawerItem.this.getOnCheckedChangeListener() != null) {
                ToggleDrawerItem.this.getOnCheckedChangeListener().onCheckedChanged(ToggleDrawerItem.this, buttonView, isChecked);
            }
        }
    };

    public ToggleDrawerItem withDescription(String description) {
        this.descriptionRes = -1;
        this.description = description;
        return this;
    }

    public ToggleDrawerItem withDescription(int descriptionRes) {
        this.description = null;
        this.descriptionRes = descriptionRes;
        return this;
    }

    public ToggleDrawerItem withChecked(boolean checked) {
        this.checked = checked;
        return this;
    }

    public ToggleDrawerItem withToggleEnabled(boolean toggleEnabled) {
        this.toggleEnabled = toggleEnabled;
        return this;
    }

    public ToggleDrawerItem withOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener) {
        this.onCheckedChangeListener = onCheckedChangeListener;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.BaseDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Checkable
    public ToggleDrawerItem withCheckable(boolean checkable) {
        this.checkable = checkable;
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

    public boolean isChecked() {
        return this.checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public boolean isToggleEnabled() {
        return this.toggleEnabled;
    }

    public void setToggleEnabled(boolean toggleEnabled) {
        this.toggleEnabled = toggleEnabled;
    }

    public OnCheckedChangeListener getOnCheckedChangeListener() {
        return this.onCheckedChangeListener;
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener) {
        this.onCheckedChangeListener = onCheckedChangeListener;
    }

    @Override // com.mikepenz.materialdrawer.model.BaseDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Checkable
    public boolean isCheckable() {
        return this.checkable;
    }

    @Override // com.mikepenz.materialdrawer.model.BaseDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Checkable
    public void setCheckable(boolean checkable) {
        this.checkable = checkable;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "TOGGLE_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_toggle;
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
        if (!isCheckable()) {
            final ViewHolder viewHolder2 = viewHolder;
            viewHolder.view.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.model.ToggleDrawerItem.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (!ToggleDrawerItem.this.toggleEnabled) {
                        return;
                    }
                    viewHolder2.toggle.setChecked(!viewHolder2.toggle.isChecked());
                }
            });
        }
        viewHolder.toggle.setChecked(this.checked);
        viewHolder.toggle.setOnCheckedChangeListener(this.checkedChangeListener);
        viewHolder.toggle.setEnabled(this.toggleEnabled);
        viewHolder.name.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
        viewHolder.description.setTextColor(UIUtils.getTextColorStateList(color, selectedTextColor));
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
            viewHolder.description.setTypeface(getTypeface());
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

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;
        private TextView description;
        private ToggleButton toggle;

        private ViewHolder(View view) {
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.icon);
            this.name = (TextView) view.findViewById(R.id.name);
            this.description = (TextView) view.findViewById(R.id.description);
            this.toggle = (ToggleButton) view.findViewById(R.id.toggle);
        }
    }
}
