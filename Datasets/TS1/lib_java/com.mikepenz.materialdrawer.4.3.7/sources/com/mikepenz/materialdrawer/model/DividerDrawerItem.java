package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/DividerDrawerItem.class */
public class DividerDrawerItem extends AbstractDrawerItem<DividerDrawerItem> {
    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "DIVIDER_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_divider;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        holder.itemView.setId(getIdentifier());
        viewHolder.view.setClickable(false);
        viewHolder.view.setEnabled(false);
        viewHolder.view.setMinimumHeight(1);
        viewHolder.divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(ctx, R.attr.material_drawer_divider, R.color.material_drawer_divider));
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/DividerDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;
        private View divider;

        private ViewHolder(View view) {
            super(view);
            this.view = view;
            this.divider = view.findViewById(R.id.material_drawer_divider);
        }
    }
}
