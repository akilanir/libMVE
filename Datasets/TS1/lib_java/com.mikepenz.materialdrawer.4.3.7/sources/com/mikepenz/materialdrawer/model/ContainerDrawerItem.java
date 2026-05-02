package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ContainerDrawerItem.class */
public class ContainerDrawerItem extends AbstractDrawerItem<ContainerDrawerItem> {
    private View mView;
    public Position mViewPosition = Position.TOP;

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ContainerDrawerItem$Position.class */
    public enum Position {
        TOP,
        BOTTOM,
        NONE
    }

    public ContainerDrawerItem withView(View view) {
        this.mView = view;
        return this;
    }

    public View getView() {
        return this.mView;
    }

    public ContainerDrawerItem withViewPosition(Position position) {
        this.mViewPosition = position;
        return this;
    }

    public Position getViewPosition() {
        return this.mViewPosition;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "CONTAINER_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_container;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        holder.itemView.setId(getIdentifier());
        viewHolder.view.setEnabled(false);
        if (this.mView.getParent() != null) {
            ((ViewGroup) this.mView.getParent()).removeView(this.mView);
        }
        ((ViewGroup) viewHolder.view).removeAllViews();
        View divider = new View(ctx);
        divider.setMinimumHeight(1);
        divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(ctx, R.attr.material_drawer_divider, R.color.material_drawer_divider));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, (int) UIUtils.convertDpToPixel(1.0f, ctx));
        if (this.mViewPosition != Position.TOP) {
            if (this.mViewPosition == Position.BOTTOM) {
                layoutParams.topMargin = ctx.getResources().getDimensionPixelSize(R.dimen.material_drawer_padding);
                ((ViewGroup) viewHolder.view).addView(divider, layoutParams);
                ((ViewGroup) viewHolder.view).addView(this.mView);
            } else {
                ((ViewGroup) viewHolder.view).addView(this.mView);
            }
        } else {
            ((ViewGroup) viewHolder.view).addView(this.mView, -1, -2);
            layoutParams.bottomMargin = ctx.getResources().getDimensionPixelSize(R.dimen.material_drawer_padding);
            ((ViewGroup) viewHolder.view).addView(divider, layoutParams);
        }
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ContainerDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;

        private ViewHolder(View view) {
            super(view);
            this.view = view;
        }
    }
}
