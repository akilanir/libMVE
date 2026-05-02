package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.support.annotation.LayoutRes;
import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.BadgeStyle;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.BasePrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/PrimaryDrawerItem.class */
public class PrimaryDrawerItem extends BasePrimaryDrawerItem<PrimaryDrawerItem> implements ColorfulBadgeable<PrimaryDrawerItem> {
    protected StringHolder mBadge;
    protected BadgeStyle mBadgeStyle = new BadgeStyle();

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public PrimaryDrawerItem withBadge(StringHolder badge) {
        this.mBadge = badge;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public PrimaryDrawerItem withBadge(String badge) {
        this.mBadge = new StringHolder(badge);
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public PrimaryDrawerItem withBadge(@StringRes int badgeRes) {
        this.mBadge = new StringHolder(badgeRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public PrimaryDrawerItem withBadgeStyle(BadgeStyle badgeStyle) {
        this.mBadgeStyle = badgeStyle;
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Badgeable
    public StringHolder getBadge() {
        return this.mBadge;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.ColorfulBadgeable
    public BadgeStyle getBadgeStyle() {
        return this.mBadgeStyle;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "PRIMARY_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_primary;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        bindViewHelper((BasePrimaryDrawerItem.BaseViewHolder) holder);
        boolean badgeVisible = StringHolder.applyToOrHide(this.mBadge, viewHolder.badge);
        if (badgeVisible) {
            this.mBadgeStyle.style(viewHolder.badge, getTextColorStateList(getColor(ctx), getSelectedTextColor(ctx)));
            viewHolder.badgeContainer.setVisibility(0);
        } else {
            viewHolder.badgeContainer.setVisibility(8);
        }
        if (getTypeface() != null) {
            viewHolder.badge.setTypeface(getTypeface());
        }
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/PrimaryDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder.class */
    private static class ViewHolder extends BasePrimaryDrawerItem.BaseViewHolder {
        private View badgeContainer;
        private TextView badge;

        public ViewHolder(View view) {
            super(view);
            this.badgeContainer = view.findViewById(R.id.material_drawer_badge_container);
            this.badge = (TextView) view.findViewById(R.id.material_drawer_badge);
        }
    }
}
