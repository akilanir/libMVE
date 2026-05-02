package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IProfile;
import com.mikepenz.materialdrawer.model.interfaces.Identifyable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.util.UIUtils;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ProfileDrawerItem.class */
public class ProfileDrawerItem implements IDrawerItem, IProfile<ProfileDrawerItem>, Tagable<ProfileDrawerItem>, Identifyable<ProfileDrawerItem>, Typefaceable<ProfileDrawerItem> {
    private Drawable icon;
    private Bitmap iconBitmap;
    private Uri iconUri;
    private String name;
    private String email;
    private Object tag;
    private int identifier = -1;
    private boolean selectable = true;
    private boolean nameShown = false;
    private boolean enabled = true;
    private int selectedColor = 0;
    private int selectedColorRes = -1;
    private int textColor = 0;
    private int textColorRes = -1;
    private Typeface typeface = null;

    private void resetIcons() {
        this.icon = null;
        this.iconBitmap = null;
        this.iconUri = null;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public ProfileDrawerItem withIdentifier(int identifier) {
        this.identifier = identifier;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Drawable icon) {
        resetIcons();
        this.icon = icon;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Bitmap iconBitmap) {
        resetIcons();
        this.iconBitmap = iconBitmap;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(String url) {
        resetIcons();
        this.iconUri = Uri.parse(url);
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withIcon(Uri uri) {
        resetIcons();
        this.iconUri = uri;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withName(String name) {
        this.name = name;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withEmail(String email) {
        this.email = email;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public ProfileDrawerItem withTag(Object object) {
        this.tag = object;
        return this;
    }

    public ProfileDrawerItem setEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public ProfileDrawerItem withNameShown(boolean nameShown) {
        this.nameShown = nameShown;
        return this;
    }

    public ProfileDrawerItem withSelectedColor(int selectedColor) {
        this.selectedColor = selectedColor;
        return this;
    }

    public ProfileDrawerItem withSelectedColorRes(int selectedColorRes) {
        this.selectedColorRes = selectedColorRes;
        return this;
    }

    public ProfileDrawerItem withTextColor(int textColor) {
        this.textColor = textColor;
        return this;
    }

    public ProfileDrawerItem withTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem withSelectable(boolean selectable) {
        this.selectable = selectable;
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

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public void setTypeface(Typeface typeface) {
        this.typeface = typeface;
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
    public Uri getIconUri() {
        return this.iconUri;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public Drawable getIcon() {
        return this.icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public Bitmap getIconBitmap() {
        return this.iconBitmap;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIconBitmap(Bitmap iconBitmap) {
        resetIcons();
        this.iconBitmap = iconBitmap;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(Uri uri) {
        resetIcons();
        this.iconUri = uri;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(String url) {
        resetIcons();
        this.iconUri = Uri.parse(url);
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public void setIcon(Drawable icon) {
        resetIcons();
        this.icon = icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public boolean isSelectable() {
        return this.selectable;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mikepenz.materialdrawer.model.interfaces.IProfile
    public ProfileDrawerItem setSelectable(boolean selectable) {
        this.selectable = selectable;
        return this;
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
        return "PROFILE_ITEM";
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem
    public int getLayoutRes() {
        return R.layout.material_drawer_item_profile;
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
        UIUtils.setBackground(viewHolder.view, UIUtils.getDrawerItemBackground(selectedColor));
        if (this.nameShown) {
            viewHolder.name.setVisibility(0);
            viewHolder.name.setText(getName());
        } else {
            viewHolder.name.setVisibility(8);
        }
        if (this.nameShown || getEmail() != null || getName() == null) {
            viewHolder.email.setText(getEmail());
        } else {
            viewHolder.email.setText(getName());
        }
        if (getTypeface() != null) {
            viewHolder.name.setTypeface(getTypeface());
            viewHolder.email.setTypeface(getTypeface());
        }
        if (this.nameShown) {
            viewHolder.name.setTextColor(color);
        }
        viewHolder.email.setTextColor(color);
        viewHolder.profileIcon.setVisibility(0);
        if (getIconUri() == null) {
            if (getIcon() == null) {
                if (getIconBitmap() != null) {
                    viewHolder.profileIcon.setImageBitmap(getIconBitmap());
                } else {
                    viewHolder.profileIcon.setVisibility(4);
                }
            } else {
                viewHolder.profileIcon.setImageDrawable(getIcon());
            }
        } else {
            viewHolder.profileIcon.setImageDrawable(UIUtils.getPlaceHolder(ctx));
            viewHolder.profileIcon.setImageURI(this.iconUri);
        }
        return convertView;
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder.class */
    private static class ViewHolder {
        private View view;
        private ImageView profileIcon;
        private TextView name;
        private TextView email;

        private ViewHolder(View view) {
            this.view = view;
            this.profileIcon = (ImageView) view.findViewById(R.id.profileIcon);
            this.name = (TextView) view.findViewById(R.id.name);
            this.email = (TextView) view.findViewById(R.id.email);
        }
    }
}
