package com.mikepenz.materialdrawer.model;

import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SwitchCompat;
import android.view.View;
import android.widget.CompoundButton;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.interfaces.OnCheckedChangeListener;
import com.mikepenz.materialdrawer.model.BaseSecondaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem.class */
public class SecondarySwitchDrawerItem extends BaseSecondaryDrawerItem<SecondarySwitchDrawerItem> {
    private boolean switchEnabled = true;
    private boolean checked = false;
    private OnCheckedChangeListener onCheckedChangeListener = null;
    private CompoundButton.OnCheckedChangeListener checkedChangeListener = new CompoundButton.OnCheckedChangeListener() { // from class: com.mikepenz.materialdrawer.model.SecondarySwitchDrawerItem.2
        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (SecondarySwitchDrawerItem.this.isEnabled()) {
                SecondarySwitchDrawerItem.this.checked = isChecked;
                if (SecondarySwitchDrawerItem.this.getOnCheckedChangeListener() != null) {
                    SecondarySwitchDrawerItem.this.getOnCheckedChangeListener().onCheckedChanged(SecondarySwitchDrawerItem.this, buttonView, isChecked);
                    return;
                }
                return;
            }
            buttonView.setOnCheckedChangeListener(null);
            buttonView.setChecked(!isChecked);
            buttonView.setOnCheckedChangeListener(SecondarySwitchDrawerItem.this.checkedChangeListener);
        }
    };

    public SecondarySwitchDrawerItem withChecked(boolean checked) {
        this.checked = checked;
        return this;
    }

    public SecondarySwitchDrawerItem withSwitchEnabled(boolean switchEnabled) {
        this.switchEnabled = switchEnabled;
        return this;
    }

    public SecondarySwitchDrawerItem withOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener) {
        this.onCheckedChangeListener = onCheckedChangeListener;
        return this;
    }

    public SecondarySwitchDrawerItem withCheckable(boolean checkable) {
        return withSelectable(checkable);
    }

    public boolean isChecked() {
        return this.checked;
    }

    public boolean isSwitchEnabled() {
        return this.switchEnabled;
    }

    public OnCheckedChangeListener getOnCheckedChangeListener() {
        return this.onCheckedChangeListener;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "SECONDARY_SWITCH_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_secondary_switch;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        final ViewHolder viewHolder = (ViewHolder) holder;
        bindViewHelper((BaseSecondaryDrawerItem.BaseViewHolder) holder);
        viewHolder.switchView.setOnCheckedChangeListener((CompoundButton.OnCheckedChangeListener) null);
        viewHolder.switchView.setChecked(this.checked);
        viewHolder.switchView.setOnCheckedChangeListener(this.checkedChangeListener);
        viewHolder.switchView.setEnabled(this.switchEnabled);
        withOnDrawerItemClickListener(new Drawer.OnDrawerItemClickListener() { // from class: com.mikepenz.materialdrawer.model.SecondarySwitchDrawerItem.1
            @Override // com.mikepenz.materialdrawer.Drawer.OnDrawerItemClickListener
            public boolean onItemClick(View view, int position, IDrawerItem drawerItem) {
                if (!SecondarySwitchDrawerItem.this.isSelectable()) {
                    SecondarySwitchDrawerItem.this.checked = !SecondarySwitchDrawerItem.this.checked;
                    viewHolder.switchView.setChecked(SecondarySwitchDrawerItem.this.checked);
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

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder.class */
    private static class ViewHolder extends BaseSecondaryDrawerItem.BaseViewHolder {
        private SwitchCompat switchView;

        private ViewHolder(View view) {
            super(view);
            this.switchView = view.findViewById(R.id.material_drawer_switch);
        }
    }
}
