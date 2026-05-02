package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.model.interfaces.Identifyable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ProfileSettingDrawerItem.class */
public class ProfileSettingDrawerItem implements IDrawerItem, IProfile<ProfileSettingDrawerItem>, Tagable<ProfileSettingDrawerItem>, Identifyable<ProfileSettingDrawerItem>, Typefaceable<ProfileSettingDrawerItem> {
    private Drawable icon;
    private Bitmap iconBitmap;
    private IIcon iicon;
    private Uri iconUri;
    private String name;
    private String email;
    private Object tag;
    private int identifier = -1;
    private boolean selectable = false;
    private boolean enabled = true;
    private boolean iconTinted = false;
    private int selectedColor = 0;
    private int selectedColorRes = -1;
    private int textColor = 0;
    private int textColorRes = -1;
    private int iconColor = 0;
    private int iconColorRes = -1;
    private Typeface typeface = null;

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public ProfileSettingDrawerItem withIdentifier(int identifier) {
        this.identifier = identifier;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Drawable icon) {
        this.icon = icon;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Bitmap icon) {
        this.iconBitmap = icon;
        return this;
    }

    public ProfileSettingDrawerItem withIcon(IIcon iicon) {
        this.iicon = iicon;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(String url) {
        this.iconUri = Uri.parse(url);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withIcon(Uri uri) {
        this.iconUri = uri;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withName(String name) {
        this.name = name;
        return this;
    }

    public ProfileSettingDrawerItem withDescription(String description) {
        this.email = description;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withEmail(String email) {
        this.email = email;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public ProfileSettingDrawerItem withTag(Object object) {
        this.tag = object;
        return this;
    }

    public ProfileSettingDrawerItem setEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public ProfileSettingDrawerItem withEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public ProfileSettingDrawerItem withSelectedColor(int selectedColor) {
        this.selectedColor = selectedColor;
        return this;
    }

    public ProfileSettingDrawerItem withSelectedColorRes(int selectedColorRes) {
        this.selectedColorRes = selectedColorRes;
        return this;
    }

    public ProfileSettingDrawerItem withTextColor(int textColor) {
        this.textColor = textColor;
        return this;
    }

    public ProfileSettingDrawerItem withTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
        return this;
    }

    public ProfileSettingDrawerItem withIconColor(int iconColor) {
        this.iconColor = iconColor;
        return this;
    }

    public ProfileSettingDrawerItem withIconColorRes(int iconColorRes) {
        this.iconColorRes = iconColorRes;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem withSelectable(boolean selectable) {
        this.selectable = selectable;
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

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public Bitmap getIconBitmap() {
        return this.iconBitmap;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIconBitmap(Bitmap iconBitmap) {
        this.iconBitmap = iconBitmap;
    }

    public int getSelectedColor() {
        return this.selectedColor;
    }

    public void setSelectedColor(int selectedColor) {
        this.selectedColor = selectedColor;
    }

    public int getSelectedColorRes() {
        return this.selectedColorRes;
    }

    public void setSelectedColorRes(int selectedColorRes) {
        this.selectedColorRes = selectedColorRes;
    }

    public int getTextColor() {
        return this.textColor;
    }

    public void setTextColor(int textColor) {
        this.textColor = textColor;
    }

    public int getTextColorRes() {
        return this.textColorRes;
    }

    public void setTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
    }

    public int getIconColorRes() {
        return this.iconColorRes;
    }

    public void setIconColorRes(int iconColorRes) {
        this.iconColorRes = iconColorRes;
    }

    public int getIconColor() {
        return this.iconColor;
    }

    public void setIconColor(int iconColor) {
        this.iconColor = iconColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Tagable
    public Object getTag() {
        return this.tag;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public void setTag(Object tag) {
        this.tag = tag;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public Drawable getIcon() {
        return this.icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(Drawable icon) {
        this.icon = icon;
    }

    public IIcon getIIcon() {
        return this.iicon;
    }

    public void setIIcon(IIcon iicon) {
        this.iicon = iicon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(Uri uri) {
        this.iconUri = uri;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(String url) {
        this.iconUri = Uri.parse(url);
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public Uri getIconUri() {
        return this.iconUri;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public boolean isSelectable() {
        return this.selectable;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileSettingDrawerItem setSelectable(boolean selectable) {
        this.selectable = selectable;
        return this;
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

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public void setTypeface(Typeface typeface) {
        this.typeface = typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public String getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setName(String name) {
        this.name = name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public String getEmail() {
        return this.email;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return this.email;
    }

    public void setDescription(String description) {
        this.email = this.email;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public int getIdentifier() {
        return this.identifier;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public void setIdentifier(int identifier) {
        this.identifier = identifier;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public boolean isEnabled() {
        return this.enabled;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public String getType() {
        return "PROFILE_SETTING_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_profile_setting;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public View convertView(LayoutInflater inflater, View convertView, ViewGroup parent) {
        ViewHolder viewHolder;
        Context ctx = parent.getContext();
        if (convertView == null) {
            convertView = inflater.inflate(getLayoutRes(), parent, false);
            viewHolder = new ViewHolder(convertView);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        int selectedColor = UIUtils.decideColor(ctx, getSelectedColor(), getSelectedColorRes(), R.attr.material_drawer_selected, R.color.material_drawer_selected);
        int color = UIUtils.decideColor(ctx, getTextColor(), getTextColorRes(), R.attr.material_drawer_primary_text, R.color.material_drawer_primary_text);
        int iconColor = UIUtils.decideColor(ctx, getIconColor(), getIconColorRes(), R.attr.material_drawer_primary_icon, R.color.material_drawer_primary_icon);
        UIUtils.setBackground(viewHolder.view, UIUtils.getDrawerItemBackground(selectedColor));
        viewHolder.name.setText(getName());
        viewHolder.name.setTextColor(color);
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
        }
        if (getIcon() != null) {
            if (this.icon != null && isIconTinted()) {
                this.icon.setColorFilter(iconColor, PorterDuff.Mode.SRC_IN);
            }
            viewHolder.icon.setImageDrawable(this.icon);
            viewHolder.icon.setVisibility(0);
        } else if (getIconBitmap() == null) {
            if (getIIcon() != null) {
                viewHolder.icon.setImageDrawable(new IconicsDrawable(ctx, getIIcon()).color(iconColor).actionBarSize().paddingDp(2));
                viewHolder.icon.setVisibility(0);
            } else {
                viewHolder.icon.setVisibility(8);
            }
        } else {
            viewHolder.icon.setImageBitmap(this.iconBitmap);
            viewHolder.icon.setVisibility(0);
        }
        return convertView;
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView icon;
        private TextView name;

        private ViewHolder(View view) {
            this.view = view;
            this.icon = (ImageView) view.findViewById(R.id.icon);
            this.name = (TextView) view.findViewById(R.id.name);
        }
    }
}
