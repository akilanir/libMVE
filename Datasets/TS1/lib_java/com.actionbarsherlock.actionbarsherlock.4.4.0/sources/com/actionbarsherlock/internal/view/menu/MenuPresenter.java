package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.os.Parcelable;
import android.view.ViewGroup;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuPresenter.class */
public interface MenuPresenter {

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuPresenter$Callback.class */
    public interface Callback {
        void onCloseMenu(MenuBuilder menuBuilder, boolean z);

        boolean onOpenSubMenu(MenuBuilder menuBuilder);
    }

    void initForMenu(Context context, MenuBuilder menuBuilder);

    MenuView getMenuView(ViewGroup viewGroup);

    void updateMenuView(boolean z);

    void setCallback(Callback callback);

    boolean onSubMenuSelected(SubMenuBuilder subMenuBuilder);

    void onCloseMenu(MenuBuilder menuBuilder, boolean z);

    boolean flagActionItems();

    boolean expandItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl);

    boolean collapseItemActionView(MenuBuilder menuBuilder, MenuItemImpl menuItemImpl);

    int getId();

    Parcelable onSaveInstanceState();

    void onRestoreInstanceState(Parcelable parcelable);
}
