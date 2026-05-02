package com.actionbarsherlock.internal.view.menu;

import android.graphics.drawable.Drawable;
import android.view.View;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.view.SubMenu;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/SubMenuWrapper.class */
public class SubMenuWrapper extends MenuWrapper implements SubMenu {
    private final android.view.SubMenu mNativeSubMenu;
    private MenuItem mItem;

    public SubMenuWrapper(android.view.SubMenu nativeSubMenu) {
        super(nativeSubMenu);
        this.mItem = null;
        this.mNativeSubMenu = nativeSubMenu;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderTitle(int titleRes) {
        this.mNativeSubMenu.setHeaderTitle(titleRes);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderTitle(CharSequence title) {
        this.mNativeSubMenu.setHeaderTitle(title);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderIcon(int iconRes) {
        this.mNativeSubMenu.setHeaderIcon(iconRes);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderIcon(Drawable icon) {
        this.mNativeSubMenu.setHeaderIcon(icon);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setHeaderView(View view) {
        this.mNativeSubMenu.setHeaderView(view);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public void clearHeader() {
        this.mNativeSubMenu.clearHeader();
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setIcon(int iconRes) {
        this.mNativeSubMenu.setIcon(iconRes);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public SubMenu setIcon(Drawable icon) {
        this.mNativeSubMenu.setIcon(icon);
        return this;
    }

    @Override // com.actionbarsherlock.view.SubMenu
    public MenuItem getItem() {
        if (this.mItem == null) {
            this.mItem = new MenuItemWrapper(this.mNativeSubMenu.getItem());
        }
        return this.mItem;
    }
}
