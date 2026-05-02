package android.support.design.internal;

import android.content.Context;
import android.support.v7.view.menu.MenuBuilder;
import android.support.v7.view.menu.MenuItemImpl;
import android.support.v7.view.menu.SubMenuBuilder;
import android.view.SubMenu;

/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/internal/NavigationMenu.class */
public class NavigationMenu extends MenuBuilder {
    public NavigationMenu(Context context) {
        super(context);
    }

    public SubMenu addSubMenu(int group, int id, int categoryOrder, CharSequence title) {
        MenuItemImpl item = addInternal(group, id, categoryOrder, title);
        SubMenuBuilder subMenu = new NavigationSubMenu(getContext(), this, item);
        item.setSubMenu(subMenu);
        return subMenu;
    }
}
