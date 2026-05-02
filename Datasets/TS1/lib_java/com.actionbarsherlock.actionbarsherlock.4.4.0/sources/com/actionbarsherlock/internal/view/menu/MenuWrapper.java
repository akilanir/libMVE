package com.actionbarsherlock.internal.view.menu;

import android.content.ComponentName;
import android.content.Intent;
import android.view.KeyEvent;
import android.view.MenuItem;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.SubMenu;
import java.util.WeakHashMap;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuWrapper.class */
public class MenuWrapper implements Menu {
    private final android.view.Menu mNativeMenu;
    private final WeakHashMap<MenuItem, com.actionbarsherlock.view.MenuItem> mNativeMap = new WeakHashMap<>();

    public MenuWrapper(android.view.Menu nativeMenu) {
        this.mNativeMenu = nativeMenu;
    }

    public android.view.Menu unwrap() {
        return this.mNativeMenu;
    }

    private com.actionbarsherlock.view.MenuItem addInternal(MenuItem nativeItem) {
        com.actionbarsherlock.view.MenuItem item = new MenuItemWrapper(nativeItem);
        this.mNativeMap.put(nativeItem, item);
        return item;
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem add(CharSequence title) {
        return addInternal(this.mNativeMenu.add(title));
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem add(int titleRes) {
        return addInternal(this.mNativeMenu.add(titleRes));
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem add(int groupId, int itemId, int order, CharSequence title) {
        return addInternal(this.mNativeMenu.add(groupId, itemId, order, title));
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem add(int groupId, int itemId, int order, int titleRes) {
        return addInternal(this.mNativeMenu.add(groupId, itemId, order, titleRes));
    }

    private SubMenu addInternal(android.view.SubMenu nativeSubMenu) {
        SubMenu subMenu = new SubMenuWrapper(nativeSubMenu);
        MenuItem nativeItem = nativeSubMenu.getItem();
        com.actionbarsherlock.view.MenuItem item = subMenu.getItem();
        this.mNativeMap.put(nativeItem, item);
        return subMenu;
    }

    @Override // com.actionbarsherlock.view.Menu
    public SubMenu addSubMenu(CharSequence title) {
        return addInternal(this.mNativeMenu.addSubMenu(title));
    }

    @Override // com.actionbarsherlock.view.Menu
    public SubMenu addSubMenu(int titleRes) {
        return addInternal(this.mNativeMenu.addSubMenu(titleRes));
    }

    @Override // com.actionbarsherlock.view.Menu
    public SubMenu addSubMenu(int groupId, int itemId, int order, CharSequence title) {
        return addInternal(this.mNativeMenu.addSubMenu(groupId, itemId, order, title));
    }

    @Override // com.actionbarsherlock.view.Menu
    public SubMenu addSubMenu(int groupId, int itemId, int order, int titleRes) {
        return addInternal(this.mNativeMenu.addSubMenu(groupId, itemId, order, titleRes));
    }

    @Override // com.actionbarsherlock.view.Menu
    public int addIntentOptions(int groupId, int itemId, int order, ComponentName caller, Intent[] specifics, Intent intent, int flags, com.actionbarsherlock.view.MenuItem[] outSpecificItems) {
        int result;
        if (outSpecificItems != null) {
            MenuItem[] nativeOutItems = new MenuItem[outSpecificItems.length];
            result = this.mNativeMenu.addIntentOptions(groupId, itemId, order, caller, specifics, intent, flags, nativeOutItems);
            int length = outSpecificItems.length;
            for (int i = 0; i < length; i++) {
                outSpecificItems[i] = new MenuItemWrapper(nativeOutItems[i]);
            }
        } else {
            result = this.mNativeMenu.addIntentOptions(groupId, itemId, order, caller, specifics, intent, flags, null);
        }
        return result;
    }

    @Override // com.actionbarsherlock.view.Menu
    public void removeItem(int id) {
        this.mNativeMap.remove(this.mNativeMenu.findItem(id));
        this.mNativeMenu.removeItem(id);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void removeGroup(int groupId) {
        for (int i = 0; i < this.mNativeMenu.size(); i++) {
            MenuItem item = this.mNativeMenu.getItem(i);
            if (item.getGroupId() == groupId) {
                this.mNativeMap.remove(item);
            }
        }
        this.mNativeMenu.removeGroup(groupId);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void clear() {
        this.mNativeMap.clear();
        this.mNativeMenu.clear();
    }

    public void invalidate() {
        if (this.mNativeMap.isEmpty()) {
            return;
        }
        WeakHashMap<MenuItem, com.actionbarsherlock.view.MenuItem> menuMapCopy = new WeakHashMap<>(this.mNativeMap.size());
        for (int i = 0; i < this.mNativeMenu.size(); i++) {
            MenuItem item = this.mNativeMenu.getItem(i);
            menuMapCopy.put(item, this.mNativeMap.get(item));
        }
        this.mNativeMap.clear();
        this.mNativeMap.putAll(menuMapCopy);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void setGroupCheckable(int group, boolean checkable, boolean exclusive) {
        this.mNativeMenu.setGroupCheckable(group, checkable, exclusive);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void setGroupVisible(int group, boolean visible) {
        this.mNativeMenu.setGroupVisible(group, visible);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void setGroupEnabled(int group, boolean enabled) {
        this.mNativeMenu.setGroupEnabled(group, enabled);
    }

    @Override // com.actionbarsherlock.view.Menu
    public boolean hasVisibleItems() {
        return this.mNativeMenu.hasVisibleItems();
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem findItem(int id) {
        MenuItem nativeItem = this.mNativeMenu.findItem(id);
        return findItem(nativeItem);
    }

    public com.actionbarsherlock.view.MenuItem findItem(MenuItem nativeItem) {
        if (nativeItem == null) {
            return null;
        }
        com.actionbarsherlock.view.MenuItem wrapped = this.mNativeMap.get(nativeItem);
        if (wrapped != null) {
            return wrapped;
        }
        return addInternal(nativeItem);
    }

    @Override // com.actionbarsherlock.view.Menu
    public int size() {
        return this.mNativeMenu.size();
    }

    @Override // com.actionbarsherlock.view.Menu
    public com.actionbarsherlock.view.MenuItem getItem(int index) {
        MenuItem nativeItem = this.mNativeMenu.getItem(index);
        return findItem(nativeItem);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void close() {
        this.mNativeMenu.close();
    }

    @Override // com.actionbarsherlock.view.Menu
    public boolean performShortcut(int keyCode, KeyEvent event, int flags) {
        return this.mNativeMenu.performShortcut(keyCode, event, flags);
    }

    @Override // com.actionbarsherlock.view.Menu
    public boolean isShortcutKey(int keyCode, KeyEvent event) {
        return this.mNativeMenu.isShortcutKey(keyCode, event);
    }

    @Override // com.actionbarsherlock.view.Menu
    public boolean performIdentifierAction(int id, int flags) {
        return this.mNativeMenu.performIdentifierAction(id, flags);
    }

    @Override // com.actionbarsherlock.view.Menu
    public void setQwertyMode(boolean isQwerty) {
        this.mNativeMenu.setQwertyMode(isQwerty);
    }
}
