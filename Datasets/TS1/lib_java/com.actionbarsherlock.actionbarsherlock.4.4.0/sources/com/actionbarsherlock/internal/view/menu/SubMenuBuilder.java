package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.view.SubMenu;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/SubMenuBuilder.class */
public class SubMenuBuilder extends MenuBuilder implements SubMenu {
    private MenuBuilder mParentMenu;
    private MenuItemImpl mItem;

    public SubMenuBuilder(Context context, MenuBuilder parentMenu, MenuItemImpl item) {
        super(context);
        this.mParentMenu = parentMenu;
        this.mItem = item;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder, com.actionbarsherlock.view.Menu
    public void setQwertyMode(boolean isQwerty) {
        this.mParentMenu.setQwertyMode(isQwerty);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public boolean isQwertyMode() {
        return this.mParentMenu.isQwertyMode();
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public void setShortcutsVisible(boolean shortcutsVisible) {
        this.mParentMenu.setShortcutsVisible(shortcutsVisible);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public boolean isShortcutsVisible() {
        return this.mParentMenu.isShortcutsVisible();
    }

    public Menu getParentMenu() {
        return this.mParentMenu;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public MenuItem getItem() {
        return this.mItem;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public void setCallback(MenuBuilder.Callback callback) {
        this.mParentMenu.setCallback(callback);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public MenuBuilder getRootMenu() {
        return this.mParentMenu;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    boolean dispatchMenuItemSelected(MenuBuilder menu, MenuItem item) {
        return super.dispatchMenuItemSelected(menu, item) || this.mParentMenu.dispatchMenuItemSelected(menu, item);
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setIcon(Drawable icon) {
        this.mItem.setIcon(icon);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setIcon(int iconRes) {
        this.mItem.setIcon(iconRes);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderIcon(Drawable icon) {
        return (SubMenu) super.setHeaderIconInt(icon);
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderIcon(int iconRes) {
        return (SubMenu) super.setHeaderIconInt(iconRes);
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderTitle(CharSequence title) {
        return (SubMenu) super.setHeaderTitleInt(title);
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderTitle(int titleRes) {
        return (SubMenu) super.setHeaderTitleInt(titleRes);
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderView(View view) {
        return (SubMenu) super.setHeaderViewInt(view);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public boolean expandItemActionView(MenuItemImpl item) {
        return this.mParentMenu.expandItemActionView(item);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public boolean collapseItemActionView(MenuItemImpl item) {
        return this.mParentMenu.collapseItemActionView(item);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder
    public String getActionViewStatesKey() {
        int itemId = this.mItem != null ? this.mItem.getItemId() : 0;
        if (itemId == 0) {
            return null;
        }
        return super.getActionViewStatesKey() + ":" + itemId;
    }
}
