package android.support.v7.internal.view.menu;

import android.support.v4.internal.view.SupportMenuItem;
import android.view.MenuItem;
import android.view.SubMenu;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/internal/view/menu/BaseMenuWrapper.class */
abstract class BaseMenuWrapper<T> extends BaseWrapper<T> {
    private HashMap<MenuItem, SupportMenuItem> mMenuItems;
    private HashMap<SubMenu, SubMenu> mSubMenus;

    BaseMenuWrapper(T object) {
        super(object);
    }

    final SupportMenuItem getMenuItemWrapper(MenuItem frameworkItem) {
        if (frameworkItem != null) {
            if (this.mMenuItems == null) {
                this.mMenuItems = new HashMap<>();
            }
            SupportMenuItem compatItem = this.mMenuItems.get(frameworkItem);
            if (null == compatItem) {
                compatItem = MenuWrapperFactory.createSupportMenuItemWrapper(frameworkItem);
                this.mMenuItems.put(frameworkItem, compatItem);
            }
            return compatItem;
        }
        return null;
    }

    final SubMenu getSubMenuWrapper(SubMenu frameworkSubMenu) {
        if (frameworkSubMenu != null) {
            if (this.mSubMenus == null) {
                this.mSubMenus = new HashMap<>();
            }
            SubMenu compatSubMenu = this.mSubMenus.get(frameworkSubMenu);
            if (null == compatSubMenu) {
                compatSubMenu = MenuWrapperFactory.createSupportSubMenuWrapper(frameworkSubMenu);
                this.mSubMenus.put(frameworkSubMenu, compatSubMenu);
            }
            return compatSubMenu;
        }
        return null;
    }

    final void internalClear() {
        if (this.mMenuItems != null) {
            this.mMenuItems.clear();
        }
        if (this.mSubMenus != null) {
            this.mSubMenus.clear();
        }
    }

    final void internalRemoveGroup(int groupId) {
        if (this.mMenuItems == null) {
            return;
        }
        Iterator<MenuItem> iterator = this.mMenuItems.keySet().iterator();
        while (iterator.hasNext()) {
            MenuItem menuItem = iterator.next();
            if (groupId == menuItem.getGroupId()) {
                iterator.remove();
            }
        }
    }

    final void internalRemoveItem(int id) {
        if (this.mMenuItems == null) {
            return;
        }
        Iterator<MenuItem> iterator = this.mMenuItems.keySet().iterator();
        while (iterator.hasNext()) {
            MenuItem menuItem = iterator.next();
            if (id == menuItem.getItemId()) {
                iterator.remove();
                return;
            }
        }
    }
}
