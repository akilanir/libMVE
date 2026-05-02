package android.support.v7.internal.view.menu;

import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/internal/view/menu/MenuView.class */
public interface MenuView {

    /* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/internal/view/menu/MenuView$ItemView.class */
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
