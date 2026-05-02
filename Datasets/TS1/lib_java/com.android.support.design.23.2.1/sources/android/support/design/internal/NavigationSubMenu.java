package android.support.design.internal;

import android.content.Context;
import android.support.v7.view.menu.MenuItemImpl;
import android.support.v7.view.menu.SubMenuBuilder;

/* loaded from: com.android.support.design.23.2.1.jar:android/support/design/internal/NavigationSubMenu.class */
public class NavigationSubMenu extends SubMenuBuilder {
    public NavigationSubMenu(Context context, NavigationMenu menu, MenuItemImpl item) {
        super(context, menu, item);
    }

    public void onItemsChanged(boolean structureChanged) {
        super.onItemsChanged(structureChanged);
        getParentMenu().onItemsChanged(structureChanged);
    }
}
