package com.mikepenz.materialdrawer.model;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.DrawableRes;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.model.utils.ViewHolderFactory;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniProfileDrawerItem.class */
public class MiniProfileDrawerItem extends AbstractDrawerItem<MiniProfileDrawerItem> implements IProfile<MiniProfileDrawerItem> {
    protected ImageHolder icon;

    public MiniProfileDrawerItem() {
    }

    public MiniProfileDrawerItem(ProfileDrawerItem profile) {
        this.icon = profile.icon;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withName(String name) {
        return null;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getName() {
        return null;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withEmail(String email) {
        return null;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public StringHolder getEmail() {
        return null;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(Drawable icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(@DrawableRes int iconRes) {
        this.icon = new ImageHolder(iconRes);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(Bitmap iconBitmap) {
        this.icon = new ImageHolder(iconBitmap);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(String url) {
        this.icon = new ImageHolder(url);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(Uri uri) {
        this.icon = new ImageHolder(uri);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public MiniProfileDrawerItem withIcon(IIcon icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ImageHolder getIcon() {
        return this.icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "MINI_PROFILE_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    @LayoutRes
    public int getLayoutRes() {
        return R.layout.material_drawer_item_mini_profile;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public void bindView(RecyclerView.ViewHolder holder) {
        ViewHolder viewHolder = (ViewHolder) holder;
        viewHolder.itemView.setId(getIdentifier());
        ImageHolder.applyToOrSetInvisible(getIcon(), viewHolder.icon);
        onPostBindView(this, holder.itemView);
    }

    @Override // com.mikepenz.materialdrawer.model.AbstractDrawerItem
    public ViewHolderFactory getFactory() {
        return new ItemFactory();
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ItemFactory.class */
    public static class ItemFactory implements ViewHolderFactory<ViewHolder> {
        @Override // com.mikepenz.materialdrawer.model.utils.ViewHolderFactory
        public ViewHolder factory(View v) {
            return new ViewHolder(v);
        }
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder.class */
    private static class ViewHolder extends RecyclerView.ViewHolder {
        private ImageView icon;

        public ViewHolder(View view) {
            super(view);
            this.icon = (ImageView) view.findViewById(R.id.material_drawer_icon);
        }
    }
}
