package com.mikepenz.materialdrawer.model;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import android.util.Pair;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.holder.ColorHolder;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.interfaces.Iconable;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/BaseDrawerItem.class */
public abstract class BaseDrawerItem<T> extends AbstractDrawerItem<T> implements Nameable<T>, Iconable<T>, Tagable<T>, Typefaceable<T> {
    protected ImageHolder icon;
    protected ImageHolder selectedIcon;
    protected StringHolder name;
    protected ColorHolder selectedColor;
    protected ColorHolder textColor;
    protected ColorHolder selectedTextColor;
    protected ColorHolder disabledTextColor;
    protected ColorHolder iconColor;
    protected ColorHolder selectedIconColor;
    protected ColorHolder disabledIconColor;
    protected Pair<Integer, ColorStateList> colorStateList;
    protected boolean iconTinted = false;
    protected Typeface typeface = null;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public T withIcon(ImageHolder icon) {
        this.icon = icon;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public T withIcon(Drawable icon) {
        this.icon = new ImageHolder(icon);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIcon(@DrawableRes int iconRes) {
        this.icon = new ImageHolder(iconRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIcon(Drawable selectedIcon) {
        this.selectedIcon = new ImageHolder(selectedIcon);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIcon(@DrawableRes int selectedIconRes) {
        this.selectedIcon = new ImageHolder(selectedIconRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public T withIcon(IIcon iicon) {
        this.icon = new ImageHolder(iicon);
        if (Build.VERSION.SDK_INT >= 21) {
            this.selectedIcon = new ImageHolder(iicon);
        } else {
            withIconTintingEnabled(true);
        }
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public T withName(StringHolder name) {
        this.name = name;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public T withName(String name) {
        this.name = new StringHolder(name);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public T withName(@StringRes int nameRes) {
        this.name = new StringHolder(nameRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedColor(@ColorInt int selectedColor) {
        this.selectedColor = ColorHolder.fromColor(selectedColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedColorRes(@ColorRes int selectedColorRes) {
        this.selectedColor = ColorHolder.fromColorRes(selectedColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withTextColor(@ColorInt int textColor) {
        this.textColor = ColorHolder.fromColor(textColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withTextColorRes(@ColorRes int textColorRes) {
        this.textColor = ColorHolder.fromColorRes(textColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedTextColor(@ColorInt int selectedTextColor) {
        this.selectedTextColor = ColorHolder.fromColor(selectedTextColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedTextColorRes(@ColorRes int selectedColorRes) {
        this.selectedTextColor = ColorHolder.fromColorRes(selectedColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledTextColor(@ColorInt int disabledTextColor) {
        this.disabledTextColor = ColorHolder.fromColor(disabledTextColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledTextColorRes(@ColorRes int disabledTextColorRes) {
        this.disabledTextColor = ColorHolder.fromColorRes(disabledTextColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIconColor(@ColorInt int iconColor) {
        this.iconColor = ColorHolder.fromColor(iconColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIconColorRes(@ColorRes int iconColorRes) {
        this.iconColor = ColorHolder.fromColorRes(iconColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIconColor(@ColorInt int selectedIconColor) {
        this.selectedIconColor = ColorHolder.fromColor(selectedIconColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIconColorRes(@ColorRes int selectedColorRes) {
        this.selectedIconColor = ColorHolder.fromColorRes(selectedColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledIconColor(@ColorInt int disabledIconColor) {
        this.disabledIconColor = ColorHolder.fromColor(disabledIconColor);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledIconColorRes(@ColorRes int disabledIconColorRes) {
        this.disabledIconColor = ColorHolder.fromColorRes(disabledIconColorRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIconTintingEnabled(boolean iconTintingEnabled) {
        this.iconTinted = iconTintingEnabled;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Deprecated
    public T withIconTinted(boolean iconTinted) {
        this.iconTinted = iconTinted;
        return this;
    }

    @Deprecated
    public T withTintSelectedIcon(boolean iconTinted) {
        return withIconTintingEnabled(iconTinted);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public T withTypeface(Typeface typeface) {
        this.typeface = typeface;
        return this;
    }

    public ColorHolder getSelectedColor() {
        return this.selectedColor;
    }

    public ColorHolder getTextColor() {
        return this.textColor;
    }

    public ColorHolder getSelectedTextColor() {
        return this.selectedTextColor;
    }

    public ColorHolder getDisabledTextColor() {
        return this.disabledTextColor;
    }

    public boolean isIconTinted() {
        return this.iconTinted;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public ImageHolder getIcon() {
        return this.icon;
    }

    public ImageHolder getSelectedIcon() {
        return this.selectedIcon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public StringHolder getName() {
        return this.name;
    }

    public ColorHolder getDisabledIconColor() {
        return this.disabledIconColor;
    }

    public ColorHolder getSelectedIconColor() {
        return this.selectedIconColor;
    }

    public ColorHolder getIconColor() {
        return this.iconColor;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    protected int getSelectedColor(Context ctx) {
        return ColorHolder.color(getSelectedColor(), ctx, R.attr.material_drawer_selected, R.color.material_drawer_selected);
    }

    protected int getColor(Context ctx) {
        int color;
        if (isEnabled()) {
            color = ColorHolder.color(getTextColor(), ctx, R.attr.material_drawer_primary_text, R.color.material_drawer_primary_text);
        } else {
            color = ColorHolder.color(getDisabledTextColor(), ctx, R.attr.material_drawer_hint_text, R.color.material_drawer_hint_text);
        }
        return color;
    }

    protected int getSelectedTextColor(Context ctx) {
        return ColorHolder.color(getSelectedTextColor(), ctx, R.attr.material_drawer_selected_text, R.color.material_drawer_selected_text);
    }

    public int getIconColor(Context ctx) {
        int iconColor;
        if (isEnabled()) {
            iconColor = ColorHolder.color(getIconColor(), ctx, R.attr.material_drawer_primary_icon, R.color.material_drawer_primary_icon);
        } else {
            iconColor = ColorHolder.color(getDisabledIconColor(), ctx, R.attr.material_drawer_hint_icon, R.color.material_drawer_hint_icon);
        }
        return iconColor;
    }

    protected int getSelectedIconColor(Context ctx) {
        return ColorHolder.color(getSelectedIconColor(), ctx, R.attr.material_drawer_selected_text, R.color.material_drawer_selected_text);
    }

    protected ColorStateList getTextColorStateList(@ColorInt int color, @ColorInt int selectedTextColor) {
        if (this.colorStateList == null || color + selectedTextColor != ((Integer) this.colorStateList.first).intValue()) {
            this.colorStateList = new Pair<>(Integer.valueOf(color + selectedTextColor), DrawerUIUtils.getTextColorStateList(color, selectedTextColor));
        }
        return (ColorStateList) this.colorStateList.second;
    }
}
