package com.actionbarsherlock.internal.view.menu;

import android.graphics.drawable.Drawable;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuView.class */
public interface MenuView {

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuView$ItemView.class */
    public interface ItemView {
        void initialize(MenuItemImpl menuItemImpl, int i);

        MenuItemImpl getItemData();

        void setTitle(CharSequence charSequence);

        void setEnabled(boolean z);

        void setCheckable(boolean z);

        void setChecked(boolean z);

        void setShortcut(boolean z, char c);

        void setIcon(Drawable drawable);

        boolean prefersCondensedTitle();

        boolean showsIcon();
    }

    void initialize(MenuBuilder menuBuilder);

    int getWindowAnimations();
}
