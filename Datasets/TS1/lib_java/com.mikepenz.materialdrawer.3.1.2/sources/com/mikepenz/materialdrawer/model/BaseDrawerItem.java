package com.mikepenz.materialdrawer.model;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.model.interfaces.Checkable;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Iconable;
import com.mikepenz.materialdrawer.model.interfaces.Identifyable;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.model.interfaces.Tagable;
import com.mikepenz.materialdrawer.model.interfaces.Typefaceable;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/BaseDrawerItem.class */
public abstract class BaseDrawerItem<T> implements IDrawerItem, Nameable<T>, Iconable<T>, Checkable<T>, Tagable<T>, Identifyable<T>, Typefaceable<T> {
    private Drawable icon;
    private IIcon iicon;
    private Drawable selectedIcon;
    private String name;
    private Object tag;
    private int identifier = -1;
    private int iconRes = -1;
    private int selectedIconRes = -1;
    private int nameRes = -1;
    private boolean enabled = true;
    private boolean checkable = true;
    private boolean iconTinted = false;
    private int selectedColor = 0;
    private int selectedColorRes = -1;
    private int textColor = 0;
    private int textColorRes = -1;
    private int selectedTextColor = 0;
    private int selectedTextColorRes = -1;
    private int disabledTextColor = 0;
    private int disabledTextColorRes = -1;
    private int iconColor = 0;
    private int iconColorRes = -1;
    private int selectedIconColor = 0;
    private int selectedIconColorRes = -1;
    private int disabledIconColor = 0;
    private int disabledIconColorRes = -1;
    private Typeface typeface = null;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Identifyable
    public T withIdentifier(int identifier) {
        this.identifier = identifier;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public T withIcon(Drawable icon) {
        this.icon = icon;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIcon(int iconRes) {
        this.iconRes = iconRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public T withIcon(IIcon iicon) {
        this.iicon = iicon;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIcon(Drawable selectedIcon) {
        this.selectedIcon = selectedIcon;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIcon(int selectedIconRes) {
        this.selectedIconRes = selectedIconRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public T withName(String name) {
        this.name = name;
        this.nameRes = -1;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public T withName(int nameRes) {
        this.nameRes = nameRes;
        this.name = null;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public T withTag(Object object) {
        this.tag = object;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.mikepenz.materialdrawer.model.interfaces.Checkable
    public T withCheckable(boolean checkable) {
        this.checkable = checkable;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T setEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedColor(int selectedColor) {
        this.selectedColor = selectedColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedColorRes(int selectedColorRes) {
        this.selectedColorRes = selectedColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withTextColor(int textColor) {
        this.textColor = textColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withTextColorRes(int textColorRes) {
        this.textColorRes = textColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedTextColor(int selectedTextColor) {
        this.selectedTextColor = selectedTextColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedTextColorRes(int selectedColorRes) {
        this.selectedTextColorRes = selectedColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledTextColor(int disabledTextColor) {
        this.disabledTextColor = disabledTextColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledTextColorRes(int disabledTextColorRes) {
        this.disabledTextColorRes = disabledTextColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIconColor(int iconColor) {
        this.iconColor = iconColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withIconColorRes(int iconColorRes) {
        this.iconColorRes = iconColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIconColor(int selectedIconColor) {
        this.selectedIconColor = selectedIconColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withSelectedIconColorRes(int selectedColorRes) {
        this.selectedIconColorRes = selectedColorRes;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledIconColor(int disabledIconColor) {
        this.disabledIconColor = disabledIconColor;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public T withDisabledIconColorRes(int disabledIconColorRes) {
        this.disabledIconColorRes = disabledIconColorRes;
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

    public int getSelectedTextColor() {
        return this.selectedTextColor;
    }

    public void setSelectedTextColor(int selectedTextColor) {
        this.selectedTextColor = selectedTextColor;
    }

    public int getSelectedTextColorRes() {
        return this.selectedTextColorRes;
    }

    public void setSelectedTextColorRes(int selectedTextColorRes) {
        this.selectedTextColorRes = selectedTextColorRes;
    }

    public int getDisabledTextColor() {
        return this.disabledTextColor;
    }

    public void setDisabledTextColor(int disabledTextColor) {
        this.disabledTextColor = disabledTextColor;
    }

    public int getDisabledTextColorRes() {
        return this.disabledTextColorRes;
    }

    public void setDisabledTextColorRes(int disabledTextColorRes) {
        this.disabledTextColorRes = disabledTextColorRes;
    }

    public boolean isIconTinted() {
        return this.iconTinted;
    }

    public void setIconTinted(boolean iconTinted) {
        this.iconTinted = iconTinted;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.IDrawerItem, com.mikepenz.materialdrawer.model.interfaces.Tagable
    public Object getTag() {
        return this.tag;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Tagable
    public void setTag(Object tag) {
        this.tag = tag;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public Drawable getIcon() {
        return this.icon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public void setIcon(Drawable icon) {
        this.icon = icon;
    }

    public int getIconRes() {
        return this.iconRes;
    }

    public void setIconRes(int iconRes) {
        this.iconRes = iconRes;
    }

    public int getSelectedIconRes() {
        return this.selectedIconRes;
    }

    public void setSelectedIconRes(int selectedIconRes) {
        this.selectedIconRes = selectedIconRes;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public IIcon getIIcon() {
        return this.iicon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Iconable
    public void setIIcon(IIcon iicon) {
        this.iicon = iicon;
    }

    public Drawable getSelectedIcon() {
        return this.selectedIcon;
    }

    public void setSelectedIcon(Drawable selectedIcon) {
        this.selectedIcon = selectedIcon;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public String getName() {
        return this.name;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public void setName(String name) {
        this.name = name;
        this.nameRes = -1;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public int getNameRes() {
        return this.nameRes;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Nameable
    public void setNameRes(int nameRes) {
        this.nameRes = nameRes;
        this.name = null;
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

    @Override // com.mikepenz.materialdrawer.model.interfaces.Checkable
    public boolean isCheckable() {
        return this.checkable;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Checkable
    public void setCheckable(boolean checkable) {
        this.checkable = checkable;
    }

    public int getDisabledIconColorRes() {
        return this.disabledIconColorRes;
    }

    public void setDisabledIconColorRes(int disabledIconColorRes) {
        this.disabledIconColorRes = disabledIconColorRes;
    }

    public int getDisabledIconColor() {
        return this.disabledIconColor;
    }

    public void setDisabledIconColor(int disabledIconColor) {
        this.disabledIconColor = disabledIconColor;
    }

    public int getSelectedIconColorRes() {
        return this.selectedIconColorRes;
    }

    public void setSelectedIconColorRes(int selectedIconColorRes) {
        this.selectedIconColorRes = selectedIconColorRes;
    }

    public int getSelectedIconColor() {
        return this.selectedIconColor;
    }

    public void setSelectedIconColor(int selectedIconColor) {
        this.selectedIconColor = selectedIconColor;
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

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public Typeface getTypeface() {
        return this.typeface;
    }

    @Override // com.mikepenz.materialdrawer.model.interfaces.Typefaceable
    public void setTypeface(Typeface typeface) {
        this.typeface = typeface;
    }
}
