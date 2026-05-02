package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/BasePrimaryDrawerItem.class */
public abstract class BasePrimaryDrawerItem<T> extends BaseDrawerItem<T> {
    private StringHolder description;
    private ColorHolder descriptionTextColor;

    /* JADX WARN: Multi-variable type inference failed */
    public T withDescription(String description) {
        this.description = new StringHolder(description);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDescription(@StringRes int descriptionRes) {
        this.description = new StringHolder(descriptionRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDescriptionTextColor(@ColorInt int color) {
        this.descriptionTextColor = ColorHolder.fromColor(color);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDescriptionTextColorRes(@ColorRes int colorRes) {
        this.descriptionTextColor = ColorHolder.fromColorRes(colorRes);
        return this;
    }

    public StringHolder getDescription() {
        return this.description;
    }

    public ColorHolder getDescriptionTextColor() {
        return this.descriptionTextColor;
    }

    protected void bindViewHelper(BaseViewHolder viewHolder) {
        Context ctx = viewHolder.itemView.getContext();
        viewHolder.itemView.setId(getIdentifier());
        viewHolder.itemView.setSelected(isSelected());
        viewHolder.itemView.setTag(this);
        int selectedColor = getSelectedColor(ctx);
        int color = getColor(ctx);
        int selectedTextColor = getSelectedTextColor(ctx);
        int iconColor = getIconColor(ctx);
        int selectedIconColor = getSelectedIconColor(ctx);
        UIUtils.setBackground(viewHolder.view, DrawerUIUtils.getSelectableBackground(ctx, selectedColor));
        StringHolder.applyTo(getName(), viewHolder.name);
        StringHolder.applyToOrHide(getDescription(), viewHolder.description);
        viewHolder.name.setTextColor(getTextColorStateList(color, selectedTextColor));
        ColorHolder.applyToOr(getDescriptionTextColor(), viewHolder.description, getTextColorStateList(color, selectedTextColor));
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
            viewHolder.description.setTypeface(getTypeface());
        }
        Drawable icon = ImageHolder.decideIcon(getIcon(), ctx, iconColor, isIconTinted(), 1);
        Drawable selectedIcon = ImageHolder.decideIcon(getSelectedIcon(), ctx, selectedIconColor, isIconTinted(), 1);
        ImageHolder.applyMultiIconTo(icon, iconColor, selectedIcon, selectedIconColor, isIconTinted(), viewHolder.icon);
        DrawerUIUtils.setDrawerVerticalPadding(viewHolder.view);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder.class */
    protected static class BaseViewHolder extends RecyclerView.ViewHolder {
        protected View view;
        protected ImageView icon;
        protected TextView name;
        protected TextView description;

        public BaseViewHolder(View view) {
            super(view);
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.material_drawer_icon);
            this.name = (TextView) view.findViewById(R.id.material_drawer_name);
            this.description = (TextView) view.findViewById(R.id.material_drawer_description);
        }
    }
}
