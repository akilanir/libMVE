package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.SwitchCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.OnCheckedChangeListener;
import com.mikepenz.materialdrawer.util.PressedEffectStateListDrawable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SwitchDrawerItem.class */
public class SwitchDrawerItem extends BaseDrawerItem<SwitchDrawerItem> {
    private String description;
    private int descriptionRes = -1;
    private boolean switchEnabled = true;
    private boolean checkable = false;
    private boolean checked = false;
    private OnCheckedChangeListener onCheckedChangeListener = null;
    private CompoundButton.OnCheckedChangeListener checkedChangeListener = new CompoundButton.OnCheckedChangeListener() { // from class: com.mikepenz.materialdrawer.model.SwitchDrawerItem.2
        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            SwitchDrawerItem.this.checked = isChecked;
            if (SwitchDrawerItem.this.getOnCheckedChangeListener() != null) {
                SwitchDrawerItem.this.getOnCheckedChangeListener().onCheckedChanged(SwitchDrawerItem.this, buttonView, isChecked);
            }
        }
    };

    public SwitchDrawerItem withDescription(String description) {
        this.descriptionRes = -1;
        this.description = description;
        return this;
    }

    public SwitchDrawerItem withDescription(int descriptionRes) {
        this.description = null;
        this.descriptionRes = descriptionRes;
        return this;
    }

    public SwitchDrawerItem withChecked(boolean checked) {
        this.checked = checked;
        return this;
    }

    public SwitchDrawerItem withSwitchEnabled(boolean switchEnabled) {
        this.switchEnabled = switchEnabled;
        return this;
    }

    public SwitchDrawerItem withOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener) {
        this.onCheckedChangeListener = onCheckedChangeListener;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.BaseDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Checkable
    public SwitchDrawerItem withCheckable(boolean checkable) {
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

    public boolean isSwitchEnabled() {
        return this.switchEnabled;
    }

    public void setSwitchEnabled(boolean switchEnabled) {
        this.switchEnabled = switchEnabled;
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
        return "SWITCH_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_switch;
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
            viewHolder.view.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.model.SwitchDrawerItem.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (!SwitchDrawerItem.this.switchEnabled) {
                        return;
                    }
                    viewHolder2.switchView.setChecked(!viewHolder2.switchView.isChecked());
                }
            });
        }
        viewHolder.switchView.setChecked(this.checked);
        viewHolder.switchView.setOnCheckedChangeListener(this.checkedChangeListener);
        viewHolder.switchView.setEnabled(this.switchEnabled);
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

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;
        private TextView description;
        private SwitchCompat switchView;

        private ViewHolder(View view) {
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.icon);
            this.name = (TextView) view.findViewById(R.id.name);
            this.description = (TextView) view.findViewById(R.id.description);
            this.switchView = view.findViewById(R.id.switchView);
        }
    }
}
