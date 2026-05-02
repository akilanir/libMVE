package android.support.v7.internal.view.menu;

import android.graphics.drawable.Drawable;
import android.support.v4.internal.view.SupportSubMenu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/internal/view/menu/SubMenuWrapperICS.class */
class SubMenuWrapperICS extends MenuWrapperICS implements SupportSubMenu {
    SubMenuWrapperICS(SubMenu subMenu) {
        super(subMenu);
    }

    @Override // android.support.v7.internal.view.menu.BaseWrapper
    public SubMenu getWrappedObject() {
        return (SubMenu) this.mWrappedObject;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setHeaderTitle(int titleRes) {
        ((SubMenu) this.mWrappedObject).setHeaderTitle(titleRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setHeaderTitle(CharSequence title) {
        ((SubMenu) this.mWrappedObject).setHeaderTitle(title);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setHeaderIcon(int iconRes) {
        ((SubMenu) this.mWrappedObject).setHeaderIcon(iconRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setHeaderIcon(Drawable icon) {
        ((SubMenu) this.mWrappedObject).setHeaderIcon(icon);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setHeaderView(View view) {
        ((SubMenu) this.mWrappedObject).setHeaderView(view);
        return this;
    }

    public void clearHeader() {
        ((SubMenu) this.mWrappedObject).clearHeader();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setIcon(int iconRes) {
        ((SubMenu) this.mWrappedObject).setIcon(iconRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SubMenu setIcon(Drawable icon) {
        ((SubMenu) this.mWrappedObject).setIcon(icon);
        return this;
    }

    public MenuItem getItem() {
        return getMenuItemWrapper(((SubMenu) this.mWrappedObject).getItem());
    }
}
