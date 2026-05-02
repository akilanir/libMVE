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
import com.mikepenz.materialdrawer.util.DrawerImageLoader;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialize.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileDrawerItem.class */
public class ProfileDrawerItem extends AbstractDrawerItem<ProfileDrawerItem> implements IProfile<ProfileDrawerItem>, Tagable<ProfileDrawerItem>, Typefaceable<ProfileDrawerItem> {
    protected ImageHolder icon;
    protected StringHolder name;
    protected StringHolder email;
    protected ColorHolder selectedColor;
    protected ColorHolder textColor;
    protected boolean nameShown = false;
    protected Typeface typeface = null;

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Drawable icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(@DrawableRes int iconRes) {
        this.icon = new ImageHolder(iconRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Bitmap iconBitmap) {
        this.icon = new ImageHolder(iconBitmap);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(IIcon icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(String url) {
        this.icon = new ImageHolder(url);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Uri uri) {
        this.icon = new ImageHolder(uri);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withName(String name) {
        this.name = new StringHolder(name);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withEmail(String email) {
        this.email = new StringHolder(email);
        return this;
    }

    public ProfileDrawerItem withNameShown(boolean nameShown) {
        this.nameShown = nameShown;
        return this;
    }

    public ProfileDrawerItem withSelectedColor(@ColorInt int selectedColor) {
        this.selectedColor = ColorHolder.fromColor(selectedColor);
        return this;
    }

    public ProfileDrawerItem withSelectedColorRes(@ColorRes int selectedColorRes) {
        this.selectedColor = ColorHolder.fromColorRes(selectedColorRes);
        return this;
    }

    public ProfileDrawerItem withTextColor(@ColorInt int textColor) {
        this.textColor = ColorHolder.fromColor(textColor);
        return this;
    }

    public ProfileDrawerItem withTextColorRes(@ColorRes int textColorRes) {
        this.textColor = ColorHolder.fromColorRes(textColorRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public ProfileDrawerItem withTypeface(Typeface typeface) {
        this.typeface = typeface;
        return this;
    }

    public boolean isNameShown() {
        return this.nameShown;
    }

    public void setNameShown(boolean nameShown) {
        this.nameShown = nameShown;
    }

    public ColorHolder getSelectedColor() {
        return this.selectedColor;
    }

    public ColorHolder getTextColor() {
        return this.textColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ImageHolder getIcon() {
        return this.icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getEmail() {
        return this.email;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "PROFILE_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_profile;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        Context ctx = holder.itemView.getContext();
        ViewHolder viewHolder = (ViewHolder) holder;
        viewHolder.itemView.setId(getIdentifier());
        viewHolder.itemView.setSelected(isSelected());
        int selectedColor = ColorHolder.color(getSelectedColor(), ctx, R.attr.material_drawer_selected, R.color.material_drawer_selected);
        int color = ColorHolder.color(getTextColor(), ctx, R.attr.material_drawer_primary_text, R.color.material_drawer_primary_text);
        UIUtils.setBackground(viewHolder.view, DrawerUIUtils.getSelectableBackground(ctx, selectedColor));
        if (this.nameShown) {
            viewHolder.name.setVisibility(0);
            StringHolder.applyTo(getName(), viewHolder.name);
        } else {
            viewHolder.name.setVisibility(8);
        }
        if (this.nameShown || getEmail() != null || getName() == null) {
            StringHolder.applyTo(getEmail(), viewHolder.email);
        } else {
            StringHolder.applyTo(getName(), viewHolder.email);
        }
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
            viewHolder.email.setTypeface(getTypeface());
        }
        if (this.nameShown) {
            viewHolder.name.setTextColor(color);
        }
        viewHolder.email.setTextColor(color);
        DrawerImageLoader.getInstance().cancelImage(viewHolder.profileIcon);
        ImageHolder.applyToOrSetInvisible(getIcon(), viewHolder.profileIcon, DrawerImageLoader.Tags.PROFILE_DRAWER_ITEM.name());
        DrawerUIUtils.setDrawerVerticalPadding(viewHolder.view);
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private View view;
        private ImageView profileIcon;
        private TextView name;
        private TextView email;

        private ViewHolder(View view) {
            super(view);
            this.view = view;
            this.profileIcon = (ImageView) view.findViewById(R.id.material_drawer_profileIcon);
            this.name = (TextView) view.findViewById(R.id.material_drawer_name);
            this.email = (TextView) view.findViewById(R.id.material_drawer_email);
        }
    }
}
