package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.BadgeStyle;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniDrawerItem.class */
public class MiniDrawerItem extends BaseDrawerItem<MiniDrawerItem> {
    private StringHolder mBadge;
    private BadgeStyle mBadgeStyle;
    private boolean mEnableSelectedBackground;

    public MiniDrawerItem() {
        this.mBadgeStyle = new BadgeStyle();
        this.mEnableSelectedBackground = false;
    }

    public MiniDrawerItem(PrimaryDrawerItem primaryDrawerItem) {
        this.mBadgeStyle = new BadgeStyle();
        this.mEnableSelectedBackground = false;
        this.mIdentifier = primaryDrawerItem.mIdentifier;
        this.mTag = primaryDrawerItem.mTag;
        this.mBadge = primaryDrawerItem.mBadge;
        this.mBadgeStyle = primaryDrawerItem.mBadgeStyle;
        this.mEnabled = primaryDrawerItem.mEnabled;
        this.mSelectable = primaryDrawerItem.mSelectable;
        this.mSelected = primaryDrawerItem.mSelected;
        this.icon = primaryDrawerItem.icon;
        this.selectedIcon = primaryDrawerItem.selectedIcon;
        this.iconTinted = primaryDrawerItem.iconTinted;
        this.selectedColor = primaryDrawerItem.selectedColor;
        this.iconColor = primaryDrawerItem.iconColor;
        this.selectedIconColor = primaryDrawerItem.selectedIconColor;
        this.disabledIconColor = primaryDrawerItem.disabledIconColor;
    }

    public MiniDrawerItem(SecondaryDrawerItem secondaryDrawerItem) {
        this.mBadgeStyle = new BadgeStyle();
        this.mEnableSelectedBackground = false;
        this.mIdentifier = secondaryDrawerItem.mIdentifier;
        this.mTag = secondaryDrawerItem.mTag;
        this.mBadge = secondaryDrawerItem.mBadge;
        this.mBadgeStyle = secondaryDrawerItem.mBadgeStyle;
        this.mEnabled = secondaryDrawerItem.mEnabled;
        this.mSelectable = secondaryDrawerItem.mSelectable;
        this.mSelected = secondaryDrawerItem.mSelected;
        this.icon = secondaryDrawerItem.icon;
        this.selectedIcon = secondaryDrawerItem.selectedIcon;
        this.iconTinted = secondaryDrawerItem.iconTinted;
        this.selectedColor = secondaryDrawerItem.selectedColor;
        this.iconColor = secondaryDrawerItem.iconColor;
        this.selectedIconColor = secondaryDrawerItem.selectedIconColor;
        this.disabledIconColor = secondaryDrawerItem.disabledIconColor;
    }

    public MiniDrawerItem withEnableSelectedBackground(boolean enableSelectedBackground) {
        this.mEnableSelectedBackground = enableSelectedBackground;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "MINI_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_mini;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        viewHolder.itemView.setId(getIdentifier());
        viewHolder.itemView.setSelected(isSelected());
        viewHolder.itemView.setTag(this);
        int iconColor = getIconColor(ctx);
        int selectedIconColor = getSelectedIconColor(ctx);
        if (this.mEnableSelectedBackground) {
            int selectedColor = getSelectedColor(ctx);
            UIUtils.setBackground(viewHolder.view, DrawerUIUtils.getSelectableBackground(ctx, selectedColor));
        }
        boolean badgeVisible = StringHolder.applyToOrHide(this.mBadge, viewHolder.badge);
        if (badgeVisible) {
            this.mBadgeStyle.style(viewHolder.badge);
        }
        Drawable icon = ImageHolder.decideIcon(getIcon(), ctx, iconColor, isIconTinted(), 1);
        Drawable selectedIcon = ImageHolder.decideIcon(getSelectedIcon(), ctx, selectedIconColor, isIconTinted(), 1);
        ImageHolder.applyMultiIconTo(icon, iconColor, selectedIcon, selectedIconColor, isIconTinted(), viewHolder.icon);
        int verticalPadding = ctx.getResources().getDimensionPixelSize(R.dimen.material_drawer_padding);
        int topBottomPadding = ctx.getResources().getDimensionPixelSize(R.dimen.material_mini_drawer_item_padding);
        viewHolder.itemView.setPadding(verticalPadding, topBottomPadding, verticalPadding, topBottomPadding);
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;
        private ImageView icon;
        private TextView badge;

        public ViewHolder(View view) {
            super(view);
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.material_drawer_icon);
            this.badge = (TextView) view.findViewById(R.id.material_drawer_badge);
        }
    }
}
