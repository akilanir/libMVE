package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileSettingDrawerItem.class */
public class ProfileSettingDrawerItem extends AbstractDrawerItem<ProfileSettingDrawerItem> implements IProfile<ProfileSettingDrawerItem>, Tagable<ProfileSettingDrawerItem>, Typefaceable<ProfileSettingDrawerItem> {
    private ImageHolder icon;
    private StringHolder name;
    private StringHolder email;
    private ColorHolder selectedColor;
    private ColorHolder textColor;
    private ColorHolder iconColor;
    private boolean iconTinted = false;
    private Typeface typeface = null;

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Drawable icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(@DrawableRes int iconRes) {
        this.icon = new ImageHolder(iconRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Bitmap icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(IIcon iicon) {
        this.icon = new ImageHolder(iicon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(String url) {
        this.icon = new ImageHolder(url);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Uri uri) {
        this.icon = new ImageHolder(uri);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withName(String name) {
        this.name = new StringHolder(name);
        return this;
    }

    public ProfileSettingDrawerItem withDescription(String description) {
        this.email = new StringHolder(description);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withEmail(String email) {
        this.email = new StringHolder(email);
        return this;
    }

    public ProfileSettingDrawerItem withSelectedColor(@ColorInt int selectedColor) {
        this.selectedColor = ColorHolder.fromColor(selectedColor);
        return this;
    }

    public ProfileSettingDrawerItem withSelectedColorRes(@ColorRes int selectedColorRes) {
        this.selectedColor = ColorHolder.fromColorRes(selectedColorRes);
        return this;
    }

    public ProfileSettingDrawerItem withTextColor(@ColorInt int textColor) {
        this.textColor = ColorHolder.fromColor(textColor);
        return this;
    }

    public ProfileSettingDrawerItem withTextColorRes(@ColorRes int textColorRes) {
        this.textColor = ColorHolder.fromColorRes(textColorRes);
        return this;
    }

    public ProfileSettingDrawerItem withIconColor(@ColorInt int iconColor) {
        this.iconColor = ColorHolder.fromColor(iconColor);
        return this;
    }

    public ProfileSettingDrawerItem withIconColorRes(@ColorRes int iconColorRes) {
        this.iconColor = ColorHolder.fromColorRes(iconColorRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public ProfileSettingDrawerItem withTypeface(Typeface typeface) {
        this.typeface = typeface;
        return this;
    }

    public ProfileSettingDrawerItem withIconTinted(boolean iconTinted) {
        this.iconTinted = iconTinted;
        return this;
    }

    public ColorHolder getSelectedColor() {
        return this.selectedColor;
    }

    public ColorHolder getTextColor() {
        return this.textColor;
    }

    public ColorHolder getIconColor() {
        return this.iconColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ImageHolder getIcon() {
        return this.icon;
    }

    public boolean isIconTinted() {
        return this.iconTinted;
    }

    public void setIconTinted(boolean iconTinted) {
        this.iconTinted = iconTinted;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getEmail() {
        return this.email;
    }

    public StringHolder getDescription() {
        return this.email;
    }

    public void setDescription(String description) {
        this.email = this.email;
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem, com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Selectable
    public boolean isSelectable() {
        return false;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "PROFILE_SETTING_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_profile_setting;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        viewHolder.itemView.setId(getIdentifier());
        viewHolder.itemView.setSelected(isSelected());
        int selectedColor = ColorHolder.color(getSelectedColor(), ctx, R.attr.material_drawer_selected, R.color.material_drawer_selected);
        int color = ColorHolder.color(getTextColor(), ctx, R.attr.material_drawer_primary_text, R.color.material_drawer_primary_text);
        int iconColor = ColorHolder.color(getIconColor(), ctx, R.attr.material_drawer_primary_icon, R.color.material_drawer_primary_icon);
        UIUtils.setBackground(viewHolder.view, DrawerUIUtils.getSelectableBackground(ctx, selectedColor));
        StringHolder.applyTo(getName(), viewHolder.name);
        viewHolder.name.setTextColor(color);
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
        }
        ImageHolder.applyDecidedIconOrSetGone(this.icon, viewHolder.icon, iconColor, isIconTinted(), 2);
        DrawerUIUtils.setDrawerVerticalPadding(viewHolder.view);
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;

        private ViewHolder(View view) {
            super(view);
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.material_drawer_icon);
            this.name = (TextView) view.findViewById(R.id.material_drawer_name);
        }
    }
}
