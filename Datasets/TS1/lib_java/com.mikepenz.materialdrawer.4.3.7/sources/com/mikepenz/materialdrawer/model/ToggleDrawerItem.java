package com.mikepenz.materialdrawer.model;

import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.ToggleButton;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.interfaces.OnCheckedChangeListener;
import com.mikepenz.materialdrawer.model.BasePrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ToggleDrawerItem.class */
public class ToggleDrawerItem extends BasePrimaryDrawerItem<ToggleDrawerItem> {
    private boolean toggleEnabled = true;
    private boolean checked = false;
    private OnCheckedChangeListener onCheckedChangeListener = null;
    private CompoundButton.OnCheckedChangeListener checkedChangeListener = new CompoundButton.OnCheckedChangeListener() { // from class: com.mikepenz.materialdrawer.model.ToggleDrawerItem.2
        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (ToggleDrawerItem.this.isEnabled()) {
                ToggleDrawerItem.this.checked = isChecked;
                if (ToggleDrawerItem.this.getOnCheckedChangeListener() != null) {
                    ToggleDrawerItem.this.getOnCheckedChangeListener().onCheckedChanged(ToggleDrawerItem.this, buttonView, isChecked);
                    return;
                }
                return;
            }
            buttonView.setOnCheckedChangeListener(null);
            buttonView.setChecked(!isChecked);
            buttonView.setOnCheckedChangeListener(ToggleDrawerItem.this.checkedChangeListener);
        }
    };

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

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "TOGGLE_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_toggle;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        final ViewHolder viewHolder = (ViewHolder) holder;
        bindViewHelper((BasePrimaryDrawerItem.BaseViewHolder) holder);
        viewHolder.toggle.setOnCheckedChangeListener(null);
        viewHolder.toggle.setChecked(this.checked);
        viewHolder.toggle.setOnCheckedChangeListener(this.checkedChangeListener);
        viewHolder.toggle.setEnabled(this.toggleEnabled);
        withOnDrawerItemClickListener(new Drawer.OnDrawerItemClickListener() { // from class: com.mikepenz.materialdrawer.model.ToggleDrawerItem.1
            @Override // com.mikepenz.materialdrawer.Drawer.OnDrawerItemClickListener
            public boolean onItemClick(View view, int position, IDrawerItem drawerItem) {
                if (!ToggleDrawerItem.this.isSelectable()) {
                    ToggleDrawerItem.this.checked = !ToggleDrawerItem.this.checked;
                    viewHolder.toggle.setChecked(ToggleDrawerItem.this.checked);
                    return false;
                }
                return false;
            }
        });
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ToggleDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder.class */
    private static class ViewHolder extends BasePrimaryDrawerItem.BaseViewHolder {
        private ToggleButton toggle;

        private ViewHolder(View view) {
            super(view);
            this.toggle = (ToggleButton) view.findViewById(R.id.material_drawer_toggle);
        }
    }
}
