package android.support.v7.internal.view.menu;

import android.content.Context;
import android.os.Parcelable;
import android.view.ViewGroup;

/* loaded from: com.android.support.appcompat-v7.22.2.0.jar:android/support/v7/internal/view/menu/MenuPresenter.class */
public interface MenuPresenter {

    /* loaded from: com.android.support.appcompat-v7.22.2.0.jar:android/support/v7/internal/view/menu/MenuPresenter$Callback.class */
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
